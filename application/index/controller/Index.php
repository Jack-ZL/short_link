<?php

namespace app\index\controller;

use app\common\controller\Frontend;

use think\Db;

class Index extends Frontend
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';

    public function index()
    {
        $this->assign('navItem','1');

        $token = $this->auth->token;
        if($token){
            $this->assign('token',$token);
        }
        return $this->view->fetch();
    }

    public function jump($keyword = null)
    {
        $url = Db::table('urls')->where('keyword',$keyword)->find();
        if ($url){
            // 统计任务
            $this->clickLog($url);
            $this->redirect($url['url'],[],301);
        }
        return '您访问的链接不存在';
    }

    /**
     * 点击日志
     * @param $url
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    private function clickLog($url)
    {
        // 唯一字符串
        $uuid = cookie('DID');
        if (!$uuid){
            $uuid = uniqid('',true);
            // 保存 cookie , 100年哦！
            cookie('DID',$uuid,3153600000);
        }
        // 跳转次数 +1
        Db::table('urls')->where('id',$url['id'])->inc('clicks')->update();

        // 访客信息
        $info['url_id'] = $url['id'];
        $info['uuid'] = $uuid; // uid
        $info['ip'] = $this->request->ip();
        // 来源
        $referer = $this->request->server('HTTP_REFERER');
        if ($referer){
            $info['referer'] = $referer;
            $parse_url = parse_url($referer);
            $info['referer_scheme'] = $parse_url['scheme'];
            $info['referer_host'] = $parse_url['host'];
        }
        $ua = $this->request->server('HTTP_USER_AGENT');
        if ($ua){
            $info['user_agent'] = $ua;
        }
        // 设备
        $info['device'] = $this->request->isMobile() ? 'mobile' : 'pc';
        // 是否新访客，默认 0
        if (! Db::table('log')->where(['url_id'=>$url['id'],'uuid'=>$uuid])->find()){
            $info['new_visitor'] = 1;
        }
        // 获取访客省份

        // 插入数据库
        Db::table('log')->insert($info);
    }

    public function doc()
    {
        $this->assign('navItem','2');
        return $this->fetch();
    }

    public function faq()
    {
        $this->assign('navItem','3');
        return $this->fetch();
    }

    public function tj()
    {
        $this->assign('navItem','4');
        return $this->fetch();
    }

    public function news()
    {
        $newslist = [];
        return jsonp(['newslist' => $newslist, 'new' => count($newslist), 'url' => 'https://www.fastadmin.net?ref=news']);
    }

    public function changJumpUrl()
    {
        $id = $this->request->post('id');
        $url = $this->request->post('url');
        // 验证链接是否合法
        if (!filter_var($url,FILTER_VALIDATE_URL)){
            $this->error('请输入正确的长链接');
        }
        $update = Db::table('urls')->where('id',$id)->update(['url'=>$url]);
        if ($update == 1){
            $this->success('修改成功');
        }
        $this->error('修改失败');
    }

}
