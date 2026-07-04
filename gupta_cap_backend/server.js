const express = require('express');
const cors = require('cors');
require('dotenv').config();

// Import your custom database connection function
const { connectDB } = require('./config/database'); 

const app = express();

// Middleware
app.use(cors());
app.use(express.json()); // Allows parsing JSON request bodies

// Simple Test Route
app.get('/api/test', (req, res) => {
    res.json({ message: "Backend server is running smoothly!" });
});

const PORT = process.env.PORT || 5000;

// Connect to Database and Start Server
const startServer = async () => {
    // 1. Establish database connection using your robust retry function
    await connectDB(); 
    
    // 2. Start listening on the designated port only after DB connection logic finishes
    app.listen(PORT, () => {
        console.log(`🚀 Server is listening perfectly on port ${PORT}`);
    });
};

startServer();