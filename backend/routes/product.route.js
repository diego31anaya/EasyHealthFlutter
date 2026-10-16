import express from "express";
import { searchProduct } from "../controllers/product.controller.js";

const router = express.Router();

router.get("/:barcode", searchProduct);

export default router;