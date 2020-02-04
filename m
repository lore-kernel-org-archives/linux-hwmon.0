Return-Path: <SRS0=BD+L=3Y=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E34C3524D
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Feb 2020 19:40:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FF142166E
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Feb 2020 19:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgBDTkf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Feb 2020 14:40:35 -0500
Received: from mga01.intel.com ([192.55.52.88]:7966 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727385AbgBDTkf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 4 Feb 2020 14:40:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 11:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="342183841"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2020 11:40:33 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1iz43l-0002Bc-EF; Wed, 05 Feb 2020 03:40:33 +0800
Date:   Wed, 05 Feb 2020 03:39:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 7fee59f207819f1a57a66c176f81fc966d6e4f01
Message-ID: <5e39c87b.vcUPKNxqYip2Cn5F%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 7fee59f207819f1a57a66c176f81fc966d6e4f01  hwmon: (pmbus/ltc2978) Fix PMBus polling of MFR_COMMON definitions.

elapsed time: 2883m

configs tested: 191
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm64                               defconfig
sparc                            allyesconfig
openrisc                    or1ksim_defconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
alpha                               defconfig
riscv                               defconfig
s390                          debug_defconfig
xtensa                          iss_defconfig
ia64                             alldefconfig
microblaze                      mmu_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                         b180_defconfig
parisc                        c3000_defconfig
parisc                              defconfig
x86_64               randconfig-a001-20200202
x86_64               randconfig-a002-20200202
x86_64               randconfig-a003-20200202
i386                 randconfig-a001-20200202
i386                 randconfig-a002-20200202
i386                 randconfig-a003-20200202
x86_64               randconfig-a001-20200203
x86_64               randconfig-a002-20200203
i386                 randconfig-a001-20200203
i386                 randconfig-a003-20200203
alpha                randconfig-a001-20200203
m68k                 randconfig-a001-20200203
mips                 randconfig-a001-20200203
nds32                randconfig-a001-20200203
parisc               randconfig-a001-20200203
riscv                randconfig-a001-20200203
alpha                randconfig-a001-20200202
m68k                 randconfig-a001-20200202
nds32                randconfig-a001-20200202
parisc               randconfig-a001-20200202
riscv                randconfig-a001-20200202
mips                 randconfig-a001-20200202
c6x                  randconfig-a001-20200203
h8300                randconfig-a001-20200203
microblaze           randconfig-a001-20200203
nios2                randconfig-a001-20200203
sparc64              randconfig-a001-20200203
sh                   randconfig-a001-20200202
s390                 randconfig-a001-20200202
csky                 randconfig-a001-20200202
xtensa               randconfig-a001-20200202
openrisc             randconfig-a001-20200202
csky                 randconfig-a001-20200203
openrisc             randconfig-a001-20200203
s390                 randconfig-a001-20200203
sh                   randconfig-a001-20200203
xtensa               randconfig-a001-20200203
x86_64               randconfig-b001-20200202
x86_64               randconfig-b003-20200202
i386                 randconfig-b001-20200202
i386                 randconfig-b003-20200202
x86_64               randconfig-b002-20200202
i386                 randconfig-b002-20200202
x86_64               randconfig-c001-20200202
x86_64               randconfig-c002-20200202
x86_64               randconfig-c003-20200202
i386                 randconfig-c001-20200202
i386                 randconfig-c002-20200202
i386                 randconfig-c003-20200202
x86_64               randconfig-c001-20200203
x86_64               randconfig-c002-20200203
x86_64               randconfig-c003-20200203
i386                 randconfig-c001-20200203
i386                 randconfig-c002-20200203
i386                 randconfig-c003-20200203
x86_64               randconfig-d001-20200202
x86_64               randconfig-d002-20200202
x86_64               randconfig-d003-20200202
i386                 randconfig-d001-20200202
i386                 randconfig-d002-20200202
i386                 randconfig-d003-20200202
x86_64               randconfig-e002-20200202
x86_64               randconfig-e003-20200202
i386                 randconfig-e001-20200202
i386                 randconfig-e002-20200202
i386                 randconfig-e003-20200202
x86_64               randconfig-e001-20200202
x86_64               randconfig-f001-20200202
x86_64               randconfig-f002-20200202
x86_64               randconfig-f003-20200202
i386                 randconfig-f001-20200202
i386                 randconfig-f002-20200202
i386                 randconfig-f003-20200202
x86_64               randconfig-g001-20200202
x86_64               randconfig-g002-20200202
x86_64               randconfig-g003-20200202
i386                 randconfig-g001-20200202
i386                 randconfig-g002-20200202
i386                 randconfig-g003-20200202
x86_64               randconfig-h001-20200202
x86_64               randconfig-h002-20200202
x86_64               randconfig-h003-20200202
i386                 randconfig-h001-20200202
i386                 randconfig-h002-20200202
i386                 randconfig-h003-20200202
ia64                 randconfig-a001-20200203
arm                  randconfig-a001-20200203
arc                  randconfig-a001-20200203
arm64                randconfig-a001-20200203
powerpc              randconfig-a001-20200203
arc                  randconfig-a001-20200202
arm                  randconfig-a001-20200202
arm64                randconfig-a001-20200202
ia64                 randconfig-a001-20200202
powerpc              randconfig-a001-20200202
sparc                randconfig-a001-20200202
riscv                            allmodconfig
riscv                             allnoconfig
riscv                    nommu_virt_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                             defconfig
sparc64                          allmodconfig
sparc64                          allyesconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
