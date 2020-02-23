Return-Path: <SRS0=8gzA=4L=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE833C35673
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Feb 2020 03:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9EBC1206D7
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Feb 2020 03:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgBWDpk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 Feb 2020 22:45:40 -0500
Received: from mga18.intel.com ([134.134.136.126]:44737 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbgBWDpk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Feb 2020 22:45:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Feb 2020 19:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,474,1574150400"; 
   d="scan'208";a="270466514"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2020 19:45:37 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j5iD3-000FuQ-3R; Sun, 23 Feb 2020 11:45:37 +0800
Date:   Sun, 23 Feb 2020 11:45:19 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 5c8507ffe058a14dbbd61c7ee513c888f0358c40
Message-ID: <5e51f54f.0CyWuyAyUPoeZ2Tb%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 5c8507ffe058a14dbbd61c7ee513c888f0358c40  hwmon: (lm73) Add support for of_match_table

elapsed time: 480m

configs tested: 164
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
riscv                               defconfig
s390                             allyesconfig
riscv                             allnoconfig
nds32                               defconfig
xtensa                          iss_defconfig
ia64                                defconfig
riscv                            allyesconfig
powerpc                             defconfig
sparc                               defconfig
sparc64                             defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200223
x86_64               randconfig-a002-20200223
x86_64               randconfig-a003-20200223
i386                 randconfig-a001-20200223
i386                 randconfig-a002-20200223
i386                 randconfig-a003-20200223
nds32                randconfig-a001-20200223
parisc               randconfig-a001-20200223
riscv                randconfig-a001-20200223
mips                 randconfig-a001-20200223
alpha                randconfig-a001-20200223
m68k                 randconfig-a001-20200223
nios2                randconfig-a001-20200223
c6x                  randconfig-a001-20200223
h8300                randconfig-a001-20200223
microblaze           randconfig-a001-20200223
sparc64              randconfig-a001-20200223
csky                 randconfig-a001-20200223
openrisc             randconfig-a001-20200223
s390                 randconfig-a001-20200223
sh                   randconfig-a001-20200223
xtensa               randconfig-a001-20200223
x86_64               randconfig-b001-20200223
x86_64               randconfig-b002-20200223
x86_64               randconfig-b003-20200223
i386                 randconfig-b001-20200223
i386                 randconfig-b002-20200223
i386                 randconfig-b003-20200223
x86_64               randconfig-c001-20200223
x86_64               randconfig-c002-20200223
x86_64               randconfig-c003-20200223
i386                 randconfig-c001-20200223
i386                 randconfig-c002-20200223
i386                 randconfig-c003-20200223
x86_64               randconfig-d001-20200223
x86_64               randconfig-d002-20200223
x86_64               randconfig-d003-20200223
i386                 randconfig-d001-20200223
i386                 randconfig-d002-20200223
i386                 randconfig-d003-20200223
x86_64               randconfig-e001-20200223
x86_64               randconfig-e002-20200223
x86_64               randconfig-e003-20200223
i386                 randconfig-e001-20200223
i386                 randconfig-e002-20200223
i386                 randconfig-e003-20200223
x86_64               randconfig-f001-20200223
x86_64               randconfig-f002-20200223
x86_64               randconfig-f003-20200223
i386                 randconfig-f001-20200223
i386                 randconfig-f002-20200223
i386                 randconfig-f003-20200223
x86_64               randconfig-g001-20200223
x86_64               randconfig-g002-20200223
x86_64               randconfig-g003-20200223
i386                 randconfig-g001-20200223
i386                 randconfig-g002-20200223
i386                 randconfig-g003-20200223
i386                 randconfig-h003-20200223
i386                 randconfig-h002-20200223
x86_64               randconfig-h002-20200223
x86_64               randconfig-h003-20200223
i386                 randconfig-h001-20200223
x86_64               randconfig-h001-20200223
arc                  randconfig-a001-20200223
arm                  randconfig-a001-20200223
arm64                randconfig-a001-20200223
ia64                 randconfig-a001-20200223
powerpc              randconfig-a001-20200223
sparc                randconfig-a001-20200223
riscv                            allmodconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
um                           x86_64_defconfig
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
