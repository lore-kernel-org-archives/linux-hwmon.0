Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC7CC54E94
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 18:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjAXS0P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 13:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjAXS0P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 13:26:15 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785C942DD1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674584774; x=1706120774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QO5yGQ3t9U6GQxaRwkN9j0cY2vtM4T6pnPPyyuBK+eA=;
  b=bM/T9VXgaBU9yaGsN5pH1RIDis0sopaU/O5ItxliVhhOcPBGVctzm2QY
   dohwy74bLuuOKC4X1x3SylHMWy+NGAwl96VCTjn1scgTgC1na5VVI3l9I
   Nyx5Ozga4h6EeiE4okafGPBwhvbNKF2KqkLgn7O/gjLEtW6/I+/3NyNEJ
   0dR/Qo5DrxTRiM02z/o3lMbb9x2NlmzLxOSbSkXzuIkT89x3scCMOwQaf
   f1QcwhQWmU5uD+/sORGO1vbqAuY37PhnzeB1LGAHynXkaFqmUfvsOdJ+1
   oy3S2yqm8iDETDtXqZGhpHnR9c701C4flbI40zwsvy6ZPuzq74mfh/v21
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="309941568"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="309941568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 10:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="612136084"
X-IronPort-AV: E=Sophos;i="5.97,243,1669104000"; 
   d="scan'208";a="612136084"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 24 Jan 2023 10:26:12 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pKNzn-0006gq-1D;
        Tue, 24 Jan 2023 18:26:11 +0000
Date:   Wed, 25 Jan 2023 02:25:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Kicherer <dev@kicherer.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 41/41] drivers/hwmon/mc34vr500.c:228:36:
 warning: conversion from 'long unsigned int' to 'unsigned int' changes value
 from '18446744073709551569' to '4294967249'
Message-ID: <202301250221.kOJxNanJ-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   513d7b190ab3715103357afd8e2ddf4b5e986ff3
commit: 513d7b190ab3715103357afd8e2ddf4b5e986ff3 [41/41] hwmon: add initial NXP MC34VR500 PMIC monitoring support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230125/202301250221.kOJxNanJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=513d7b190ab3715103357afd8e2ddf4b5e986ff3
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 513d7b190ab3715103357afd8e2ddf4b5e986ff3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/hwmon/mc34vr500.c: In function 'mc34vr500_probe':
>> drivers/hwmon/mc34vr500.c:228:36: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551569' to '4294967249' [-Woverflow]
     228 |                                    ~(LOWVINS_BIT | THERM110S_BIT |
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     229 |                                    THERM120S_BIT | THERM130S_BIT));
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +228 drivers/hwmon/mc34vr500.c

   163	
   164	static int mc34vr500_probe(struct i2c_client *client)
   165	{
   166		struct device *dev = &client->dev;
   167		struct mc34vr500_data *data;
   168		struct device *hwmon_dev;
   169		int ret;
   170		unsigned int reg, revid, fabid;
   171		struct regmap *regmap;
   172	
   173		regmap = devm_regmap_init_i2c(client, &mc34vr500_regmap_config);
   174		if (IS_ERR(regmap))
   175			return PTR_ERR(regmap);
   176	
   177		data = devm_kzalloc(dev, sizeof(struct mc34vr500_data), GFP_KERNEL);
   178		if (!data)
   179			return -ENOMEM;
   180	
   181		data->regmap = regmap;
   182	
   183		ret = regmap_read(regmap, MC34VR500_DEVICEID, &reg);
   184		if (ret < 0)
   185			return ret;
   186	
   187		if (reg != MC34VR500_DEVICEID_VALUE)
   188			return -ENODEV;
   189	
   190		ret = regmap_read(regmap, MC34VR500_SILICONREVID, &revid);
   191		if (ret < 0)
   192			return ret;
   193	
   194		ret = regmap_read(regmap, MC34VR500_FABID, &fabid);
   195		if (ret < 0)
   196			return ret;
   197	
   198		dev_dbg(dev, "mc34vr500: revid 0x%x fabid 0x%x\n", revid, fabid);
   199	
   200		hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
   201								 data,
   202								 &mc34vr500_chip_info,
   203								 NULL);
   204		if (IS_ERR(hwmon_dev))
   205			return PTR_ERR(hwmon_dev);
   206	
   207		data->hwmon_dev = hwmon_dev;
   208	
   209		if (client->irq) {
   210			ret = devm_request_threaded_irq(dev, client->irq, NULL,
   211							mc34vr500_process_interrupt,
   212							IRQF_TRIGGER_RISING |
   213							IRQF_ONESHOT |
   214							IRQF_SHARED,
   215							dev_name(dev), data);
   216			if (ret)
   217				return ret;
   218	
   219			/* write 1 to clear interrupts */
   220			ret = regmap_write(regmap, MC34VR500_INTSTAT0, LOWVINS_BIT |
   221					   THERM110S_BIT | THERM120S_BIT |
   222					   THERM130S_BIT);
   223			if (ret)
   224				return ret;
   225	
   226			/* unmask interrupts */
   227			ret = regmap_write(regmap, MC34VR500_INTMASK0,
 > 228					   ~(LOWVINS_BIT | THERM110S_BIT |
   229					   THERM120S_BIT | THERM130S_BIT));
   230			if (ret)
   231				return ret;
   232		}
   233	
   234		return 0;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
