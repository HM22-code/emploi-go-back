const { Sequelize } = require('sequelize');

// Environment variables can be used to set the database dynamically
const DB_NAME = process.env.DB_NAME || 'oauth_db';
const DB_USER = process.env.DB_USER || 'root';
const DB_PASSWORD = process.env.DB_PASSWORD || null;
const DB_DIALECT = process.env.DB_DIALECT || 'sqlite';
const DB_STORAGE = process.env.DB_STORAGE || './database.sqlite';

const sequelize = new Sequelize(DB_NAME, DB_USER, DB_PASSWORD, {
  host: process.env.DB_HOST || 'localhost',
  dialect: DB_DIALECT,
  storage: DB_DIALECT === 'sqlite' ? DB_STORAGE : undefined,
});

sequelize.sync({ force: false })
  .then(() => {
    console.log('Database synchronized');
  })
  .catch((error) => {
    console.error('Failed to synchronize database:', error);
  });


module.exports = sequelize;