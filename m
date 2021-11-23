Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB7CC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Nov 2021 12:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbhKWMat (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Nov 2021 07:30:49 -0500
Received: from mga03.intel.com ([134.134.136.65]:32982 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235725AbhKWMas (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Nov 2021 07:30:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234959939"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="234959939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 04:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="457038854"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 23 Nov 2021 04:27:37 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mpUtc-0001ow-KN; Tue, 23 Nov 2021 12:27:36 +0000
Date:   Tue, 23 Nov 2021 20:27:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [groeck-staging:watchdog-next 11/23]
 drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk
 flags for different Samsung watchdog IP(). Prototype was for
 QUIRK_HAS_WTCLRINT_REG() instead
Message-ID: <202111232037.iwzPIkeS-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   5c9a4cc5516e30ac2e0586e315e0806ae766321b
commit: 10748806ee44ad974d7ccd84c682222213b53e69 [11/23] watchdog: s3c2410: Cleanup PMU related code
config: arc-randconfig-r015-20211117 (https://download.01.org/0day-ci/archive/20211123/202111232037.iwzPIkeS-lkp@intel.com/config.gz)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=10748806ee44ad974d7ccd84c682222213b53e69
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 10748806ee44ad974d7ccd84c682222213b53e69
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/watchdog/s3c2410_wdt.c:94: warning: expecting prototype for Quirk flags for different Samsung watchdog IP(). Prototype was for QUIRK_HAS_WTCLRINT_REG() instead


vim +94 drivers/watchdog/s3c2410_wdt.c

    59	
    60	/**
    61	 * Quirk flags for different Samsung watchdog IP-cores.
    62	 *
    63	 * This driver supports multiple Samsung SoCs, each of which might have
    64	 * different set of registers and features supported. As watchdog block
    65	 * sometimes requires modifying PMU registers for proper functioning, register
    66	 * differences in both watchdog and PMU IP-cores should be accounted for. Quirk
    67	 * flags described below serve the purpose of telling the driver about mentioned
    68	 * SoC traits, and can be specified in driver data for each particular supported
    69	 * device.
    70	 *
    71	 * %QUIRK_HAS_WTCLRINT_REG: Watchdog block has WTCLRINT register. It's used to
    72	 * clear the interrupt once the interrupt service routine is complete. It's
    73	 * write-only, writing any values to this register clears the interrupt, but
    74	 * reading is not permitted.
    75	 *
    76	 * %QUIRK_HAS_PMU_MASK_RESET: PMU block has the register for disabling/enabling
    77	 * WDT reset request. On old SoCs it's usually called MASK_WDT_RESET_REQUEST,
    78	 * new SoCs have CLUSTERx_NONCPU_INT_EN register, which 'mask_bit' value is
    79	 * inverted compared to the former one.
    80	 *
    81	 * %QUIRK_HAS_PMU_RST_STAT: PMU block has RST_STAT (reset status) register,
    82	 * which contains bits indicating the reason for most recent CPU reset. If
    83	 * present, driver will use this register to check if previous reboot was due to
    84	 * watchdog timer reset.
    85	 *
    86	 * %QUIRK_HAS_PMU_AUTO_DISABLE: PMU block has AUTOMATIC_WDT_RESET_DISABLE
    87	 * register. If 'mask_bit' bit is set, PMU will disable WDT reset when
    88	 * corresponding processor is in reset state.
    89	 *
    90	 * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
    91	 * with "watchdog counter enable" bit. That bit should be set to make watchdog
    92	 * counter running.
    93	 */
  > 94	#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
    95	#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
    96	#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
    97	#define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
    98	#define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
    99	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
