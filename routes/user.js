const express = require("express");
const pool = require("../pool.js");
var router=express.Router();

//1、用户注册
router.post("/register",(req,res)=>{
    pool.query("insert into xz_user values ?",[null,req.body.uname,req.body.upwd,req.body.email,req.body.phone,req.body.avatar,req.body.user_name,req.body.gender],(err,result)=>{
        if (err) throw err;
        if(result.affectedRows>0){
            res.send("1");
        }
    })
})




module.exports=router;