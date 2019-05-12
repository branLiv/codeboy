const express = require("express");
const bodyParser = require("body-parser");
const user = require("./routes/user.js");
// const product = require("routes/product.js");
var server=express();
var port=3000;
server.listen(port,()=>{
    console.log("server listening 3000...");
});
server.use(express.static("public"));
server.use(bodyParser.urlencoded({
    extended:false
}));
//挂在用户路由器
server.use("/user",user);
//挂在商品路由器
// server.use("/product",product);