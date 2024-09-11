<?php


namespace app\index\controller;


use think\Controller;
use think\Db;
use think\Validate;

class Api extends Controller
{
    public function create(){
        $long_url = $this->request->post('url');
        $keyword = $this->request->post('keyword');

        // 验证链接是否合法
        if (!filter_var($long_url,FILTER_VALIDATE_URL)){
            return $this->returnError(-2);
        }

        $data = [];

        if ($token = $this->request->header('Token')){
            if ($uid = Db::name('user')->where('token',$token)->value('id')){
                $data['user_id'] = $uid;
            }
        }

        if ($keyword){
            // 客户自定义
            $check = Validate::checkRule($keyword,'alphaNum|length:3,25');
            if (!$check){
                return $this->returnError(-6);
            }
            // 查询关键词是否被占用
            if (Db::table('urls')->where('keyword',$keyword)->find()){
                return $this->returnError(-7);
            }

            // 客户自定义
            $data['url'] = $long_url;
            $data['keyword'] = $keyword;
            $data['type'] = 2;
            $data['ip'] = $this->request->ip();

            // 启动事务
            Db::startTrans();
            try {
                Db::table('urls')->insert($data);
                // 提交事务
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return $this->returnError(-1);
            }
            return $this->returnSuccess($keyword);
        } else {

            // 系统生成
            $data['url'] = $long_url;
            $data['ip'] = $this->request->ip();

            // 启动事务
            Db::startTrans();
            try {
                $id = Db::table('urls')->insertGetId($data);
                // 生成关键词
                $keyword = decimal_10_to($id);
                // 查询关键词是否存在
                $had = Db::table('urls')->where(['keyword'=>$keyword])->find();
                if ($had){
                    // 从类型为自定义的记录里选取一条记录，用它的 id 去计算短码
                    $keyword = decimal_10_to($had['id']);
                }
                Db::table('urls')->where('id',$id)->update(['keyword'=>$keyword]);
                // 提交事务
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return $this->returnError(-1);
            }
            return $this->returnSuccess($keyword);
        }
    }

    /**
     * 成功返回短链接
     * @param $keyword
     * @return \think\response\Json
     */
    protected function returnSuccess($keyword)
    {
        $short_url = $this->request->domain().'/'.$keyword;
        $long_url = $this->request->post('url');
        return json(['Code'=>0,'ShortUrl'=>$short_url,'LongUrl'=>$long_url,'ErrMsg'=>'']);
    }

    /**
     * 返回错误信息
     * @param $code
     * @return \think\response\Json
     */
    protected function returnError($code)
    {
        switch ($code){
            case -1:
                $msg = '短链接生成失败';
                break;
            case -2:
                $msg = '长链接不合法';
                break;
            case -3:
                $msg = '长链接存在安全隐患';
                break;
            case -4:
                $msg = '长链接插入数据库失败';
                break;
            case -5:
                $msg = '长链接在黑名单中，不允许注册';
                break;
            case -6:
                $msg = '短链后缀只能是字母、数字，长度范围：3-25';
                break;
            case -7:
                $msg = '该后缀已被占用';
                break;
            default:
                $msg = '正常返回短链接';
        }
        $long_url = $this->request->post('url') ?: '';
        return json(['Code'=>$code,'ShortUrl'=>'','LongUrl'=>$long_url,'ErrMsg'=>$msg]);
    }

    public function query()
    {
        $short_url = $this->request->post('shortUrl');
        if (!$short_url){
            return $this->queryError(-1);
        }
        $pare_url = explode('/',$short_url);
        if (count($pare_url) != 4){
            return $this->queryError(-1);
        }
        if ($url = Db::table('urls')->where('keyword',$pare_url[3])->find()){
            return $this->querySuccess($url['url']);
        } else {
            return $this->queryError(-2);
        }
    }


    protected function querySuccess($long_url)
    {
        $short_url = $this->request->post('shortUrl');
        return json(['Code'=>0,'ShortUrl'=>$short_url,'LongUrl'=>$long_url,'ErrMsg'=>'']);
    }

    protected function queryError($code)
    {
        switch ($code){
            case -1:
                $msg = '短链接不合法';
                break;
            case -2:
                $msg = '短链接不存在';
                break;
            case -3:
                $msg = '短链接对应的长链接不合法';
                break;
            default:
                $msg = '正常返回短链接';
        }
        $long_url = $this->request->post('url') ?: '';
        return json(['Code'=>$code,'ShortUrl'=>'','LongUrl'=>$long_url,'ErrMsg'=>$msg]);
    }

    public function tj()
    {
        $short_url = $this->request->get('shortUrl');
        $type = $this->request->get('type');
        if (!$short_url){
            return json(['code'=>0,'msg'=>'短链接不能为空']);
        }
        // 解析短链接
        $pare_url = explode('/',$short_url);
        if (count($pare_url) != 4){
            return json(['code'=>0,'msg'=>'短链接不合法']);
        }
        if ($url = Db::table('urls')->where('keyword',$pare_url[3])->find()){
            $today_start_time = date('Y-m-d 00:00:00');
            $today_end_time = date('Y-m-d 23:59:59');

            $yesterday_start_time = date('Y-m-d 00:00:00',time()-24*3600);
            $yesterday_end_time = date('Y-m-d 23:59:59',time()-24*3600);

            switch ($type){
                case 'flow':
                    // 今日浏览量
                    $data['today']['pv'] = Db::table('log')->where('url_id',$url['id'])->where('click_time','between',[$today_start_time,$today_end_time])->count();
                    // 今日访客数
                    $data['today']['uv'] = Db::table('log')->where('url_id',$url['id'])->where('click_time','between',[$today_start_time,$today_end_time])->distinct(true)->count('DISTINCT uuid');
                    // 今日ip数
                    $data['today']['ip'] = Db::table('log')->where('url_id',$url['id'])->where('click_time','between',[$today_start_time,$today_end_time])->distinct(true)->count('DISTINCT ip');

                    // 昨日浏览量
                    $data['yesterday']['pv'] = Db::table('log')->where('url_id',$url['id'])->where('click_time','between',[$yesterday_start_time,$yesterday_end_time])->count();
                    // 昨日访客数
                    $data['yesterday']['uv'] = Db::table('log')->where('url_id',$url['id'])->where('click_time','between',[$yesterday_start_time,$yesterday_end_time])->distinct(true)->count('DISTINCT uuid');
                    // 昨日ip数
                    $data['yesterday']['ip'] = Db::table('log')->where('url_id',$url['id'])->where('click_time','between',[$yesterday_start_time,$yesterday_end_time])->distinct(true)->count('DISTINCT ip');

                    // 总浏览量
                    $data['total']['pv'] = Db::table('log')->where('url_id',$url['id'])->count();
                    // 总访客数
                    $data['total']['uv'] = Db::table('log')->where('url_id',$url['id'])->distinct(true)->count('DISTINCT uuid');
                    // 总ip数
                    $data['total']['ip'] = Db::table('log')->where('url_id',$url['id'])->distinct(true)->count('DISTINCT ip');

                    return json(['code'=>1,'data'=>$data]);

            }
        } else {
            return json(['code'=>0,'msg'=>'短链接不存在']);
        }
    }
}