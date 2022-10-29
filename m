Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552AAC433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 19:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiJ2TU6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 15:20:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ2TU6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 15:20:58 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE9A1C127
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 12:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667071257; x=1698607257;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F5K9x1oIQLtoINoX34exDlDDFF/xUnM4qc/fNHCAeE0=;
  b=MZo1yev8QNnzW9rUmDyrQPrV+3REEYSz7YF2c4TGgAs/uKbm+BNfSIHv
   7CAQOHWoph3PPitFbzsaXpJe9SMAH9i2i6sTj+i5b8Yu8l2JnzWikWI2m
   K7wxXXQ1z+nwt2DEeyrznVq161gXiKH0+e+KRAMsMYeY9O52lMyBYGHif
   2BvWAOR13NvSPssMuyOc92EG6dDTQbG9VpdIdYfXO0aPYWFJdQufJWNb/
   fn5uwDR9X5dyCZlpskIBIP4jlkGudbcNSHz8Coec1rtu4KXoQoMZ5pb4n
   PbGcrT+kAB6J4m1NyxykucCCQJjvtRdyQPcHZRETvXLLG7Y716kmHoBme
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="289083457"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="289083457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 12:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="666417336"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="666417336"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Oct 2022 12:20:55 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oorO2-000BIl-2m;
        Sat, 29 Oct 2022 19:20:54 +0000
Date:   Sun, 30 Oct 2022 03:20:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 4ed8d458b8820f1df07c78c4cb523f7e49f9556d
Message-ID: <635d7d04.aZgFJu//KbkO4WaO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 4ed8d458b8820f1df07c78c4cb523f7e49f9556d  watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already running

elapsed time: 720m

configs tested: 71
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                                defconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20221028
powerpc                           allnoconfig
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
x86_64                        randconfig-a006
x86_64                           allyesconfig
i386                          randconfig-a003
x86_64                        randconfig-a013
mips                             allyesconfig
riscv                randconfig-r042-20221028
x86_64                        randconfig-a011
arc                              allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a004
s390                 randconfig-r044-20221028
i386                          randconfig-a014
alpha                            allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
i386                          randconfig-a012
x86_64                        randconfig-a015
i386                          randconfig-a016
m68k                             allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
m68k                         apollo_defconfig
m68k                       m5249evb_defconfig
arm                       multi_v4t_defconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
arm                          pxa3xx_defconfig
sh                        dreamcast_defconfig
sh                            titan_defconfig
powerpc                      mgcoge_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a013
hexagon              randconfig-r041-20221028
x86_64                        randconfig-a014
i386                          randconfig-a015
hexagon              randconfig-r045-20221028
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
