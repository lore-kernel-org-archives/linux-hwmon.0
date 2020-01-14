Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A144C33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 08:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2BE762084D
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 08:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgANIpZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 03:45:25 -0500
Received: from mga17.intel.com ([192.55.52.151]:16329 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgANIpZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 03:45:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Jan 2020 00:45:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,432,1571727600"; 
   d="scan'208";a="273272192"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jan 2020 00:45:24 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1irHpD-000IPk-KA; Tue, 14 Jan 2020 16:45:23 +0800
Date:   Tue, 14 Jan 2020 16:44:41 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 a18924ed5b723baafb3f9a79f8eadb283e2793a4
Message-ID: <5e1d7f79.wuytZok9j9tGHvyy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: a18924ed5b723baafb3f9a79f8eadb283e2793a4  MAINTAINERS: add entry for ADM1177 driver

elapsed time: 1509m

configs tested: 110
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
parisc                         b180_defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
parisc                            allnoconfig
parisc                            allyesonfig
parisc                        c3000_defconfig
parisc                              defconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
i386                             alldefconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
s390                 randconfig-a001-20200113
csky                 randconfig-a001-20200113
sh                   randconfig-a001-20200113
xtensa               randconfig-a001-20200113
openrisc             randconfig-a001-20200113
arc                  randconfig-a001-20200114
arm                  randconfig-a001-20200114
arm64                randconfig-a001-20200114
ia64                 randconfig-a001-20200114
powerpc              randconfig-a001-20200114
sparc                randconfig-a001-20200114
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                 randconfig-h001-20200114
i386                 randconfig-h002-20200114
i386                 randconfig-h003-20200114
csky                 randconfig-a001-20200114
openrisc             randconfig-a001-20200114
s390                 randconfig-a001-20200114
sh                   randconfig-a001-20200114
xtensa               randconfig-a001-20200114
c6x                  randconfig-a001-20200114
h8300                randconfig-a001-20200114
microblaze           randconfig-a001-20200114
nios2                randconfig-a001-20200114
sparc64              randconfig-a001-20200114
x86_64               randconfig-f001-20200114
x86_64               randconfig-f002-20200114
x86_64               randconfig-f003-20200114
i386                 randconfig-f001-20200114
i386                 randconfig-f002-20200114
i386                 randconfig-f003-20200114
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                               rhel-7.6
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
x86_64               randconfig-b002-20200114
i386                 randconfig-b001-20200114
i386                 randconfig-b002-20200114
i386                 randconfig-b003-20200114
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
x86_64               randconfig-c002-20200112
i386                 randconfig-c003-20200112
i386                 randconfig-c001-20200112

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
