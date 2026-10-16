import { getProductByBarcode } from "../services/open_food_facts.service.js";

export async function searchProduct(req, res) {
  const { barcode } = req.params;
  if (!barcode) {
    return res.status(400).json({
      success: false,
      message: "Invalid barcode",
    });
  }

  try {
    const product = await getProductByBarcode(barcode);

    if (!product) {
      return res.status(404).json({
        success: false,
        message: "Product not found",
      });
    }

    return res.status(200).json({
      success: true,
      data: product,
    });
  } catch (error) {
    console.error("Product lookup failed:", error);

    return res.status(502).json({
      success: false,
      message: "Could not retrieve product information",
    });
  }
}
