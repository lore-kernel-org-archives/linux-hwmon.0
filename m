Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD1CC432BE
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 14:00:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10CF660F58
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Aug 2021 14:00:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhHCOAs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Aug 2021 10:00:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:40050 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236252AbhHCOAq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 3 Aug 2021 10:00:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="200863437"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="200863437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 07:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; 
   d="scan'208";a="479521134"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2021 07:00:31 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mAuy6-000DxW-HB; Tue, 03 Aug 2021 14:00:30 +0000
Date:   Tue, 03 Aug 2021 22:00:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 b3ffffdb86b9d09185ace6a7daaf8c4e8bb61317
Message-ID: <61094bf1.tJYg1LC2R33RxwHL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: b3ffffdb86b9d09185ace6a7daaf8c4e8bb61317  dt-bindings: watchdog: Add compatible for Mediatek MT7986

elapsed time: 731m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210803
sh                           se7751_defconfig
arc                    vdk_hs38_smp_defconfig
m68k                       bvme6000_defconfig
arm                         mv78xx0_defconfig
powerpc                     kmeter1_defconfig
sh                     sh7710voipgw_defconfig
arm                          pxa3xx_defconfig
arm                         assabet_defconfig
arm                          pxa910_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                  colibri_pxa300_defconfig
arm                     davinci_all_defconfig
sh                           se7750_defconfig
sh                         apsh4a3a_defconfig
riscv                            allyesconfig
powerpc                     powernv_defconfig
mips                         bigsur_defconfig
openrisc                 simple_smp_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
sh                           se7724_defconfig
m68k                         apollo_defconfig
arm                       cns3420vb_defconfig
arm                          iop32x_defconfig
mips                 decstation_r4k_defconfig
arm                        trizeps4_defconfig
sh                           se7722_defconfig
arm                     eseries_pxa_defconfig
sh                          r7780mp_defconfig
sh                            titan_defconfig
arm                       mainstone_defconfig
parisc                generic-64bit_defconfig
arm                        multi_v5_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
mips                        bcm63xx_defconfig
powerpc                    socrates_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
sh                        sh7763rdp_defconfig
sh                          sdk7786_defconfig
powerpc                      walnut_defconfig
mips                            ar7_defconfig
m68k                       m5275evb_defconfig
riscv                    nommu_k210_defconfig
arm                          badge4_defconfig
arm                              alldefconfig
arm                       imx_v6_v7_defconfig
powerpc                      bamboo_defconfig
arm                          ixp4xx_defconfig
powerpc                      ppc44x_defconfig
powerpc                  iss476-smp_defconfig
m68k                             allyesconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210803
x86_64               randconfig-a004-20210803
x86_64               randconfig-a006-20210803
x86_64               randconfig-a003-20210803
x86_64               randconfig-a001-20210803
x86_64               randconfig-a005-20210803
i386                 randconfig-a004-20210803
i386                 randconfig-a005-20210803
i386                 randconfig-a002-20210803
i386                 randconfig-a006-20210803
i386                 randconfig-a001-20210803
i386                 randconfig-a003-20210803
x86_64               randconfig-a012-20210802
x86_64               randconfig-a016-20210802
x86_64               randconfig-a013-20210802
x86_64               randconfig-a011-20210802
x86_64               randconfig-a014-20210802
x86_64               randconfig-a015-20210802
i386                 randconfig-a012-20210803
i386                 randconfig-a011-20210803
i386                 randconfig-a015-20210803
i386                 randconfig-a013-20210803
i386                 randconfig-a014-20210803
i386                 randconfig-a016-20210803
i386                 randconfig-a012-20210802
i386                 randconfig-a011-20210802
i386                 randconfig-a015-20210802
i386                 randconfig-a013-20210802
i386                 randconfig-a014-20210802
i386                 randconfig-a016-20210802
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210803
x86_64               randconfig-c001-20210802
x86_64               randconfig-a012-20210803
x86_64               randconfig-a016-20210803
x86_64               randconfig-a013-20210803
x86_64               randconfig-a011-20210803
x86_64               randconfig-a014-20210803
x86_64               randconfig-a015-20210803

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
