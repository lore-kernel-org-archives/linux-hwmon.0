Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D91C433E0
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Jan 2021 05:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8939022511
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Jan 2021 05:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbhAXFLc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Jan 2021 00:11:32 -0500
Received: from mga03.intel.com ([134.134.136.65]:55952 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbhAXFLa (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Jan 2021 00:11:30 -0500
IronPort-SDR: tvW1OLGAjHp0uNdtb2XySLq3qdzwI2sC+zc1ym0RvNYer03ngB/HeAEkCiHyw/dmRXvC/oBsSU
 2rZ0ccqaBHjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9873"; a="179677363"
X-IronPort-AV: E=Sophos;i="5.79,370,1602572400"; 
   d="scan'208";a="179677363"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2021 21:10:47 -0800
IronPort-SDR: Z0MlVR9V7xijB3t86PaObyZBehF4h9MAJlPvkM9KdWWwW35uA2fE3Ld1AxQUmDNMDpZIqb1fVr
 DQF4C2Up8qQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,370,1602572400"; 
   d="scan'208";a="405268474"
Received: from lkp-server01.sh.intel.com (HELO 27c4e0a4b6d9) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2021 21:10:45 -0800
Received: from kbuild by 27c4e0a4b6d9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l3Xfg-00002s-SU; Sun, 24 Jan 2021 05:10:44 +0000
Date:   Sun, 24 Jan 2021 13:10:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 0d3771d52ed50b39db55d6577aa2c1aa7e7c86a5
Message-ID: <600d014b.0DJQruohl7rJuBuX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0d3771d52ed50b39db55d6577aa2c1aa7e7c86a5  hwmon: (applesmc) Assign boolean values to a bool variable

elapsed time: 3308m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    amigaone_defconfig
mips                malta_qemu_32r6_defconfig
mips                        maltaup_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                         virt_defconfig
arm                        shmobile_defconfig
sparc                       sparc32_defconfig
microblaze                      mmu_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                       holly_defconfig
powerpc                  storcenter_defconfig
powerpc                     taishan_defconfig
powerpc                     redwood_defconfig
arm                             rpc_defconfig
arc                        nsim_700_defconfig
arm                       versatile_defconfig
sh                           se7712_defconfig
mips                        bcm47xx_defconfig
arm                        spear3xx_defconfig
mips                         tb0287_defconfig
mips                      pic32mzda_defconfig
arm                            pleb_defconfig
sparc                            alldefconfig
sh                        apsh4ad0a_defconfig
powerpc                      makalu_defconfig
sh                         ap325rxa_defconfig
arc                            hsdk_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210121
x86_64               randconfig-a003-20210121
x86_64               randconfig-a001-20210121
x86_64               randconfig-a005-20210121
x86_64               randconfig-a006-20210121
x86_64               randconfig-a004-20210121
i386                 randconfig-a001-20210121
i386                 randconfig-a002-20210121
i386                 randconfig-a004-20210121
i386                 randconfig-a006-20210121
i386                 randconfig-a005-20210121
i386                 randconfig-a003-20210121
i386                 randconfig-a013-20210121
i386                 randconfig-a011-20210121
i386                 randconfig-a012-20210121
i386                 randconfig-a014-20210121
i386                 randconfig-a015-20210121
i386                 randconfig-a016-20210121
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
