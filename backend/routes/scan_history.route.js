import express from "express";
import {
  getScanHistory,
  createScanHistoryEntry,
  deleteScanHistoryEntry,
} from "../controllers/scan_history.controller.js";

const router = express.Router();

router.get("/", getScanHistory);

router.post("/", createScanHistoryEntry);

//router.put("/:id", updateProduct);

router.delete("/:id", deleteScanHistoryEntry);

export default router;
