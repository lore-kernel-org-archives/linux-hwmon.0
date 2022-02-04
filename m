Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66CFC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Feb 2022 20:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbiBDUGy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Feb 2022 15:06:54 -0500
Received: from mga12.intel.com ([192.55.52.136]:18125 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238955AbiBDUGA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 4 Feb 2022 15:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644005160; x=1675541160;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LpSHzVbfZeiTeKV9epKHzK2i16MVuGL4aVtfNPSniSw=;
  b=AmloEM4MPgzZlwcm6HMi9rHGnaR826KZs7oLE+M4m/xlOgJ42rDpKGNT
   3GuLiLj8ULxeY0dcyF3j3VcnBKRoD75dUagdhG1JUes3ZF24uZkGdvTyE
   5W81v7z1LvO/m0l4K1VS4Oey7cgXOrvBqWTpkaMZU06l+XX3LP79cs9Hw
   4tFy1ZEwPLxw254nEeY4xA/qJIe9LmGKjTdfHzSZryUdX9VaxDQY27pv5
   tgV63Gvr42RlF3vgFdtNZmyf9cKo3msIF8QSYOkHdAn3luuV3Bjkb+phb
   YVgYsUoNMEE6TG5CZC+x9pShI2GRBmYebwJC2guao9UcGo7zHnEFsStyr
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="228405603"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="228405603"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 12:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="584236166"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2022 12:03:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nG4o5-000Y71-BI; Fri, 04 Feb 2022 20:03:45 +0000
Date:   Sat, 05 Feb 2022 04:02:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 37ed278a9530c856c98d55cfd262a8679dbdd6d8
Message-ID: <61fd866a.qSZX86dEYFk+rfkA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 37ed278a9530c856c98d55cfd262a8679dbdd6d8  hwmon: (asus-ec-sensors) Add Crosshair VIII Hero WiFi

elapsed time: 826m

configs tested: 190
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
powerpc              randconfig-c003-20220131
m68k                          hp300_defconfig
sh                   sh7724_generic_defconfig
arc                    vdk_hs38_smp_defconfig
xtensa                          iss_defconfig
mips                      fuloong2e_defconfig
arm                         vf610m4_defconfig
powerpc64                        alldefconfig
sh                        sh7757lcr_defconfig
sh                          r7780mp_defconfig
sh                ecovec24-romimage_defconfig
arm                            hisi_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
ia64                        generic_defconfig
mips                    maltaup_xpa_defconfig
openrisc                  or1klitex_defconfig
sparc64                             defconfig
arc                           tb10x_defconfig
sh                     sh7710voipgw_defconfig
sh                         ap325rxa_defconfig
mips                  maltasmvp_eva_defconfig
mips                         db1xxx_defconfig
sh                           se7206_defconfig
sh                             sh03_defconfig
arm                       aspeed_g5_defconfig
powerpc                      cm5200_defconfig
arm                      footbridge_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7750_defconfig
sh                         microdev_defconfig
arc                            hsdk_defconfig
parisc                           allyesconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                  iss476-smp_defconfig
powerpc                     mpc83xx_defconfig
powerpc                     stx_gp3_defconfig
mips                         bigsur_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8548_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ep88xc_defconfig
arm                         lubbock_defconfig
mips                          rb532_defconfig
powerpc                      ppc40x_defconfig
sh                   rts7751r2dplus_defconfig
nds32                               defconfig
arm                            qcom_defconfig
powerpc                     pq2fads_defconfig
m68k                            q40_defconfig
sh                              ul2_defconfig
mips                           gcw0_defconfig
powerpc                    klondike_defconfig
mips                      loongson3_defconfig
xtensa                  cadence_csp_defconfig
m68k                          multi_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
arm                             rpc_defconfig
arm                             pxa_defconfig
sh                             espt_defconfig
mips                           ip32_defconfig
microblaze                      mmu_defconfig
xtensa                           allyesconfig
powerpc                     rainier_defconfig
openrisc                 simple_smp_defconfig
nios2                         10m50_defconfig
ia64                         bigsur_defconfig
um                                  defconfig
arm                         nhk8815_defconfig
arm                  randconfig-c002-20220202
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc                     mpc512x_defconfig
mips                     loongson1c_defconfig
powerpc                          allyesconfig
powerpc               mpc834x_itxgp_defconfig
arm                  colibri_pxa270_defconfig
powerpc                        icon_defconfig
mips                        bcm63xx_defconfig
x86_64                           allyesconfig
arm                         shannon_defconfig
powerpc                     tqm5200_defconfig
arm                           sama7_defconfig
arm                       spear13xx_defconfig
mips                        omega2p_defconfig
arm                   milbeaut_m10v_defconfig
arm                         orion5x_defconfig
mips                          ath79_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                         socfpga_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          pcm027_defconfig
arm                           spitz_defconfig
arm                     davinci_all_defconfig
powerpc                   microwatt_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220203
hexagon              randconfig-r041-20220203
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
