Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4069CC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Sep 2021 04:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1699061211
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Sep 2021 04:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhILE16 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Sep 2021 00:27:58 -0400
Received: from mga02.intel.com ([134.134.136.20]:13831 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhILE15 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Sep 2021 00:27:57 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10104"; a="208632681"
X-IronPort-AV: E=Sophos;i="5.85,285,1624345200"; 
   d="scan'208";a="208632681"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2021 21:26:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,285,1624345200"; 
   d="scan'208";a="608280703"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2021 21:26:42 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mPH4j-0006G9-PZ; Sun, 12 Sep 2021 04:26:41 +0000
Date:   Sun, 12 Sep 2021 12:25:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 73f91cb3556726c38d236a9c9c3d36da06413da6
Message-ID: <613d8153.XR5e/SAVBrxtjW4X%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 73f91cb3556726c38d236a9c9c3d36da06413da6  watchdog: sb_wdog: Remove COMPILE_TEST support

elapsed time: 3361m

configs tested: 256
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210910
i386                 randconfig-c001-20210912
i386                 randconfig-c001-20210911
mips                     cu1830-neo_defconfig
sh                          kfr2r09_defconfig
sh                        apsh4ad0a_defconfig
xtensa                    xip_kc705_defconfig
mips                        bcm47xx_defconfig
powerpc                     tqm8548_defconfig
arm                      jornada720_defconfig
arm                          imote2_defconfig
sh                                  defconfig
ia64                         bigsur_defconfig
powerpc                     kmeter1_defconfig
powerpc                   bluestone_defconfig
um                             i386_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc837x_rdb_defconfig
i386                             allyesconfig
openrisc                  or1klitex_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     sequoia_defconfig
arm                      integrator_defconfig
nios2                         3c120_defconfig
arm                          moxart_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pxa168_defconfig
microblaze                          defconfig
nios2                            alldefconfig
arm                         bcm2835_defconfig
powerpc                 mpc8540_ads_defconfig
arm                         mv78xx0_defconfig
arc                          axs103_defconfig
nds32                               defconfig
powerpc                     akebono_defconfig
sh                         ap325rxa_defconfig
m68k                          atari_defconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
arm                         axm55xx_defconfig
mips                     loongson2k_defconfig
mips                      fuloong2e_defconfig
ia64                            zx1_defconfig
openrisc                 simple_smp_defconfig
arm                         s3c6400_defconfig
xtensa                    smp_lx200_defconfig
powerpc                    gamecube_defconfig
sh                            migor_defconfig
microblaze                      mmu_defconfig
mips                      pic32mzda_defconfig
powerpc                    mvme5100_defconfig
powerpc                     asp8347_defconfig
powerpc                       ppc64_defconfig
xtensa                           alldefconfig
sh                           se7206_defconfig
arm                          ep93xx_defconfig
arm                        oxnas_v6_defconfig
arm                         at91_dt_defconfig
nios2                         10m50_defconfig
powerpc                     ppa8548_defconfig
mips                        nlm_xlp_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     mpc5200_defconfig
arm                        mini2440_defconfig
arm                        cerfcube_defconfig
mips                         tb0226_defconfig
sh                            hp6xx_defconfig
mips                           ip28_defconfig
powerpc                      bamboo_defconfig
mips                           ci20_defconfig
sh                          rsk7264_defconfig
arc                    vdk_hs38_smp_defconfig
arm                           stm32_defconfig
arm                         assabet_defconfig
mips                       rbtx49xx_defconfig
s390                       zfcpdump_defconfig
mips                         db1xxx_defconfig
xtensa                  cadence_csp_defconfig
arm                        multi_v7_defconfig
arc                          axs101_defconfig
parisc                generic-32bit_defconfig
arm                       versatile_defconfig
m68k                       m5475evb_defconfig
powerpc                          g5_defconfig
arm                         lubbock_defconfig
sh                   sh7770_generic_defconfig
arm                          pxa910_defconfig
sh                          urquell_defconfig
mips                          malta_defconfig
mips                 decstation_r4k_defconfig
arm                          lpd270_defconfig
powerpc                    sam440ep_defconfig
mips                        workpad_defconfig
sh                             espt_defconfig
arm                         nhk8815_defconfig
mips                         tb0287_defconfig
h8300                       h8s-sim_defconfig
mips                           ip27_defconfig
powerpc                     ksi8560_defconfig
sh                           se7712_defconfig
parisc                              defconfig
sh                          r7785rp_defconfig
m68k                       m5275evb_defconfig
h8300                            alldefconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
powerpc                   microwatt_defconfig
mips                          ath25_defconfig
mips                         tb0219_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         palmz72_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                  iss476-smp_defconfig
sh                          polaris_defconfig
m68k                        mvme16x_defconfig
sh                        sh7763rdp_defconfig
powerpc                     taishan_defconfig
mips                           ip22_defconfig
sh                           se7721_defconfig
arm                      tct_hammer_defconfig
arm                          ixp4xx_defconfig
ia64                             allyesconfig
powerpc                      pmac32_defconfig
m68k                       m5208evb_defconfig
powerpc                 canyonlands_defconfig
alpha                            alldefconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7724_defconfig
parisc                generic-64bit_defconfig
csky                             alldefconfig
powerpc                 mpc834x_itx_defconfig
sh                        edosk7760_defconfig
arm                           h5000_defconfig
openrisc                    or1ksim_defconfig
x86_64               randconfig-c001-20210912
arm                  randconfig-c002-20210912
x86_64               randconfig-c001-20210910
arm                  randconfig-c002-20210910
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20210911
i386                 randconfig-a005-20210911
i386                 randconfig-a002-20210911
i386                 randconfig-a006-20210911
i386                 randconfig-a001-20210911
i386                 randconfig-a003-20210911
i386                 randconfig-a005-20210908
i386                 randconfig-a004-20210908
i386                 randconfig-a006-20210908
i386                 randconfig-a002-20210908
i386                 randconfig-a001-20210908
i386                 randconfig-a003-20210908
x86_64               randconfig-a002-20210911
x86_64               randconfig-a003-20210911
x86_64               randconfig-a004-20210911
x86_64               randconfig-a006-20210911
x86_64               randconfig-a005-20210911
x86_64               randconfig-a001-20210911
x86_64               randconfig-a013-20210910
x86_64               randconfig-a016-20210910
x86_64               randconfig-a012-20210910
x86_64               randconfig-a011-20210910
x86_64               randconfig-a014-20210910
x86_64               randconfig-a015-20210910
i386                 randconfig-a016-20210910
i386                 randconfig-a011-20210910
i386                 randconfig-a012-20210910
i386                 randconfig-a013-20210910
i386                 randconfig-a014-20210910
x86_64               randconfig-a004-20210908
x86_64               randconfig-a006-20210908
x86_64               randconfig-a003-20210908
x86_64               randconfig-a001-20210908
x86_64               randconfig-a005-20210908
x86_64               randconfig-a002-20210908
arc                  randconfig-r043-20210908
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c007-20210910
mips                 randconfig-c004-20210910
powerpc              randconfig-c003-20210910
i386                 randconfig-c001-20210910
s390                 randconfig-c005-20210910
riscv                randconfig-c006-20210911
x86_64               randconfig-c007-20210911
mips                 randconfig-c004-20210911
powerpc              randconfig-c003-20210911
i386                 randconfig-c001-20210911
s390                 randconfig-c005-20210911
x86_64               randconfig-a002-20210910
x86_64               randconfig-a003-20210910
x86_64               randconfig-a004-20210910
x86_64               randconfig-a006-20210910
x86_64               randconfig-a001-20210910
i386                 randconfig-a004-20210910
i386                 randconfig-a005-20210910
i386                 randconfig-a002-20210910
i386                 randconfig-a006-20210910
i386                 randconfig-a001-20210910
i386                 randconfig-a003-20210910
x86_64               randconfig-a013-20210911
x86_64               randconfig-a016-20210911
x86_64               randconfig-a012-20210911
x86_64               randconfig-a011-20210911
x86_64               randconfig-a014-20210911
x86_64               randconfig-a015-20210911
i386                 randconfig-a016-20210911
i386                 randconfig-a011-20210911
i386                 randconfig-a015-20210911
i386                 randconfig-a012-20210911
i386                 randconfig-a013-20210911
i386                 randconfig-a014-20210911
s390                 randconfig-r044-20210908
riscv                randconfig-r042-20210908
hexagon              randconfig-r045-20210908
hexagon              randconfig-r041-20210908

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
