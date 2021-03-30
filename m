Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B851C433C1
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 22:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B131619BC
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 22:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhC3Wyd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Mar 2021 18:54:33 -0400
Received: from mga05.intel.com ([192.55.52.43]:9696 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232825AbhC3WyU (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Mar 2021 18:54:20 -0400
IronPort-SDR: Z2tPICKMFTMA/UtW85gJAsPppazmpkR1d3pxyifPfKoT9qqmXXW4WJvOBm1f4q4abUnOqP+a7m
 J0QMR4WLtoCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="277049626"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="277049626"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2021 15:54:19 -0700
IronPort-SDR: JwzfBbAgiG96Idp9+79YrHjn0uLIwVcFiWeZOZAdMRR8YRyac7Fhq2q42qMt8P7DqZZ6UnQlIG
 w8IFkSh7n7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; 
   d="scan'208";a="377015914"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Mar 2021 15:54:18 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lRNFZ-0005Vn-8Y; Tue, 30 Mar 2021 22:54:17 +0000
Date:   Wed, 31 Mar 2021 06:53:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 02bb6badc9fb03056eb405e189efa62b1825782b
Message-ID: <6063abec.R+/QulgCNLusOMCV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 02bb6badc9fb03056eb405e189efa62b1825782b  hwmon: (mlxreg-fan) Add support for fan drawers capability and present registers

elapsed time: 725m

configs tested: 156
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                       imx_v4_v5_defconfig
sh                          r7780mp_defconfig
arm                       imx_v6_v7_defconfig
sh                              ul2_defconfig
microblaze                      mmu_defconfig
mips                          ath25_defconfig
m68k                        m5272c3_defconfig
mips                         db1xxx_defconfig
arm                        cerfcube_defconfig
arm                           tegra_defconfig
arm                        neponset_defconfig
mips                  cavium_octeon_defconfig
m68k                       m5249evb_defconfig
arm                        mini2440_defconfig
arm                         s3c2410_defconfig
mips                        vocore2_defconfig
sh                        edosk7705_defconfig
sh                          urquell_defconfig
arm                            mmp2_defconfig
powerpc                      bamboo_defconfig
i386                                defconfig
powerpc                 mpc837x_mds_defconfig
arm                          lpd270_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                         virt_defconfig
sh                            titan_defconfig
powerpc                         ps3_defconfig
arm                             pxa_defconfig
s390                          debug_defconfig
arc                              alldefconfig
powerpc                  iss476-smp_defconfig
arm                       omap2plus_defconfig
powerpc                     tqm8541_defconfig
sparc64                             defconfig
mips                        jmr3927_defconfig
sh                          sdk7780_defconfig
m68k                          amiga_defconfig
sh                               j2_defconfig
arm                        magician_defconfig
arm                          exynos_defconfig
h8300                               defconfig
arm                       mainstone_defconfig
sh                          landisk_defconfig
arm                   milbeaut_m10v_defconfig
m68k                           sun3_defconfig
powerpc                    sam440ep_defconfig
mips                          rm200_defconfig
arm                           u8500_defconfig
arm                        multi_v7_defconfig
sh                          rsk7201_defconfig
arm                  colibri_pxa300_defconfig
arm                         hackkit_defconfig
mips                           jazz_defconfig
arc                         haps_hs_defconfig
mips                      bmips_stb_defconfig
sh                   secureedge5410_defconfig
m68k                            mac_defconfig
ia64                      gensparse_defconfig
powerpc                     skiroot_defconfig
mips                            ar7_defconfig
mips                     cu1000-neo_defconfig
sparc                       sparc64_defconfig
sh                           se7619_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      arches_defconfig
mips                        qi_lb60_defconfig
riscv                          rv32_defconfig
powerpc                    socrates_defconfig
powerpc                        fsp2_defconfig
arm                         s5pv210_defconfig
arm                     am200epdkit_defconfig
mips                           xway_defconfig
powerpc                       ppc64_defconfig
arm                          iop32x_defconfig
mips                        bcm47xx_defconfig
powerpc                      ppc44x_defconfig
mips                malta_kvm_guest_defconfig
powerpc                       ebony_defconfig
sh                            migor_defconfig
mips                       lemote2f_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210330
x86_64               randconfig-a003-20210330
x86_64               randconfig-a002-20210330
x86_64               randconfig-a001-20210330
x86_64               randconfig-a005-20210330
x86_64               randconfig-a006-20210330
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a015-20210330
i386                 randconfig-a011-20210330
i386                 randconfig-a014-20210330
i386                 randconfig-a013-20210330
i386                 randconfig-a016-20210330
i386                 randconfig-a012-20210330
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210330
x86_64               randconfig-a015-20210330
x86_64               randconfig-a014-20210330
x86_64               randconfig-a016-20210330
x86_64               randconfig-a013-20210330
x86_64               randconfig-a011-20210330

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
