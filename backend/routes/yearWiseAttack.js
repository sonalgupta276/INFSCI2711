const express = require('express');
const router = express.Router();
const yearWiseAttacks = require('../services/yearWiseAttacks');


router.get('/', async function(req, res, next) {
  try {
    res.json(await yearWiseAttacks.getYearWiseAttacks(req.query.page));
  } catch (err) {
    console.error(`Error while getting programming languages `, err.message);
    next(err);
  }
});

module.exports = router;