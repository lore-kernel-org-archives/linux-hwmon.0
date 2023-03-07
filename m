Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D63EC64EC4
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Mar 2023 00:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCGA6v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Mar 2023 19:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjCGA6t (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2023 19:58:49 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16EA31E33
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Mar 2023 16:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678150726; x=1709686726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OOxHRAOxNUFAmG0bMr6TzMEWgbw6yZjsPYXFqDEYTRE=;
  b=HgnW20WbKdaAFqGvFgRs4m1Q/22k/7lAaoOqXiHLKPdrPh5TdwHKFlcH
   ElMOI6FlT9GnhpnlV0/dIfVES1RQKUpNJJS1DNBTHE4PuyXFfv77jMT7u
   3P4NenBNC+/7V5VXzq628ZQMWAm03k+YlUyrDmPDTiOOeug6OI+LvLMjW
   6Rsge48CjTxHGhDgIvCFmeuY/HtEK4X+YHW2J1fJMdRL/h/1PBphos5ze
   W4BJjtcFP/h9l8zoOotn8fH1vszxXLLD/qtwqiq1uV3difK4WFIv/G+cC
   +0n2FlAcf/++7GLREXDfTAskL685uH41Dktwr2/zgo+ANTaQ7mKpxfsRz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="337244801"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="337244801"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 16:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="676378228"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="676378228"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Mar 2023 16:58:44 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZLfA-0000oo-0p;
        Tue, 07 Mar 2023 00:58:44 +0000
Date:   Tue, 7 Mar 2023 08:57:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:watchdog-next 35/38]
 drivers/watchdog/bcm47xx_wdt.c:205:47: error: too few arguments to function
 call, expected 2, have 1
Message-ID: <202303070812.88OvdkNL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   faaf9f98d1032c901d8e859e3b6883c7e67614b6
commit: 82919ed52f4a2c1b26fa34d6fd5370da06dff816 [35/38] watchdog: bcm47xx: Simplify using devm_watchdog_register_device()
config: hexagon-randconfig-r045-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070812.88OvdkNL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=82919ed52f4a2c1b26fa34d6fd5370da06dff816
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 82919ed52f4a2c1b26fa34d6fd5370da06dff816
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070812.88OvdkNL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/bcm47xx_wdt.c:205:47: error: too few arguments to function call, expected 2, have 1
           ret = devm_watchdog_register_device(&wdt->wdd);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~          ^
   include/linux/watchdog.h:226:5: note: 'devm_watchdog_register_device' declared here
   int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
       ^
   1 error generated.


vim +205 drivers/watchdog/bcm47xx_wdt.c

   176	
   177	static int bcm47xx_wdt_probe(struct platform_device *pdev)
   178	{
   179		int ret;
   180		bool soft;
   181		struct bcm47xx_wdt *wdt = dev_get_platdata(&pdev->dev);
   182	
   183		if (!wdt)
   184			return -ENXIO;
   185	
   186		soft = wdt->max_timer_ms < WDT_SOFTTIMER_THRESHOLD * 1000;
   187	
   188		if (soft) {
   189			wdt->wdd.ops = &bcm47xx_wdt_soft_ops;
   190			timer_setup(&wdt->soft_timer, bcm47xx_wdt_soft_timer_tick, 0);
   191		} else {
   192			wdt->wdd.ops = &bcm47xx_wdt_hard_ops;
   193		}
   194	
   195		wdt->wdd.info = &bcm47xx_wdt_info;
   196		wdt->wdd.timeout = WDT_DEFAULT_TIME;
   197		wdt->wdd.parent = &pdev->dev;
   198		ret = wdt->wdd.ops->set_timeout(&wdt->wdd, timeout);
   199		if (ret)
   200			goto err_timer;
   201		watchdog_set_nowayout(&wdt->wdd, nowayout);
   202		watchdog_set_restart_priority(&wdt->wdd, 64);
   203		watchdog_stop_on_reboot(&wdt->wdd);
   204	
 > 205		ret = devm_watchdog_register_device(&wdt->wdd);
   206		if (ret)
   207			goto err_timer;
   208	
   209		dev_info(&pdev->dev, "BCM47xx Watchdog Timer enabled (%d seconds%s%s)\n",
   210			timeout, nowayout ? ", nowayout" : "",
   211			soft ? ", Software Timer" : "");
   212		return 0;
   213	
   214	err_timer:
   215		if (soft)
   216			del_timer_sync(&wdt->soft_timer);
   217	
   218		return ret;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
