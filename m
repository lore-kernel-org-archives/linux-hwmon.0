Return-Path: <SRS0=xFUD=EK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FF2C4741F
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Nov 2020 17:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B27C820759
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Nov 2020 17:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgKDR1L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Nov 2020 12:27:11 -0500
Received: from mga09.intel.com ([134.134.136.24]:20271 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726849AbgKDR1L (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 4 Nov 2020 12:27:11 -0500
IronPort-SDR: aEsMGXo70q1ouZt4NHQM1i+iHgUSI7OTjA+2l3di2w7yA4uk6mXq8f3L9tMK+ATA1eq3rLZNXP
 JlwHSOHPGKIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="169400351"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="169400351"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 09:27:00 -0800
IronPort-SDR: MXq5QCEhcyDB1/VQJT9e/wFQZsLOHO/m3IO9D3ntjpqc32daVITEvMPdci9ovFWYqNd/s6iIXG
 20smoaiXr7Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; 
   d="scan'208";a="306492220"
Received: from lkp-server02.sh.intel.com (HELO e61783667810) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Nov 2020 09:26:58 -0800
Received: from kbuild by e61783667810 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kaMYk-00011m-2d; Wed, 04 Nov 2020 17:26:58 +0000
Date:   Thu, 05 Nov 2020 01:26:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 ce15cd2cee8bd802c47ec37bf93e640d594ede71
Message-ID: <5fa2e43e.eBhNN1EkEcdyJEW/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: ce15cd2cee8bd802c47ec37bf93e640d594ede71  hwmon: add Corsair PSU HID controller driver

elapsed time: 723m

configs tested: 163
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
m68k                       bvme6000_defconfig
m68k                           sun3_defconfig
h8300                               defconfig
arm                        shmobile_defconfig
sh                           se7751_defconfig
arm                        vexpress_defconfig
mips                          ath25_defconfig
arm                            u300_defconfig
sh                           se7705_defconfig
mips                           ip28_defconfig
m68k                       m5208evb_defconfig
sh                           se7712_defconfig
arm                        multi_v7_defconfig
sh                          rsk7269_defconfig
sh                   secureedge5410_defconfig
mips                        maltaup_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
powerpc                   motionpro_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
arm                            mmp2_defconfig
mips                      pistachio_defconfig
ia64                            zx1_defconfig
mips                        vocore2_defconfig
mips                           ip22_defconfig
s390                       zfcpdump_defconfig
powerpc                 mpc834x_itx_defconfig
ia64                                defconfig
m68k                       m5249evb_defconfig
arm                          pxa910_defconfig
openrisc                            defconfig
mips                         tb0226_defconfig
xtensa                              defconfig
mips                      malta_kvm_defconfig
sh                ecovec24-romimage_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
sh                           se7722_defconfig
riscv                            allyesconfig
powerpc                      katmai_defconfig
sh                            hp6xx_defconfig
microblaze                      mmu_defconfig
mips                           xway_defconfig
c6x                         dsk6455_defconfig
arm                          lpd270_defconfig
powerpc                        icon_defconfig
powerpc                      cm5200_defconfig
arc                            hsdk_defconfig
mips                        jmr3927_defconfig
powerpc                      ppc6xx_defconfig
arm                      integrator_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      tqm8xx_defconfig
mips                     cu1000-neo_defconfig
arm                          exynos_defconfig
mips                          ath79_defconfig
powerpc                    sam440ep_defconfig
sh                          landisk_defconfig
m68k                          amiga_defconfig
powerpc                 canyonlands_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8555_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
m68k                          hp300_defconfig
openrisc                         alldefconfig
mips                          malta_defconfig
powerpc                  storcenter_defconfig
arc                          axs103_defconfig
riscv                    nommu_virt_defconfig
sh                     sh7710voipgw_defconfig
arm                         orion5x_defconfig
mips                         rt305x_defconfig
s390                          debug_defconfig
arm                           stm32_defconfig
sh                           se7780_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                         wii_defconfig
powerpc                       eiger_defconfig
arm                              alldefconfig
arm                            zeus_defconfig
powerpc                     rainier_defconfig
arm                       cns3420vb_defconfig
powerpc                        fsp2_defconfig
ia64                             alldefconfig
mips                      maltaaprp_defconfig
arm                     am200epdkit_defconfig
xtensa                          iss_defconfig
arm                           viper_defconfig
arm                           sunxi_defconfig
ia64                             allmodconfig
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
i386                 randconfig-a004-20201104
i386                 randconfig-a006-20201104
i386                 randconfig-a005-20201104
i386                 randconfig-a001-20201104
i386                 randconfig-a002-20201104
i386                 randconfig-a003-20201104
x86_64               randconfig-a012-20201104
x86_64               randconfig-a015-20201104
x86_64               randconfig-a013-20201104
x86_64               randconfig-a011-20201104
x86_64               randconfig-a014-20201104
x86_64               randconfig-a016-20201104
i386                 randconfig-a015-20201104
i386                 randconfig-a013-20201104
i386                 randconfig-a014-20201104
i386                 randconfig-a016-20201104
i386                 randconfig-a011-20201104
i386                 randconfig-a012-20201104
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201104
x86_64               randconfig-a003-20201104
x86_64               randconfig-a005-20201104
x86_64               randconfig-a002-20201104
x86_64               randconfig-a006-20201104
x86_64               randconfig-a001-20201104

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
