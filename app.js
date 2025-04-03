const express = require("express");
const cors = require("cors"); // Enable CORS support
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors()); // Allow cross-origin requests
app.use(express.json()); // Support JSON payloads

// Root Route
app.get("/", (req, res) => {
  res.send("Hello, World! This is a CI/CD pipeline deployment using AWS!. Added the whole code using the code pipeline and added new functionality");
});

// Health Check Route
app.get("/health", (req, res) => {
  res.json({ status: "ok", message: "Server is running fine!" });
});

// Global Error Handler
app.use((err, req, res, next) => {
  console.error("Error:", err.stack);
  res.status(500).json({ error: "Internal Server Error" });
});

// Start Server
app.listen(PORT, "0.0.0.0", () => {
  console.log(`🚀 Server is running on http://0.0.0.0:${PORT}`);
});
