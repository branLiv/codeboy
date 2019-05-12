set names utf8;
drop database if exists xz;
create database xz charset=utf8;
use xz;
    -- 1、用户信息表
    create table xz_user(
        uid int primary key auto_increment,
        uname varchar(32),
        upwd varchar(32),
        email varchar(64),
        phone varchar(16) unique not null,
        avatar varchar(128),
        user_name varchar(32),
        gender bool
    );
    -- 1、添加测试信息
    insert into xz_user values
        (null,"branLiv",123,"123@123.com",15956077774,null,"李伟",1),
        (null,"coco",123,"123@123.com",15956123274,null,"任捷",1);

    -- 2、用户地址表
    create table xz_receiver_address(
        aid int primary key auto_increment,
        user_id int,
        receiver varchar(16),
        province varchar(16),
        city varchar(16),
        county varchar(16),
        address varchar(128),
        cellphone varchar(16),
        fixedphone varchar(16),
        postcode char(6),
        tag varchar(16),
        is_default bool
    );
    --2、添加测试信息
    insert into xz_receiver_address values
    (null,10,"程晓鱼","安徽省","芜湖市","无为县","襄安镇襄安中学史地组","13965447503",null,null,"好吃的",1),
    (null,20,"程晓兔","安徽省","芜湖市","无为县","高沟镇新沟中学","13922447503",null,null,"好看的",1);

    --3、用户购物车表
    create table xz_shopping_cart(
        cid int primary key auto_increment,
        user_id int,
        product_id int,
        count int
    );
    --3、添加测试信息
    insert into xz_shopping_cart values
    (null,10,3321,1),
    (null,10,2321,11);

    --4、用户订单表
    create table xz_order(
        aid int primary key auto_increment,
        user_id int,
        address_id int,
        status int,
        order_time bigint,
        pay_time bigint,
        deliver_time bigint,
        received_time bigint
    );
    --4、添加测试信息
    insert into xz_order values
    (null,10,3232,2,43220,43250,null,null);

    --5、用户订单详情表
    create table xz_order_detail(
        did int primary key auto_increment,
        order_id int,
        product_id int,
        count int
    );
    --5、添加测试信息
    insert into xz_order_detail values
    (null,10,3321,1),
    (null,10,2321,11);

    --6、商品类别表
    create table xz_laptop_family(
        fid int primary key auto_increment,
        name varchar(32)
    );
    --6、添加测试信息
    insert into xz_laptop_family values
    (null,"这是一款与众不同的，物美价廉的，你值得拥有的年度好货！");

    --7、商品表
    create table xz_laptop(
        lid int primary key auto_increment,
        family_id int,
        product_id int,
        title varchar(128),
        subtitle varchar(128),
        price decimal(10,2),
        promise varchar(64),
        spec varchar(64),
        name varchar(32),
        os varchar(32),
        memory varchar(32),
        resolution varchar(32),
        video_card varchar(32),
        cpu varchar(32),
        video_memory varchar(32),
        category varchar(32),
        disc varchar(32),
        details varchar(1024),
        shelf_time bigint,
        sold_count int,
        is_onsale bool
    );
    --7、添加测试信息
    insert into xz_laptop values
    (null,10,3321,"这是一款与众不同的，物美价廉的，你值得拥有的年度好货！",null,6888.88,"70天无理由退货，质保10年","#1280 pad新款","ipad 3I","ios1.0.5","4g","1920*768","AMD440","I10","2g",null,"500g",null,42450,256,1);

    --8、商品详情图标
    create table xz_laptop_pic(
        pid int primary key auto_increment,
        laptop_id int,
        sm varchar(128),
        md varchar(128),
        lg varchar(128)
    );
    --8、添加测试信息
    insert into xz_laptop_pic values
    (null,2166,"img/sm.png","img/md.png","img/lg.png");

    --9、首页轮播图表
    create table xz_index_carousel(
        cid int primary key auto_increment,
        img varchar(128),
        title varchar(64),
        href varchar(128)
    );
    --9、插入测试信息
    insert into xz_index_carousel values
    (null,"../img/carousel.png","超大屏游戏笔记本，吃鸡上王者更轻松","http://127.0.0.1:3000/img/laptop.png");

    --10、首页商品兰目标
    create table xz_index_product(
        pid int primary key auto_increment,
        title varchar(64),
        details varchar(128),
        pic varchar(128),
        price decimal(10,2),
        href varchar(128),
        seq_recommended tinyint,
        seq_new_arrival tinyint,
        seq_top_sale tinyint
    );
    --10、插入测试信息
    insert into xz_index_product values
    (null,"超大屏游戏笔记本，吃鸡上王者更轻松","超大屏游戏笔记本，吃鸡上王者更轻松","../img/carousel.png",688.88,"http://127.0.0.1:3000/img/laptop.png",3,2,1);