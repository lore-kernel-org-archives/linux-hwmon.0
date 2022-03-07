Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A90C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Mar 2022 06:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbiCGGRd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Mar 2022 01:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233044AbiCGGRd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Mar 2022 01:17:33 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326763BBD3
        for <linux-hwmon@vger.kernel.org>; Sun,  6 Mar 2022 22:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646633799; x=1678169799;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8+zP0wL4ZYUvvih3/B0sJTmQgjC8LJ3CaSnSkP+O1DU=;
  b=apSNHMmuIa9v97PpouufSrLdevqXMA8MeW6C/sRq/BKJZ7TTxMj9gkD2
   6hrYJwt9M15lxzhJb21x2UwAOoDR2GOy+ySzhGeP3KLlufoxpr7IhFJHz
   KG1VB388Kzz4aioFYVef5VeucgbFgyr8BWC4DvOBXMn1dlUPkYYxzgwwh
   K6y7yuy2BaLejXTnV37z1M5BRa1K0XqtL+0ZadsMbVdayFg4TpR2FsrM1
   Ii4mv4f9UtMnj1mOMQk2g2aZxHFOwqwTrsiGSa+KHAsWqsz5iHBJ+V9qY
   0XlyhcgW73DAcyV0uISwqyOeCD/XaGzZ5Hsxrq3iBJF2bIy02yZU//VXV
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="254504002"
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; 
   d="scan'208";a="254504002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2022 22:16:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,161,1643702400"; 
   d="scan'208";a="780212832"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 06 Mar 2022 22:16:37 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nR6fY-00001V-4F; Mon, 07 Mar 2022 06:16:32 +0000
Date:   Mon, 07 Mar 2022 13:40:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 007e433cf0373334a2bef1b0c9831647184906ba
Message-ID: <62259ac1.6J+FwC0BF84rO/ES%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 007e433cf0373334a2bef1b0c9831647184906ba  hwmon: Add driver for Texas Instruments TMP464 and TMP468

elapsed time: 4818m

configs tested: 107
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
arm                         axm55xx_defconfig
arm                        mvebu_v7_defconfig
arm                        cerfcube_defconfig
h8300                            alldefconfig
powerpc                  iss476-smp_defconfig
sh                           se7751_defconfig
riscv                            allmodconfig
sh                          kfr2r09_defconfig
sh                          r7780mp_defconfig
arm                           sama5_defconfig
arm                         lubbock_defconfig
sparc                       sparc64_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          urquell_defconfig
powerpc                     ep8248e_defconfig
arm                         vf610m4_defconfig
m68k                          multi_defconfig
sh                ecovec24-romimage_defconfig
sh                   secureedge5410_defconfig
arm                           u8500_defconfig
m68k                          sun3x_defconfig
powerpc                        cell_defconfig
arm                       omap2plus_defconfig
s390                          debug_defconfig
arm                           h5000_defconfig
arm                            mps2_defconfig
arm                        clps711x_defconfig
m68k                        m5407c3_defconfig
sh                           se7712_defconfig
arm                  randconfig-c002-20220302
arm                  randconfig-c002-20220304
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
parisc64                            defconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  colibri_pxa270_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220304
hexagon              randconfig-r041-20220304
hexagon              randconfig-r045-20220302
hexagon              randconfig-r041-20220302
hexagon              randconfig-r045-20220303
riscv                randconfig-r042-20220303
hexagon              randconfig-r041-20220303

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
