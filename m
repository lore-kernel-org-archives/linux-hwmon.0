Return-Path: <SRS0=Rliy=AT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24AFC433E0
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jul 2020 13:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8242206E9
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jul 2020 13:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729357AbgGHNo5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jul 2020 09:44:57 -0400
Received: from mga09.intel.com ([134.134.136.24]:29280 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729288AbgGHNo5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 8 Jul 2020 09:44:57 -0400
IronPort-SDR: kN49Ah+JPh0rsBcByK/O/fUQEtusbVuxc+Bst94GDHX3EDM11WHKVSEK2pUwhomXFWGqhHd0G6
 ek/cuyLIxbCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149304235"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="149304235"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2020 06:44:56 -0700
IronPort-SDR: 2z02YQdc8uEFrNO0bNT/s7oOgSoGrRSPpCo2hjdGGpc5lms+5vH31Li8GeXKDcTCMWHkF+pA0l
 bxA6ccxHx+4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; 
   d="scan'208";a="306049886"
Received: from lkp-server01.sh.intel.com (HELO 6136dd46483e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2020 06:44:55 -0700
Received: from kbuild by 6136dd46483e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jtANa-00008y-QK; Wed, 08 Jul 2020 13:44:54 +0000
Date:   Wed, 08 Jul 2020 21:44:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 f56beec0e46b26bf053b93d857dc9ec343738bf8
Message-ID: <5f05cda5.ZfdaTbyct0g5TZcq%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: f56beec0e46b26bf053b93d857dc9ec343738bf8  watchdog: Use fallthrough pseudo-keyword

elapsed time: 720m

configs tested: 100
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                               allnoconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
nios2                               defconfig
powerpc                     pq2fads_defconfig
mips                     decstation_defconfig
powerpc                      ppc40x_defconfig
sh                                allnoconfig
arm                         nhk8815_defconfig
s390                       zfcpdump_defconfig
nios2                            alldefconfig
sh                          r7785rp_defconfig
arm                        trizeps4_defconfig
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
i386                 randconfig-a001-20200707
i386                 randconfig-a002-20200707
i386                 randconfig-a006-20200707
i386                 randconfig-a004-20200707
i386                 randconfig-a005-20200707
i386                 randconfig-a003-20200707
x86_64               randconfig-a001-20200708
x86_64               randconfig-a006-20200708
x86_64               randconfig-a003-20200708
x86_64               randconfig-a002-20200708
x86_64               randconfig-a004-20200708
x86_64               randconfig-a005-20200708
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
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
