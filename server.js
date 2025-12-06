const express = require("express");
const path = require("path");
const app = express();
const port = 3000; // FIXED PORT
app.use(express.static(path.join(__dirname)));
app.get(/.*/, (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});
app.listen(port, () => {
  console.log(`Flutter web running on port ${port}`);
});