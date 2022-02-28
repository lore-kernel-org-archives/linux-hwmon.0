Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CAAC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Feb 2022 14:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbiB1OKN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Feb 2022 09:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237096AbiB1OJz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Feb 2022 09:09:55 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C527EB02
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Feb 2022 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646057347; x=1677593347;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k5wPT2IqCGTWlpy8xny2krC4hZdCEh9ZNtT/OrZMW5c=;
  b=ImpwL6E7Bl6K3aEKHqs4EpiQ/Ba+QW5eOclKgL10kVB8DayUWlrPl6oV
   Fyu7icD45H3EL5jKf+eTXevHS45+fRK5dRfsv7FGvd2Jve+4kwepehMip
   txIB5S+3SRYcpp3V/qB7QGV/y744ovyq3e79H0eeCz2fYGr+7s67LRdhA
   841scBI7e9VbZyFglDSPOWRY8oLBlpMjVrYS8P3wo9eClup6VpKa+pnpr
   L7uC2fWgxtfKZo8A6NpH2cywIDwTIyhZQiUfiyAERIGxNelncBwfmZiuI
   wqnqO5bQ9NwFFg7F9++dqGtWnn8NNPn+r4Mhd78WqepQfGlEOszet4dVl
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="250470766"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="250470766"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 06:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="640890125"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Feb 2022 06:05:08 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOgeC-0007QL-3b; Mon, 28 Feb 2022 14:05:08 +0000
Date:   Mon, 28 Feb 2022 22:04:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 686d303ee6301261b422ea51e64833d7909a2c36
Message-ID: <621cd688.axj4l9nrS3terWbp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 686d303ee6301261b422ea51e64833d7909a2c36  hwmon: (pmbus) Add mutex to regulator ops

elapsed time: 724m

configs tested: 169
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
arm64                            allyesconfig
i386                 randconfig-c001-20220228
i386                          randconfig-c001
powerpc                    sam440ep_defconfig
sparc                            allyesconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
arm                          lpd270_defconfig
arm                            zeus_defconfig
mips                           ip32_defconfig
m68k                           sun3_defconfig
mips                      loongson3_defconfig
arc                         haps_hs_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
s390                       zfcpdump_defconfig
sparc                               defconfig
xtensa                    smp_lx200_defconfig
microblaze                          defconfig
sh                          rsk7264_defconfig
arc                     haps_hs_smp_defconfig
openrisc                 simple_smp_defconfig
riscv                    nommu_k210_defconfig
openrisc                         alldefconfig
sh                   rts7751r2dplus_defconfig
arc                     nsimosci_hs_defconfig
arm                        clps711x_defconfig
sh                 kfr2r09-romimage_defconfig
um                                  defconfig
parisc                              defconfig
mips                             allyesconfig
sh                        sh7757lcr_defconfig
arm                      integrator_defconfig
m68k                                defconfig
xtensa                          iss_defconfig
sh                          r7780mp_defconfig
mips                           jazz_defconfig
xtensa                  cadence_csp_defconfig
arc                          axs103_defconfig
sh                      rts7751r2d1_defconfig
sh                          polaris_defconfig
sh                             sh03_defconfig
sh                           se7705_defconfig
arm                           h3600_defconfig
m68k                       m5249evb_defconfig
sh                           se7206_defconfig
arc                        vdk_hs38_defconfig
nds32                               defconfig
arm                             ezx_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
arm                        multi_v7_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
m68k                         amcore_defconfig
powerpc                     taishan_defconfig
sh                     sh7710voipgw_defconfig
sh                          urquell_defconfig
m68k                        mvme16x_defconfig
powerpc                     rainier_defconfig
arm                          pxa910_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
s390                 randconfig-c005-20220227
arm                          imote2_defconfig
riscv                            alldefconfig
mips                        qi_lb60_defconfig
mips                          rm200_defconfig
hexagon                          alldefconfig
mips                   sb1250_swarm_defconfig
mips                      bmips_stb_defconfig
riscv                    nommu_virt_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
powerpc                          allmodconfig
mips                      maltaaprp_defconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
s390                 randconfig-r044-20220227
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
riscv                randconfig-r042-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
