Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D841C4743F
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Jun 2021 00:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2759D60FEE
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Jun 2021 00:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhFEAnT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Jun 2021 20:43:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:58622 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231172AbhFEAnS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Jun 2021 20:43:18 -0400
IronPort-SDR: ulEEwSDZYgibs1Gbn+keGBuASZ1RjRqxi3pUPFOac3BFTHe8IN6APzA8rWrsiWbny5pF2bcv4y
 JpxWV9IHL6Vg==
X-IronPort-AV: E=McAfee;i="6200,9189,10005"; a="204423885"
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="204423885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 17:41:31 -0700
IronPort-SDR: SgY9BSJ4P7t+rqBxFhPnSmzSVcYTVUvzcj7Wc3Q4IIB7pYdlXeVGMdi7rr/7EQhMAvG4+QhL94
 0WO0tnyxyaUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,249,1616482800"; 
   d="scan'208";a="551327544"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2021 17:41:29 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lpKNV-0007C9-C2; Sat, 05 Jun 2021 00:41:29 +0000
Date:   Sat, 05 Jun 2021 08:40:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 a7015d2a3c19d8f2cbab5f7839ffee8fa26770b2
Message-ID: <60bac801.4oBbZVhbS3Ln5YiZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a7015d2a3c19d8f2cbab5f7839ffee8fa26770b2  hwmon: (ina3221) use CVRF only for single-shot conversion

elapsed time: 720m

configs tested: 209
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
arm                        clps711x_defconfig
arc                         haps_hs_defconfig
mips                          rb532_defconfig
arm                          collie_defconfig
powerpc                 mpc8540_ads_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  colibri_pxa270_defconfig
powerpc                    adder875_defconfig
powerpc                       ebony_defconfig
sh                        apsh4ad0a_defconfig
arm                        keystone_defconfig
powerpc                    gamecube_defconfig
mips                      maltasmvp_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                           gcw0_defconfig
powerpc                      obs600_defconfig
arm                           sama5_defconfig
mips                    maltaup_xpa_defconfig
powerpc                       eiger_defconfig
powerpc                      chrp32_defconfig
arm                           corgi_defconfig
um                               alldefconfig
powerpc                  iss476-smp_defconfig
arm                             mxs_defconfig
m68k                       m5275evb_defconfig
arm                     am200epdkit_defconfig
mips                        bcm47xx_defconfig
nios2                               defconfig
mips                           xway_defconfig
powerpc                          allmodconfig
powerpc                      ep88xc_defconfig
sh                               alldefconfig
powerpc64                           defconfig
powerpc                 mpc8313_rdb_defconfig
openrisc                            defconfig
mips                  decstation_64_defconfig
riscv                    nommu_virt_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
mips                         tb0287_defconfig
arm                            mmp2_defconfig
sparc                            alldefconfig
mips                           rs90_defconfig
i386                                defconfig
sh                        edosk7705_defconfig
arm                         shannon_defconfig
arm                       omap2plus_defconfig
mips                        qi_lb60_defconfig
powerpc                        warp_defconfig
mips                 decstation_r4k_defconfig
nds32                            alldefconfig
sh                          rsk7264_defconfig
powerpc                    klondike_defconfig
sh                         microdev_defconfig
arm                         s5pv210_defconfig
arm                         hackkit_defconfig
ia64                                defconfig
powerpc                     taishan_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                         apsh4a3a_defconfig
powerpc                      ppc40x_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 canyonlands_defconfig
arm                          pxa168_defconfig
arm                         at91_dt_defconfig
mips                           jazz_defconfig
sh                           se7619_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        dreamcast_defconfig
arm                      integrator_defconfig
arm                            mps2_defconfig
arm                          simpad_defconfig
powerpc                       maple_defconfig
nds32                             allnoconfig
sh                          r7780mp_defconfig
m68k                         apollo_defconfig
mips                           mtx1_defconfig
arm                            xcep_defconfig
sh                         ap325rxa_defconfig
sh                            titan_defconfig
powerpc                     stx_gp3_defconfig
sh                          rsk7201_defconfig
arm                       imx_v6_v7_defconfig
powerpc                     sbc8548_defconfig
arm                   milbeaut_m10v_defconfig
sh                               allmodconfig
mips                           ip28_defconfig
m68k                       m5208evb_defconfig
sh                          sdk7786_defconfig
arm                       cns3420vb_defconfig
arm                        trizeps4_defconfig
sh                          lboxre2_defconfig
powerpc                      tqm8xx_defconfig
mips                         rt305x_defconfig
mips                      pic32mzda_defconfig
powerpc                   lite5200b_defconfig
arm                         lubbock_defconfig
powerpc                     mpc83xx_defconfig
powerpc                       holly_defconfig
xtensa                              defconfig
powerpc                     kmeter1_defconfig
mips                         cobalt_defconfig
powerpc                   motionpro_defconfig
m68k                            q40_defconfig
powerpc                     ppa8548_defconfig
powerpc                     kilauea_defconfig
mips                           ip22_defconfig
alpha                            alldefconfig
arm                         mv78xx0_defconfig
xtensa                          iss_defconfig
mips                       lemote2f_defconfig
mips                      maltaaprp_defconfig
nios2                         3c120_defconfig
powerpc                        fsp2_defconfig
sparc                       sparc32_defconfig
sh                        sh7785lcr_defconfig
arm                        multi_v7_defconfig
m68k                                defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210604
x86_64               randconfig-a004-20210604
x86_64               randconfig-a003-20210604
x86_64               randconfig-a006-20210604
x86_64               randconfig-a005-20210604
x86_64               randconfig-a001-20210604
i386                 randconfig-a003-20210604
i386                 randconfig-a006-20210604
i386                 randconfig-a004-20210604
i386                 randconfig-a001-20210604
i386                 randconfig-a005-20210604
i386                 randconfig-a002-20210604
i386                 randconfig-a003-20210603
i386                 randconfig-a006-20210603
i386                 randconfig-a004-20210603
i386                 randconfig-a001-20210603
i386                 randconfig-a005-20210603
i386                 randconfig-a002-20210603
x86_64               randconfig-a015-20210603
x86_64               randconfig-a011-20210603
x86_64               randconfig-a012-20210603
x86_64               randconfig-a014-20210603
x86_64               randconfig-a016-20210603
x86_64               randconfig-a013-20210603
i386                 randconfig-a015-20210604
i386                 randconfig-a013-20210604
i386                 randconfig-a016-20210604
i386                 randconfig-a011-20210604
i386                 randconfig-a014-20210604
i386                 randconfig-a012-20210604
i386                 randconfig-a015-20210603
i386                 randconfig-a013-20210603
i386                 randconfig-a011-20210603
i386                 randconfig-a016-20210603
i386                 randconfig-a014-20210603
i386                 randconfig-a012-20210603
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210604
x86_64               randconfig-a015-20210604
x86_64               randconfig-a011-20210604
x86_64               randconfig-a014-20210604
x86_64               randconfig-a012-20210604
x86_64               randconfig-a016-20210604
x86_64               randconfig-a013-20210604

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
