const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Etablissement = sequelize.define('Etablissement', {
  siret: {
    type: DataTypes.INTEGER,
    primaryKey: true,
  },
  trancheEffectifsEtablissement: {
    type: DataTypes.TEXT,
  },
  numeroVoieEtablissement: {
    type: DataTypes.TEXT,
  },
  typeVoieEtablissement: {
    type: DataTypes.TEXT,
  },
  libelleVoieEtablissement: {
    type: DataTypes.TEXT,
  },
  codePostalEtablissement: {
    type: DataTypes.INTEGER,
  },
  libelleCommuneEtablissement: {
    type: DataTypes.TEXT,
  },
  enseigne1Etablissement: {
    type: DataTypes.TEXT,
  },
  activitePrincipaleEtablissement: {
    type: DataTypes.TEXT,
  },
}, {
  tableName: "Etablissement",
  timestamps: false
});

module.exports = Etablissement;