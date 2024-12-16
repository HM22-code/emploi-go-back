const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Geolocalisation = sequelize.define('Geolocalisation', {
  siret: {
    type: DataTypes.INTEGER,
    primaryKey: true,
  },
  y_latitude: {
    type: DataTypes.REAL,
  },
  x_longitude: {
    type: DataTypes.REAL,
  },
}, {
  tableName: "Geolocalisation",
  timestamps: false
});

module.exports = Geolocalisation;