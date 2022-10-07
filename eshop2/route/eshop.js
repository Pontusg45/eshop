/**
 * Route for eshop.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const eshop       = require("../src/eshop.js");
const sitename   = "| The Coffe Shop";

module.exports = router;

router.get("/index", (req, res) => {
    let data = {
        title: `Welcome ${sitename}`
    };

    res.render("eshop/index", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: "Kategorier"
    };

    data.res = await eshop.showCategory();
    console.log(data);
    res.render("eshop/category", data);
});

router.get("/product", async (req, res) => {
    let data = {
        title: `Create a new product ${sitename}`
    };

    data.res = await eshop.showProducts();
    console.log(data.res);

    res.render("eshop/product", data);
});

router.get("/create", async (req, res) => {
    let data = {
        title: `Create a new product ${sitename}`
    };

    console.log(data.res);

    res.render("eshop/create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await eshop.createProduct(req.body.n, req.body.c, req.body.p, req.body.d, req.body.q);
    res.redirect("/eshop/product");
});

router.get("/product/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Product ${id} ${sitename}`,
        account: id
    };

    data.res = await eshop.showSpecificProduct(id);

    res.render("eshop/product-view", data);
});

router.get("/edit/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Edit product ${id} ${sitename}`,
        account: id
    };

    data.res = await eshop.showSpecificProduct(id);
    console.log(data.res[0]);

    res.render("eshop/product-edit", data);
});

router.post("/edit", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await eshop.updateProduct(req.body.name, req.body.desc, req.body.price, req.body.id);
    res.redirect(`/eshop/edit/${req.body.id}`);
});

router.get("/delete/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Delete product ${id} ${sitename}`,
        account: id
    };

    data.res = await eshop.showSpecificProduct(id);

    res.render("eshop/product-delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await eshop.removeProduct(req.body.id);
    res.redirect(`/eshop/product`);
});

router.get("/costumer", async (req, res) => {
    let data = {
        title: `Shows all Costumers ${sitename}`
    };

    data.res = await eshop.showCostumers();
    console.log(data.res);

    res.render("eshop/costumer", data);
});

router.get("/order", async (req, res) => {
    let data = {
        title: `Shows all orders${sitename}`
    };

    data.res = await eshop.showOrders();
    console.log(data.res);

    res.render("eshop/order", data);
});
router.get("/create_order/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Shows all Costumers ${id} ${sitename}`,
        order: id
    };

    await eshop.createOrder(id);
    data.res = await eshop.showOrders();
    console.log(data);

    res.render("eshop/order", data);
});

router.post("/add_to_order", urlencodedParser, async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Edit product ${id} ${sitename}`,
        account: id
    };

    console.log(`${req.body.order_id} ${req.body.id} ${req.body.quantity}`);
    data.res = await eshop.addToOrder(req.body.order_id, req.body.id, req.body.quantity);
    console.log(data.res);

    res.redirect(`/eshop/order`);
});

router.get("/add_to_order/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        title: `Edit product ${id} ${sitename}`,
        account: id
    };

    data.res = await eshop.showProducts();
    console.log(data);

    res.render("eshop/add_to_order", data);
});

router.get("/about", async (req, res) => {
    let data = {
        title: `About ${sitename}`
    };

    res.render("eshop/about", data);
});
