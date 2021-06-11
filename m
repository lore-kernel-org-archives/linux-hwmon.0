Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5BEC4743D
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Jun 2021 03:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E81D61285
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Jun 2021 03:59:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhFKEBp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Jun 2021 00:01:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:64038 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhFKEBo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Jun 2021 00:01:44 -0400
IronPort-SDR: noLN61KD3q4HdaF43KVuCbxRJRMsm+w6ytSW3wdvBN5+1YMwy46BpHVrlTK4z06y5b0bvX+sHs
 QIe3Q5/Pcp/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="269304442"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="269304442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:59:46 -0700
IronPort-SDR: q0tNTVsQWZUZ5fZPAg4xFJc+dJQEbCY7wRqXG2r7X/uDbEn15S4IXeyns+so3m3beVnG/ZfUqb
 wsRIszwSZzFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="419953237"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2021 20:59:44 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrYKe-0000RA-CM; Fri, 11 Jun 2021 03:59:44 +0000
Date:   Fri, 11 Jun 2021 11:59:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 e13d1127241404f1c3eb1379ac4dd100eaf385b4
Message-ID: <60c2dfa0.5Pwom7OVxmIkEJ7w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e13d1127241404f1c3eb1379ac4dd100eaf385b4  hwmon: (tps23861) correct shunt LSB values

elapsed time: 726m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
arm                        mini2440_defconfig
arm                        keystone_defconfig
sh                          sdk7780_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         vf610m4_defconfig
powerpc                          allmodconfig
m68k                           sun3_defconfig
mips                        nlm_xlp_defconfig
arm                  colibri_pxa300_defconfig
arm                         bcm2835_defconfig
arm                      tct_hammer_defconfig
csky                             alldefconfig
sparc                       sparc32_defconfig
sh                              ul2_defconfig
sh                          rsk7264_defconfig
ia64                        generic_defconfig
arm                           viper_defconfig
powerpc                 mpc836x_mds_defconfig
arm                        clps711x_defconfig
sparc                            alldefconfig
sh                   sh7770_generic_defconfig
arm                          pxa910_defconfig
sh                          lboxre2_defconfig
arm                        shmobile_defconfig
arc                         haps_hs_defconfig
powerpc                         wii_defconfig
mips                        vocore2_defconfig
sh                          polaris_defconfig
m68k                          sun3x_defconfig
arm                      footbridge_defconfig
arm                   milbeaut_m10v_defconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc64_defconfig
mips                         mpc30x_defconfig
h8300                            alldefconfig
sh                           se7721_defconfig
h8300                     edosk2674_defconfig
arm                         at91_dt_defconfig
sh                               alldefconfig
powerpc                 mpc8272_ads_defconfig
h8300                               defconfig
sh                           se7619_defconfig
sh                         ap325rxa_defconfig
powerpc                     asp8347_defconfig
xtensa                          iss_defconfig
arm                        oxnas_v6_defconfig
powerpc                    ge_imp3a_defconfig
sh                          urquell_defconfig
arm                          gemini_defconfig
parisc                           alldefconfig
mips                            gpr_defconfig
mips                         db1xxx_defconfig
sh                               j2_defconfig
powerpc                      pmac32_defconfig
mips                         rt305x_defconfig
powerpc                      tqm8xx_defconfig
nios2                         3c120_defconfig
microblaze                      mmu_defconfig
ia64                             allmodconfig
powerpc                    mvme5100_defconfig
arm                        magician_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                          pxa168_defconfig
mips                     loongson2k_defconfig
powerpc64                           defconfig
m68k                        mvme16x_defconfig
mips                       bmips_be_defconfig
arm                            mps2_defconfig
x86_64                            allnoconfig
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
powerpc                           allnoconfig
i386                 randconfig-a002-20210610
i386                 randconfig-a006-20210610
i386                 randconfig-a004-20210610
i386                 randconfig-a001-20210610
i386                 randconfig-a005-20210610
i386                 randconfig-a003-20210610
x86_64               randconfig-a015-20210610
x86_64               randconfig-a011-20210610
x86_64               randconfig-a012-20210610
x86_64               randconfig-a014-20210610
x86_64               randconfig-a016-20210610
x86_64               randconfig-a013-20210610
i386                 randconfig-a015-20210610
i386                 randconfig-a013-20210610
i386                 randconfig-a016-20210610
i386                 randconfig-a014-20210610
i386                 randconfig-a012-20210610
i386                 randconfig-a011-20210610
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210610
x86_64               randconfig-a001-20210610
x86_64               randconfig-a004-20210610
x86_64               randconfig-a003-20210610
x86_64               randconfig-a006-20210610
x86_64               randconfig-a005-20210610

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
