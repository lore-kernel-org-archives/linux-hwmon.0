Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEA3C432BE
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 14:07:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C10960E0B
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Aug 2021 14:07:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbhHZOI3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Aug 2021 10:08:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:51951 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235064AbhHZOI2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Aug 2021 10:08:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="197986259"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="197986259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="684947246"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2021 07:07:17 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mJG2H-0001JF-4m; Thu, 26 Aug 2021 14:07:17 +0000
Date:   Thu, 26 Aug 2021 22:06:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 b3a7ab2d4376726178909e27b6956c012277ac4e
Message-ID: <61279ffc./RJsX+1mQSTTVnsT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b3a7ab2d4376726178909e27b6956c012277ac4e  hwmon: remove amd_energy driver in Makefile

elapsed time: 721m

configs tested: 243
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210826
powerpc              randconfig-c003-20210826
sh                          rsk7269_defconfig
parisc                              defconfig
nios2                            allyesconfig
powerpc                      cm5200_defconfig
arm                           u8500_defconfig
powerpc                     mpc512x_defconfig
mips                      bmips_stb_defconfig
powerpc                         wii_defconfig
xtensa                  cadence_csp_defconfig
arc                        nsimosci_defconfig
sh                          lboxre2_defconfig
arm                          gemini_defconfig
mips                      fuloong2e_defconfig
powerpc                       holly_defconfig
m68k                            mac_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                       ebony_defconfig
arm                           sama5_defconfig
m68k                          amiga_defconfig
m68k                          sun3x_defconfig
xtensa                       common_defconfig
h8300                               defconfig
xtensa                generic_kc705_defconfig
mips                         bigsur_defconfig
arm                      footbridge_defconfig
ia64                         bigsur_defconfig
ia64                            zx1_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                      axs103_smp_defconfig
mips                             allmodconfig
arm                         s3c2410_defconfig
arm                       aspeed_g4_defconfig
arm                            xcep_defconfig
arm                            mps2_defconfig
i386                             alldefconfig
m68k                       bvme6000_defconfig
arm                         mv78xx0_defconfig
sh                           se7619_defconfig
arm                        keystone_defconfig
mips                        vocore2_defconfig
sh                           se7721_defconfig
arm                         nhk8815_defconfig
arm                         hackkit_defconfig
mips                        nlm_xlr_defconfig
xtensa                  nommu_kc705_defconfig
nios2                         3c120_defconfig
powerpc                      obs600_defconfig
powerpc                     sbc8548_defconfig
sh                            hp6xx_defconfig
powerpc                     redwood_defconfig
mips                  maltasmvp_eva_defconfig
ia64                                defconfig
mips                     cu1000-neo_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      ep88xc_defconfig
alpha                            alldefconfig
sh                          r7780mp_defconfig
powerpc                     tqm5200_defconfig
arm                           tegra_defconfig
m68k                            q40_defconfig
powerpc                      acadia_defconfig
powerpc                     mpc83xx_defconfig
mips                      loongson3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                          g5_defconfig
arm                       multi_v4t_defconfig
openrisc                    or1ksim_defconfig
h8300                     edosk2674_defconfig
powerpc                 mpc8540_ads_defconfig
arm                             mxs_defconfig
arm                            pleb_defconfig
sh                            shmin_defconfig
sh                               j2_defconfig
powerpc                      arches_defconfig
arc                            hsdk_defconfig
mips                         tb0226_defconfig
arm                        neponset_defconfig
mips                         rt305x_defconfig
openrisc                  or1klitex_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         vf610m4_defconfig
openrisc                 simple_smp_defconfig
arc                          axs101_defconfig
mips                           gcw0_defconfig
csky                             alldefconfig
arm                          pxa910_defconfig
sh                           se7705_defconfig
m68k                        m5407c3_defconfig
mips                           xway_defconfig
parisc                generic-32bit_defconfig
sh                           sh2007_defconfig
mips                           ip22_defconfig
arm64                            alldefconfig
powerpc                      ppc64e_defconfig
sparc                       sparc32_defconfig
powerpc                      pcm030_defconfig
arm                          moxart_defconfig
powerpc                      ppc40x_defconfig
ia64                             alldefconfig
powerpc                      tqm8xx_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7750_defconfig
mips                        workpad_defconfig
mips                      pic32mzda_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                            zeus_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      mgcoge_defconfig
arm                          lpd270_defconfig
nios2                         10m50_defconfig
mips                          ath79_defconfig
arm                          collie_defconfig
m68k                          hp300_defconfig
arm                          pxa3xx_defconfig
mips                        omega2p_defconfig
powerpc                     pq2fads_defconfig
powerpc                     taishan_defconfig
powerpc                   motionpro_defconfig
sh                             sh03_defconfig
mips                         db1xxx_defconfig
xtensa                           alldefconfig
sh                      rts7751r2d1_defconfig
powerpc                     tqm8541_defconfig
sh                   sh7770_generic_defconfig
arm                         assabet_defconfig
powerpc                      pasemi_defconfig
powerpc                        warp_defconfig
mips                        qi_lb60_defconfig
powerpc                 linkstation_defconfig
arm                       imx_v6_v7_defconfig
arm                        mini2440_defconfig
mips                       bmips_be_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210826
x86_64               randconfig-a006-20210826
x86_64               randconfig-a001-20210826
x86_64               randconfig-a003-20210826
x86_64               randconfig-a004-20210826
x86_64               randconfig-a002-20210826
i386                 randconfig-a006-20210826
i386                 randconfig-a001-20210826
i386                 randconfig-a002-20210826
i386                 randconfig-a005-20210826
i386                 randconfig-a003-20210826
i386                 randconfig-a004-20210826
x86_64               randconfig-a014-20210825
x86_64               randconfig-a015-20210825
x86_64               randconfig-a016-20210825
x86_64               randconfig-a013-20210825
x86_64               randconfig-a012-20210825
x86_64               randconfig-a011-20210825
i386                 randconfig-a011-20210825
i386                 randconfig-a016-20210825
i386                 randconfig-a012-20210825
i386                 randconfig-a014-20210825
i386                 randconfig-a013-20210825
i386                 randconfig-a015-20210825
arc                  randconfig-r043-20210825
riscv                randconfig-r042-20210825
s390                 randconfig-r044-20210825
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
i386                 randconfig-c001-20210826
s390                 randconfig-c005-20210826
arm                  randconfig-c002-20210826
riscv                randconfig-c006-20210826
powerpc              randconfig-c003-20210826
x86_64               randconfig-c007-20210826
mips                 randconfig-c004-20210826
x86_64               randconfig-a014-20210826
x86_64               randconfig-a015-20210826
x86_64               randconfig-a016-20210826
x86_64               randconfig-a013-20210826
x86_64               randconfig-a012-20210826
x86_64               randconfig-a011-20210826
i386                 randconfig-a011-20210826
i386                 randconfig-a016-20210826
i386                 randconfig-a012-20210826
i386                 randconfig-a014-20210826
i386                 randconfig-a013-20210826
i386                 randconfig-a015-20210826
x86_64               randconfig-a005-20210825
x86_64               randconfig-a001-20210825
x86_64               randconfig-a006-20210825
x86_64               randconfig-a003-20210825
x86_64               randconfig-a004-20210825
x86_64               randconfig-a002-20210825
hexagon              randconfig-r041-20210826
hexagon              randconfig-r045-20210826
riscv                randconfig-r042-20210826
s390                 randconfig-r044-20210826

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
