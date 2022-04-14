const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getTopTerrorGroups(page = 1){
  const offset = helper.getOffset(page, config.listPerPage);
  const rows = await db.query(
    'Select `Group`,`Total Casualties` as casualities from globalterror_dw.toptenterrorgroups order by `Total Casualties` desc'
  );
  const data = helper.emptyOrRows(rows);
    groups = []
    casualities = []

    data.forEach(element => {
        groups.push(element.Group)
        casualities.push(parseInt(element.casualities))
    })

  return {
    groups,
    casualities
  }
}

module.exports = {
    getTopTerrorGroups
}
