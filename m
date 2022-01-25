Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A73C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jan 2022 16:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1585988AbiAYQu7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 25 Jan 2022 11:50:59 -0500
Received: from mga09.intel.com ([134.134.136.24]:37018 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1586444AbiAYQth (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jan 2022 11:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643129377; x=1674665377;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t7QpXxGktFMSlchq9Jx8MjkKI/wARAyA0qox3PrGqIw=;
  b=Uw2UUdS1NqcV7x2PnWvxM1swZ3OZdt5SuuhKMt/J2HVjCgfMR0AMoiMR
   1tje27Ld5Y000Ke2AaSMJTW2IH6F1fXiCFdf52hrA7s6eIntY/xOcHzw7
   HyFfNXbf/Gzf82BSvVJlpQgH+HaDiwB/+WZJpoZoDKUa1E9tzYE0x1yr6
   CdiKIxBqbY/VL/w0Qkf1SsKUvk5xZaiuvyJG4hEfyKfg/E2t0bWkBvld5
   8KnI+V2FlPNnbyFahxeCv9QsMmu3caNxn8S3IjPRr9Lad65O1Wg5lmITI
   Je+N+Eo4FeY5i5bjhvNvqPRQc0lBgZuIkVaRJjEjyiOuQlNnsOsbdTqTl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246128906"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="246128906"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 08:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; 
   d="scan'208";a="520448473"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Jan 2022 08:48:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nCOzK-000KBz-5t; Tue, 25 Jan 2022 16:48:10 +0000
Date:   Wed, 26 Jan 2022 00:47:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 79da533d3cc717ccc05ddbd3190da8a72bc2408b
Message-ID: <61f029b0.k0PfHGizAwfwWu8u%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 79da533d3cc717ccc05ddbd3190da8a72bc2408b  hwmon: (nct6775) Fix crash in clear_caseopen

elapsed time: 728m

configs tested: 160
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
sh                 kfr2r09-romimage_defconfig
mips                         bigsur_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     rainier_defconfig
mips                      maltasmvp_defconfig
powerpc                    sam440ep_defconfig
arc                            hsdk_defconfig
sh                           se7722_defconfig
mips                     decstation_defconfig
sparc                       sparc64_defconfig
powerpc                      ppc6xx_defconfig
mips                            gpr_defconfig
arc                          axs101_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     asp8347_defconfig
powerpc                           allnoconfig
um                                  defconfig
m68k                             allyesconfig
sh                          kfr2r09_defconfig
nios2                         10m50_defconfig
powerpc                     sequoia_defconfig
arm                           h5000_defconfig
riscv                    nommu_k210_defconfig
m68k                          atari_defconfig
openrisc                            defconfig
csky                                defconfig
powerpc                     tqm8548_defconfig
sh                           se7206_defconfig
arm                        mvebu_v7_defconfig
arm                           viper_defconfig
xtensa                generic_kc705_defconfig
openrisc                         alldefconfig
sh                           sh2007_defconfig
sh                          r7780mp_defconfig
mips                  maltasmvp_eva_defconfig
sh                             shx3_defconfig
parisc                generic-32bit_defconfig
openrisc                  or1klitex_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                        m5272c3_defconfig
arc                          axs103_defconfig
powerpc                    amigaone_defconfig
arm                            lart_defconfig
arc                         haps_hs_defconfig
mips                        bcm47xx_defconfig
xtensa                          iss_defconfig
arm                  randconfig-c002-20220124
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
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
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a001-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220124
riscv                randconfig-r042-20220125
arc                  randconfig-r043-20220125
s390                 randconfig-r044-20220125
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
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
mips                        workpad_defconfig
mips                     loongson2k_defconfig
mips                  cavium_octeon_defconfig
mips                        omega2p_defconfig
powerpc                    mvme5100_defconfig
arm                         lpc32xx_defconfig
riscv                          rv32_defconfig
mips                        bcm63xx_defconfig
powerpc                     tqm5200_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
mips                     cu1830-neo_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
arm                     davinci_all_defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
mips                           ip28_defconfig
riscv                    nommu_virt_defconfig
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220125
hexagon              randconfig-r045-20220124
hexagon              randconfig-r041-20220125
hexagon              randconfig-r041-20220124
s390                 randconfig-r044-20220124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
