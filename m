Return-Path: <SRS0=zIh4=74=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D644C433E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jun 2020 08:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86F922053B
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jun 2020 08:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728756AbgFOIVP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Jun 2020 04:21:15 -0400
Received: from mga01.intel.com ([192.55.52.88]:4086 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728369AbgFOIVO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jun 2020 04:21:14 -0400
IronPort-SDR: 4+9aVU0zpUGskrIXqftg1B8b4zQQT1dzvubw62wntRmVKprh13fobPVV4mnwCcd8RirClRvcw5
 kNeU+cu2GSBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 01:21:14 -0700
IronPort-SDR: 6ecsqHnjsfq+E1obw8lXKY0JBuX6YGDoChO+uFYspoVkT/+xCxA7V0kVL66Ai+o7JFLaenycST
 niI7A7K0QH0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="351288234"
Received: from lkp-server01.sh.intel.com (HELO 7da8aae59540) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2020 01:21:12 -0700
Received: from kbuild by 7da8aae59540 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jkkMi-00000n-3J; Mon, 15 Jun 2020 08:21:12 +0000
Date:   Mon, 15 Jun 2020 16:21:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 5093411241c596bf8c64c73e5e4a1227bfeda31b
Message-ID: <5ee72f6e.6RzVijlVNfYf9OfT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 5093411241c596bf8c64c73e5e4a1227bfeda31b  hwmon: (nct6683) Replace container_of() with  kobj_to_dev()

elapsed time: 480m

configs tested: 117
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
sh                          rsk7269_defconfig
arc                        nsim_700_defconfig
powerpc                       holly_defconfig
sparc64                          alldefconfig
arm                       multi_v4t_defconfig
powerpc                        cell_defconfig
powerpc                    adder875_defconfig
arm                       aspeed_g5_defconfig
mips                       capcella_defconfig
mips                          ath25_defconfig
mips                        bcm63xx_defconfig
arc                     haps_hs_smp_defconfig
mips                            ar7_defconfig
arm                          badge4_defconfig
mips                      loongson3_defconfig
sh                           se7206_defconfig
x86_64                              defconfig
arm                           efm32_defconfig
powerpc                         wii_defconfig
mips                          ath79_defconfig
sh                           cayman_defconfig
mips                         db1xxx_defconfig
mips                     cu1000-neo_defconfig
arm                         s5pv210_defconfig
powerpc                mpc7448_hpc2_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a015-20200614
i386                 randconfig-a011-20200614
i386                 randconfig-a014-20200614
i386                 randconfig-a013-20200614
i386                 randconfig-a016-20200614
i386                 randconfig-a012-20200614
i386                 randconfig-a016-20200615
i386                 randconfig-a015-20200615
i386                 randconfig-a011-20200615
i386                 randconfig-a014-20200615
i386                 randconfig-a013-20200615
i386                 randconfig-a012-20200615
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
