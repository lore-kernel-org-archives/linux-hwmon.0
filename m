Return-Path: <SRS0=O8W0=CC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FD2C433E1
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Aug 2020 19:06:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98ED82074D
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Aug 2020 19:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgHXTGe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Aug 2020 15:06:34 -0400
Received: from mga04.intel.com ([192.55.52.120]:57300 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgHXTGd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Aug 2020 15:06:33 -0400
IronPort-SDR: p94QifUHNUMWrZ9Q6FQrgr0m7waPe3VT1FXuHCzFeY6KkP6new3KYz+xvHopweIiU9HCV0rnqQ
 dFLjkriSzgsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="153386380"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="scan'208";a="153386380"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 12:06:32 -0700
IronPort-SDR: CbnTWqu4gPuxBXMnxtcNhkag0c7Cb4p8XKT2JKphXnzO8p4l3UvcDYYnpLFlou7XYsRokHdoFZ
 UqtHSazOVshQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="scan'208";a="338539624"
Received: from lkp-server01.sh.intel.com (HELO c420d4f0765f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2020 12:06:29 -0700
Received: from kbuild by c420d4f0765f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAHnZ-0000Ml-5P; Mon, 24 Aug 2020 19:06:29 +0000
Date:   Tue, 25 Aug 2020 03:05:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 314119a5380374a2a1c1edbc7e0a055ee1e3f2fb
Message-ID: <5f440f86.zo7Z/k4exvhFw4iH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 314119a5380374a2a1c1edbc7e0a055ee1e3f2fb  dt-bindings: hwmon: Add bindings for ADM1266

elapsed time: 722m

configs tested: 122
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
nios2                         10m50_defconfig
m68k                        m5407c3_defconfig
powerpc                          g5_defconfig
arm                    vt8500_v6_v7_defconfig
sh                           se7206_defconfig
arm                       imx_v6_v7_defconfig
ia64                            zx1_defconfig
m68k                                defconfig
sh                     magicpanelr2_defconfig
mips                           jazz_defconfig
c6x                         dsk6455_defconfig
arm                         lpc32xx_defconfig
arm                      integrator_defconfig
arm                           sunxi_defconfig
xtensa                         virt_defconfig
powerpc                      mgcoge_defconfig
ia64                          tiger_defconfig
sh                        dreamcast_defconfig
xtensa                           alldefconfig
mips                     loongson1b_defconfig
m68k                             allmodconfig
arm                         mv78xx0_defconfig
sh                          landisk_defconfig
powerpc                     ep8248e_defconfig
mips                       rbtx49xx_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
sh                          polaris_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     mpc83xx_defconfig
mips                      loongson3_defconfig
arm                            zeus_defconfig
arm                              zx_defconfig
arc                              alldefconfig
arm                          badge4_defconfig
h8300                     edosk2674_defconfig
mips                            ar7_defconfig
c6x                        evmc6472_defconfig
c6x                        evmc6474_defconfig
sh                          sdk7780_defconfig
sh                          r7785rp_defconfig
arm                             rpc_defconfig
h8300                    h8300h-sim_defconfig
powerpc                         ps3_defconfig
riscv                    nommu_k210_defconfig
sparc                               defconfig
arc                        nsimosci_defconfig
sh                           se7721_defconfig
m68k                            q40_defconfig
arm                           stm32_defconfig
x86_64                           alldefconfig
sparc                       sparc64_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a002-20200823
i386                 randconfig-a004-20200823
i386                 randconfig-a003-20200823
i386                 randconfig-a005-20200823
i386                 randconfig-a006-20200823
i386                 randconfig-a001-20200823
i386                 randconfig-a002-20200824
i386                 randconfig-a004-20200824
i386                 randconfig-a005-20200824
i386                 randconfig-a003-20200824
i386                 randconfig-a006-20200824
i386                 randconfig-a001-20200824
x86_64               randconfig-a015-20200824
x86_64               randconfig-a016-20200824
x86_64               randconfig-a012-20200824
x86_64               randconfig-a014-20200824
x86_64               randconfig-a011-20200824
x86_64               randconfig-a013-20200824
i386                 randconfig-a013-20200824
i386                 randconfig-a012-20200824
i386                 randconfig-a011-20200824
i386                 randconfig-a016-20200824
i386                 randconfig-a015-20200824
i386                 randconfig-a014-20200824
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
