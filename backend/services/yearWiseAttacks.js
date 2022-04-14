const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getYearWiseAttacks(page = 1){
  const offset = helper.getOffset(page, config.listPerPage);
  const rows = await db.query(
    'Select `Year`, Region, sum(`Total Casualties`) as casualities from globalterror_dw.yearregioncountryattackview group by `Year`, `Region` order by `Year`, `Region`'
  );
  const data = helper.emptyOrRows(rows);
  year = []
  australia = []
  centralAmerica = []
  eastAsia = []
  eEurope = []
  meNAfrica = []
  nAmerica = []
  sAmerica = []
  sAsia = []
  sEastAsia = []
  subSaAfrica = []
  westEurope = []
  
  data.forEach(element => {
      if (!year.includes(element.Year)){
          year.push(element.Year)
      }
  })
  
  for (let i = 0; i < year.length; i++){

    australia.push(0)
    centralAmerica.push(0)
    eastAsia.push(0)
    eEurope.push(0)
    meNAfrica.push(0)
    nAmerica.push(0)
    sAmerica.push(0)
    sAsia.push(0)
    sEastAsia.push(0)
    subSaAfrica.push(0)
    westEurope.push(0)

  }

  let prevTarget = ''
  let currTarget = ''
  let k = -1
  for (let j = 0; j < data.length; j++){
      currTarget = data[j].Year
      if (currTarget != prevTarget && data[j].Region == 'Australasia & Oceania' ) {
          k += 1
          australia[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'Central America & Caribbean') {
        centralAmerica[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'East Asia') {
        eastAsia[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'Eastern Europe') {
        eEurope[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'Middle East & North Africa') {
        meNAfrica[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'North America') {
        nAmerica[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'South America') {
        sAmerica[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'South Asia') {
        sAsia[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'Southeast Asia') {
        sEastAsia[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'Sub-Saharan Africa') {
        subSaAfrica[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Region == 'Western Europe') {
        westEurope[k] = parseInt(data[j].casualities)
      }
      prevTarget = currTarget
  }


          


 
return {
    year,
    australia,
  centralAmerica,
  eastAsia,
  eEurope,
  meNAfrica,
  nAmerica,
  sAmerica,
  sAsia,
  sEastAsia,
  subSaAfrica,
  westEurope
    
}
}

module.exports = {
    getYearWiseAttacks
}
