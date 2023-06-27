Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4EEEB64D9
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jun 2023 01:09:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjF0BJf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jun 2023 21:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjF0BJe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jun 2023 21:09:34 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0767134
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jun 2023 18:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687828173; x=1719364173;
  h=date:from:to:cc:subject:message-id;
  bh=giJSR8O+5jq7oWVYA159HperHLK/mfruDfcRZaHgS6g=;
  b=fGQOBsruGDiUKiedz2OrGNW70pM70AjcJsDNpdCZa96Z/c8nUBBDlGAy
   AX6sZTvY23hWUqqGFG+7tBV0HMDOQvvbKE4/2PFveG9NHcaJKkDJXRjXd
   ENlteWToaHMx/b+TU7usf3MQLXpJ8THzWhW1TmD8ZMAHpjtbwk8iPumlH
   vrJYva5t1bWpaQS7cMiW2D2Q3gTPJdP+fdt4Pats2BePmT3E5EQkaQPLV
   WwZsPgnr4UHMfvnbUsQl4uwKu1rQ2zd4xnh4wkZkCAwIsNftiL5YzKgTW
   KOJ9wB765pM1VMk0SdiRl0f0pY5t2xpWpQ50gNDea4P1OTjiMb7+KKVyY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364886521"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="364886521"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 18:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="666496987"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="scan'208";a="666496987"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Jun 2023 18:09:32 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qDxD1-000B80-2S;
        Tue, 27 Jun 2023 01:09:31 +0000
Date:   Tue, 27 Jun 2023 09:08:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
Message-ID: <202306270956.2le9hjAO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b  hwmon: (oxp-sensors) Add support for AOKZOE A1 PRO

elapsed time: 2694m

configs tested: 145
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230625   gcc  
arc                  randconfig-r003-20230625   gcc  
arc                  randconfig-r005-20230625   gcc  
arc                  randconfig-r011-20230625   gcc  
arc                  randconfig-r025-20230625   gcc  
arc                  randconfig-r043-20230625   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                          collie_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                          ixp4xx_defconfig   clang
arm                            mmp2_defconfig   clang
arm                        mvebu_v7_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm                  randconfig-r021-20230625   gcc  
arm                  randconfig-r034-20230625   clang
arm                  randconfig-r046-20230625   gcc  
arm                         s5pv210_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230625   gcc  
arm64                randconfig-r026-20230625   clang
csky                             alldefconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230625   gcc  
hexagon              randconfig-r002-20230625   clang
hexagon              randconfig-r041-20230625   clang
hexagon              randconfig-r045-20230625   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230625   gcc  
i386         buildonly-randconfig-r005-20230625   gcc  
i386         buildonly-randconfig-r006-20230625   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230625   gcc  
i386                 randconfig-i002-20230625   gcc  
i386                 randconfig-i003-20230625   gcc  
i386                 randconfig-i004-20230625   gcc  
i386                 randconfig-i005-20230625   gcc  
i386                 randconfig-i006-20230625   gcc  
i386                 randconfig-i011-20230625   clang
i386                 randconfig-i012-20230625   clang
i386                 randconfig-i013-20230625   clang
i386                 randconfig-i014-20230625   clang
i386                 randconfig-i015-20230625   clang
i386                 randconfig-i016-20230625   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230625   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r014-20230625   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                       lemote2f_defconfig   clang
mips                      maltaaprp_defconfig   clang
mips                           mtx1_defconfig   clang
mips                 randconfig-r025-20230625   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r022-20230625   gcc  
openrisc             randconfig-r016-20230625   gcc  
openrisc             randconfig-r026-20230625   gcc  
openrisc             randconfig-r035-20230625   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r012-20230625   gcc  
parisc               randconfig-r024-20230625   gcc  
parisc               randconfig-r036-20230625   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
powerpc                 mpc85xx_cds_defconfig   gcc  
powerpc                      obs600_defconfig   clang
powerpc                     rainier_defconfig   gcc  
powerpc              randconfig-r006-20230625   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r023-20230625   clang
riscv                randconfig-r042-20230625   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230625   clang
s390                       zfcpdump_defconfig   gcc  
sh                               allmodconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                   randconfig-r013-20230625   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r021-20230625   gcc  
sparc64              randconfig-r031-20230625   gcc  
sparc64              randconfig-r033-20230625   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230625   gcc  
x86_64       buildonly-randconfig-r002-20230625   gcc  
x86_64       buildonly-randconfig-r003-20230625   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
