Return-Path: <SRS0=Jxdb=5H=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1589FC4332D
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Mar 2020 08:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2F9D20774
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Mar 2020 08:02:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbgCVICT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Mar 2020 04:02:19 -0400
Received: from mga07.intel.com ([134.134.136.100]:44734 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726137AbgCVICT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Mar 2020 04:02:19 -0400
IronPort-SDR: JtyRqPlyEOfDIKApcUBujDXK2dBk+8scXV2QDjb0UCdrI3jTH18niNH31013pKR9YNMGDj9S9L
 TjWBt7xIbJDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2020 01:02:18 -0700
IronPort-SDR: 9ccLiCwx/cD/okeF5WJt8Z29pH224eYG4tw3OGFOq+sGPDfy2QVX44RAAKCKKFvcccris0ledT
 94WrpRHscD8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,291,1580803200"; 
   d="scan'208";a="392585796"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Mar 2020 01:02:17 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jFvYm-000BEW-AD; Sun, 22 Mar 2020 16:02:16 +0800
Date:   Sun, 22 Mar 2020 16:02:10 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 0d939f12b4395dc0f64711e5f0895afeb7a1f8a2
Message-ID: <5e771b82.wXg+ctH9MTN0yEee%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 0d939f12b4395dc0f64711e5f0895afeb7a1f8a2  docs: hwmon: Update documentation for isl68137 pmbus driver

elapsed time: 590m

configs tested: 149
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
powerpc                             defconfig
csky                                defconfig
s390                              allnoconfig
arc                              allyesconfig
nios2                         3c120_defconfig
ia64                             allyesconfig
sh                            titan_defconfig
sh                               allmodconfig
riscv                               defconfig
nds32                               defconfig
openrisc                    or1ksim_defconfig
h8300                    h8300h-sim_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             alldefconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
nds32                             allnoconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
mips                 randconfig-a001-20200322
nds32                randconfig-a001-20200322
m68k                 randconfig-a001-20200322
parisc               randconfig-a001-20200322
alpha                randconfig-a001-20200322
riscv                randconfig-a001-20200322
c6x                  randconfig-a001-20200322
h8300                randconfig-a001-20200322
microblaze           randconfig-a001-20200322
nios2                randconfig-a001-20200322
sparc64              randconfig-a001-20200322
s390                 randconfig-a001-20200322
csky                 randconfig-a001-20200322
xtensa               randconfig-a001-20200322
openrisc             randconfig-a001-20200322
sh                   randconfig-a001-20200322
i386                 randconfig-b003-20200322
i386                 randconfig-b001-20200322
x86_64               randconfig-b003-20200322
i386                 randconfig-b002-20200322
x86_64               randconfig-b002-20200322
x86_64               randconfig-c001-20200322
x86_64               randconfig-c002-20200322
x86_64               randconfig-c003-20200322
i386                 randconfig-c001-20200322
i386                 randconfig-c002-20200322
i386                 randconfig-c003-20200322
i386                 randconfig-d003-20200322
i386                 randconfig-d001-20200322
i386                 randconfig-d002-20200322
x86_64               randconfig-d001-20200322
x86_64               randconfig-d003-20200322
x86_64               randconfig-d002-20200322
x86_64               randconfig-e001-20200322
x86_64               randconfig-e002-20200322
x86_64               randconfig-e003-20200322
i386                 randconfig-e001-20200322
i386                 randconfig-e002-20200322
i386                 randconfig-e003-20200322
i386                 randconfig-f001-20200322
i386                 randconfig-f003-20200322
i386                 randconfig-f002-20200322
x86_64               randconfig-f002-20200322
x86_64               randconfig-f003-20200322
x86_64               randconfig-f001-20200322
i386                 randconfig-g003-20200322
x86_64               randconfig-g002-20200322
i386                 randconfig-g001-20200322
i386                 randconfig-g002-20200322
x86_64               randconfig-g001-20200322
x86_64               randconfig-g003-20200322
arm                  randconfig-a001-20200322
arm64                randconfig-a001-20200322
ia64                 randconfig-a001-20200322
arc                  randconfig-a001-20200322
sparc                randconfig-a001-20200322
powerpc              randconfig-a001-20200322
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
