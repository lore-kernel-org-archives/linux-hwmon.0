Return-Path: <SRS0=rlEW=DI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C9CC4727C
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Oct 2020 08:54:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2F20208B6
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Oct 2020 08:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730902AbgJAIyk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Oct 2020 04:54:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:32211 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730378AbgJAIyk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 1 Oct 2020 04:54:40 -0400
IronPort-SDR: xo1p9I0zkGm9agyZQq/GqAS7PmyfIA7Yybool53R/Skr52gSSdRBi1UXNDLgB6PHZJKOO/PhwL
 h2RChVCbraCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="163532040"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="163532040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 01:54:39 -0700
IronPort-SDR: rtnzp0ckK+2NkDqyqsA/Ekp7xUyePskoFqoTxta+f6NcO9cMy6wN+3i37AQRwLyDikLNZYgMT4
 YCMHTPVxZjzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="339464171"
Received: from lkp-server02.sh.intel.com (HELO de448af6ea1b) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2020 01:54:37 -0700
Received: from kbuild by de448af6ea1b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNuMH-0000ZV-Aa; Thu, 01 Oct 2020 08:54:37 +0000
Date:   Thu, 01 Oct 2020 16:53:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 ba1a48575989dbba2782fad861c51d586dc20eb6
Message-ID: <5f75991e.xniuEPkoaf2T6vU5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: ba1a48575989dbba2782fad861c51d586dc20eb6  dt-bindings: Add MP2975 voltage regulator device

elapsed time: 721m

configs tested: 153
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                            allyesconfig
arm                         shannon_defconfig
arm                  colibri_pxa300_defconfig
mips                          ath25_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 linkstation_defconfig
c6x                         dsk6455_defconfig
powerpc64                        alldefconfig
m68k                             allmodconfig
powerpc                 canyonlands_defconfig
mips                          ath79_defconfig
alpha                               defconfig
c6x                        evmc6457_defconfig
powerpc                     asp8347_defconfig
arm                         mv78xx0_defconfig
arm                           tegra_defconfig
sh                           se7619_defconfig
mips                        bcm63xx_defconfig
nds32                            alldefconfig
nios2                         10m50_defconfig
powerpc                     rainier_defconfig
xtensa                       common_defconfig
sh                           sh2007_defconfig
powerpc                  iss476-smp_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          simpad_defconfig
microblaze                    nommu_defconfig
sparc                            allyesconfig
arm                          pcm027_defconfig
sh                              ul2_defconfig
arm                        oxnas_v6_defconfig
powerpc                   motionpro_defconfig
arm                          gemini_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                           alldefconfig
arm                         nhk8815_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
m68k                             allyesconfig
powerpc                    mvme5100_defconfig
arc                            hsdk_defconfig
m68k                           sun3_defconfig
arm                          pxa910_defconfig
sh                     magicpanelr2_defconfig
powerpc                    sam440ep_defconfig
sh                          sdk7786_defconfig
xtensa                          iss_defconfig
powerpc                      ppc44x_defconfig
sh                           se7750_defconfig
m68k                            q40_defconfig
arm                        multi_v5_defconfig
arm                          lpd270_defconfig
arm                        trizeps4_defconfig
powerpc                      chrp32_defconfig
arm                           stm32_defconfig
x86_64                              defconfig
mips                      loongson3_defconfig
powerpc                      makalu_defconfig
arm                       imx_v6_v7_defconfig
arc                    vdk_hs38_smp_defconfig
mips                        bcm47xx_defconfig
arm                             pxa_defconfig
mips                           ip28_defconfig
arm                         hackkit_defconfig
sh                          rsk7269_defconfig
m68k                         apollo_defconfig
arm                              zx_defconfig
sh                           se7343_defconfig
arm                            dove_defconfig
mips                        nlm_xlr_defconfig
mips                        jmr3927_defconfig
powerpc                      katmai_defconfig
powerpc                           allnoconfig
sh                          rsk7203_defconfig
sh                   sh7724_generic_defconfig
sh                             espt_defconfig
csky                                defconfig
arm                          iop32x_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
arm                         palmz72_defconfig
c6x                        evmc6474_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a003-20200930
i386                 randconfig-a002-20200930
i386                 randconfig-a006-20200930
i386                 randconfig-a005-20200930
i386                 randconfig-a004-20200930
i386                 randconfig-a001-20200930
x86_64               randconfig-a015-20200930
x86_64               randconfig-a013-20200930
x86_64               randconfig-a012-20200930
x86_64               randconfig-a016-20200930
x86_64               randconfig-a014-20200930
x86_64               randconfig-a011-20200930
i386                 randconfig-a011-20200930
i386                 randconfig-a015-20200930
i386                 randconfig-a012-20200930
i386                 randconfig-a014-20200930
i386                 randconfig-a016-20200930
i386                 randconfig-a013-20200930
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a001-20200930
x86_64               randconfig-a005-20200930
x86_64               randconfig-a003-20200930
x86_64               randconfig-a004-20200930
x86_64               randconfig-a002-20200930
x86_64               randconfig-a006-20200930

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
