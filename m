Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BAFCC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jan 2022 05:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235695AbiA3FeW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jan 2022 00:34:22 -0500
Received: from mga05.intel.com ([192.55.52.43]:44438 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240678AbiA3FeW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jan 2022 00:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643520862; x=1675056862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aduGOJcXsxcxdxjpVqpSmhbJxwuYDU745GkOwzVMwE8=;
  b=aMbpkvJNYByF0GHXuvmUJAgbeNzMHbjNnmd4JuLVyWjYuqASAiLQMzlf
   G9DeuM/K41gaieP4Mo7ZEJtGmxUhUCNYAf4+TZymgKt3o0uiP1hum+hEH
   ppoK15gdKaLZHNTG2mywItJtqRk7srpCUpAWZIpYk18zVMNTDn7vk2p8q
   TlTqQrQH1DPi/h2YgwFtiVVOqWUt6D2eCNxxloUeLGtn3xTWGKwSHQRBb
   SMlO4ZP+mpkZt/PiORV5DD6UkX+7CVUPPY2n29wQC2qlaIsBaJK+7d60q
   fTNqw8JMzE6tPQBstw06Q5UcWClQjogpIs3rOKIK20z0J0li57HdCLeBM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="333676182"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="333676182"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 21:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="533890477"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Jan 2022 21:34:20 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nE2qy-000Q6E-2p; Sun, 30 Jan 2022 05:34:20 +0000
Date:   Sun, 30 Jan 2022 13:33:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:watchdog-next 1/4]
 drivers/watchdog/max77620_wdt.c:18:10: fatal error: 'linux/mfd/max77714.h'
 file not found
Message-ID: <202201301330.qrjqfMhi-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   c00ed93a33886a91023b17f2503d72de49303063
commit: 4b35b464fe64f6dd5bf8d5df14090961fdf63a07 [1/4] watchdog: max77620: add support for the max77714 variant
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220130/202201301330.qrjqfMhi-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=4b35b464fe64f6dd5bf8d5df14090961fdf63a07
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 4b35b464fe64f6dd5bf8d5df14090961fdf63a07
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/watchdog/max77620_wdt.c:18:10: fatal error: 'linux/mfd/max77714.h' file not found
   #include <linux/mfd/max77714.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +18 drivers/watchdog/max77620_wdt.c

  > 18	#include <linux/mfd/max77714.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/regmap.h>
    21	#include <linux/slab.h>
    22	#include <linux/watchdog.h>
    23	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
