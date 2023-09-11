Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42683CA0EC6
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Sep 2023 21:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240078AbjIKVRX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240870AbjIKO4M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Sep 2023 10:56:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF03DC
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Sep 2023 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694444163; x=1725980163;
  h=date:from:to:cc:subject:message-id;
  bh=grU3C9/SSLzmaK+zyA2uEWlrY4dvuEBzSZrZFDpA/5o=;
  b=ca58UWxa6MTPCT1+5hUpdx1KsNRh0NpjhO+281rJBeDSlpvOOC6CBcRF
   eIxQMLseVtjnCo9KSoEsniywHd5EV9kDgYeTrD1EPKnBoEhmrM0vsZu4u
   1jMTmbkWkllOG6h9O/6rVLJTBsV24rG+AFQnqkfSYAImEFMCzzrESz42O
   tYo7zSk1xvt26QstTkjkwxp6TJxxrFwQr2YmgpM5FkyID2ftPK8xfduFy
   tgrY8g2TmYvCYrZezhVgGdCljcby4iTM8O++d9G24mZHs88aYAyWmVi0e
   +KynvkRkveRqZH93/nnafntmv4/Dtu8KPDtPF464jsbmGgdC61xlFfKXP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368341149"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="368341149"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 07:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="886534470"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="886534470"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2023 07:54:53 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qfiJn-0006Mf-0Z;
        Mon, 11 Sep 2023 14:55:15 +0000
Date:   Mon, 11 Sep 2023 22:54:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 860bbe8e618fd62446309e286ab4a83d38201c0a
Message-ID: <202309112234.SGKDgpAw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 860bbe8e618fd62446309e286ab4a83d38201c0a  Watchdog: Remove redundant dev_err_probe() for platform_get_irq()

elapsed time: 815m

configs tested: 205
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230911   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20230911   gcc  
arc                  randconfig-r012-20230911   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20230911   gcc  
arm                  randconfig-r015-20230911   gcc  
arm                           sunxi_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230911   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230911   gcc  
csky                 randconfig-r011-20230911   gcc  
csky                 randconfig-r022-20230911   gcc  
hexagon               randconfig-001-20230911   clang
hexagon               randconfig-002-20230911   clang
hexagon              randconfig-r026-20230911   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230911   gcc  
i386         buildonly-randconfig-002-20230911   gcc  
i386         buildonly-randconfig-003-20230911   gcc  
i386         buildonly-randconfig-004-20230911   gcc  
i386         buildonly-randconfig-005-20230911   gcc  
i386         buildonly-randconfig-006-20230911   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230911   gcc  
i386                  randconfig-002-20230911   gcc  
i386                  randconfig-003-20230911   gcc  
i386                  randconfig-004-20230911   gcc  
i386                  randconfig-005-20230911   gcc  
i386                  randconfig-006-20230911   gcc  
i386                  randconfig-011-20230911   clang
i386                  randconfig-012-20230911   clang
i386                  randconfig-013-20230911   clang
i386                  randconfig-014-20230911   clang
i386                  randconfig-015-20230911   clang
i386                  randconfig-016-20230911   clang
i386                 randconfig-r005-20230911   gcc  
i386                 randconfig-r013-20230911   clang
i386                 randconfig-r026-20230911   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230911   gcc  
loongarch            randconfig-r005-20230911   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r033-20230911   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                          malta_defconfig   clang
mips                        omega2p_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r011-20230911   gcc  
mips                 randconfig-r016-20230911   gcc  
mips                 randconfig-r024-20230911   gcc  
mips                 randconfig-r036-20230911   clang
mips                   sb1250_swarm_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230911   gcc  
nios2                randconfig-r006-20230911   gcc  
nios2                randconfig-r016-20230911   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r011-20230911   gcc  
openrisc             randconfig-r034-20230911   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230911   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                     ep8248e_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8555_defconfig   gcc  
powerpc64            randconfig-r022-20230911   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230911   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230911   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r021-20230911   gcc  
sparc                randconfig-r031-20230911   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r002-20230911   gcc  
sparc64              randconfig-r004-20230911   gcc  
sparc64              randconfig-r014-20230911   gcc  
sparc64              randconfig-r023-20230911   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230911   gcc  
um                   randconfig-r025-20230911   gcc  
um                   randconfig-r032-20230911   clang
um                   randconfig-r035-20230911   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230911   gcc  
x86_64       buildonly-randconfig-002-20230911   gcc  
x86_64       buildonly-randconfig-003-20230911   gcc  
x86_64       buildonly-randconfig-004-20230911   gcc  
x86_64       buildonly-randconfig-005-20230911   gcc  
x86_64       buildonly-randconfig-006-20230911   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230911   clang
x86_64                randconfig-002-20230911   clang
x86_64                randconfig-003-20230911   clang
x86_64                randconfig-004-20230911   clang
x86_64                randconfig-005-20230911   clang
x86_64                randconfig-006-20230911   clang
x86_64                randconfig-011-20230911   gcc  
x86_64                randconfig-012-20230911   gcc  
x86_64                randconfig-013-20230911   gcc  
x86_64                randconfig-014-20230911   gcc  
x86_64                randconfig-015-20230911   gcc  
x86_64                randconfig-016-20230911   gcc  
x86_64                randconfig-071-20230911   gcc  
x86_64                randconfig-072-20230911   gcc  
x86_64                randconfig-073-20230911   gcc  
x86_64                randconfig-074-20230911   gcc  
x86_64                randconfig-075-20230911   gcc  
x86_64                randconfig-076-20230911   gcc  
x86_64               randconfig-r002-20230911   gcc  
x86_64               randconfig-r035-20230911   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r001-20230911   gcc  
xtensa               randconfig-r012-20230911   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
