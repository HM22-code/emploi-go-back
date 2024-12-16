const Etablissement = require('../models/etablissement');

// Find all users
exports.findAll = async (req, res) => {
  try {
    const etablissements = await Etablissement.findAll();
    res.json(etablissements);
  } catch (error) {
    res.status(500).json({ message: 'Failed to fetch etablissements.' });
  }
};