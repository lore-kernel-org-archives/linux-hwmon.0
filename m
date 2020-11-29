Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88378C3E8C5
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Nov 2020 18:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56AA4207FF
	for <linux-hwmon@archiver.kernel.org>; Sun, 29 Nov 2020 18:39:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgK2Sjt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 29 Nov 2020 13:39:49 -0500
Received: from mga18.intel.com ([134.134.136.126]:4021 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727739AbgK2Sjs (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 29 Nov 2020 13:39:48 -0500
IronPort-SDR: TwPAWXhvy3wzNNc9p6nvSsOdNTyildNdkhpYR62yjETaiHLAPsNMdu2Ux+DaRDIJaH+HZAwZlr
 SWRMqrRbkk1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="160320691"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="160320691"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 10:39:07 -0800
IronPort-SDR: DpvsDxGx9wUBetS04Levk33eZnzRAUU3d2oAtZxtDCpRJNTUQIqeiMm19D8tXqWjQQxAv/ZxjZ
 uCktTvBhCubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="363913126"
Received: from lkp-server01.sh.intel.com (HELO 3082e074203f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2020 10:39:06 -0800
Received: from kbuild by 3082e074203f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kjRbF-0000Fq-LK; Sun, 29 Nov 2020 18:39:05 +0000
Date:   Mon, 30 Nov 2020 02:38:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 439ed83acc19a2cecc64a114b7872217f77b5f81
Message-ID: <5fc3eac1.h+a1+WMFCSyXVMyG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 439ed83acc19a2cecc64a114b7872217f77b5f81  hwmon: (pwm-fan) Convert to hwmon_device_register_with_info API

elapsed time: 723m

configs tested: 101
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         lpc18xx_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
mips                  decstation_64_defconfig
powerpc                      makalu_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        vexpress_defconfig
mips                      pistachio_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      cm5200_defconfig
arm                  colibri_pxa270_defconfig
arm                          collie_defconfig
arc                          axs103_defconfig
powerpc                      ep88xc_defconfig
arc                      axs103_smp_defconfig
sh                           sh2007_defconfig
powerpc                     mpc512x_defconfig
sh                          rsk7203_defconfig
powerpc                      obs600_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                         rt305x_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
powerpc                    socrates_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201129
i386                 randconfig-a003-20201129
i386                 randconfig-a002-20201129
i386                 randconfig-a005-20201129
i386                 randconfig-a001-20201129
i386                 randconfig-a006-20201129
x86_64               randconfig-a015-20201129
x86_64               randconfig-a011-20201129
x86_64               randconfig-a016-20201129
x86_64               randconfig-a014-20201129
x86_64               randconfig-a012-20201129
x86_64               randconfig-a013-20201129
i386                 randconfig-a012-20201129
i386                 randconfig-a013-20201129
i386                 randconfig-a011-20201129
i386                 randconfig-a016-20201129
i386                 randconfig-a014-20201129
i386                 randconfig-a015-20201129
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201129
x86_64               randconfig-a006-20201129
x86_64               randconfig-a004-20201129
x86_64               randconfig-a005-20201129
x86_64               randconfig-a002-20201129
x86_64               randconfig-a001-20201129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
