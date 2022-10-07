/*  *
 * General routes.
 */
"use strict";

const express = require("express");
const router  = express.Router();

// Add a route for the path /
router.get("/", (req, res) => {
    res.send("Hello World");
});


module.exports = router;
