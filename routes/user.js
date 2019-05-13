const express = require("express");
const pool = require("../pool.js");
var router=express.Router();

//1、用户注册
router.post("/register",(req,res)=>{
    pool.query("insert into xz_user set ?",[req.body],(err,result)=>{
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

//3、手机号是否存在验证
router.get("/check_phone",(req,res)=>{
    pool.query("select * from xz_user where phone=?",[req.query.phone],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send("0");
            console.log("手机号已存在");
        }else{
            res.send("1");
        }
    })
})

module.exports=router;