Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D59AC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Dec 2021 10:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbhLUK74 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 05:59:56 -0500
Received: from mga04.intel.com ([192.55.52.120]:47837 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230391AbhLUK7z (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 05:59:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640084395; x=1671620395;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L40GZQtN43aDenQYN52Vhc3Btdw6V1tCiGM3OSLFh9c=;
  b=fmUF6RfwmcevP8TeGMTDK4mukyeqdxFbopOPJsDl/iZqXIsgYYRh98gW
   eZw/tNN21/HTb6MFK3b7eDfBIHz3IqgNeF/gapQwfg22B7tsVXmB+0BVD
   F/zzBcKzeeg4w5LxKyiyaZrLlvnROzvXhbSRVvZuezsUZGnWUOEs+0AjR
   +1g5dPI9I3NJOKzsCFRr+jL/mfD+t5M/U5PHSScacphOEOJdoQmZyBlLO
   snvwFPHrIL+wL7vije5ZV5A1A5MfC+eu9S9AKZW3v67Bd22fjA7NOrx0h
   Qtwc9TZ0sdmOUA20d22AXXY/tCC964qZ5EdPMcxf4OBSDNiNNqyrYPRZH
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="239120651"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="239120651"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 02:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="467753291"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 21 Dec 2021 02:59:54 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzcs5-00090Z-CD; Tue, 21 Dec 2021 10:59:53 +0000
Date:   Tue, 21 Dec 2021 18:59:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 c2c94abe099d234010dea98c038e034fead84c4a
Message-ID: <61c1b379.AnTKwYgTRyUHT2TQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: c2c94abe099d234010dea98c038e034fead84c4a  watchdog: Add Apple SoC watchdog driver

elapsed time: 824m

configs tested: 99
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
powerpc                      chrp32_defconfig
mips                           ip27_defconfig
csky                             alldefconfig
powerpc                       eiger_defconfig
arm                           tegra_defconfig
powerpc                     tqm8541_defconfig
m68k                             alldefconfig
sh                          urquell_defconfig
sh                             shx3_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         lubbock_defconfig
powerpc                   currituck_defconfig
arm                          exynos_defconfig
sh                     magicpanelr2_defconfig
sh                           se7750_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
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
s390                             allmodconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a006-20211220
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a005-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a013-20211220
i386                 randconfig-a016-20211220
i386                 randconfig-a015-20211220
i386                 randconfig-a014-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
