const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getRegionAttacks(page = 1){
  const offset = helper.getOffset(page, config.listPerPage);
  const rows = await db.query(
    'Select Region, Attack, count(`Total Casualties`) as casualities from globalterror_dw.regioncountryattackview Group by Region, Attack order by Region,Attack'
  );
  const data = helper.emptyOrRows(rows);
  regions = []
  armedAssault = []
  assassination = []
  bombing = []
  facInfraAttack = []
  hijacking = []
  hostBarricade = []
  hostKid = []
  unarmedAssault = []

  data.forEach(element => {
      if (!regions.includes(element.Region)){
          regions.push(element.Region)
      }
  })
  
  for (let i = 0; i < regions.length; i++){
      armedAssault.push(0)
      assassination.push(0)
      bombing.push(0)
      facInfraAttack.push(0)
      hijacking.push(0)
      hostBarricade.push(0)
      hostKid.push(0)
      unarmedAssault.push(0)
  }

  let prevTarget = ''
  let currTarget = ''
  let k = -1
  for (let j = 0; j < data.length; j++){
      currTarget = data[j].Region
      if (currTarget != prevTarget && data[j].Attack == 'Armed Assault') {
          k += 1
          armedAssault[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Assassination') {
          assassination[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Bombing/Explosion') {
          bombing[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Facility/Infrastructure Attack') {
          facInfraAttack[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Hijacking') {
          hijacking[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Hostage Taking (Barricade Incident)') {
          hostBarricade[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Hostage Taking (Kidnapping)') {
          hostKid[k] = parseInt(data[j].casualities)
      }
      if (currTarget == prevTarget && data[j].Attack == 'Unarmed Assault') {
          unarmedAssault[k] = parseInt(data[j].casualities)
      }
      prevTarget = currTarget
  }


          


 
return {
  targets,
  armedAssault,
  assassination,
  bombing,
  facInfraAttack,
  hijacking,
  hostBarricade,
  hostKid,
  unarmedAssault
}
}

module.exports = {
  getRegionAttacks
}
