Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2A1C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Sep 2021 02:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33C36610A8
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Sep 2021 02:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhISCKW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Sep 2021 22:10:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:30213 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhISCKV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Sep 2021 22:10:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10111"; a="223031697"
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; 
   d="scan'208";a="223031697"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2021 19:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,305,1624345200"; 
   d="scan'208";a="701839938"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2021 19:08:55 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mRmGE-0005FF-K4; Sun, 19 Sep 2021 02:08:54 +0000
Date:   Sun, 19 Sep 2021 10:08:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e6fab7af6ba1bc77c78713a83876f60ca7a4a064
Message-ID: <61469ba9.W8+/TTovGYJyGpr9%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e6fab7af6ba1bc77c78713a83876f60ca7a4a064  hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs

elapsed time: 2963m

configs tested: 285
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210916
i386                 randconfig-c001-20210918
sh                          rsk7269_defconfig
powerpc                     ep8248e_defconfig
riscv                    nommu_virt_defconfig
arm                         shannon_defconfig
arm                       imx_v4_v5_defconfig
sh                                  defconfig
arm                         socfpga_defconfig
powerpc                       ebony_defconfig
arm                           u8500_defconfig
m68k                       bvme6000_defconfig
powerpc64                        alldefconfig
um                                  defconfig
openrisc                 simple_smp_defconfig
arm                        oxnas_v6_defconfig
sh                          landisk_defconfig
um                           x86_64_defconfig
arm                        mvebu_v7_defconfig
arc                        nsimosci_defconfig
mips                     loongson1b_defconfig
sh                           se7712_defconfig
powerpc                        warp_defconfig
arm                      integrator_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                                defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      pic32mzda_defconfig
sh                          r7785rp_defconfig
powerpc                      ppc6xx_defconfig
arm                          simpad_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                      malta_kvm_defconfig
powerpc                     taishan_defconfig
mips                           ip32_defconfig
arm                          ixp4xx_defconfig
s390                          debug_defconfig
arm                       mainstone_defconfig
arm                            qcom_defconfig
arm                          pcm027_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                             mxs_defconfig
arm                   milbeaut_m10v_defconfig
sh                          lboxre2_defconfig
m68k                        m5307c3_defconfig
m68k                        mvme16x_defconfig
powerpc                        fsp2_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7750_defconfig
mips                        omega2p_defconfig
arm                      pxa255-idp_defconfig
powerpc                     tqm8541_defconfig
powerpc                    klondike_defconfig
powerpc                     tqm8548_defconfig
powerpc                     kmeter1_defconfig
powerpc                  mpc885_ads_defconfig
arm                         cm_x300_defconfig
sh                               alldefconfig
m68k                         amcore_defconfig
arc                            hsdk_defconfig
arm                        neponset_defconfig
powerpc                      pmac32_defconfig
ia64                        generic_defconfig
arm                        vexpress_defconfig
m68k                        m5272c3_defconfig
mips                           ip27_defconfig
arm64                            alldefconfig
mips                           rs90_defconfig
powerpc                      ppc40x_defconfig
powerpc                     tqm8540_defconfig
arm                        clps711x_defconfig
arm                          badge4_defconfig
arm                            zeus_defconfig
powerpc                      tqm8xx_defconfig
arm                        mvebu_v5_defconfig
powerpc                     sequoia_defconfig
arm                        mini2440_defconfig
m68k                         apollo_defconfig
mips                             allyesconfig
powerpc                mpc7448_hpc2_defconfig
ia64                            zx1_defconfig
powerpc                       maple_defconfig
arm                             pxa_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           tegra_defconfig
sh                           se7780_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
powerpc                      chrp32_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear3xx_defconfig
arc                                 defconfig
sh                          kfr2r09_defconfig
arm                       cns3420vb_defconfig
sh                        apsh4ad0a_defconfig
powerpc                     mpc83xx_defconfig
powerpc                     powernv_defconfig
mips                          rm200_defconfig
mips                     cu1000-neo_defconfig
arm                          ep93xx_defconfig
xtensa                  audio_kc705_defconfig
xtensa                          iss_defconfig
mips                           xway_defconfig
arc                     nsimosci_hs_defconfig
x86_64                           allyesconfig
powerpc                  storcenter_defconfig
arm                        keystone_defconfig
arm                             ezx_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                           se7724_defconfig
powerpc                           allnoconfig
arm                       multi_v4t_defconfig
mips                          ath79_defconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
powerpc                   motionpro_defconfig
arm                         s3c6400_defconfig
s390                             alldefconfig
powerpc                    socrates_defconfig
powerpc                       eiger_defconfig
mips                         cobalt_defconfig
mips                  maltasmvp_eva_defconfig
arc                           tb10x_defconfig
xtensa                           alldefconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
powerpc                 linkstation_defconfig
powerpc                     mpc512x_defconfig
x86_64               randconfig-c001-20210918
arm                  randconfig-c002-20210918
x86_64               randconfig-c001-20210916
arm                  randconfig-c002-20210916
x86_64               randconfig-c001-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                             allyesconfig
parisc                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
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
i386                 randconfig-a004-20210917
i386                 randconfig-a005-20210917
i386                 randconfig-a006-20210917
i386                 randconfig-a002-20210917
i386                 randconfig-a003-20210917
i386                 randconfig-a001-20210917
x86_64               randconfig-a013-20210918
x86_64               randconfig-a016-20210918
x86_64               randconfig-a012-20210918
x86_64               randconfig-a011-20210918
x86_64               randconfig-a014-20210918
x86_64               randconfig-a015-20210918
x86_64               randconfig-a016-20210916
x86_64               randconfig-a013-20210916
x86_64               randconfig-a012-20210916
x86_64               randconfig-a011-20210916
x86_64               randconfig-a014-20210916
x86_64               randconfig-a015-20210916
i386                 randconfig-a016-20210916
i386                 randconfig-a015-20210916
i386                 randconfig-a011-20210916
i386                 randconfig-a012-20210916
i386                 randconfig-a013-20210916
i386                 randconfig-a014-20210916
i386                 randconfig-a016-20210918
i386                 randconfig-a012-20210918
i386                 randconfig-a011-20210918
i386                 randconfig-a015-20210918
i386                 randconfig-a013-20210918
i386                 randconfig-a014-20210918
riscv                randconfig-r042-20210916
s390                 randconfig-r044-20210916
arc                  randconfig-r043-20210916
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210916
x86_64               randconfig-c007-20210916
mips                 randconfig-c004-20210916
powerpc              randconfig-c003-20210916
arm                  randconfig-c002-20210916
i386                 randconfig-c001-20210916
s390                 randconfig-c005-20210916
riscv                randconfig-c006-20210917
x86_64               randconfig-c007-20210917
mips                 randconfig-c004-20210917
powerpc              randconfig-c003-20210917
arm                  randconfig-c002-20210917
i386                 randconfig-c001-20210917
s390                 randconfig-c005-20210917
riscv                randconfig-c006-20210918
x86_64               randconfig-c007-20210918
powerpc              randconfig-c003-20210918
mips                 randconfig-c004-20210918
i386                 randconfig-c001-20210918
arm                  randconfig-c002-20210918
s390                 randconfig-c005-20210918
riscv                randconfig-c006-20210919
x86_64               randconfig-c007-20210919
powerpc              randconfig-c003-20210919
mips                 randconfig-c004-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
s390                 randconfig-c005-20210919
x86_64               randconfig-a002-20210916
x86_64               randconfig-a003-20210916
x86_64               randconfig-a006-20210916
x86_64               randconfig-a004-20210916
x86_64               randconfig-a005-20210916
x86_64               randconfig-a001-20210916
x86_64               randconfig-a002-20210918
x86_64               randconfig-a004-20210918
x86_64               randconfig-a006-20210918
x86_64               randconfig-a003-20210918
x86_64               randconfig-a001-20210918
x86_64               randconfig-a005-20210918
i386                 randconfig-a004-20210916
i386                 randconfig-a005-20210916
i386                 randconfig-a006-20210916
i386                 randconfig-a002-20210916
i386                 randconfig-a003-20210916
i386                 randconfig-a001-20210916
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
hexagon              randconfig-r045-20210918
hexagon              randconfig-r041-20210918
hexagon              randconfig-r045-20210916
hexagon              randconfig-r041-20210916

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
