import mongoose from "mongoose";

const scan_historySchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },
    brand: {
      type: String,
      required: true,
    },
    nutrition: {
      nutri_score: {
        type: String,
        enum: ['A', 'B', 'C', 'D', 'E', null],
        default: null
      },
      calories: {
        type: Number,
        min: 0,
      }, 
      protein: {
        type: Number,
        min: 0
      }
    },
    image: {
      type: String,
      required: true,
    },
  },
  {
    timestamps: true, // createdAt, updatedAt
  },
);

const Scan_History = mongoose.model("scan_history", scan_historySchema);

export default Scan_History;
