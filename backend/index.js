

const express = require("express");
const app = express();
const port = 3000;
const demoRouter = require("./routes/demo");
const regionAttacks = require("./routes/regionAttacks");
const terrorGroups = require("./routes/terrorGroups");
const attackTarget = require("./routes/attackTarget");
const yearAttack = require("./routes/yearWiseAttack");
app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Headers", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, PATCH, DELETE");
    next();
  });

app.get("/", (req, res) => {
  res.json({ message: "ok" });
});

app.use("/demo", demoRouter);
app.use("/getRegionAttacks", regionAttacks);
app.use("/getTerrorGroups", terrorGroups);
app.use("/getAttackTarget", attackTarget);
app.use("/getYearWiseAttack", yearAttack);
/* Error handler middleware */
app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});





