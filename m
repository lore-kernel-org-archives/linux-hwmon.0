Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FD3C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Jan 2022 15:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbiAXPyQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 10:54:16 -0500
Received: from mga14.intel.com ([192.55.52.115]:48796 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243238AbiAXPyM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 10:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643039651; x=1674575651;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MduTiWe47Tp06KzvxwVjH4HsYnof8/NdJ3sXQIUbdWY=;
  b=V3YkDv/VBZgjHH3n6Lo4rzKTyh9C6lVCm5o8nLMGKTx2wZqIjvLBgDkK
   ASJSQBbXHHQEZ/68CBY42SQF0xuwoW9fNdAUjDLxVb5GD6XqjhuerO3MH
   Zi7gJI8kHks6pX7Lz+5nJiB9Z6nIXOqop7/bstxLs2n6xpzhDfZL+b72T
   0eif3GX6Mev5Hdppwtk+xR6v+sLpM/K1iwl/+DwxkZbBSPqhMPsobZVoX
   Td97apFv8P59sgdZ1VR/5mN2JWj9fqFbQj61Nmn5BnCuG/yZ6FQo7WgE5
   faA6Hg3HNie1f5Ypf2GkvUSIaeiAHMVTlLuZPWD7I8BuGV4us11eVZxzn
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246291769"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="246291769"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 07:53:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="519988332"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Jan 2022 07:53:53 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nC1fF-000IZD-6n; Mon, 24 Jan 2022 15:53:53 +0000
Date:   Mon, 24 Jan 2022 23:53:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 eef2ad404a65c05b866d27003851bced9f95c47c
Message-ID: <61eecb7f.uEOnRuuXcozrkhO/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: eef2ad404a65c05b866d27003851bced9f95c47c  hwmon: (nct6775) Fix crash in clear_caseopen

elapsed time: 725m

configs tested: 142
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
arc                 nsimosci_hs_smp_defconfig
arm                       imx_v6_v7_defconfig
i386                                defconfig
xtensa                       common_defconfig
m68k                          multi_defconfig
sh                          landisk_defconfig
sh                          r7780mp_defconfig
parisc                              defconfig
powerpc                       eiger_defconfig
arm                         cm_x300_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc837x_mds_defconfig
sh                          rsk7269_defconfig
arm                         vf610m4_defconfig
sh                            shmin_defconfig
sparc                       sparc32_defconfig
h8300                       h8s-sim_defconfig
alpha                               defconfig
ia64                            zx1_defconfig
xtensa                              defconfig
h8300                               defconfig
arm                        oxnas_v6_defconfig
openrisc                    or1ksim_defconfig
openrisc                            defconfig
xtensa                           allyesconfig
mips                     loongson1b_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
sh                           se7780_defconfig
sh                           se7705_defconfig
sh                          rsk7201_defconfig
sh                         ap325rxa_defconfig
arc                         haps_hs_defconfig
powerpc                     mpc83xx_defconfig
h8300                            alldefconfig
powerpc                     tqm8541_defconfig
sh                          sdk7780_defconfig
mips                            gpr_defconfig
microblaze                      mmu_defconfig
mips                         cobalt_defconfig
arc                     haps_hs_smp_defconfig
parisc                generic-32bit_defconfig
arm                  randconfig-c002-20220123
arm                  randconfig-c002-20220124
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
alpha                            allyesconfig
nios2                            allyesconfig
csky                                defconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
s390                 randconfig-c005-20220124
arm                                 defconfig
arm                     am200epdkit_defconfig
mips                          ath79_defconfig
arm                          moxart_defconfig
powerpc                 mpc8560_ads_defconfig
mips                     loongson2k_defconfig
arm                             mxs_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                         tb0287_defconfig
arm                        vexpress_defconfig
mips                            e55_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220123
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220123

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
