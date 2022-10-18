Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B60C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 Oct 2022 03:42:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231416AbiJRDma (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Oct 2022 23:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbiJRDmF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Oct 2022 23:42:05 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277DA1057A
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Oct 2022 20:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666064298; x=1697600298;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LcqYqJw9+D3dOmVT6hsz+W8kTBmT97iPb7vUseyz7y0=;
  b=XIj/fakQa2FzWGO7QAMSIhCoXHxNaNy9ncug4UmtP5qT2Hd/CKu84dlF
   TSEBywWFnYBC69LpT7/qig9Wi+E+tMPM0oH0ddhQl+/Tlse48I34yInBc
   xrTRKIsoYiDQF+2qmBUtpc47L9byG/zHR38XAv0SvHt1Q+XX0nVusTRvF
   e/S3v66NWi+JPTKqevLiiQcqdqvrADDbtHagjfnCclKrd6UIIseFP+Ecn
   zupQ9AkACSoojJUjVtFL8K1Ic0VuByk0x37eeVBRyHBRA+SiNHIA3Lc99
   Cqjqe5Od4Oc4n+9uuK/Ws5L+aApu4pMDsRZMxzR2pckjZqbXHaL8aLvCi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="305970448"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="305970448"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 20:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="957592604"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="957592604"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2022 20:38:14 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1okdQj-0001FU-3A;
        Tue, 18 Oct 2022 03:38:13 +0000
Date:   Tue, 18 Oct 2022 11:37:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 7208127c690c7575460b70128a06d5dc7eb555bf
Message-ID: <634e1f90.lzII7NUBe4eY1wXM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 7208127c690c7575460b70128a06d5dc7eb555bf  watchdog: sp805_wdt: fix spelling typo in comment

elapsed time: 1474m

configs tested: 199
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221017
i386                             allyesconfig
i386                                defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
i386                 randconfig-a005-20221017
i386                 randconfig-a003-20221017
i386                 randconfig-a004-20221017
i386                 randconfig-a001-20221017
i386                 randconfig-a006-20221017
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
arm                              allyesconfig
sh                   secureedge5410_defconfig
arc                        nsimosci_defconfig
m68k                          multi_defconfig
csky                             alldefconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64               randconfig-a004-20221017
x86_64               randconfig-a001-20221017
x86_64               randconfig-a002-20221017
x86_64               randconfig-a006-20221017
x86_64               randconfig-a005-20221017
m68k                             allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                          amiga_defconfig
sh                   sh7724_generic_defconfig
sh                          rsk7264_defconfig
mips                 decstation_r4k_defconfig
loongarch                         allnoconfig
s390                       zfcpdump_defconfig
mips                           ci20_defconfig
powerpc                      pcm030_defconfig
sh                         ap325rxa_defconfig
powerpc                    amigaone_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      tqm8xx_defconfig
arm                                 defconfig
mips                           jazz_defconfig
arm                          simpad_defconfig
um                               alldefconfig
arm                           sama5_defconfig
arm                         at91_dt_defconfig
m68k                        m5407c3_defconfig
powerpc                  iss476-smp_defconfig
sh                   rts7751r2dplus_defconfig
m68k                        mvme16x_defconfig
arm                        spear6xx_defconfig
sparc                             allnoconfig
sh                          r7785rp_defconfig
s390                          debug_defconfig
openrisc                 simple_smp_defconfig
ia64                                defconfig
i386                 randconfig-c001-20221017
i386                             alldefconfig
xtensa                  audio_kc705_defconfig
microblaze                          defconfig
arm                          pxa910_defconfig
arc                      axs103_smp_defconfig
m68k                            mac_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                             allmodconfig
sh                        edosk7760_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 canyonlands_defconfig
arc                        nsim_700_defconfig
riscv                               defconfig
powerpc                 mpc837x_mds_defconfig
sh                           se7721_defconfig
arc                          axs103_defconfig
powerpc                     asp8347_defconfig
sh                ecovec24-romimage_defconfig
arm                      footbridge_defconfig
m68k                             alldefconfig
arm                         assabet_defconfig
mips                  maltasmvp_eva_defconfig
arm                          gemini_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                 mpc8540_ads_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                    adder875_defconfig
sh                           se7751_defconfig
parisc                           alldefconfig
nios2                               defconfig
mips                        vocore2_defconfig
arm                        keystone_defconfig
powerpc                        cell_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                         amcore_defconfig
powerpc                      makalu_defconfig
loongarch                           defconfig
sh                             sh03_defconfig
ia64                            zx1_defconfig
arc                     nsimosci_hs_defconfig
powerpc                        warp_defconfig
sh                          polaris_defconfig
m68k                          hp300_defconfig
sh                          rsk7203_defconfig
arm                             ezx_defconfig
sh                              ul2_defconfig
powerpc                  storcenter_defconfig
arm                            lart_defconfig
sh                             shx3_defconfig
parisc                generic-64bit_defconfig
arm                        cerfcube_defconfig
m68k                            q40_defconfig
arc                           tb10x_defconfig
i386                 randconfig-a002-20221017
loongarch                        allmodconfig
x86_64               randconfig-a003-20221017
powerpc                         wii_defconfig
arm                        realview_defconfig
arc                        vdk_hs38_defconfig
powerpc                      chrp32_defconfig
powerpc                      arches_defconfig
arm                          iop32x_defconfig
openrisc                  or1klitex_defconfig
m68k                       m5208evb_defconfig
mips                     decstation_defconfig
mips                        bcm47xx_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7705_defconfig
x86_64               randconfig-c001-20221017
arm                  randconfig-c002-20221017
arm                           h3600_defconfig
powerpc                     taishan_defconfig
m68k                       bvme6000_defconfig
mips                             allmodconfig
ia64                             allmodconfig
sparc                       sparc32_defconfig
sparc                       sparc64_defconfig
arm                       aspeed_g5_defconfig
arm64                            alldefconfig

clang tested configs:
s390                 randconfig-r044-20221017
hexagon              randconfig-r045-20221017
riscv                randconfig-r042-20221017
hexagon              randconfig-r041-20221017
x86_64               randconfig-a014-20221017
x86_64               randconfig-a015-20221017
x86_64               randconfig-a012-20221017
x86_64               randconfig-a011-20221017
x86_64               randconfig-a013-20221017
x86_64               randconfig-a016-20221017
i386                 randconfig-a013-20221017
i386                 randconfig-a015-20221017
i386                 randconfig-a016-20221017
i386                 randconfig-a011-20221017
i386                 randconfig-a014-20221017
i386                 randconfig-a012-20221017
mips                          rm200_defconfig
arm                          pxa168_defconfig
riscv                            alldefconfig
mips                   sb1250_swarm_defconfig
i386                             allyesconfig
mips                 randconfig-c004-20221017
i386                 randconfig-c001-20221017
s390                 randconfig-c005-20221017
arm                  randconfig-c002-20221017
riscv                randconfig-c006-20221017
x86_64               randconfig-c007-20221017
powerpc              randconfig-c003-20221017
riscv                          rv32_defconfig
arm                         palmz72_defconfig
arm                             mxs_defconfig
x86_64               randconfig-k001-20221017
arm                          collie_defconfig
x86_64                        randconfig-c007
mips                 randconfig-c004-20221018
i386                          randconfig-c001
s390                 randconfig-c005-20221018
arm                  randconfig-c002-20221018
riscv                randconfig-c006-20221018
powerpc              randconfig-c003-20221018
arm                        mvebu_v5_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
