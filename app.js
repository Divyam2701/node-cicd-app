const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello, World! This is a CI/CD pipeline deployment using AWS! and also added cicd pipeline to ensure that code remians updated");
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
