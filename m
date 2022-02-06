Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CF6C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Feb 2022 07:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiBFHGL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Feb 2022 02:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiBFHGL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Feb 2022 02:06:11 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D770BC061353
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Feb 2022 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644131169; x=1675667169;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xP1a3fphdTSSf7vsHvlAuE10fE4gmHQn3iqmtkVVDnc=;
  b=L+pje2+hzP3++l9sF+OfHRtUj6qOVH3H5a+9e2Iq0i16VNyUtp95e1XX
   iDSIN5o3aWEs7T4M1pEzFvbONW2uLYW64hxrUKQo1P1zju2xJOzyLvDWq
   PMs4EJbZdHl3Ue5q6CJBISf6U71eDmtGjxkl+VhCIg+Pnp91i7i0DlQ5Z
   UAfvWjXuc7jSot14ljNIZnhh7Hemossci2371Oqq1GQ8vdprFtpPkxd2e
   4eRDr8gLGafrhNh32424S67YG7OgrbhnKoeCV19IDhO5Bf5wUH5Q4r0N1
   iUX4W+O9E10EXnityrlImGcbvoKn7gvJtltJN4UH+P35mSm9pwNVYm6fh
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10249"; a="248771997"
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="248771997"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2022 23:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="484052715"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2022 23:05:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nGbbc-000a0g-TY; Sun, 06 Feb 2022 07:05:04 +0000
Date:   Sun, 06 Feb 2022 15:04:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 bb9bb9c75482aa008cfc62b5cb88681de8408fa3
Message-ID: <61ff7310.USTJkLZlTyqPcGzO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: bb9bb9c75482aa008cfc62b5cb88681de8408fa3  hwmon: (ntc_thermistor) Underscore Samsung thermistor

elapsed time: 721m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                          sun3x_defconfig
powerpc                  storcenter_defconfig
s390                                defconfig
alpha                            allyesconfig
mips                         bigsur_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           ci20_defconfig
m68k                        stmark2_defconfig
powerpc                       maple_defconfig
csky                                defconfig
sh                           se7780_defconfig
sh                             sh03_defconfig
powerpc64                           defconfig
arm                            mps2_defconfig
powerpc                         ps3_defconfig
arc                                 defconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
sh                         ecovec24_defconfig
powerpc                   motionpro_defconfig
sparc                            alldefconfig
arm                          iop32x_defconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
openrisc                         alldefconfig
sh                          kfr2r09_defconfig
mips                       capcella_defconfig
powerpc                    amigaone_defconfig
sh                            titan_defconfig
sparc64                             defconfig
riscv                               defconfig
arm                         at91_dt_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220206
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
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
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
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
riscv                randconfig-c006-20220206
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220206
mips                 randconfig-c004-20220206
i386                          randconfig-c001
arm                  randconfig-c002-20220206
s390                 randconfig-c005-20220206
powerpc                  mpc866_ads_defconfig
arm                         s5pv210_defconfig
powerpc                     tqm8560_defconfig
arm                         orion5x_defconfig
powerpc                       ebony_defconfig
mips                       rbtx49xx_defconfig
mips                      maltaaprp_defconfig
mips                        bcm63xx_defconfig
arm                       imx_v4_v5_defconfig
mips                     cu1830-neo_defconfig
powerpc                     powernv_defconfig
mips                          ath79_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220206
riscv                randconfig-r042-20220206
hexagon              randconfig-r041-20220206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
