Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2119BC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Sep 2021 13:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F319C6101C
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Sep 2021 13:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhISNrx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 19 Sep 2021 09:47:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:59220 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230520AbhISNrx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Sep 2021 09:47:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10111"; a="223064437"
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; 
   d="scan'208";a="223064437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2021 06:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; 
   d="scan'208";a="473048126"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2021 06:46:26 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mRx9F-0005V7-It; Sun, 19 Sep 2021 13:46:25 +0000
Date:   Sun, 19 Sep 2021 21:46:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 1c2b67fd9b0336ecc29306709af06100f6f2b08e
Message-ID: <61473f2e.4zZrs4jiIcboduRQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 1c2b67fd9b0336ecc29306709af06100f6f2b08e  watchdog: mtk: add disable_wdt_extrst support

elapsed time: 2316m

configs tested: 225
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210918
powerpc                      mgcoge_defconfig
arm                         mv78xx0_defconfig
powerpc                     stx_gp3_defconfig
powerpc                      ppc44x_defconfig
arm                       aspeed_g4_defconfig
m68k                             alldefconfig
arm                          gemini_defconfig
powerpc                   lite5200b_defconfig
arc                            hsdk_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                      malta_kvm_defconfig
powerpc                     taishan_defconfig
mips                           ip32_defconfig
arm                          ixp4xx_defconfig
s390                          debug_defconfig
arc                     haps_hs_smp_defconfig
arm                           omap1_defconfig
powerpc                         wii_defconfig
powerpc                 mpc837x_mds_defconfig
arm                         orion5x_defconfig
arm                             mxs_defconfig
arm                   milbeaut_m10v_defconfig
sh                          lboxre2_defconfig
arm                            qcom_defconfig
m68k                        m5307c3_defconfig
m68k                        mvme16x_defconfig
powerpc                        fsp2_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        mini2440_defconfig
sparc64                          alldefconfig
m68k                        m5272c3_defconfig
microblaze                      mmu_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7750_defconfig
mips                        omega2p_defconfig
arm                      pxa255-idp_defconfig
arm                        neponset_defconfig
powerpc                      pmac32_defconfig
mips                           ip27_defconfig
arm64                            alldefconfig
mips                           rs90_defconfig
powerpc                      ppc40x_defconfig
powerpc                     tqm8540_defconfig
sh                           se7705_defconfig
sh                                  defconfig
alpha                            alldefconfig
arm                         s3c6400_defconfig
mips                           xway_defconfig
powerpc                  mpc885_ads_defconfig
mips                          rm200_defconfig
arm                         s5pv210_defconfig
sh                           sh2007_defconfig
mips                        nlm_xlp_defconfig
mips                   sb1250_swarm_defconfig
arm                         cm_x300_defconfig
m68k                         apollo_defconfig
mips                             allyesconfig
powerpc                mpc7448_hpc2_defconfig
ia64                            zx1_defconfig
arm                         at91_dt_defconfig
powerpc                      obs600_defconfig
powerpc                      walnut_defconfig
sh                        dreamcast_defconfig
microblaze                          defconfig
um                                  defconfig
powerpc                     pq2fads_defconfig
ia64                        generic_defconfig
arm                         vf610m4_defconfig
xtensa                          iss_defconfig
powerpc                     tqm8548_defconfig
powerpc                     mpc5200_defconfig
mips                           ip28_defconfig
sh                           se7712_defconfig
arm                      footbridge_defconfig
arm                        vexpress_defconfig
sh                           se7721_defconfig
arc                                 defconfig
sh                          kfr2r09_defconfig
arm                       cns3420vb_defconfig
sh                        apsh4ad0a_defconfig
powerpc                     mpc83xx_defconfig
mips                     loongson1b_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                    amigaone_defconfig
sh                               j2_defconfig
sparc                       sparc64_defconfig
mips                  decstation_64_defconfig
sh                   rts7751r2dplus_defconfig
arm                             pxa_defconfig
arm                         palmz72_defconfig
powerpc                      tqm8xx_defconfig
arm                       multi_v4t_defconfig
mips                          ath79_defconfig
mips                  maltasmvp_eva_defconfig
arc                           tb10x_defconfig
xtensa                           alldefconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
powerpc                 linkstation_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     mpc512x_defconfig
arm                        oxnas_v6_defconfig
arm                           h3600_defconfig
sh                          r7785rp_defconfig
powerpc                        cell_defconfig
arm                          pxa168_defconfig
x86_64               randconfig-c001-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
x86_64               randconfig-c001-20210918
arm                  randconfig-c002-20210918
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210919
x86_64               randconfig-a004-20210919
x86_64               randconfig-a006-20210919
x86_64               randconfig-a003-20210919
x86_64               randconfig-a001-20210919
x86_64               randconfig-a005-20210919
i386                 randconfig-a004-20210919
i386                 randconfig-a005-20210919
i386                 randconfig-a002-20210919
i386                 randconfig-a006-20210919
i386                 randconfig-a001-20210919
i386                 randconfig-a003-20210919
x86_64               randconfig-a013-20210918
x86_64               randconfig-a016-20210918
x86_64               randconfig-a012-20210918
x86_64               randconfig-a011-20210918
x86_64               randconfig-a014-20210918
x86_64               randconfig-a015-20210918
i386                 randconfig-a016-20210918
i386                 randconfig-a012-20210918
i386                 randconfig-a011-20210918
i386                 randconfig-a015-20210918
i386                 randconfig-a013-20210918
i386                 randconfig-a014-20210918
riscv                randconfig-r042-20210918
s390                 randconfig-r044-20210918
arc                  randconfig-r043-20210918
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
riscv                randconfig-c006-20210919
x86_64               randconfig-c007-20210919
powerpc              randconfig-c003-20210919
mips                 randconfig-c004-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
s390                 randconfig-c005-20210919
riscv                randconfig-c006-20210918
x86_64               randconfig-c007-20210918
powerpc              randconfig-c003-20210918
mips                 randconfig-c004-20210918
i386                 randconfig-c001-20210918
arm                  randconfig-c002-20210918
s390                 randconfig-c005-20210918
x86_64               randconfig-a002-20210918
x86_64               randconfig-a004-20210918
x86_64               randconfig-a006-20210918
x86_64               randconfig-a003-20210918
x86_64               randconfig-a001-20210918
x86_64               randconfig-a005-20210918
i386                 randconfig-a004-20210918
i386                 randconfig-a005-20210918
i386                 randconfig-a002-20210918
i386                 randconfig-a006-20210918
i386                 randconfig-a001-20210918
i386                 randconfig-a003-20210918
x86_64               randconfig-a013-20210919
x86_64               randconfig-a016-20210919
x86_64               randconfig-a012-20210919
x86_64               randconfig-a011-20210919
x86_64               randconfig-a014-20210919
x86_64               randconfig-a015-20210919
i386                 randconfig-a016-20210919
i386                 randconfig-a012-20210919
i386                 randconfig-a011-20210919
i386                 randconfig-a015-20210919
i386                 randconfig-a013-20210919
i386                 randconfig-a014-20210919
hexagon              randconfig-r045-20210918
hexagon              randconfig-r041-20210918

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
