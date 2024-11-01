import { Router } from "express";
const userRouter = new Router()

// Modelo del usuario
import UserModel from "../models/user.model.js";

// Controlador
import UserController from "../controllers/user.controller.js";
const userController = new UserController({ userModel: UserModel })

// Prefix de la api
const prefix = process.env.API_PREFIX

// Rutas
userRouter.get(`${prefix}/users`, userController.getAll)
userRouter.get(`${prefix}/user/:id`, userController.getUserById)

userRouter.post(`${prefix}/users/create`, userController.createUser)
userRouter.post(`${prefix}/users/delete`, userController.deleteUser)
userRouter.post(`${prefix}/users/edit`, userController.editUser)

userRouter.post(`${prefix}/users/password`, userController.validPassword)
userRouter.post(`${prefix}/users/login`, userController.login)

userRouter.get(`${prefix}/user/record/:id`, userController.getUserRecord)
userRouter.post(`${prefix}/user/record/add`, userController.addRecord)
userRouter.post(`${prefix}/user/record/delete`, userController.deleteRecord)

userRouter.get(`${prefix}/user/:id/favorite/all`, userController.getFavorites)
userRouter.get(`${prefix}/user/:id/like/all`, userController.getLikes)
userRouter.get(`${prefix}/user/:id/later/all`, userController.getLater)

userRouter.post(`${prefix}/user/favorite/add`, userController.addFavorite)
userRouter.post(`${prefix}/user/like/add`, userController.addLike)
userRouter.post(`${prefix}/user/later/add`, userController.addSeeLater)

userRouter.post(`${prefix}/user/favorite/delete`, userController.deleteFavorite)
userRouter.post(`${prefix}/user/like/delete`, userController.deleteLike)
userRouter.post(`${prefix}/user/later/delete`, userController.deleteSeeLater)


export default userRouter