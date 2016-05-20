//
//  NetworkDefinition.h
//  PLASOFTWARE
//
//  Created by Chris on 4/20/16.
//  Copyright © 2016 Young. All rights reserved.
//

#ifndef NetworkDefinition_h
#define NetworkDefinition_h

//web服务地址
#define SERVER_URL @"http://www.zendaiart.net/"
//md5 key
#define MD5_KEY @"QW!!22*&90)"



/*功能接口定义*/

//用户登陆
#define USERLOGIN @"beaut/loginuser.php"

//用户注册
#define USERREGIST @"beaut/registeruser.php"

//城市列表
#define CITYLIST @"beaut/getcitylist.php"

//商户查询
#define STORE_ALL @"beaut/orginfosearch.php"

//项目查询
#define SERVICE @"beaut/servicesearch.php"

//服务项目、员工查询
#define STORE_SERVICE_STUFF @"beaut/prodservicesearch.php"

//进行预约
#define CONFIRM_RESERVATION @"beaut/custorder.php"

//预约列表
#define RESERVATION_LIST @"beaut/orderlist.php"

//预约详情
#define RESERVATION_INFO @"beaut/orderdetail.php"

//取消预约
#define RESERVATION_CANCEL @"beaut/ordercancel.php"



#endif /* NetworkDefinition_h */
