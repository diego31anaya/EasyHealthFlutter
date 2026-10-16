export async function getProductByBarcode(barcode) {
  const url = process.env.OPENFOODFACTS_BASE_API_URL + `/product/${barcode}`;

  const response = await fetch(url, {
    headers: {
        "User-Agent": "EasyHealthFlutter/1.0"
    },
    signal: AbortSignal.timeout(8000),
  });

  if (response.status === 404) return null;

  if(!response.ok) {
    throw new Error(`Open Food Facts returned ${response.status}`);
  }

  const data = await response.json();
  return data.product ?? null;
}
