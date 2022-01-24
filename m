Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA21DC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 09:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbiAXJif (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 04:38:35 -0500
Received: from mga12.intel.com ([192.55.52.136]:15297 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231314AbiAXJia (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 04:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643017110; x=1674553110;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gicxBCVexW5fz+AspqMVDIYwML/SHm8zSdGhGCLFfBg=;
  b=mGSGF/f7pAUOwV7Wpcy3gInch2/PMbBAzvCMZKG/ifBW1J+tnk8JG9de
   YD2aS9Js12Ma576yrr8J8t6+XUKCVp9AHovfNTxw0vsTTxjIVhQy30nP6
   oRYYPMHYho0k4KaePQyJrwczVAldNV3Afm3SkTVJEAs09uBVyaqvL2C+m
   0MF9WFaTK5mIpnubNlZIj3r7VoHCR3BBlJmfwmO8l8bPQLcQlQdkEgVDK
   cwi8tdpJXCXEfiw+PIrOBT/YOgpCRAza2IehmlInCLG7AMgD+nkRNUKYw
   WHxvonIkN6AamK1WdnxIuw080ifpGzdH7T45zyy2oeWfxe9/6xKBhdv9q
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="225986115"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="225986115"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 01:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="695362641"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2022 01:38:28 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nBvnw-000I7N-08; Mon, 24 Jan 2022 09:38:28 +0000
Date:   Mon, 24 Jan 2022 17:37:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next 14/33] drivers/hwmon/lm83.c:159:21:
 error: variable 'lm83_regmap_config' has initializer but incomplete type
Message-ID: <202201241714.m6MHXXnD-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   9b9f1e670d2c61c676039474fd2d98ca0a54ff75
commit: 165aace2ebd0b55c5589f213d55e3ac28b7aa588 [14/33] hwmon: (lm83) Use regmap
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20220124/202201241714.m6MHXXnD-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=165aace2ebd0b55c5589f213d55e3ac28b7aa588
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout 165aace2ebd0b55c5589f213d55e3ac28b7aa588
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hwmon/lm83.c:159:21: error: variable 'lm83_regmap_config' has initializer but incomplete type
     159 | static const struct regmap_config lm83_regmap_config = {
         |                     ^~~~~~~~~~~~~
>> drivers/hwmon/lm83.c:160:10: error: 'const struct regmap_config' has no member named 'reg_bits'
     160 |         .reg_bits = 8,
         |          ^~~~~~~~
   drivers/hwmon/lm83.c:160:21: warning: excess elements in struct initializer
     160 |         .reg_bits = 8,
         |                     ^
   drivers/hwmon/lm83.c:160:21: note: (near initialization for 'lm83_regmap_config')
>> drivers/hwmon/lm83.c:161:10: error: 'const struct regmap_config' has no member named 'val_bits'
     161 |         .val_bits = 8,
         |          ^~~~~~~~
   drivers/hwmon/lm83.c:161:21: warning: excess elements in struct initializer
     161 |         .val_bits = 8,
         |                     ^
   drivers/hwmon/lm83.c:161:21: note: (near initialization for 'lm83_regmap_config')
>> drivers/hwmon/lm83.c:162:10: error: 'const struct regmap_config' has no member named 'cache_type'
     162 |         .cache_type = REGCACHE_RBTREE,
         |          ^~~~~~~~~~
   drivers/hwmon/lm83.c:162:23: warning: excess elements in struct initializer
     162 |         .cache_type = REGCACHE_RBTREE,
         |                       ^~~~~~~~~~~~~~~
   drivers/hwmon/lm83.c:162:23: note: (near initialization for 'lm83_regmap_config')
>> drivers/hwmon/lm83.c:163:10: error: 'const struct regmap_config' has no member named 'volatile_reg'
     163 |         .volatile_reg = lm83_regmap_is_volatile,
         |          ^~~~~~~~~~~~
   drivers/hwmon/lm83.c:163:25: warning: excess elements in struct initializer
     163 |         .volatile_reg = lm83_regmap_is_volatile,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm83.c:163:25: note: (near initialization for 'lm83_regmap_config')
>> drivers/hwmon/lm83.c:164:10: error: 'const struct regmap_config' has no member named 'reg_read'
     164 |         .reg_read = lm83_regmap_reg_read,
         |          ^~~~~~~~
   drivers/hwmon/lm83.c:164:21: warning: excess elements in struct initializer
     164 |         .reg_read = lm83_regmap_reg_read,
         |                     ^~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm83.c:164:21: note: (near initialization for 'lm83_regmap_config')
>> drivers/hwmon/lm83.c:165:10: error: 'const struct regmap_config' has no member named 'reg_write'
     165 |         .reg_write = lm83_regmap_reg_write,
         |          ^~~~~~~~~
   drivers/hwmon/lm83.c:165:22: warning: excess elements in struct initializer
     165 |         .reg_write = lm83_regmap_reg_write,
         |                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/lm83.c:165:22: note: (near initialization for 'lm83_regmap_config')
   drivers/hwmon/lm83.c: In function 'lm83_probe':
>> drivers/hwmon/lm83.c:383:24: error: implicit declaration of function 'devm_regmap_init' [-Werror=implicit-function-declaration]
     383 |         data->regmap = devm_regmap_init(dev, NULL, client, &lm83_regmap_config);
         |                        ^~~~~~~~~~~~~~~~
   drivers/hwmon/lm83.c:383:22: warning: assignment to 'struct regmap *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     383 |         data->regmap = devm_regmap_init(dev, NULL, client, &lm83_regmap_config);
         |                      ^
   drivers/hwmon/lm83.c: At top level:
>> drivers/hwmon/lm83.c:159:35: error: storage size of 'lm83_regmap_config' isn't known
     159 | static const struct regmap_config lm83_regmap_config = {
         |                                   ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/lm83_regmap_config +159 drivers/hwmon/lm83.c

   158	
 > 159	static const struct regmap_config lm83_regmap_config = {
 > 160		.reg_bits = 8,
 > 161		.val_bits = 8,
 > 162		.cache_type = REGCACHE_RBTREE,
 > 163		.volatile_reg = lm83_regmap_is_volatile,
 > 164		.reg_read = lm83_regmap_reg_read,
 > 165		.reg_write = lm83_regmap_reg_write,
   166	};
   167	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
