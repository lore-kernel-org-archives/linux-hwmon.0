Return-Path: <SRS0=0qjx=3M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EF1C2D0DB
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Jan 2020 10:17:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 779382253D
	for <linux-hwmon@archiver.kernel.org>; Thu, 23 Jan 2020 10:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgAWKRf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 23 Jan 2020 05:17:35 -0500
Received: from mga05.intel.com ([192.55.52.43]:59936 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgAWKRf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Jan 2020 05:17:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 02:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; 
   d="scan'208";a="222305571"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2020 02:17:33 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iuZYL-0007ly-6u; Thu, 23 Jan 2020 18:17:33 +0800
Date:   Thu, 23 Jan 2020 18:16:42 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 46215c08d2d45fcf905553199073dadf2463c3b6
Message-ID: <5e29728a.d1K7UGeFp014Uwm4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 46215c08d2d45fcf905553199073dadf2463c3b6  hwmon: (k10temp) Add debugfs support

elapsed time: 824m

configs tested: 165
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arm                           sunxi_defconfig
ia64                              allnoconfig
x86_64               randconfig-a001-20200123
x86_64               randconfig-a002-20200123
x86_64               randconfig-a003-20200123
i386                 randconfig-a001-20200123
i386                 randconfig-a002-20200123
i386                 randconfig-a003-20200123
x86_64               randconfig-h001-20200123
x86_64               randconfig-h002-20200123
x86_64               randconfig-h003-20200123
i386                 randconfig-h001-20200123
i386                 randconfig-h002-20200123
i386                 randconfig-h003-20200123
x86_64               randconfig-f001-20200123
x86_64               randconfig-f002-20200123
x86_64               randconfig-f003-20200123
i386                 randconfig-f001-20200123
i386                 randconfig-f002-20200123
i386                 randconfig-f003-20200123
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
c6x                  randconfig-a001-20200123
h8300                randconfig-a001-20200123
microblaze           randconfig-a001-20200123
nios2                randconfig-a001-20200123
sparc64              randconfig-a001-20200123
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
alpha                randconfig-a001-20200123
m68k                 randconfig-a001-20200123
mips                 randconfig-a001-20200123
nds32                randconfig-a001-20200123
parisc               randconfig-a001-20200123
riscv                randconfig-a001-20200123
m68k                          multi_defconfig
m68k                       m5475evb_defconfig
h8300                    h8300h-sim_defconfig
h8300                     edosk2674_defconfig
m68k                           sun3_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
openrisc             randconfig-a001-20200123
csky                 randconfig-a001-20200123
xtensa               randconfig-a001-20200123
sh                   randconfig-a001-20200123
s390                 randconfig-a001-20200123
x86_64               randconfig-b001-20200123
x86_64               randconfig-b002-20200123
x86_64               randconfig-b003-20200123
i386                 randconfig-b001-20200123
i386                 randconfig-b002-20200123
i386                 randconfig-b003-20200123
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6
c6x                        evmc6678_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
arc                  randconfig-a001-20200123
arm                  randconfig-a001-20200123
arm64                randconfig-a001-20200123
ia64                 randconfig-a001-20200123
powerpc              randconfig-a001-20200123
sparc                randconfig-a001-20200123
c6x                              allyesconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64               randconfig-e001-20200123
x86_64               randconfig-e002-20200123
x86_64               randconfig-e003-20200123
i386                 randconfig-e001-20200123
i386                 randconfig-e002-20200123
i386                 randconfig-e003-20200123
x86_64               randconfig-c001-20200123
x86_64               randconfig-c002-20200123
x86_64               randconfig-c003-20200123
i386                 randconfig-c001-20200123
i386                 randconfig-c002-20200123
i386                 randconfig-c003-20200123
x86_64               randconfig-g001-20200123
x86_64               randconfig-g002-20200123
x86_64               randconfig-g003-20200123
i386                 randconfig-g001-20200123
i386                 randconfig-g002-20200123
i386                 randconfig-g003-20200123
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
x86_64               randconfig-d001-20200123
x86_64               randconfig-d002-20200123
x86_64               randconfig-d003-20200123
i386                 randconfig-d001-20200123
i386                 randconfig-d002-20200123
i386                 randconfig-d003-20200123

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
