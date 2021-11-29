Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE20FC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Nov 2021 12:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242700AbhK2Mu3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Nov 2021 07:50:29 -0500
Received: from mga11.intel.com ([192.55.52.93]:45631 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377634AbhK2Ms3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Nov 2021 07:48:29 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="233451313"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="233451313"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 04:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; 
   d="scan'208";a="459135935"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2021 04:45:09 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mrg1s-000Bwk-Fh; Mon, 29 Nov 2021 12:45:08 +0000
Date:   Mon, 29 Nov 2021 20:44:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yunus Bas <y.bas@phytec.de>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Andrej Picej <andrej.picej@norik.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: [groeck-staging:watchdog-next 25/28] ld.lld: error: undefined
 symbol: i2c_smbus_write_byte_data
Message-ID: <202111292002.XQbF71R5-lkp@intel.com>
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
config: arm-randconfig-r014-20211128 (https://download.01.org/0day-ci/archive/20211129/202111292002.XQbF71R5-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=5ea29919c29413c984f4ba3e04a6679d306e7a6e
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 5ea29919c29413c984f4ba3e04a6679d306e7a6e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: i2c_smbus_write_byte_data
   >>> referenced by da9063_wdt.c
   >>>               watchdog/da9063_wdt.o:(da9063_wdt_restart) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
