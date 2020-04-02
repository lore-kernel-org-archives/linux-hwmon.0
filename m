Return-Path: <SRS0=8m/r=5S=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECDDC18E5B
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Apr 2020 08:50:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81C04208E4
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Apr 2020 08:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387741AbgDBIuQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Apr 2020 04:50:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:47008 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728612AbgDBIuQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 2 Apr 2020 04:50:16 -0400
IronPort-SDR: aye1H5QttkQyqgh+XrIGPcTizOmUvv/A/5ry/4TDT5neIWglnjXI5C/1YW1EYK5iNbP1BcIDpR
 AWsN7czETpfg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2020 01:50:15 -0700
IronPort-SDR: QN25Z/C2SZGTEFw8IMnyQVKcsCL4rdME9mKbeutgvzYu+bXUkr6ji9uGBjgV7cg9O6kN+SPKly
 UGAa2utmjHDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,335,1580803200"; 
   d="scan'208";a="242466186"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2020 01:50:14 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJvYD-000AHH-Nd; Thu, 02 Apr 2020 16:50:13 +0800
Date:   Thu, 02 Apr 2020 16:49:42 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 4eb981e976791a08beede15a23cc862795e72afd
Message-ID: <5e85a726.aEE7RMpSjuH9WQO0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 4eb981e976791a08beede15a23cc862795e72afd  hwmon: (pmbus/isl68137) Fix up chip IDs

elapsed time: 941m

configs tested: 123
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
sh                          rsk7269_defconfig
m68k                       m5475evb_defconfig
ia64                                defconfig
powerpc                             defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
xtensa                          iss_defconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a003-20200401
i386                 randconfig-a002-20200401
x86_64               randconfig-a002-20200401
x86_64               randconfig-a001-20200401
i386                 randconfig-a003-20200401
i386                 randconfig-a001-20200401
alpha                randconfig-a001-20200401
m68k                 randconfig-a001-20200401
mips                 randconfig-a001-20200401
nds32                randconfig-a001-20200401
parisc               randconfig-a001-20200401
riscv                randconfig-a001-20200401
csky                 randconfig-a001-20200401
openrisc             randconfig-a001-20200401
s390                 randconfig-a001-20200401
sh                   randconfig-a001-20200401
xtensa               randconfig-a001-20200401
x86_64               randconfig-b001-20200401
x86_64               randconfig-b002-20200401
x86_64               randconfig-b003-20200401
i386                 randconfig-b001-20200401
i386                 randconfig-b002-20200401
i386                 randconfig-b003-20200401
x86_64               randconfig-d001-20200401
i386                 randconfig-d003-20200401
i386                 randconfig-d001-20200401
x86_64               randconfig-d002-20200401
i386                 randconfig-d002-20200401
x86_64               randconfig-g001-20200401
x86_64               randconfig-g002-20200401
x86_64               randconfig-g003-20200401
i386                 randconfig-g001-20200401
i386                 randconfig-g002-20200401
i386                 randconfig-g003-20200401
x86_64               randconfig-h002-20200401
i386                 randconfig-h002-20200401
i386                 randconfig-h003-20200401
i386                 randconfig-h001-20200401
x86_64               randconfig-h001-20200401
x86_64               randconfig-h003-20200401
arm64                randconfig-a001-20200401
sparc                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
arc                  randconfig-a001-20200401
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
s390                          debug_defconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                             alldefconfig
s390                                defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc64                             defconfig
sparc64                          allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
