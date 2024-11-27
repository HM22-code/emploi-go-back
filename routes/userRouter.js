var express = require('express');
var router = express.Router();
const User = require('../models/user');

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
router.get('/', async (req, res) => {
  try {
    const users = await User.findAll();
    res.json(users);
  } catch (error) {
    res.status(500).json({ message: 'Failed to fetch users.' });
  }
});

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
router.get('/:id', async (req, res) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (!user) {
      res.status(404).json({ message: 'User not found.' });
    } else {
      res.json(user);
    }
  } catch (error) {
    res.status(500).json({ message: 'Failed to fetch user.' });
  }
});

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
router.post('/', async (req, res) => {
  try {
    const user = await User.create(req.body);
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: 'Failed to create user.' });
  }
});

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
router.put('/:id', async (req, res) => {
  try {
    const [updatedRowsCount] = await User.update(req.body, {
        where: { id: req.params.id }
    });
    if (updatedRowsCount === 0) {
      res.status(404).json({ message: 'User not found.' });
    } else {
      const user = await User.findByPk(req.params.id);
      res.json(user);
    }
  } catch (error) {
    res.status(500).json({ message: 'Failed to update user.' });
  }
});

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
router.delete('/:id', async (req, res) => {
  try {
    const deletedRowsCount = await User.destroy({ where: { id: req.params.id } });
    if (deletedRowsCount === 0) {
      res.status(404).json({ message: 'User not found.' });
    } else {
      res.json({ message: 'User deleted successfully.' });
    }
  } catch (error) {
    res.status(500).json({ message: 'Failed to delete user.' });
  }
});

module.exports = router;
