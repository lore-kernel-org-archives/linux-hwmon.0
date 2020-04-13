Return-Path: <SRS0=kKRA=55=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1997BC2BB1D
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Apr 2020 06:19:49 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC5A3206A1
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Apr 2020 06:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC5A3206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-hwmon-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgDMGTs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Apr 2020 02:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgDMGTs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Apr 2020 02:19:48 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C429C0A3BE0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2020 23:19:48 -0700 (PDT)
IronPort-SDR: pVBMDdkd8IMHBcGiTSpBcZ/LcHbPCb52VJ6tOCbtMQPstl+9xTqe/W0w2ZFcQtg+JbliuBdOcg
 UiTkUY5taGxg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2020 23:19:46 -0700
IronPort-SDR: QkWlxFTiyk21sOXLi3mj1gjZ/GNNy98BaaBgdgrN4FqeIFKSn7JL0hMqUeyCznJltVndIVwNa3
 ELf6//yfl5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; 
   d="scan'208";a="266321527"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Apr 2020 23:19:46 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jNsRd-0006W6-O0; Mon, 13 Apr 2020 14:19:45 +0800
Date:   Mon, 13 Apr 2020 14:18:26 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 0e786f328b382e6df64f31390973b81f8fb9a044
Message-ID: <5e940432.WjQxL8BehQ2b3ZqY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 0e786f328b382e6df64f31390973b81f8fb9a044  hwmon: (k10temp) make some symbols static

elapsed time: 481m

configs tested: 160
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
riscv                               defconfig
xtensa                          iss_defconfig
ia64                                defconfig
powerpc                             defconfig
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
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
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
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200413
x86_64               randconfig-a002-20200413
x86_64               randconfig-a003-20200413
i386                 randconfig-a001-20200413
i386                 randconfig-a002-20200413
i386                 randconfig-a003-20200413
alpha                randconfig-a001-20200412
m68k                 randconfig-a001-20200412
mips                 randconfig-a001-20200412
nds32                randconfig-a001-20200412
parisc               randconfig-a001-20200412
riscv                randconfig-a001-20200412
c6x                  randconfig-a001-20200412
h8300                randconfig-a001-20200412
microblaze           randconfig-a001-20200412
nios2                randconfig-a001-20200412
sparc64              randconfig-a001-20200412
csky                 randconfig-a001-20200413
openrisc             randconfig-a001-20200413
s390                 randconfig-a001-20200413
sh                   randconfig-a001-20200413
xtensa               randconfig-a001-20200413
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
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
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
