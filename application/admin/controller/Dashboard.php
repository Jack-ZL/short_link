<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use app\common\model\User;
use think\Config;
use think\Db;

/**
 * 控制台
 *
 * @icon fa fa-dashboard
 * @remark 用于展示当前系统中的统计数据、统计报表及重要实时数据
 */
class Dashboard extends Backend
{

    /**
     * 查看
     */
    public function index()
    {
        $seventtime = \fast\Date::unixtime('day', -7);
        $paylist = $createlist = [];
        for ($i = 0; $i < 7; $i++)
        {
            $day = date("Y-m-d", $seventtime + ($i * 86400));
            $createlist[$day] = mt_rand(20, 200);
            $paylist[$day] = mt_rand(1, mt_rand(1, $createlist[$day]));
        }
        $hooks = config('addons.hooks');
        $uploadmode = isset($hooks['upload_config_init']) && $hooks['upload_config_init'] ? implode(',', $hooks['upload_config_init']) : 'local';
        $addonComposerCfg = ROOT_PATH . '/vendor/karsonzhang/fastadmin-addons/composer.json';
        Config::parse($addonComposerCfg, "json", "composer");
        $config = Config::get("composer");
        $addonVersion = isset($config['version']) ? $config['version'] : __('Unknown');
        $total_user = User::where('group_id',0)->count();
        $total_views = Db::table('log')->count();
        $total_url = Db::table('urls')->count();

        $today_url = Db::table('urls')->whereBetween('create_time',[date('Y-m-d').' 00:00:00',date('Y-m-d').' 23:59:59'])->count();
        $this->view->assign([
            'totaluser'        => $total_user,
            'totalviews'       => $total_views,
            'totalorder'       => $total_url,
            'totalorderamount' => 0,
            'todayuserlogin'   => '-',
            'todayusersignup'  => '-',
            'todayorder'       => $today_url,
            'unsettleorder'    => '-',
            'sevendnu'         => '-',
            'sevendau'         => '-',
            'paylist'          => $paylist,
            'createlist'       => $createlist,
            'addonversion'       => $addonVersion,
            'uploadmode'       => $uploadmode
        ]);

        return $this->view->fetch();
    }

}
