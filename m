Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EE1C1B0E3
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 10:48:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3928722C7D
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 10:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgLNKsH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Dec 2020 05:48:07 -0500
Received: from mga02.intel.com ([134.134.136.20]:7953 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730596AbgLNKsE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Dec 2020 05:48:04 -0500
IronPort-SDR: dVl7M0tn/K71HIVkWIk+ZAZEFoC4vkYQNnA9vOIW2Na6SBaIaQWVieTATbkT7nJPYtAD9f9vji
 X5LR1bZt1qRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="161738595"
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="161738595"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2020 02:47:15 -0800
IronPort-SDR: z1a/NMQvzMdz3Q8JvHvCogAtbxgxd+m6Jyqt4I4rlqwCGTSUVXdmoBT3VD7kGufWEX1pU0pSaQ
 zv5MDWctUKDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,418,1599548400"; 
   d="scan'208";a="486988897"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2020 02:47:14 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kolNp-0000Fl-RO; Mon, 14 Dec 2020 10:47:13 +0000
Date:   Mon, 14 Dec 2020 18:46:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 fa4e534ad44517e950d7eb5b4f50638b9bb17f95
Message-ID: <5fd74279.94k0R9UvTszOWbmp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: fa4e534ad44517e950d7eb5b4f50638b9bb17f95  dt-binding: watchdog: add Rockchip compatibles to snps,dw-wdt.yaml

elapsed time: 722m

configs tested: 97
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
arm                         lpc18xx_defconfig
sh                         ap325rxa_defconfig
powerpc                     pq2fads_defconfig
openrisc                 simple_smp_defconfig
arm                        shmobile_defconfig
powerpc                       ppc64_defconfig
powerpc                    gamecube_defconfig
powerpc                   currituck_defconfig
ia64                            zx1_defconfig
xtensa                              defconfig
powerpc                 xes_mpc85xx_defconfig
mips                          rm200_defconfig
powerpc                      acadia_defconfig
powerpc                     tqm8548_defconfig
arm                          lpd270_defconfig
mips                   sb1250_swarm_defconfig
arm                  colibri_pxa300_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
sh                           se7724_defconfig
powerpc                      walnut_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
