Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF13C00144
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Jul 2022 02:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiG0Cpl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiG0Cpk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 22:45:40 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0C365C1
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 19:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658889940; x=1690425940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=trtn3XVYsdaOEJdN4atxGNZuRatQMCB/R/h160AX9xg=;
  b=miAGg9VJtu37sK6wXIkh1PoqzzG6h7MgRjQR8nSXV98nI84EfdP+UZsx
   gYQuTsgLcK/rGbyAiJfzdmvJYNqc3zZTXWi7/FysqYa6ejWLJE7RSRJ5i
   Af3S+G8H2yssrmZiDWi+9ESh1Rnuts3lEHHZ0R1D/j5rTUluqOZ6/b1oy
   B9amyJIdBpLRwYqB96VHI7009BBad/brOBX9wcC4ItjlRx1R/9dBJuPJj
   VJnTao+EQIu8Yz9wtsxoa4s0z/fYQ5gbws8Pcw9Mabf6LDfflO0WohH1b
   rml8DJ8MO78S/TtOhbOc97/xlKsBGqVIoLSUQnaY+r1+qPn4j1il891eG
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="313903751"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="313903751"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 19:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="575782332"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2022 19:45:38 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oGX3J-0008CU-29;
        Wed, 27 Jul 2022 02:45:37 +0000
Date:   Wed, 27 Jul 2022 10:45:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7d4edccc9bbfe1dcdff641343f7b0c6763fbe774
Message-ID: <62e0a6bd.GRNdPlb96xRtJz+a%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7d4edccc9bbfe1dcdff641343f7b0c6763fbe774  hwmon: (sht15) Fix wrong assumptions in device remove callback

elapsed time: 724m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
powerpc              randconfig-c003-20220724
i386                          randconfig-c001
arc                        nsimosci_defconfig
s390                             allmodconfig
sh                          rsk7264_defconfig
m68k                        m5272c3_defconfig
ia64                      gensparse_defconfig
alpha                            alldefconfig
arc                     nsimosci_hs_defconfig
sh                               j2_defconfig
powerpc                  iss476-smp_defconfig
powerpc                         ps3_defconfig
arm                        keystone_defconfig
arm                     eseries_pxa_defconfig
powerpc                  storcenter_defconfig
sh                           se7705_defconfig
m68k                       m5275evb_defconfig
arm                        shmobile_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                         mpc30x_defconfig
m68k                         apollo_defconfig
nios2                         10m50_defconfig
nios2                            allyesconfig
arc                          axs103_defconfig
nios2                               defconfig
powerpc                       eiger_defconfig
sparc64                          alldefconfig
arm                           sama5_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
x86_64                        randconfig-c001
arm                  randconfig-c002-20220724
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220724
riscv                randconfig-r042-20220724
s390                 randconfig-r044-20220724
s390                 randconfig-r044-20220726
riscv                randconfig-r042-20220726
arc                  randconfig-r043-20220726
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
mips                           rs90_defconfig
arm                  colibri_pxa300_defconfig
powerpc                     powernv_defconfig
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a006
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20220724
hexagon              randconfig-r045-20220724

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
