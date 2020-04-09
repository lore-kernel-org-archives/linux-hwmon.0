Return-Path: <SRS0=sjJb=5Z=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E18C2BA19
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 03:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7CF120757
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Apr 2020 03:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDIDdw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Apr 2020 23:33:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:15965 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgDIDdw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 8 Apr 2020 23:33:52 -0400
IronPort-SDR: pZSE4u2fQxgq4QLcbLQCOFH0Yn6M6IqiWjaxeY2+WZ0x4y3UMDLb1oZsc2l11TPSlIMJeXQVSW
 A3OnhI+tLMgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 20:33:52 -0700
IronPort-SDR: dvk3bqSNHuahaZThaClTS+uSid0wy4liTzeOSHTk3mt8OIOhgH3v9bWqM25LRaSECYEzj1v/TX
 dk36Ss6ZwzWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,361,1580803200"; 
   d="scan'208";a="453030182"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2020 20:33:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jMNws-0008YD-Fk; Thu, 09 Apr 2020 11:33:50 +0800
Date:   Thu, 09 Apr 2020 11:33:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 533123c81e3436cd8f5915efc5545002a6e37f8b
Message-ID: <5e8e9793.u+RXwriAlmjnGzVw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 533123c81e3436cd8f5915efc5545002a6e37f8b  hwmon: (drivetemp) Use drivetemp's true module name in Kconfig section

elapsed time: 1479m

configs tested: 147
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
ia64                             alldefconfig
m68k                          multi_defconfig
um                                  defconfig
sparc64                           allnoconfig
ia64                             allmodconfig
s390                             alldefconfig
i386                                defconfig
powerpc                             defconfig
um                           x86_64_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                              debian-10.3
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200408
x86_64               randconfig-a002-20200408
x86_64               randconfig-a003-20200408
i386                 randconfig-a001-20200408
i386                 randconfig-a002-20200408
i386                 randconfig-a003-20200408
mips                 randconfig-a001-20200408
nds32                randconfig-a001-20200408
m68k                 randconfig-a001-20200408
alpha                randconfig-a001-20200408
parisc               randconfig-a001-20200408
riscv                randconfig-a001-20200408
c6x                  randconfig-a001-20200408
h8300                randconfig-a001-20200408
microblaze           randconfig-a001-20200408
nios2                randconfig-a001-20200408
sparc64              randconfig-a001-20200408
csky                 randconfig-a001-20200408
openrisc             randconfig-a001-20200408
s390                 randconfig-a001-20200408
sh                   randconfig-a001-20200408
xtensa               randconfig-a001-20200408
x86_64               randconfig-b001-20200408
x86_64               randconfig-b002-20200408
x86_64               randconfig-b003-20200408
i386                 randconfig-b001-20200408
i386                 randconfig-b002-20200408
i386                 randconfig-b003-20200408
x86_64               randconfig-c001-20200408
x86_64               randconfig-c002-20200408
x86_64               randconfig-c003-20200408
i386                 randconfig-c001-20200408
i386                 randconfig-c002-20200408
i386                 randconfig-c003-20200408
x86_64               randconfig-d001-20200408
x86_64               randconfig-d003-20200408
i386                 randconfig-d003-20200408
i386                 randconfig-d001-20200408
x86_64               randconfig-d002-20200408
i386                 randconfig-d002-20200408
x86_64               randconfig-e002-20200408
i386                 randconfig-e003-20200408
i386                 randconfig-e001-20200408
x86_64               randconfig-e001-20200408
x86_64               randconfig-e003-20200408
i386                 randconfig-e002-20200408
x86_64               randconfig-h001-20200408
x86_64               randconfig-h002-20200408
x86_64               randconfig-h003-20200408
i386                 randconfig-h001-20200408
i386                 randconfig-h002-20200408
i386                 randconfig-h003-20200408
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                             i386_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
