Return-Path: <SRS0=kKRA=55=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0F9C2BA19
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Apr 2020 06:19:47 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6912206A1
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Apr 2020 06:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6912206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-hwmon-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgDMGTr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Apr 2020 02:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgDMGTr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Apr 2020 02:19:47 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EE5C0A3BE0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2020 23:19:46 -0700 (PDT)
IronPort-SDR: my+AlGBOEv6ONfJeym2fsZSHbzHGbsWACco3K4RbwiO4pK+BmxyHRUQ/3nreA1KgtakTHXfG8/
 wF0Pb8/URhmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2020 23:19:45 -0700
IronPort-SDR: oJWaeHy5izdK1EMHiZCXvt8mJ+z6s6tNLipjYxONBFVovaWjmLe7zF1pOyX0CW5X+nqra8X/jV
 QawGrQRVqtjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; 
   d="scan'208";a="399518532"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2020 23:19:44 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jNsRb-0006Hb-Ii; Mon, 13 Apr 2020 14:19:43 +0800
Date:   Mon, 13 Apr 2020 14:18:28 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 635049d0e3a0464a63e85b382640446e06d581a7
Message-ID: <5e940434.NuVEh00aNTdyO5LQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 635049d0e3a0464a63e85b382640446e06d581a7  hwmon: (dell-smm) Use one DMI match for all XPS models

elapsed time: 481m

configs tested: 165
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
m68k                           sun3_defconfig
s390                             allmodconfig
riscv                            allyesconfig
riscv                          rv32_defconfig
c6x                        evmc6678_defconfig
parisc                           allyesconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
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
x86_64               randconfig-a001-20200413
x86_64               randconfig-a002-20200413
x86_64               randconfig-a003-20200413
i386                 randconfig-a001-20200413
i386                 randconfig-a002-20200413
i386                 randconfig-a003-20200413
mips                 randconfig-a001-20200412
nds32                randconfig-a001-20200412
riscv                randconfig-a001-20200412
m68k                 randconfig-a001-20200412
parisc               randconfig-a001-20200412
alpha                randconfig-a001-20200412
c6x                  randconfig-a001-20200412
h8300                randconfig-a001-20200412
microblaze           randconfig-a001-20200412
nios2                randconfig-a001-20200412
sparc64              randconfig-a001-20200412
s390                 randconfig-a001-20200413
xtensa               randconfig-a001-20200413
sh                   randconfig-a001-20200413
openrisc             randconfig-a001-20200413
csky                 randconfig-a001-20200413
x86_64               randconfig-b001-20200412
x86_64               randconfig-b002-20200412
x86_64               randconfig-b003-20200412
i386                 randconfig-b001-20200412
i386                 randconfig-b002-20200412
i386                 randconfig-b003-20200412
x86_64               randconfig-d001-20200412
x86_64               randconfig-d002-20200412
x86_64               randconfig-d003-20200412
i386                 randconfig-d001-20200412
i386                 randconfig-d002-20200412
i386                 randconfig-d003-20200412
x86_64               randconfig-e001-20200412
x86_64               randconfig-e002-20200412
x86_64               randconfig-e003-20200412
i386                 randconfig-e001-20200412
i386                 randconfig-e002-20200412
i386                 randconfig-e003-20200412
x86_64               randconfig-f001-20200412
x86_64               randconfig-f002-20200412
x86_64               randconfig-f003-20200412
i386                 randconfig-f001-20200412
i386                 randconfig-f002-20200412
i386                 randconfig-f003-20200412
x86_64               randconfig-g001-20200412
x86_64               randconfig-g002-20200412
x86_64               randconfig-g003-20200412
i386                 randconfig-g001-20200412
i386                 randconfig-g002-20200412
i386                 randconfig-g003-20200412
x86_64               randconfig-h001-20200413
i386                 randconfig-h003-20200413
i386                 randconfig-h002-20200413
i386                 randconfig-h001-20200413
x86_64               randconfig-h002-20200413
x86_64               randconfig-h001-20200412
x86_64               randconfig-h002-20200412
x86_64               randconfig-h003-20200412
i386                 randconfig-h001-20200412
i386                 randconfig-h002-20200412
i386                 randconfig-h003-20200412
arc                  randconfig-a001-20200412
arm                  randconfig-a001-20200412
arm64                randconfig-a001-20200412
ia64                 randconfig-a001-20200412
powerpc              randconfig-a001-20200412
sparc                randconfig-a001-20200412
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
s390                             alldefconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
