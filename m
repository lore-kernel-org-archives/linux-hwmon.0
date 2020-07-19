Return-Path: <SRS0=cJ4m=A6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,LONGWORDS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1A6C433E0
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Jul 2020 14:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1BBC2080D
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Jul 2020 14:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgGSOtO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 19 Jul 2020 10:49:14 -0400
Received: from mga03.intel.com ([134.134.136.65]:45058 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgGSOtO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Jul 2020 10:49:14 -0400
IronPort-SDR: mvJJr7qbplzNBO7qkiyg9XpqS3AKxKS6DXrF6LjZFN7SnuEza1lqYCMrduPi3m7MXT7og0XJRL
 bV83Wu2h8TOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149796138"
X-IronPort-AV: E=Sophos;i="5.75,370,1589266800"; 
   d="scan'208";a="149796138"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2020 07:49:13 -0700
IronPort-SDR: ZatwKFqefmYrAb6szTsMD/dkAdYBQcAzv+nkchdR0Tz6PCvH7cZIk5TxTk66dPmCx78Xl5Fh46
 xJ9NWHnSH+Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,370,1589266800"; 
   d="scan'208";a="301043255"
Received: from lkp-server02.sh.intel.com (HELO 50058c6ee6fc) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 Jul 2020 07:49:12 -0700
Received: from kbuild by 50058c6ee6fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jxAcp-0001AJ-I1; Sun, 19 Jul 2020 14:49:11 +0000
Date:   Sun, 19 Jul 2020 22:47:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 a346ff429dd1e89bdd9b266d1025a982fca79ea5
Message-ID: <5f145d1f.gy0V2W+eXlRfZF/p%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: a346ff429dd1e89bdd9b266d1025a982fca79ea5  hwmon: (adm1025) Replace HTTP links with HTTPS ones

elapsed time: 1365m

configs tested: 110
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                               allnoconfig
arc                         haps_hs_defconfig
powerpc                      ppc6xx_defconfig
powerpc                    gamecube_defconfig
mips                  cavium_octeon_defconfig
mips                malta_qemu_32r6_defconfig
arm                        vexpress_defconfig
sh                             shx3_defconfig
arm                      integrator_defconfig
c6x                         dsk6455_defconfig
m68k                         amcore_defconfig
arm                          simpad_defconfig
openrisc                         allyesconfig
mips                   sb1250_swarm_defconfig
arm                        spear6xx_defconfig
arm                            hisi_defconfig
powerpc64                        alldefconfig
arm                        spear3xx_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
sh                          r7780mp_defconfig
arm                            mps2_defconfig
um                            kunit_defconfig
powerpc                           allnoconfig
mips                         tb0219_defconfig
csky                             alldefconfig
sh                        edosk7705_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
powerpc                             defconfig
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
i386                 randconfig-a015-20200719
i386                 randconfig-a011-20200719
i386                 randconfig-a016-20200719
i386                 randconfig-a012-20200719
i386                 randconfig-a013-20200719
i386                 randconfig-a014-20200719
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
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
