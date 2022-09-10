Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEAAECAAD5
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Sep 2022 07:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIJH6u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Sep 2022 03:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiIJH6s (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Sep 2022 03:58:48 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E0719C0F
        for <linux-hwmon@vger.kernel.org>; Sat, 10 Sep 2022 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662796727; x=1694332727;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7RreQa9SqDFJRxTDG0TaNzDsm/Coetna3MsLHxoaTfk=;
  b=J7r2hXGS5w4DdakHY8b/WaA5ySWuLjH3NsK3s80NQPZr6xB/k0LA0gup
   3w0mfQmKUttpPjetFrY3crhbrZKzEdJfOIdtWoCvDtXs79uit46ISB4p2
   lHgMGY5qQ185vvOLHDO7WkAui3lPWd4mf40hcpzqmD9Y1bkIzxWJwwXo0
   2kbq8Z7ngAbbRXPfQmTwRem5iiOJAxZqwoOpPThW5WeRQSGlUeE7zV0X7
   KA2/jIo39LJgHyvMkNYCOKoH5Z5BiI/XeZe9WuNYqVcbH7/8pFiMRaaRo
   CNE1oS+UWO5dMJBMOEJkGsAfIzr4sZmODfp5VGwtB9goqFsRr6e2em4CK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="278016450"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="278016450"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 00:58:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="592881862"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 10 Sep 2022 00:58:46 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oWvO1-0002Ha-2b;
        Sat, 10 Sep 2022 07:58:45 +0000
Date:   Sat, 10 Sep 2022 15:58:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 88700d1396bae72d9a4c23a48bbd98c1c2f53f3d
Message-ID: <631c43a3.pfgJU+H+0m3b+e4K%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 88700d1396bae72d9a4c23a48bbd98c1c2f53f3d  hwmon: (asus-ec-sensors) autoload module via DMI data

elapsed time: 777m

configs tested: 111
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
mips                             allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
x86_64                           allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a001
x86_64                        randconfig-a013
i386                          randconfig-a003
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a011
i386                          randconfig-a005
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
arm                                 defconfig
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
arc                  randconfig-r043-20220909
m68k                             allyesconfig
arc                  randconfig-r043-20220907
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig
sh                   secureedge5410_defconfig
arm                         lubbock_defconfig
sh                          rsk7264_defconfig
powerpc                      ppc40x_defconfig
arm                         axm55xx_defconfig
mips                         db1xxx_defconfig
arm                            zeus_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                        keystone_defconfig
x86_64                           alldefconfig
xtensa                    xip_kc705_defconfig
mips                    maltaup_xpa_defconfig
arm                          badge4_defconfig
mips                      maltasmvp_defconfig
mips                     decstation_defconfig
sh                         ecovec24_defconfig
sh                           se7712_defconfig
i386                          randconfig-c001
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
s390                       zfcpdump_defconfig
mips                        bcm47xx_defconfig
arm                            pleb_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
powerpc                       eiger_defconfig
openrisc                  or1klitex_defconfig
arc                              alldefconfig
sh                              ul2_defconfig
arm                           sunxi_defconfig
arm                          exynos_defconfig
nios2                         10m50_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                             espt_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                            mps2_defconfig
m68k                        m5407c3_defconfig
sparc                               defconfig
nios2                         3c120_defconfig
mips                      fuloong2e_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                        clps711x_defconfig
sh                             shx3_defconfig
riscv                            allmodconfig
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a003
x86_64                        randconfig-a014
riscv                randconfig-r042-20220909
hexagon              randconfig-r041-20220909
hexagon              randconfig-r045-20220909
s390                 randconfig-r044-20220909
hexagon              randconfig-r041-20220907
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
x86_64                        randconfig-k001
hexagon              randconfig-r041-20220908
hexagon              randconfig-r045-20220908

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
