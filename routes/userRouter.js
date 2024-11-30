var express = require('express');
var router = express.Router();
var userController = require('../controllers/userController');
const authJWT = require('../middleware/authJWT');
const authRoles = require('../middleware/authRoles');

/**
 * @swagger
 * /users/:
 *   get:
 *     summary: Get all users.
 *     description: Get all users.
 *     responses:
 *       '200':
 *         description: A successful response
 *       '500':
 *         description: Internal server error
 */
router.get('/', authJWT, authRoles("ADMIN"), userController.findAll);

/**
 * @swagger
 * /users/{id}:
 *   get:
 *     summary: Get user by ID.
 *     description: Get user by ID.
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: User ID
 *     responses:
 *       '200':
 *         description: A successful response
 *       '404':
 *         description: User not found
 *       '500':
 *         description: Internal server error
 */
router.get('/:id', authJWT, authRoles("ADMIN"), userController.find);

/**
 * @swagger
 * /users/:
 *   post:
 *     summary: Create a new user.
 *     description: Create a new user.
 *     responses:
 *       '200':
 *         description: A successful response
 *       '500':
 *         description: Internal server error
 */
router.post('/', authJWT, authRoles("ADMIN"), userController.create);

/**
 * @swagger
 * /users/{id}:
 *   put:
 *     summary: Update user by ID.
 *     description: Update user by ID.
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: User ID
 *     responses:
 *       '200':
 *         description: A successful response
 *       '404':
 *         description: User not found
 *       '500':
 *         description: Internal server error
 */
router.put('/:id', authJWT, authRoles("ADMIN"), userController.update);

/**
 * @swagger
 * /users/{id}:
 *   delete:
 *     summary: Delete user by ID.
 *     description: Delete user by ID.
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: User ID
 *     responses:
 *       '200':
 *         description: A successful response
 *       '404':
 *         description: User not found
 *       '500':
 *         description: Internal server error
 */
router.delete('/:id', authJWT, authRoles("ADMIN"), userController.delete);

module.exports = router;
