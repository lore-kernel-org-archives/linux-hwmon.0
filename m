Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB04FC433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 05:54:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D3ED60FDC
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 05:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhJMF4I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Oct 2021 01:56:08 -0400
Received: from mga14.intel.com ([192.55.52.115]:13142 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229582AbhJMF4I (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Oct 2021 01:56:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227639930"
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; 
   d="scan'208";a="227639930"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2021 22:54:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,369,1624345200"; 
   d="scan'208";a="480656994"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Oct 2021 22:54:03 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1maXDH-0004J4-3e; Wed, 13 Oct 2021 05:54:03 +0000
Date:   Wed, 13 Oct 2021 13:53:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 ada61aa0b1184a8fda1a89a340c7d6cc4e59aee5
Message-ID: <6166745c.KAgf2iQV5K6lBmUs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: ada61aa0b1184a8fda1a89a340c7d6cc4e59aee5  hwmon: Fix possible memleak in __hwmon_device_register()

elapsed time: 875m

configs tested: 157
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                 randconfig-c001-20211012
sh                   sh7724_generic_defconfig
powerpc                     pseries_defconfig
xtensa                          iss_defconfig
arm                           sunxi_defconfig
arm                        shmobile_defconfig
sh                          r7780mp_defconfig
mips                      malta_kvm_defconfig
arm                           sama7_defconfig
powerpc                     mpc5200_defconfig
xtensa                generic_kc705_defconfig
arm                            mmp2_defconfig
powerpc                      makalu_defconfig
s390                          debug_defconfig
mips                           mtx1_defconfig
parisc                generic-32bit_defconfig
xtensa                  audio_kc705_defconfig
powerpc                     tqm8548_defconfig
powerpc                     tqm8560_defconfig
arm                    vt8500_v6_v7_defconfig
m68k                        m5307c3_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
riscv                             allnoconfig
powerpc                 mpc85xx_cds_defconfig
arm                           omap1_defconfig
alpha                            allyesconfig
powerpc                        icon_defconfig
m68k                          multi_defconfig
arm                          imote2_defconfig
mips                  maltasmvp_eva_defconfig
openrisc                            defconfig
arm64                            alldefconfig
powerpc                       maple_defconfig
arm                             ezx_defconfig
ia64                             allyesconfig
mips                 decstation_r4k_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                      mgcoge_defconfig
arm                          simpad_defconfig
mips                           ip22_defconfig
powerpc                     tqm5200_defconfig
powerpc                 linkstation_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
mips                         cobalt_defconfig
arm                         axm55xx_defconfig
nios2                         10m50_defconfig
powerpc                      katmai_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          landisk_defconfig
um                             i386_defconfig
arc                           tb10x_defconfig
mips                           ip32_defconfig
arm                           corgi_defconfig
powerpc                       ebony_defconfig
mips                      bmips_stb_defconfig
powerpc                       eiger_defconfig
mips                            e55_defconfig
mips                        nlm_xlp_defconfig
arm                  randconfig-c002-20211012
x86_64               randconfig-c001-20211012
ia64                             allmodconfig
ia64                                defconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20211012
x86_64               randconfig-a006-20211012
x86_64               randconfig-a001-20211012
x86_64               randconfig-a005-20211012
x86_64               randconfig-a002-20211012
x86_64               randconfig-a003-20211012
i386                 randconfig-a001-20211012
i386                 randconfig-a003-20211012
i386                 randconfig-a004-20211012
i386                 randconfig-a005-20211012
i386                 randconfig-a002-20211012
i386                 randconfig-a006-20211012
arc                  randconfig-r043-20211012
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
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
arm                  randconfig-c002-20211012
mips                 randconfig-c004-20211012
i386                 randconfig-c001-20211012
s390                 randconfig-c005-20211012
x86_64               randconfig-c007-20211012
powerpc              randconfig-c003-20211012
riscv                randconfig-c006-20211012
i386                 randconfig-a001-20211013
i386                 randconfig-a003-20211013
i386                 randconfig-a004-20211013
i386                 randconfig-a005-20211013
i386                 randconfig-a002-20211013
i386                 randconfig-a006-20211013
x86_64               randconfig-a004-20211013
x86_64               randconfig-a006-20211013
x86_64               randconfig-a001-20211013
x86_64               randconfig-a005-20211013
x86_64               randconfig-a002-20211013
x86_64               randconfig-a003-20211013
x86_64               randconfig-a015-20211012
x86_64               randconfig-a012-20211012
x86_64               randconfig-a016-20211012
x86_64               randconfig-a014-20211012
x86_64               randconfig-a013-20211012
x86_64               randconfig-a011-20211012
i386                 randconfig-a016-20211012
i386                 randconfig-a014-20211012
i386                 randconfig-a011-20211012
i386                 randconfig-a015-20211012
i386                 randconfig-a012-20211012
i386                 randconfig-a013-20211012
hexagon              randconfig-r041-20211012
s390                 randconfig-r044-20211012
riscv                randconfig-r042-20211012
hexagon              randconfig-r045-20211012

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
