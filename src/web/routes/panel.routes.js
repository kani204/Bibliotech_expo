import { Router } from "express";
const panelRouter = new Router()

// Funcion para saber si el usuario esta logeado
import { isAdmin } from '../utils/auth.js'

// Validadores
import { validationResult } from "express-validator";
import { createBookValidator, createUserValidator } from '../utils/validators.js'

// URL de la API de la biblioteca
import config from '../config.json' with { type: 'json' }
const apiUrl = config["apiUrl"]

// En todas las rutas despues de /panel se verificara si el usuario es un administrador o no
// panelRouter.get('/panel*', isAdmin)

panelRouter.get('/panel', (req, res) => {
    const { username, role, userId } = req.session

    res.render('panel/panel',
        {
            title: 'Bibliotech - Panel de Administrador',
            user: { username, role, userId }
        }
    )
})

panelRouter.get('/panel/books', async (req, res) => {
    const { username, role, userId } = req.session

    const data = await (await fetch(`${apiUrl}/books`, { method: 'GET' })).json()

    res.render('panel/books',
        {
            title: 'Bibliotech - Libros', books: data.books,
            user: { username, role, userId }
        }
    )
})

panelRouter.get('/panel/books/:id/edit', async (req, res) => {
    const { username, role, userId } = req.session
    const { id } = req.params // Id del libro

    const [book] = await (await fetch(`${apiUrl}/book/${id}`, { method: 'GET' })).json()
    if (book.error) {
        return res.redirect('/panel/error')
    }

    res.render('panel/editBook',
        {
            title: 'Bibliotech - Editar Libro', book,
            user: { username, role, userId }
        }
    )
})

panelRouter.post('/panel/books/:id/edit', createBookValidator, async (req, res) => {
    const { id } = req.params
    const { username, userId, role } = req.session

    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        console.log(errors.array())

        const [book] = await (await fetch(`${apiUrl}/book/${id}`, { method: 'GET' })).json()
        if (book.error) {
            return res.redirect('/panel/error')
        }

        return res.render('panel/editBook',
            {
                title: 'Bibliotech - Editar Libro', errors: errors.array(), values: req.body, book,
                user: {
                    username, userId, role
                }
            }
        )
    }

    const { title, author, isbn, date, pages, language, state, publisher, synopsis, image, pdfLink, categories } = req.body
    const file = req.file ? `/uploads/${req.file.filename}` : null

    const response = await fetch(`${apiUrl}/book/${id}/edit`,
        {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ title, author, isbn, date, pages, language, state, publisher, synopsis, image, pdfLink, categories, file })
        }
    )

    const { error } = await response.json()

    if (error == 'required_fields')
        return res.redirect('/panel/books/edit?error=required_fields')

    res.redirect('/book/' + id)
})

panelRouter.get('/panel/books/add', async (req, res) => {
    const { username, role, userId } = req.session

    res.render('panel/createBook',
        {
            title: 'Bibliotech - Añadir Libro',
            user: { username, role, userId }
        }
    )
})

panelRouter.post('/panel/books/add', createBookValidator, async (req, res) => {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        return res.render('panel/createBook',
            {
                title: 'Bibliotech - Añadir Libro', errors: errors.array(), values: req.body
            }
        )
    }

    const { title, author, isbn, date, pages, language, state, publisher, synopsis, pdfLink, categories } = req.body
    const image = req.file ? `/uploads/${req.file.filename}` : null

    const response = await fetch(`${apiUrl}/book/create`,
        {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ title, author, isbn, date, pages, language, publisher, synopsis, image, pdfLink, state, categories })
        }
    )

    const { error } = await response.json()
    if (error == 'required_fields')
        return res.redirect('/panel/books/add?error=required_fields')

    if (!response.ok)
        return res.redirect('/panel/books/add?error=invalid')

    res.redirect('/panel/books')
})

panelRouter.get('/panel/users', async (req, res) => {
    const { username, role, userId } = req.session

    const users = await (await fetch(`${apiUrl}/users`, { method: 'GET' })).json()

    res.render('panel/users',
        {
            title: 'Bibliotech - Usuarios', users,
            user: { username, role, userId }
        }
    )
})

panelRouter.get('/panel/users/:id/edit', async (req, res) => {
    const { username, role, userId } = req.session
    const { id } = req.params

    const user = await (await fetch(`${apiUrl}/user/${id}`, { method: 'GET' })).json()

    res.render('panel/editUser',
        {
            title: 'Bibliotech - Editar Usuario',
            user: { username, role, userId },
            userProfile: { id: user.id, username: user.username, image: user.image, email: user.email, role: user.roleId }
        }
    )
})

panelRouter.post('/panel/users/:id/edit', async (req, res) => {
    const { id } = req.params
    const { username, email, role } = req.body
    const file = req.file ? `/uploads/${req.file.filename}` : null

    const response = await fetch(`${apiUrl}/users/edit`,
        {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id, username, email, role, avatar: file })
        }
    )

    const user = await response.json()

    if (user.message.includes('not'))
        return res.redirect('/panel/users/edit?error=user_not_exist')

    if (!response.ok)
        return res.redirect('/panel/error')

    res.redirect('/panel/users')
})

panelRouter.get('/panel/users/create', async (req, res) => {
    const { username, role, userId } = req.session
    const { error } = req.query

    res.render('panel/createUser',
        {
            title: 'Bibliotech - Crear Usuario',
            user: { username, role, userId },
            error
        }
    )
})

panelRouter.post('/panel/users/create', createUserValidator, async (req, res) => {
    const errors = validationResult(req)
    if (!errors.isEmpty()) {
        return res.render('panel/createUser',
            {
                title: 'Bibliotech - Crear Usuario', errors: errors.array(), values: req.body
            }
        )
    }

    const { name, email, password, confirmPassword, role } = req.body
    const image = req.file ? `/uploads/${req.file.filename}` : null

    console.log(image)
    if (!name || !email || !password || !confirmPassword || !role || !image)
        return res.redirect('/panel/users/create?error=required_fields')

    if (password !== confirmPassword)
        return res.redirect('/panel/users/create?error=passwords_dont_match')

    const user = await fetch(`${apiUrl}/users/create`,
        {
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username: name, email, password, role, image })
        }
    )

    const response = await user.json()

    if (response.message.includes('used')) {
        return res.redirect('/panel/users/create?error=username_used')
    }

    if (!user.ok) {
        console.log(response)
        return res.redirect('/panel/users/create?error=invalid')
    }

    res.redirect('/panel/users')
})

panelRouter.get('/panel/docs/api', async (req, res) => {
    const { username, role, userId } = req.session

    res.render('panel/api',
        {
            title: 'Bibliotech - Documentación API',
            user: { username, role, userId }
        }
    )
})

panelRouter.get('/panel/docs/manual', async (req, res) => {
    const { username, role, userId } = req.session

    res.render('panel/manual',
        {
            title: 'Bibliotech - Manual del programador',
            user: { username, role, userId }
        }
    )
})

panelRouter.get('/panel/docs/reports', async (req, res) => {
    const { username, role, userId } = req.session

    res.render('panel/reports',
        {
            title: 'Bibliotech - Informes',
            user: { username, role, userId }
        }
    )
})

panelRouter.get('/panel/error', async (req, res) => {
    const { username, role, userId } = req.session

    res.render('panel/error',
        {
            title: 'Bibliotech - Error',
            user: { username, role, userId }
        }
    )
})

export default panelRouter