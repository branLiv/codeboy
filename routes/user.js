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

//2、用户名是否存在验证
router.get("/check",(req,res)=>{
    pool.query("select * from xz_user where uname=?",[req.query.uname],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send("0");
            console.log("用户已存在");
        }else{
            res.send("1");
            console.log("用户名可用！");
        }
    })
})


module.exports=router;