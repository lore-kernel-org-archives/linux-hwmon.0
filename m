Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24629C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 29 Dec 2021 05:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhL2FPr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 29 Dec 2021 00:15:47 -0500
Received: from mga07.intel.com ([134.134.136.100]:5222 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229532AbhL2FPq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Dec 2021 00:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640754946; x=1672290946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X90lhjh8kPSIpcyqGbCCN++eBIwu1yIxEyxAVBiarLM=;
  b=MDSdHBqN42t3XhNWxXR2dmgYvT2r+gfuuiJ4ls/VqKyQmMO23UlR8kkQ
   OoGHnJb4Sh0W1JOJ4JDr5eVUBBY82L/Pgb2UYEtXl+kfHCyLizcs2gKAF
   bNNMLsZ4mv6mijooKtKsJGYLFJvOlzZB7iiheX24Swn0dlcFJO3px5jza
   6OPBBbB/HdD59RdwiB9ThyIeURpp3efNDNE0fmWcDu5QF+VWxBli8AI2h
   SmsLav/OmrOwa9xy5Uc2IPTezrfKAY50AJuzHmb08pxWcbG+8bYErfYxn
   7xh8B7sEyeE31xkuXfWeY98P0AysXbZSGJrAazSOlldWY1QJ8cTFqXWCu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="304823301"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="304823301"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 21:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="468375884"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Dec 2021 21:15:45 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n2RJQ-0008Yb-M0; Wed, 29 Dec 2021 05:15:44 +0000
Date:   Wed, 29 Dec 2021 13:15:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 660d187887cf28bcd71e56008a71657811953189
Message-ID: <61cbeed8.OZrniPcI8jiH897s%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 660d187887cf28bcd71e56008a71657811953189  hwmon: (xgene-hwmon) Add free before exiting xgene_hwmon_probe

elapsed time: 722m

configs tested: 178
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211228
powerpc              randconfig-c003-20211229
i386                 randconfig-c001-20211229
arc                     haps_hs_smp_defconfig
mips                         db1xxx_defconfig
arm                             mxs_defconfig
parisc                generic-32bit_defconfig
arm                          simpad_defconfig
mips                        workpad_defconfig
mips                           gcw0_defconfig
arm                        clps711x_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                           ip32_defconfig
mips                       lemote2f_defconfig
powerpc                     mpc5200_defconfig
mips                     decstation_defconfig
h8300                    h8300h-sim_defconfig
arm                         nhk8815_defconfig
sh                           se7724_defconfig
parisc                generic-64bit_defconfig
arm                          exynos_defconfig
xtensa                       common_defconfig
powerpc                     mpc512x_defconfig
arm                          pxa168_defconfig
mips                     loongson2k_defconfig
powerpc                     taishan_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 mpc834x_mds_defconfig
mips                  cavium_octeon_defconfig
h8300                     edosk2674_defconfig
powerpc                    ge_imp3a_defconfig
arm                             rpc_defconfig
ia64                            zx1_defconfig
powerpc                 mpc836x_mds_defconfig
arm                         axm55xx_defconfig
mips                         bigsur_defconfig
mips                          rm200_defconfig
riscv                            allyesconfig
powerpc                         wii_defconfig
i386                                defconfig
mips                         cobalt_defconfig
openrisc                            defconfig
sh                         ecovec24_defconfig
sh                        edosk7705_defconfig
sparc                               defconfig
m68k                       m5249evb_defconfig
um                             i386_defconfig
microblaze                      mmu_defconfig
sh                        sh7757lcr_defconfig
powerpc                         ps3_defconfig
powerpc                       maple_defconfig
mips                        maltaup_defconfig
arm                            xcep_defconfig
mips                          ath79_defconfig
powerpc                  mpc885_ads_defconfig
arm                         lpc18xx_defconfig
powerpc                     pq2fads_defconfig
arm                           sama5_defconfig
arm                       imx_v6_v7_defconfig
arm                          pxa910_defconfig
arm                         lpc32xx_defconfig
arc                        nsimosci_defconfig
arm                              alldefconfig
s390                       zfcpdump_defconfig
sparc64                             defconfig
ia64                         bigsur_defconfig
h8300                       h8s-sim_defconfig
openrisc                         alldefconfig
m68k                          atari_defconfig
m68k                          sun3x_defconfig
arm                             ezx_defconfig
arm                        shmobile_defconfig
arc                    vdk_hs38_smp_defconfig
csky                             alldefconfig
riscv             nommu_k210_sdcard_defconfig
arm                     davinci_all_defconfig
powerpc                    amigaone_defconfig
powerpc                          g5_defconfig
m68k                        m5272c3_defconfig
sh                   sh7770_generic_defconfig
mips                          rb532_defconfig
mips                       rbtx49xx_defconfig
powerpc                      ppc44x_defconfig
arm                  randconfig-c002-20211228
arm                  randconfig-c002-20211229
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211228
x86_64               randconfig-a001-20211228
x86_64               randconfig-a003-20211228
x86_64               randconfig-a006-20211228
x86_64               randconfig-a004-20211228
x86_64               randconfig-a002-20211228
i386                 randconfig-a006-20211228
i386                 randconfig-a004-20211228
i386                 randconfig-a002-20211228
i386                 randconfig-a003-20211228
i386                 randconfig-a001-20211228
i386                 randconfig-a005-20211228
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20211228
mips                 randconfig-c004-20211228
powerpc              randconfig-c003-20211228
arm                  randconfig-c002-20211228
x86_64               randconfig-c007-20211228
i386                 randconfig-c001-20211228
i386                 randconfig-a002-20211229
i386                 randconfig-a003-20211229
i386                 randconfig-a001-20211229
i386                 randconfig-a006-20211229
i386                 randconfig-a004-20211229
i386                 randconfig-a005-20211229
x86_64               randconfig-a015-20211228
x86_64               randconfig-a013-20211228
x86_64               randconfig-a012-20211228
x86_64               randconfig-a011-20211228
x86_64               randconfig-a016-20211228
x86_64               randconfig-a014-20211228
i386                 randconfig-a012-20211228
i386                 randconfig-a011-20211228
i386                 randconfig-a014-20211228
i386                 randconfig-a016-20211228
i386                 randconfig-a013-20211228
i386                 randconfig-a015-20211228
x86_64               randconfig-a005-20211229
x86_64               randconfig-a001-20211229
x86_64               randconfig-a003-20211229
x86_64               randconfig-a006-20211229
x86_64               randconfig-a004-20211229
x86_64               randconfig-a002-20211229
hexagon              randconfig-r041-20211228
riscv                randconfig-r042-20211228
s390                 randconfig-r044-20211228
hexagon              randconfig-r045-20211228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
