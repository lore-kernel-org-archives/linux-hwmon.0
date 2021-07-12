Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCD7C11F66
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 11:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34289610FA
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Jul 2021 11:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhGLMB4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Jul 2021 08:01:56 -0400
Received: from mga03.intel.com ([134.134.136.65]:40624 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231326AbhGLMBz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Jul 2021 08:01:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="210007234"
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="210007234"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 04:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,232,1620716400"; 
   d="scan'208";a="652924401"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jul 2021 04:59:05 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1m2uaX-000H0G-1z; Mon, 12 Jul 2021 11:59:05 +0000
Date:   Mon, 12 Jul 2021 19:58:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 00962bee9671c7bafb3d8c52c5b30a90449e33ba
Message-ID: <60ec2e6a.wG6Xy9w15bNNj7dY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 00962bee9671c7bafb3d8c52c5b30a90449e33ba  watchdog: bcm2835_wdt: consider system-power-controller property

elapsed time: 725m

configs tested: 116
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
sh                           se7206_defconfig
mips                      bmips_stb_defconfig
powerpc                         wii_defconfig
arm                         assabet_defconfig
mips                        vocore2_defconfig
nios2                               defconfig
powerpc                 mpc8313_rdb_defconfig
xtensa                          iss_defconfig
sh                           se7343_defconfig
powerpc                     akebono_defconfig
ia64                                defconfig
m68k                        mvme16x_defconfig
mips                    maltaup_xpa_defconfig
sh                   sh7724_generic_defconfig
nios2                         10m50_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme147_defconfig
powerpc                      pmac32_defconfig
powerpc                     powernv_defconfig
powerpc                     ep8248e_defconfig
powerpc                      arches_defconfig
powerpc                      cm5200_defconfig
x86_64                            allnoconfig
xtensa                  cadence_csp_defconfig
m68k                       m5208evb_defconfig
powerpc                      walnut_defconfig
sh                   sh7770_generic_defconfig
csky                                defconfig
arm                           viper_defconfig
sh                     magicpanelr2_defconfig
m68k                            q40_defconfig
sh                               j2_defconfig
arm                        realview_defconfig
xtensa                           allyesconfig
powerpc                 mpc836x_rdk_defconfig
openrisc                            defconfig
xtensa                  audio_kc705_defconfig
mips                          rb532_defconfig
powerpc                     kilauea_defconfig
powerpc                        fsp2_defconfig
arm                             rpc_defconfig
mips                           ip32_defconfig
m68k                          multi_defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
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
arc                              allyesconfig
nds32                             allnoconfig
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
x86_64               randconfig-a005-20210712
x86_64               randconfig-a004-20210712
x86_64               randconfig-a003-20210712
x86_64               randconfig-a002-20210712
x86_64               randconfig-a006-20210712
x86_64               randconfig-a001-20210712
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
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210712

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
