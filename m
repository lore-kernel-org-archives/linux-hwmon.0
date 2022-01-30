Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB6EC43219
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Jan 2022 14:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237542AbiA3Ohm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 Jan 2022 09:37:42 -0500
Received: from mga03.intel.com ([134.134.136.65]:33655 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347212AbiA3Ohl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 Jan 2022 09:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643553462; x=1675089462;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ScCP4xE6Pk/yzMSMyJRsNCKH6emg9i6ud6LWf4Ho8Hg=;
  b=f6+1+jgEhgTbARAQEvBdPToQsJibNZv1d86A/r5gwpgbzLw7mez/9DFJ
   skUWd99Sd/jkQmsVJc820GkqPQMlb7Qvd4i+1yiJ/zuxIF6DfVr7OwNih
   Kcvxbmo/Nt3BmgpInUBQfPvaw7eVIUaPVuBvAhm2GP1R7ehoLaq8sfrCb
   C5DQI2thVKIh6PbLz2dNHouoKs3c2v6GEMxowmGK+hMph/AxTTGcj5YaD
   VgZnCOCreNk2QLP6xEjHTykhmbvyuCF2os/JsR2PRq3jbAn1P75Gwb1F2
   qBhv0/sSNdDs5Iq6OrOaHEjw577++hT7Bme+8Q3+k9Y4Og43N/rvrCTdA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247302146"
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="247302146"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 06:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,328,1635231600"; 
   d="scan'208";a="582361304"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2022 06:37:39 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nEBKk-000Qc8-La; Sun, 30 Jan 2022 14:37:38 +0000
Date:   Sun, 30 Jan 2022 22:36:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:master] BUILD SUCCESS
 1d2d8baaf05367edb281168e36083912630aa57b
Message-ID: <61f6a282.2gIwezwFGOf0jEt+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git master
branch HEAD: 1d2d8baaf05367edb281168e36083912630aa57b  pinctrl-sunxi: sunxi_pinctrl_gpio_direction_in/output: use correct offset

elapsed time: 725m

configs tested: 132
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
powerpc                 mpc8540_ads_defconfig
m68k                          amiga_defconfig
arm                           u8500_defconfig
sparc64                             defconfig
powerpc                        cell_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                           sama5_defconfig
parisc                generic-32bit_defconfig
arm                         s3c6400_defconfig
powerpc                      arches_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
mips                      fuloong2e_defconfig
openrisc                            defconfig
sh                          lboxre2_defconfig
powerpc                     tqm8541_defconfig
arm                        spear6xx_defconfig
xtensa                           alldefconfig
m68k                                defconfig
i386                             alldefconfig
arm                             rpc_defconfig
powerpc                       eiger_defconfig
powerpc                      pcm030_defconfig
sh                               allmodconfig
mips                         tb0226_defconfig
mips                 decstation_r4k_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
arm                         lpc18xx_defconfig
powerpc                      ep88xc_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     ep8248e_defconfig
riscv                    nommu_k210_defconfig
sh                           se7206_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7264_defconfig
sh                             espt_defconfig
sh                           se7712_defconfig
m68k                             allmodconfig
i386                                defconfig
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
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
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220130
riscv                randconfig-r042-20220130
s390                 randconfig-r044-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
powerpc                      ppc64e_defconfig
arm                          pcm027_defconfig
hexagon                             defconfig
mips                     cu1000-neo_defconfig
powerpc                   lite5200b_defconfig
powerpc                 mpc8315_rdb_defconfig
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
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
