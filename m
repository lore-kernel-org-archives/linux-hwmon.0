Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48DEC4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 15:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9FB760F38
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Jul 2021 15:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhGYPOD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Jul 2021 11:14:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:20856 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231278AbhGYPOD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Jul 2021 11:14:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="212155416"
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; 
   d="scan'208";a="212155416"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2021 08:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,266,1620716400"; 
   d="scan'208";a="497732709"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2021 08:54:31 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m7gSU-0004em-Qb; Sun, 25 Jul 2021 15:54:30 +0000
Date:   Sun, 25 Jul 2021 23:54:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 88316b6c34b4bccab3b9d67a9b311b41a0ad2723
Message-ID: <60fd8922.Ha7ViOv5TcxtbirQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 88316b6c34b4bccab3b9d67a9b311b41a0ad2723  hwmon: (w83627ehf) Make DEVICE_ATTR_RO static

elapsed time: 723m

configs tested: 135
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210725
nds32                            alldefconfig
sh                           se7206_defconfig
sh                           se7712_defconfig
sh                           se7343_defconfig
powerpc                     skiroot_defconfig
arm                          collie_defconfig
arm                         lpc18xx_defconfig
arm                           h3600_defconfig
arm                              alldefconfig
mips                  cavium_octeon_defconfig
powerpc                   bluestone_defconfig
arm                             mxs_defconfig
arm64                            alldefconfig
ia64                            zx1_defconfig
mips                           ci20_defconfig
sh                          r7785rp_defconfig
powerpc                     tqm8548_defconfig
sh                           sh2007_defconfig
h8300                               defconfig
powerpc                     kmeter1_defconfig
m68k                        stmark2_defconfig
nios2                            allyesconfig
mips                malta_qemu_32r6_defconfig
i386                                defconfig
mips                        nlm_xlr_defconfig
arm                         cm_x300_defconfig
arm                       aspeed_g4_defconfig
arm                     eseries_pxa_defconfig
arm                       imx_v6_v7_defconfig
mips                         mpc30x_defconfig
arm                            mps2_defconfig
xtensa                         virt_defconfig
arm                          moxart_defconfig
sh                        sh7757lcr_defconfig
arm                      tct_hammer_defconfig
mips                       bmips_be_defconfig
xtensa                           alldefconfig
sh                           se7780_defconfig
powerpc                 mpc8272_ads_defconfig
arm                           u8500_defconfig
sh                        dreamcast_defconfig
s390                                defconfig
sh                           se7721_defconfig
powerpc                     pseries_defconfig
riscv                    nommu_virt_defconfig
powerpc                  storcenter_defconfig
mips                    maltaup_xpa_defconfig
mips                         cobalt_defconfig
riscv                            alldefconfig
xtensa                  audio_kc705_defconfig
mips                  decstation_64_defconfig
mips                      maltaaprp_defconfig
m68k                          hp300_defconfig
mips                         db1xxx_defconfig
powerpc                      cm5200_defconfig
arm                            xcep_defconfig
arm                    vt8500_v6_v7_defconfig
arc                      axs103_smp_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                       ebony_defconfig
powerpc                 mpc8313_rdb_defconfig
x86_64                            allnoconfig
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210725
i386                 randconfig-a003-20210725
i386                 randconfig-a004-20210725
i386                 randconfig-a002-20210725
i386                 randconfig-a001-20210725
i386                 randconfig-a006-20210725
x86_64               randconfig-a011-20210725
x86_64               randconfig-a016-20210725
x86_64               randconfig-a013-20210725
x86_64               randconfig-a014-20210725
x86_64               randconfig-a012-20210725
x86_64               randconfig-a015-20210725
i386                 randconfig-a016-20210725
i386                 randconfig-a013-20210725
i386                 randconfig-a012-20210725
i386                 randconfig-a014-20210725
i386                 randconfig-a011-20210725
i386                 randconfig-a015-20210725
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210725
x86_64               randconfig-a003-20210725
x86_64               randconfig-a006-20210725
x86_64               randconfig-a001-20210725
x86_64               randconfig-a005-20210725
x86_64               randconfig-a004-20210725
x86_64               randconfig-a002-20210725

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
