Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A0EC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Oct 2021 07:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D371B61260
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Oct 2021 07:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbhJSHEJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 19 Oct 2021 03:04:09 -0400
Received: from mga07.intel.com ([134.134.136.100]:53314 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhJSHEH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Oct 2021 03:04:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="291904904"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; 
   d="scan'208";a="291904904"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 00:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; 
   d="scan'208";a="719922624"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2021 00:01:51 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mcj8A-000CAW-VI; Tue, 19 Oct 2021 07:01:50 +0000
Date:   Tue, 19 Oct 2021 15:00:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 66ae4d562b6a8eb2e54d051f31350b1bd5fa3d9c
Message-ID: <616e6d28.NRxEhNWyEh9pezMn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 66ae4d562b6a8eb2e54d051f31350b1bd5fa3d9c  hwmon: (tmp421) Add of_node_put() before return

elapsed time: 726m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211019
powerpc                    adder875_defconfig
powerpc                      walnut_defconfig
arc                        nsim_700_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8548_defconfig
powerpc                   bluestone_defconfig
powerpc                      acadia_defconfig
ia64                         bigsur_defconfig
arm                       multi_v4t_defconfig
arm                      jornada720_defconfig
powerpc                     pseries_defconfig
xtensa                       common_defconfig
mips                            gpr_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7203_defconfig
arm                           stm32_defconfig
um                               alldefconfig
arm                          lpd270_defconfig
mips                      maltaaprp_defconfig
sh                          urquell_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
riscv                               defconfig
openrisc                    or1ksim_defconfig
arm                        spear3xx_defconfig
arm                            qcom_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
powerpc                     kilauea_defconfig
sparc                               defconfig
arm                         vf610m4_defconfig
m68k                        mvme147_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            dove_defconfig
riscv                          rv32_defconfig
sh                     magicpanelr2_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         orion5x_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                          imote2_defconfig
powerpc                      makalu_defconfig
s390                       zfcpdump_defconfig
arc                        vdk_hs38_defconfig
m68k                            q40_defconfig
powerpc                 linkstation_defconfig
arm                        keystone_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        neponset_defconfig
powerpc                           allnoconfig
arm                       mainstone_defconfig
openrisc                            defconfig
powerpc                      ppc64e_defconfig
mips                          rb532_defconfig
m68k                        stmark2_defconfig
xtensa                  nommu_kc705_defconfig
sh                         ap325rxa_defconfig
sh                          r7780mp_defconfig
m68k                          sun3x_defconfig
sh                             sh03_defconfig
mips                       rbtx49xx_defconfig
arm                  colibri_pxa270_defconfig
sh                           se7619_defconfig
m68k                       bvme6000_defconfig
h8300                               defconfig
m68k                        m5307c3_defconfig
powerpc                      mgcoge_defconfig
m68k                        m5407c3_defconfig
powerpc64                        alldefconfig
arm                           sunxi_defconfig
sh                ecovec24-romimage_defconfig
arm                       cns3420vb_defconfig
powerpc                          g5_defconfig
powerpc                       holly_defconfig
arm                      integrator_defconfig
arm                           corgi_defconfig
arm                        realview_defconfig
powerpc                  storcenter_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                  randconfig-c002-20211019
x86_64               randconfig-c001-20211019
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a015-20211019
x86_64               randconfig-a012-20211019
x86_64               randconfig-a016-20211019
x86_64               randconfig-a014-20211019
x86_64               randconfig-a013-20211019
x86_64               randconfig-a011-20211019
i386                 randconfig-a014-20211019
i386                 randconfig-a016-20211019
i386                 randconfig-a011-20211019
i386                 randconfig-a015-20211019
i386                 randconfig-a012-20211019
i386                 randconfig-a013-20211019
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211019
mips                 randconfig-c004-20211019
i386                 randconfig-c001-20211019
s390                 randconfig-c005-20211019
x86_64               randconfig-c007-20211019
riscv                randconfig-c006-20211019
powerpc              randconfig-c003-20211019
x86_64               randconfig-a004-20211019
x86_64               randconfig-a006-20211019
x86_64               randconfig-a005-20211019
x86_64               randconfig-a001-20211019
x86_64               randconfig-a002-20211019
x86_64               randconfig-a003-20211019
i386                 randconfig-a001-20211019
i386                 randconfig-a003-20211019
i386                 randconfig-a004-20211019
i386                 randconfig-a005-20211019
i386                 randconfig-a002-20211019
i386                 randconfig-a006-20211019
hexagon              randconfig-r041-20211019
hexagon              randconfig-r045-20211019

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
