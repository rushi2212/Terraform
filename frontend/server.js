const express = require("express");

const app = express();
const PORT = 3000;


app.get("/", (req, res) => {

    res.json({
        message: "Express Frontend is running"
    });
});

app.get("/api", async (req, res) => {

    try {

        const response = await fetch("http://backend:5000/");
        const data = await response.json();

        res.json({
            frontend: "Express",
            backend: data
        });

    } catch (error) {
        res.status(500).json({
            error: "Could not connect to Flask backend"
        });
    }
    
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Express frontend running on port ${PORT}`);
});