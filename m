Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B660C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Jan 2021 09:13:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC73722D02
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Jan 2021 09:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbhAYJNG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Jan 2021 04:13:06 -0500
Received: from mga12.intel.com ([192.55.52.136]:30507 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726861AbhAYGR0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Jan 2021 01:17:26 -0500
IronPort-SDR: qyX4DgFPLxZIns/4/6HvAoUTbJtR48NUTLLwW6RKSXLtJOjxGV7URVdTtXzLyD8LRu4CjsdhCT
 OUkh1jrk1qRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="158847331"
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="158847331"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2021 22:16:12 -0800
IronPort-SDR: BRDEVp/k2/cmethnKJokNLOIMUJlYMvCAihazWjUqMHH/JRB8NIJtrgjI1F1ugF6sH30Zwsinw
 KtjFLm5V0mhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,372,1602572400"; 
   d="scan'208";a="387187205"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Jan 2021 22:16:11 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l3vAY-00001w-MP; Mon, 25 Jan 2021 06:16:10 +0000
Date:   Mon, 25 Jan 2021 13:46:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 08124c74c93cca0d2a103fbbf980df17986e65f4
Message-ID: <600e5b23.1leGrN7xr5p0MlkW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 08124c74c93cca0d2a103fbbf980df17986e65f4  hwmon: (pwm-fan) stop using legacy PWM functions and some cleanups

elapsed time: 753m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7264_defconfig
powerpc                 linkstation_defconfig
arm                      pxa255-idp_defconfig
arm                     am200epdkit_defconfig
mips                      pistachio_defconfig
xtensa                  cadence_csp_defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
c6x                                 defconfig
powerpc                 mpc832x_mds_defconfig
sparc                               defconfig
arm                       aspeed_g5_defconfig
arm                          pcm027_defconfig
mips                        qi_lb60_defconfig
mips                  decstation_64_defconfig
powerpc                      chrp32_defconfig
arm                             mxs_defconfig
mips                     cu1000-neo_defconfig
powerpc                     tqm8560_defconfig
powerpc64                        alldefconfig
sh                        sh7757lcr_defconfig
mips                         tb0287_defconfig
sh                      rts7751r2d1_defconfig
mips                         tb0219_defconfig
mips                           ip27_defconfig
m68k                         apollo_defconfig
arc                        nsimosci_defconfig
arm                         hackkit_defconfig
sparc                            allyesconfig
sh                               j2_defconfig
powerpc                        fsp2_defconfig
mips                       rbtx49xx_defconfig
mips                        bcm47xx_defconfig
powerpc                  mpc885_ads_defconfig
s390                          debug_defconfig
arm                          iop32x_defconfig
arm                          tango4_defconfig
mips                        nlm_xlr_defconfig
arm                          pxa3xx_defconfig
sh                            shmin_defconfig
powerpc                     mpc512x_defconfig
arm                      integrator_defconfig
h8300                       h8s-sim_defconfig
powerpc                      mgcoge_defconfig
arm                           h5000_defconfig
sh                     sh7710voipgw_defconfig
arm                          imote2_defconfig
mips                     loongson1b_defconfig
arm                            dove_defconfig
arm                            mps2_defconfig
sh                   rts7751r2dplus_defconfig
nios2                            alldefconfig
mips                       capcella_defconfig
mips                          ath25_defconfig
arm                          simpad_defconfig
sh                           se7751_defconfig
mips                         bigsur_defconfig
csky                             alldefconfig
arm                          pxa168_defconfig
nds32                            alldefconfig
powerpc                     tqm8541_defconfig
arm                        shmobile_defconfig
powerpc                     tqm8555_defconfig
arm                         s5pv210_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210124
i386                 randconfig-a002-20210124
i386                 randconfig-a004-20210124
i386                 randconfig-a006-20210124
i386                 randconfig-a005-20210124
i386                 randconfig-a003-20210124
i386                 randconfig-a001-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a006-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
x86_64               randconfig-a012-20210124
x86_64               randconfig-a016-20210124
x86_64               randconfig-a015-20210124
x86_64               randconfig-a011-20210124
x86_64               randconfig-a013-20210124
x86_64               randconfig-a014-20210124
i386                 randconfig-a013-20210124
i386                 randconfig-a011-20210124
i386                 randconfig-a012-20210124
i386                 randconfig-a015-20210124
i386                 randconfig-a014-20210124
i386                 randconfig-a016-20210124
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210124
x86_64               randconfig-a002-20210124
x86_64               randconfig-a001-20210124
x86_64               randconfig-a005-20210124
x86_64               randconfig-a006-20210124
x86_64               randconfig-a004-20210124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
