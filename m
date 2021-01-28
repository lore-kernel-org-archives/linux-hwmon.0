Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C65AC433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jan 2021 15:24:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB3E264DF5
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jan 2021 15:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbhA1PYZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Jan 2021 10:24:25 -0500
Received: from mga05.intel.com ([192.55.52.43]:5869 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231875AbhA1PXG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Jan 2021 10:23:06 -0500
IronPort-SDR: ylLASE0BLs+TXHpteldOChz5BRMTfDmwTqtzbw4Ki10ud2dBVRryuX3UhEWopfX+ZFbS+fRtMP
 wFkECBZUH3MQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="265082286"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="265082286"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 07:22:15 -0800
IronPort-SDR: t1lqtcdWol5FfGCIcvjfm2DC5nFI2OgpdlakzqsnIINI/jZDsswu7qANoRMmR1Hfnbhnji6Ha/
 SSZeAnB3FE0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="369888856"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 07:22:14 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l597d-0002zo-HC; Thu, 28 Jan 2021 15:22:13 +0000
Date:   Thu, 28 Jan 2021 23:21:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 dd52b01be3a58c3df3a8a7bb41574fb79c802ee0
Message-ID: <6012d688.uWbWkc41dWM5UWFd%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: dd52b01be3a58c3df3a8a7bb41574fb79c802ee0  hwmon: (pmbus/max16601) Add support for MAX16508

elapsed time: 725m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      mgcoge_defconfig
powerpc                          g5_defconfig
powerpc                         ps3_defconfig
nds32                            alldefconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
sh                            titan_defconfig
arm                     eseries_pxa_defconfig
xtensa                    xip_kc705_defconfig
mips                            gpr_defconfig
arm                          pxa910_defconfig
arm                         lpc18xx_defconfig
sh                         microdev_defconfig
mips                         mpc30x_defconfig
arc                     nsimosci_hs_defconfig
c6x                        evmc6474_defconfig
riscv                               defconfig
mips                           ip28_defconfig
alpha                            alldefconfig
powerpc                    gamecube_defconfig
sparc                       sparc32_defconfig
mips                         tb0226_defconfig
mips                      pic32mzda_defconfig
powerpc                     pseries_defconfig
arm                          ep93xx_defconfig
openrisc                    or1ksim_defconfig
nios2                            allyesconfig
sh                         apsh4a3a_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
m68k                       m5275evb_defconfig
powerpc                      ppc44x_defconfig
m68k                        m5407c3_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                  colibri_pxa270_defconfig
arm                       multi_v4t_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
arc                           tb10x_defconfig
m68k                        mvme147_defconfig
m68k                        m5272c3_defconfig
arm                       aspeed_g4_defconfig
c6x                        evmc6678_defconfig
mips                          malta_defconfig
xtensa                generic_kc705_defconfig
sh                          rsk7269_defconfig
mips                            ar7_defconfig
nios2                               defconfig
riscv                             allnoconfig
sh                          sdk7780_defconfig
mips                      malta_kvm_defconfig
sh                   secureedge5410_defconfig
arc                              alldefconfig
mips                   sb1250_swarm_defconfig
openrisc                            defconfig
ia64                        generic_defconfig
openrisc                 simple_smp_defconfig
mips                  cavium_octeon_defconfig
sparc                            allyesconfig
powerpc                  storcenter_defconfig
x86_64                              defconfig
powerpc                    sam440ep_defconfig
arm                           tegra_defconfig
mips                          ath79_defconfig
m68k                        mvme16x_defconfig
arc                         haps_hs_defconfig
sparc64                          alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210128
i386                 randconfig-a002-20210128
i386                 randconfig-a004-20210128
i386                 randconfig-a005-20210128
i386                 randconfig-a003-20210128
i386                 randconfig-a006-20210128
x86_64               randconfig-a012-20210128
x86_64               randconfig-a015-20210128
x86_64               randconfig-a016-20210128
x86_64               randconfig-a011-20210128
x86_64               randconfig-a013-20210128
x86_64               randconfig-a014-20210128
i386                 randconfig-a013-20210128
i386                 randconfig-a011-20210128
i386                 randconfig-a012-20210128
i386                 randconfig-a016-20210128
i386                 randconfig-a014-20210128
i386                 randconfig-a015-20210128
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210128
x86_64               randconfig-a003-20210128
x86_64               randconfig-a001-20210128
x86_64               randconfig-a005-20210128
x86_64               randconfig-a006-20210128
x86_64               randconfig-a004-20210128

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
