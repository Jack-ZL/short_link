<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

Route::post('api/create','Api/create');

Route::post('api/query','Api/query');

Route::get('api/tj','Api/tj');

Route::get('/','Index/index');

Route::get('doc','Index/doc');

Route::get('faq','Index/faq');

Route::get('tj','Index/tj');

Route::rule('user/urls','User/urls');

Route::rule('index/ajax/lang','index/ajax/lang');

Route::rule('user','User/index');
Route::rule('user/login','User/login');
Route::rule('user/logout','User/logout');
Route::rule('user/register','User/register');
Route::rule('user/changepwd','User/changepwd');
Route::rule('user/profile','User/profile');

Route::get('/[:keyword]', 'Index/jump');

return [
    //别名配置,别名只能是映射到控制器且访问时必须加上请求的方法
    '__alias__'   => [
    ],
    //变量规则
    '__pattern__' => [
    ],
//        域名绑定到模块
//        '__domain__'  => [
//            'admin' => 'admin',
//            'api'   => 'api',
//        ],
];
