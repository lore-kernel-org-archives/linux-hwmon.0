Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4097AC43211
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Dec 2020 13:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6DFA20769
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Dec 2020 13:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730732AbgLCN5J (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Dec 2020 08:57:09 -0500
Received: from mga09.intel.com ([134.134.136.24]:30763 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727065AbgLCN5I (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Dec 2020 08:57:08 -0500
IronPort-SDR: yoNyftQJZIgUqmoThD32STKa7sHqBT5j4jgvpQ3XPyjcQpU+61S3NIf3UmF7JgXJcJzj+BrMq1
 N91bQeuOYExg==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="173353654"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="173353654"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2020 05:56:27 -0800
IronPort-SDR: AlAQThro07KoW+vb8PtIX+lnfKBIC24Yf/3EGMmIruFUeMiGXkort6ywwvagGyfOPvoeUgSvxW
 xzMPmCojtSMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; 
   d="scan'208";a="335961198"
Received: from lkp-server01.sh.intel.com (HELO c4fb854e61c6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Dec 2020 05:56:26 -0800
Received: from kbuild by c4fb854e61c6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kkp5t-0000GB-J2; Thu, 03 Dec 2020 13:56:25 +0000
Date:   Thu, 03 Dec 2020 21:55:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 9b08a57ac1303d569e54af0fc0644bc590dd1c87
Message-ID: <5fc8ee58.wYtlzvzay8xHt1pq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 9b08a57ac1303d569e54af0fc0644bc590dd1c87  hwmon:Driver for Delta power supplies Q54SJ108A2

elapsed time: 724m

configs tested: 166
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                   motionpro_defconfig
mips                     cu1830-neo_defconfig
sh                        sh7763rdp_defconfig
powerpc                   lite5200b_defconfig
powerpc                     sbc8548_defconfig
arm                      footbridge_defconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
powerpc                     pseries_defconfig
sparc                       sparc64_defconfig
mips                           ip22_defconfig
m68k                          multi_defconfig
mips                           mtx1_defconfig
m68k                          sun3x_defconfig
arm                         s5pv210_defconfig
ia64                             alldefconfig
arm                         nhk8815_defconfig
powerpc                    adder875_defconfig
powerpc                     powernv_defconfig
powerpc                     ep8248e_defconfig
mips                         tb0226_defconfig
arc                        nsimosci_defconfig
mips                  maltasmvp_eva_defconfig
openrisc                            defconfig
parisc                generic-32bit_defconfig
h8300                               defconfig
arm                         orion5x_defconfig
powerpc                           allnoconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      chrp32_defconfig
powerpc                      cm5200_defconfig
x86_64                              defconfig
h8300                     edosk2674_defconfig
mips                        bcm47xx_defconfig
sh                              ul2_defconfig
arm                        oxnas_v6_defconfig
mips                        nlm_xlp_defconfig
powerpc                    socrates_defconfig
m68k                          atari_defconfig
powerpc                   currituck_defconfig
arm                          badge4_defconfig
mips                           ci20_defconfig
powerpc                          g5_defconfig
powerpc                         wii_defconfig
microblaze                      mmu_defconfig
um                            kunit_defconfig
nios2                            alldefconfig
sh                           se7724_defconfig
sparc64                             defconfig
sparc                       sparc32_defconfig
sh                           se7343_defconfig
arm                          pxa3xx_defconfig
arm                              zx_defconfig
s390                             alldefconfig
arm                           sunxi_defconfig
arm                       omap2plus_defconfig
arc                     haps_hs_smp_defconfig
arm                            lart_defconfig
riscv                    nommu_virt_defconfig
powerpc                    gamecube_defconfig
arm                     davinci_all_defconfig
s390                          debug_defconfig
powerpc                          allyesconfig
powerpc                     tqm8555_defconfig
arm                       multi_v4t_defconfig
powerpc                     ppa8548_defconfig
m68k                        m5307c3_defconfig
mips                         db1xxx_defconfig
arm                         lpc32xx_defconfig
mips                            e55_defconfig
arm                        neponset_defconfig
parisc                           allyesconfig
arm                           corgi_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                       m5208evb_defconfig
ia64                        generic_defconfig
mips                       capcella_defconfig
mips                      loongson3_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
i386                 randconfig-a004-20201203
i386                 randconfig-a005-20201203
i386                 randconfig-a001-20201203
i386                 randconfig-a002-20201203
i386                 randconfig-a006-20201203
i386                 randconfig-a003-20201203
i386                 randconfig-a004-20201202
i386                 randconfig-a005-20201202
i386                 randconfig-a001-20201202
i386                 randconfig-a002-20201202
i386                 randconfig-a006-20201202
i386                 randconfig-a003-20201202
x86_64               randconfig-a016-20201203
x86_64               randconfig-a012-20201203
x86_64               randconfig-a014-20201203
x86_64               randconfig-a013-20201203
x86_64               randconfig-a015-20201203
x86_64               randconfig-a011-20201203
i386                 randconfig-a014-20201203
i386                 randconfig-a013-20201203
i386                 randconfig-a011-20201203
i386                 randconfig-a015-20201203
i386                 randconfig-a012-20201203
i386                 randconfig-a016-20201203
i386                 randconfig-a014-20201202
i386                 randconfig-a013-20201202
i386                 randconfig-a011-20201202
i386                 randconfig-a015-20201202
i386                 randconfig-a012-20201202
i386                 randconfig-a016-20201202
x86_64               randconfig-a004-20201202
x86_64               randconfig-a006-20201202
x86_64               randconfig-a001-20201202
x86_64               randconfig-a002-20201202
x86_64               randconfig-a005-20201202
x86_64               randconfig-a003-20201202
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201203
x86_64               randconfig-a006-20201203
x86_64               randconfig-a001-20201203
x86_64               randconfig-a002-20201203
x86_64               randconfig-a005-20201203
x86_64               randconfig-a003-20201203

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
