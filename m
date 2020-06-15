Return-Path: <SRS0=zIh4=74=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3728C433DF
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jun 2020 05:53:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D33F220663
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Jun 2020 05:53:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgFOFxr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Jun 2020 01:53:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:30868 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728276AbgFOFxq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jun 2020 01:53:46 -0400
IronPort-SDR: e13yd3sD74e8XIMpWV/GxoPd3bs3uwfs2VWHbgdEjT4vQeNgHhFk/4CHWzjJtvIBFiKzrHVTjk
 0XVKTfRJubaQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2020 22:53:45 -0700
IronPort-SDR: d3XM5ThpHWqpHXZmL7wTzYhy3CffhrQJdyZYiqy4kMg1DPH1KmVAbumulYsuYg6Dcz6em/Xixy
 9oeIt/nOCS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="290581918"
Received: from lkp-server01.sh.intel.com (HELO d0919238dc75) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2020 22:53:44 -0700
Received: from kbuild by d0919238dc75 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jki3z-000020-C0; Mon, 15 Jun 2020 05:53:43 +0000
Date:   Mon, 15 Jun 2020 13:53:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 cd4bbb321a296687c376117fa6a9d61cce3650f0
Message-ID: <5ee70cde.pDJN8LdUt/uWQGRB%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: cd4bbb321a296687c376117fa6a9d61cce3650f0  watchdog: dw_wdt: Add DebugFS files

elapsed time: 483m

configs tested: 140
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
sh                          rsk7269_defconfig
arc                        nsim_700_defconfig
powerpc                       holly_defconfig
sparc64                          alldefconfig
arm                       multi_v4t_defconfig
powerpc                        cell_defconfig
powerpc                    amigaone_defconfig
arm                           stm32_defconfig
mips                      loongson3_defconfig
arm                        multi_v7_defconfig
sh                           se7750_defconfig
powerpc                     pq2fads_defconfig
arm                       versatile_defconfig
mips                        bcm47xx_defconfig
h8300                               defconfig
arc                     haps_hs_smp_defconfig
mips                            ar7_defconfig
arm                          badge4_defconfig
sh                           se7206_defconfig
x86_64                              defconfig
arm                           efm32_defconfig
powerpc64                           defconfig
powerpc                         wii_defconfig
mips                          ath79_defconfig
sh                           cayman_defconfig
arm                           sama5_defconfig
arm                           viper_defconfig
m68k                          multi_defconfig
h8300                       h8s-sim_defconfig
xtensa                generic_kc705_defconfig
m68k                          amiga_defconfig
arm                           tegra_defconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200615
i386                 randconfig-a002-20200615
i386                 randconfig-a001-20200615
i386                 randconfig-a004-20200615
i386                 randconfig-a005-20200615
i386                 randconfig-a003-20200615
x86_64               randconfig-a015-20200615
x86_64               randconfig-a011-20200615
x86_64               randconfig-a016-20200615
x86_64               randconfig-a012-20200615
x86_64               randconfig-a014-20200615
x86_64               randconfig-a013-20200615
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
um                               allyesconfig
um                                  defconfig
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
