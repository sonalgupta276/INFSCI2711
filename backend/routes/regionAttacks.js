const express = require('express');
const router = express.Router();
const regionAttacks = require('../services/regionAttacks');


router.get('/', async function(req, res, next) {
  try {
    res.json(await regionAttacks.getRegionAttacks(req.query.page));
  } catch (err) {
    console.error(`Error while getting programming languages `, err.message);
    next(err);
  }
});

module.exports = router;