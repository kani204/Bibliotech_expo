import { Router } from 'express'
const userRouter = new Router()

// URL de la api
import config from '../config.json' with { type: 'json' }
const apiUrl = config["apiUrl"]

userRouter.get('/login', async (req, res) => {
    const { error, account_created } = req.query

    res.render('login',
        {
            title: "Bibliotech - Iniciar sesión", error, account_created
        }
    )
})
userRouter.post('/login', async (req, res) => {
    const { email, password } = req.body

    const response = await fetch(`${apiUrl}/users/login`,
        {
            method: 'POST',
            body: JSON.stringify({ email, password }),
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
        }
    )

    const user = await response.json()

    if (!response.ok) { 
        if(user.message.includes('email')) {
            return res.redirect(`/login?error=user_not_exist`)
        }

        if(user.message.includes('password')) {
            return res.redirect(`/login?error=invalid_password`)
        }

        return res.redirect('/login/error=true')
    }

    req.session.userId = user.id
    req.session.username = user.username
    req.session.role = user.role
    req.session.image = user.image

    res.redirect('/')
})

userRouter.get('/register', async (req, res) => {
    const { error } = req.query

    res.render('register',
        {
            title: 'Bibliotech - Registro', error
        }
    )
})
userRouter.post('/register', async (req, res) => {
    const { username, email, password } = req.body

    const response = await fetch(`${apiUrl}/users/create`,
        {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify({ username, email, password })
        }
    )

    if (!response.ok) { 
        const { message } = await response.json()

        if(message.includes('username')) {
            return res.redirect('/register?error=username_used')
        }

        if(message.includes('email')) {
            return res.redirect('/register?error=email_used')
        }

        return res.redirect('/register?error=true')
    }

    res.redirect('/login?account_created=true')
})

userRouter.get('/logout', async (req, res) => {
    const { userId } = req.session
    
    if(userId) {
        req.session.destroy()
        res.redirect('/')
    }
})

export default userRouter