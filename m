Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D73EC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Jan 2022 04:12:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236975AbiA1EMz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 23:12:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:14065 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231222AbiA1EMy (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 23:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643343174; x=1674879174;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tTvh7kj3C/3vfcqqSLgP5U0IElXRsBzKJFpHLTJ6eh8=;
  b=QT4o+AdIlzA8UaHtPwGhxqOkE/h8nK9nokhTWSKMgFukFbVC3nJkWJVl
   aq2x4g16X2EHJPKCe3OQnfyDU0DHmOrqWpV4r6w1PtamR/wtTEhkuOK/V
   A7wc+m13fERlXWnxTnA3IxNNVd96fW2nZU6irn7eNEPo/8HhauJyEvA9D
   5qgHOkfHKRNHmxi0uOF6frLSNLzWBnO9xKqit7QJl9riYrPIehcpXp7hy
   tGb3f3+KmiDMwlP5o42t0EVcgPhmkDkWa0tt1Z6xfQwrRZCDS8PAKhMRe
   cFK0umQQFfzbbmHrGNfSOmNVTKW62wQFZ4e7nziR3BM033kEJXEyAXogf
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="246815947"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="246815947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 20:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="535980507"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Jan 2022 20:12:53 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nDId2-000NRM-Kj; Fri, 28 Jan 2022 04:12:52 +0000
Date:   Fri, 28 Jan 2022 12:12:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 468630091675964e6178462407108dafdda06d54
Message-ID: <61f36d14.IeZO3m3hYvwltldp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 468630091675964e6178462407108dafdda06d54  hwmon: (powr1220) Add support for Lattice's POWR1014 power manager IC

elapsed time: 725m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
powerpc                 mpc834x_itx_defconfig
arm                         at91_dt_defconfig
mips                         mpc30x_defconfig
xtensa                              defconfig
mips                        vocore2_defconfig
um                             i386_defconfig
h8300                    h8300h-sim_defconfig
parisc                generic-64bit_defconfig
sparc                       sparc64_defconfig
mips                        bcm47xx_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sh                               allmodconfig
powerpc                  storcenter_defconfig
arm                        keystone_defconfig
sh                     sh7710voipgw_defconfig
sh                 kfr2r09-romimage_defconfig
parisc                generic-32bit_defconfig
arm                           viper_defconfig
sh                         ecovec24_defconfig
riscv                            allmodconfig
sh                        sh7763rdp_defconfig
arm                          pxa910_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm8541_defconfig
mips                           xway_defconfig
powerpc                      ppc6xx_defconfig
arc                              alldefconfig
arc                        nsimosci_defconfig
arm                             pxa_defconfig
arm                            pleb_defconfig
arm                         assabet_defconfig
s390                          debug_defconfig
h8300                     edosk2674_defconfig
nios2                         3c120_defconfig
xtensa                    xip_kc705_defconfig
sh                         apsh4a3a_defconfig
mips                           ci20_defconfig
arm                  randconfig-c002-20220127
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
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
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64               randconfig-a001-20220124
riscv                randconfig-r042-20220127
riscv                randconfig-r042-20220125
arc                  randconfig-r043-20220127
arc                  randconfig-r043-20220125
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220127
s390                 randconfig-r044-20220125
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
x86_64                        randconfig-c007
arm                  randconfig-c002-20220125
riscv                randconfig-c006-20220125
powerpc              randconfig-c003-20220125
mips                 randconfig-c004-20220125
i386                          randconfig-c001
powerpc                     powernv_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   bluestone_defconfig
mips                           ip27_defconfig
powerpc                      ppc44x_defconfig
arm                     davinci_all_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                          allmodconfig
arm                                 defconfig
mips                     cu1830-neo_defconfig
powerpc                     kilauea_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      katmai_defconfig
arm                         bcm2835_defconfig
powerpc                       ebony_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220126
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220127
hexagon              randconfig-r045-20220126
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220127
hexagon              randconfig-r041-20220126
hexagon              randconfig-r045-20220125
hexagon              randconfig-r041-20220125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
