Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9872C07E99
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 14:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C724F61167
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 14:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbhGLO5X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Jul 2021 10:57:23 -0400
Received: from mga14.intel.com ([192.55.52.115]:63695 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235268AbhGLO5X (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jul 2021 10:57:23 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="209809841"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="209809841"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 07:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="629688553"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2021 07:54:32 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m2xKK-000H66-20; Mon, 12 Jul 2021 14:54:32 +0000
Date:   Mon, 12 Jul 2021 22:54:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 3352a33e7f9c9b41e7f19b7386ce6e1cb2b7d77d
Message-ID: <60ec5799.Tn+4ColP0K8oZJFE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 3352a33e7f9c9b41e7f19b7386ce6e1cb2b7d77d  hwmon: (w83627ehf) Remove w83627ehf_remove()

elapsed time: 720m

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
mips                     cu1830-neo_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc40x_defconfig
ia64                             alldefconfig
s390                                defconfig
xtensa                  nommu_kc705_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                      malta_kvm_defconfig
mips                           jazz_defconfig
ia64                          tiger_defconfig
mips                        qi_lb60_defconfig
powerpc                    ge_imp3a_defconfig
sh                          polaris_defconfig
sparc                            alldefconfig
i386                                defconfig
arm                  colibri_pxa270_defconfig
sh                   sh7724_generic_defconfig
nios2                         10m50_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme147_defconfig
powerpc                      pmac32_defconfig
arm                        clps711x_defconfig
powerpc                    klondike_defconfig
arm                           omap1_defconfig
arm                           spitz_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     powernv_defconfig
powerpc                     ep8248e_defconfig
powerpc                      arches_defconfig
powerpc                      cm5200_defconfig
x86_64                            allnoconfig
xtensa                  cadence_csp_defconfig
m68k                       m5208evb_defconfig
powerpc                      walnut_defconfig
sh                   sh7770_generic_defconfig
arm                           viper_defconfig
sh                     magicpanelr2_defconfig
m68k                            q40_defconfig
sh                               j2_defconfig
arm                        realview_defconfig
i386                             alldefconfig
powerpc                 mpc8540_ads_defconfig
m68k                         apollo_defconfig
arm                          pcm027_defconfig
csky                                defconfig
openrisc                  or1klitex_defconfig
mips                        nlm_xlr_defconfig
arm                        spear3xx_defconfig
powerpc                        fsp2_defconfig
arm                             rpc_defconfig
mips                          rb532_defconfig
mips                           ip32_defconfig
m68k                          multi_defconfig
arm                          gemini_defconfig
sparc                               defconfig
sh                             espt_defconfig
um                                  defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210712
i386                 randconfig-a004-20210712
i386                 randconfig-a006-20210712
i386                 randconfig-a001-20210712
i386                 randconfig-a002-20210712
i386                 randconfig-a003-20210712
x86_64               randconfig-a013-20210711
x86_64               randconfig-a012-20210711
x86_64               randconfig-a015-20210711
x86_64               randconfig-a014-20210711
x86_64               randconfig-a016-20210711
x86_64               randconfig-a011-20210711
i386                 randconfig-a015-20210712
i386                 randconfig-a014-20210712
i386                 randconfig-a011-20210712
i386                 randconfig-a013-20210712
i386                 randconfig-a012-20210712
i386                 randconfig-a016-20210712
x86_64               randconfig-a005-20210712
x86_64               randconfig-a004-20210712
x86_64               randconfig-a003-20210712
x86_64               randconfig-a002-20210712
x86_64               randconfig-a006-20210712
x86_64               randconfig-a001-20210712
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-b001-20210712
x86_64               randconfig-a005-20210711
x86_64               randconfig-a004-20210711
x86_64               randconfig-a002-20210711
x86_64               randconfig-a003-20210711
x86_64               randconfig-a006-20210711
x86_64               randconfig-a001-20210711
x86_64               randconfig-a013-20210712
x86_64               randconfig-a014-20210712
x86_64               randconfig-a015-20210712
x86_64               randconfig-a012-20210712
x86_64               randconfig-a016-20210712
x86_64               randconfig-a011-20210712

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
