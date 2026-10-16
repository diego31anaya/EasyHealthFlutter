import mongoose from "mongoose"

export async function connectDB() {
    try {
        const connection = await mongoose.connect(process.env.MONGO_URI)
        console.log(`MongoDB Connected: ${connection.connection.host}`)
    } catch (error) {
        console.error(`Error: ${error.message}`);
        process.exit(1); // 1 code means a failure, 0 means success
    }
}