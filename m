Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB72C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Nov 2021 12:26:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235458AbhK2M33 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Nov 2021 07:29:29 -0500
Received: from mga03.intel.com ([134.134.136.65]:56578 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239960AbhK2M12 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Nov 2021 07:27:28 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="235887575"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="235887575"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 04:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="676333404"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Nov 2021 04:24:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mrfhY-000BvW-0I; Mon, 29 Nov 2021 12:24:08 +0000
Date:   Mon, 29 Nov 2021 20:24:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yunus Bas <y.bas@phytec.de>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Andrej Picej <andrej.picej@norik.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [groeck-staging:watchdog-next 25/28]
 drivers/watchdog/da9063_wdt.c:177:15: error: implicit declaration of
 function 'i2c_smbus_write_byte_data'
Message-ID: <202111292050.cwhXdxtQ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   293903b9dfe43520f01374dc1661be11d6838c49
commit: 5ea29919c29413c984f4ba3e04a6679d306e7a6e [25/28] watchdog: da9063: use atomic safe i2c transfer in reset handler
config: csky-randconfig-r032-20211128 (https://download.01.org/0day-ci/archive/20211129/202111292050.cwhXdxtQ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=5ea29919c29413c984f4ba3e04a6679d306e7a6e
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 5ea29919c29413c984f4ba3e04a6679d306e7a6e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/watchdog/da9063_wdt.c: In function 'da9063_wdt_restart':
>> drivers/watchdog/da9063_wdt.c:177:15: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Werror=implicit-function-declaration]
     177 |         ret = i2c_smbus_write_byte_data(client, DA9063_REG_CONTROL_F,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_smbus_write_byte_data +177 drivers/watchdog/da9063_wdt.c

   168	
   169	static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
   170				      void *data)
   171	{
   172		struct da9063 *da9063 = watchdog_get_drvdata(wdd);
   173		struct i2c_client *client = to_i2c_client(da9063->dev);
   174		int ret;
   175	
   176		/* Don't use regmap because it is not atomic safe */
 > 177		ret = i2c_smbus_write_byte_data(client, DA9063_REG_CONTROL_F,
   178						DA9063_SHUTDOWN);
   179		if (ret < 0)
   180			dev_alert(da9063->dev, "Failed to shutdown (err = %d)\n",
   181				  ret);
   182	
   183		/* wait for reset to assert... */
   184		mdelay(500);
   185	
   186		return ret;
   187	}
   188	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
