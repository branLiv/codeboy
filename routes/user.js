const express = require("express");
const pool = require("../pool.js");
var router=express.Router();

//1、用户注册
router.post("/register",(req,res)=>{
    console.log(req.body);
    pool.query("insert into xz_user values(null,?,?,?,?,null,null,null)",[req.body.uname,req.body.upwd,req.body.email,req.body.phone],(err,result)=>{
        if (err) throw err;
        console.log(result);
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

// 4、用户登录
router.post("/login",(req,res)=>{
    pool.query("select * from xz_user where uname=? and upwd=?",[req.body.uname,req.body.upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send("1");
        }else{
            res.send('0');
        }
    })
})

//5、用户检索
router.get("/detail",(req,res)=>{
    pool.query("select * from xz_user",(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})

//6、删除用户
router.get("/delete",(req,res)=>{
    pool.query("delete from xz_user where uid=?",[req.query.uid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send("1");
        }
    })
})







module.exports=router;