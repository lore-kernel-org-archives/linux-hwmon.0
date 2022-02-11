Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30818C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Feb 2022 07:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242069AbiBKHWg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Feb 2022 02:22:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbiBKHWg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Feb 2022 02:22:36 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A77010E4
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 23:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644564155; x=1676100155;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VI4vR/wB10/+o8znIyTtvbtOO64Oa6Bn6YdR6rWVe5U=;
  b=fzx8voC0tD1DGGg+w9vLTOzBN164VlvFSm1mxrv2KdiO+GG0uiDp8AoA
   40cV9Z2ejpjQS8Y0kX+zRwa3OuFEMKqdxcSbbMAYfJtegcVIHYiZ/nIux
   VSSjopYrmQ9srWkloMf1h8LKt2QVuAzEdjlgs0LfQa92ZPimy8ZUGjH0g
   YmwCt48h0/hY84AmFjNx0U2I3mHeq5pqEI5GUNlIs+HrkSEFROYdAe1V+
   qs7fv0LggCFbdDfDgliSuMI/s3sUliXYg3K80QBdxVfR6SoTG3z4N5Guz
   zgbe8YANFuNU9W/HKhtTvK3fGAklXS/hN51dWos5iKiBn9JcjqSffaJgA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247270598"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="247270598"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 23:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; 
   d="scan'208";a="623136824"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2022 23:22:34 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nIQGH-0004Hl-Bs; Fri, 11 Feb 2022 07:22:33 +0000
Date:   Fri, 11 Feb 2022 15:22:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 cf7ff6f041303d3f6f0e19120e6e133b1fb5b1c3
Message-ID: <62060eab.E5nSqftS68j/mNPf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: cf7ff6f041303d3f6f0e19120e6e133b1fb5b1c3  hwmon: (asus-ec-sensors) add CPU core voltage

elapsed time: 726m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                     ep8248e_defconfig
arc                            hsdk_defconfig
m68k                         amcore_defconfig
mips                        vocore2_defconfig
arm                         lpc18xx_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
openrisc                 simple_smp_defconfig
openrisc                            defconfig
sparc64                          alldefconfig
powerpc                     mpc83xx_defconfig
m68k                           sun3_defconfig
sh                         ecovec24_defconfig
nios2                            alldefconfig
sh                          urquell_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
arm                          simpad_defconfig
m68k                          multi_defconfig
xtensa                          iss_defconfig
arm                     eseries_pxa_defconfig
alpha                            alldefconfig
mips                            gpr_defconfig
riscv                    nommu_k210_defconfig
h8300                     edosk2674_defconfig
parisc                              defconfig
sh                                  defconfig
m68k                        m5407c3_defconfig
sh                   sh7770_generic_defconfig
m68k                          hp300_defconfig
powerpc                     tqm8555_defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
arm                           sunxi_defconfig
parisc                           alldefconfig
m68k                          amiga_defconfig
powerpc                      makalu_defconfig
arm                  randconfig-c002-20220211
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
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
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
s390                 randconfig-r044-20220209
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
riscv                randconfig-c006-20220209
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
i386                          randconfig-c001
mips                 randconfig-c004-20220209
mips                 randconfig-c004-20220210
arm                  randconfig-c002-20220209
mips                            e55_defconfig
arm                        mvebu_v5_defconfig
powerpc                      katmai_defconfig
mips                         tb0219_defconfig
arm                         lpc32xx_defconfig
powerpc                        icon_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220210
hexagon              randconfig-r045-20220208
hexagon              randconfig-r045-20220209
hexagon              randconfig-r041-20220210
hexagon              randconfig-r041-20220208
hexagon              randconfig-r041-20220209
riscv                randconfig-r042-20220208
s390                 randconfig-r044-20220208
hexagon              randconfig-r045-20220211
hexagon              randconfig-r041-20220211
riscv                randconfig-r042-20220211

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
