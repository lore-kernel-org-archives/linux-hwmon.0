Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9AFC64EC4
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Mar 2023 01:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjCGB3z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Mar 2023 20:29:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbjCGB3u (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2023 20:29:50 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6724538004
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Mar 2023 17:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678152588; x=1709688588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZPDaTzQoAuH42c4EspEn7uYowEPyADNCkorlukdT7Qc=;
  b=ikkOeheqWU689LLZQ599nNYj/kolXl4rLt/x2WYbqp6B8lmYp0n9bCF9
   I064ps8iDtBe4udMxRpAYZ7X5I4Jzx3THRMsLE5+MIdzGAzehyIBEJ+vd
   kKptLZKMQ4W+ZaEP1NYZxr8N9vHuBwk5tWuZFwfOuJUzBZH0IoqA9AwD+
   /ehcU19xNShKLUCHUPgX7LCahQ37bmDSDCwJWrIlswsCS7L5g4CYXy2QP
   +aavrMG6QitmVTfVyuhFtd50JioTv7HCSIQoiUoBDqPSh7G2ZTfw5JW3g
   ZrpnlqApD22v7wvF0dqu3714A0zIR9NTEkLz0uBygo8n4vsByUny6b6cR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="363349301"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="363349301"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 17:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="653786476"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="653786476"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Mar 2023 17:29:46 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZM9B-0000qd-1Y;
        Tue, 07 Mar 2023 01:29:45 +0000
Date:   Tue, 7 Mar 2023 09:28:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:watchdog-next 36/38]
 drivers/watchdog/rn5t618_wdt.c:181:52: error: too few arguments to function
 call, expected 2, have 1
Message-ID: <202303070927.HjANQYhS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   faaf9f98d1032c901d8e859e3b6883c7e67614b6
commit: 5c9e1ad78758b851a9dc3a1adb0df3f8782c7450 [36/38] watchdog: rn5t618: Simplify using devm_watchdog_register_device()
config: x86_64-randconfig-a014-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070927.HjANQYhS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=5c9e1ad78758b851a9dc3a1adb0df3f8782c7450
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 5c9e1ad78758b851a9dc3a1adb0df3f8782c7450
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070927.HjANQYhS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/watchdog/rn5t618_wdt.c:181:52: error: too few arguments to function call, expected 2, have 1
           return devm_watchdog_register_device(&wdt->wdt_dev);
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~              ^
   include/linux/watchdog.h:226:5: note: 'devm_watchdog_register_device' declared here
   int devm_watchdog_register_device(struct device *dev, struct watchdog_device *);
       ^
   1 error generated.


vim +181 drivers/watchdog/rn5t618_wdt.c

   140	
   141	static int rn5t618_wdt_probe(struct platform_device *pdev)
   142	{
   143		struct device *dev = &pdev->dev;
   144		struct rn5t618 *rn5t618 = dev_get_drvdata(dev->parent);
   145		struct rn5t618_wdt *wdt;
   146		int min_timeout, max_timeout;
   147		int ret;
   148		unsigned int val;
   149	
   150		wdt = devm_kzalloc(dev, sizeof(struct rn5t618_wdt), GFP_KERNEL);
   151		if (!wdt)
   152			return -ENOMEM;
   153	
   154		min_timeout = rn5t618_wdt_map[0].time;
   155		max_timeout = rn5t618_wdt_map[ARRAY_SIZE(rn5t618_wdt_map) - 1].time;
   156	
   157		wdt->rn5t618 = rn5t618;
   158		wdt->wdt_dev.info = &rn5t618_wdt_info;
   159		wdt->wdt_dev.ops = &rn5t618_wdt_ops;
   160		wdt->wdt_dev.min_timeout = min_timeout;
   161		wdt->wdt_dev.max_timeout = max_timeout;
   162		wdt->wdt_dev.timeout = max_timeout;
   163		wdt->wdt_dev.parent = dev;
   164	
   165		/* Read out previous power-off factor */
   166		ret = regmap_read(wdt->rn5t618->regmap, RN5T618_POFFHIS, &val);
   167		if (ret)
   168			return ret;
   169	
   170		if (val & RN5T618_POFFHIS_VINDET)
   171			wdt->wdt_dev.bootstatus = WDIOF_POWERUNDER;
   172		else if (val & RN5T618_POFFHIS_WDG)
   173			wdt->wdt_dev.bootstatus = WDIOF_CARDRESET;
   174	
   175		watchdog_set_drvdata(&wdt->wdt_dev, wdt);
   176		watchdog_init_timeout(&wdt->wdt_dev, timeout, dev);
   177		watchdog_set_nowayout(&wdt->wdt_dev, nowayout);
   178	
   179		platform_set_drvdata(pdev, wdt);
   180	
 > 181		return devm_watchdog_register_device(&wdt->wdt_dev);
   182	}
   183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
