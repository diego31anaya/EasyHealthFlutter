import express from "express";
import dotenv from "dotenv";
import { connectDB } from "../config/database.js";
import scan_historyRoutes from "../routes/scan_history.route.js";
import productRoutes from "../routes/product.route.js"

// TEMPORARY
//import dns from 'node:dns'; // Or const dns = require('node:dns');
//dns.setServers(['1.1.1.1', '8.8.8.8']);

dotenv.config();

const app = express();
const PORT = process.env.PORT || 8000;

app.use(express.json()); // allows us to accept JSON data in req.body

app.use("/products", productRoutes);
app.use("/scan_history", scan_historyRoutes);

async function startServer() {
  try {
    await connectDB();

    app.listen(PORT, () => {
      console.log(`Server started at http://localhost:${PORT}`);
    });
  } catch (error) {
    console.error("Failed to start server:", error);
    process.exit(1);
  }
}

startServer();
