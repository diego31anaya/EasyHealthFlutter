import mongoose from "mongoose";
import Scan_History from "../models/scan_history.modal.js";

export const getScanHistory = async (req, res) => {
  try {
    const scan_history = await Scan_History.find({});
    res.status(200).json({ success: true, data: scan_history });
  } catch (error) {
    console.error("Error in fetching scan_history:", error.message);
    res.status(500).json({ success: false, message: "Server Error" });
  }
};

export const createScanHistoryEntry = async (req, res) => {
  const scanHistoryEntry = req.body; // user will send this data

  if (
    !scanHistoryEntry.name ||
    !scanHistoryEntry.image ||
    !scanHistoryEntry.brand ||
    !scanHistoryEntry.nutrition
  ) {
    return res.status(400).json({ message: "Please provide all fields " });
  }

  const newScanHistoryEntry = new Scan_History(scanHistoryEntry);

  try {
    await newScanHistoryEntry.save();
    res.status(201).json({ success: true, data: newScanHistoryEntry });
  } catch (error) {
    console.error("Error in Create Scan History Entry:", error.message);
    res.status(500).json({ success: false, message: "Server Error" });
  }
};

export const updateScanHistory = async (req, res) => {};

export const deleteScanHistoryEntry = async (req, res) => {
  const { id } = req.params;

  if (!mongoose.Types.ObjectId.isValid(id)) {
    return res
      .status(404)
      .json({ success: false, message: "Invalid Scan History Entry Id" });
  }

  try {
    await Scan_History.findByIdAndDelete(id);
    res.status(200).json({ success: true, message: "Scan History Entry deleted" });
  } catch (error) {
    res.status(500).json({ success: false, message: "Server Error" });
  }
};
