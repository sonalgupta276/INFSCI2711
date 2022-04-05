const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getCasulitiesRegionWise(page = 1){
  const offset = helper.getOffset(page, config.listPerPage);
  const rows = await db.query(
    'SELECT Region,`Total Casualties` as casulaties FROM globalterror_dw.regionview order by `Total Casualties` desc'
  );
  const data = helper.emptyOrRows(rows);
    console.log(data)
    regions = []
    casualities = []

    data.forEach(element => {
        regions.push(element.Region)
        casualities.push(parseInt(element.casulaties))
    })

  return {
    regions,
    casualities
  }
}

module.exports = {
    getCasulitiesRegionWise
}
