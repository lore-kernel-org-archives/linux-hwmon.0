Return-Path: <SRS0=Tvco=AS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8025C433DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 10:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA570206DF
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jul 2020 10:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgGGKua (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jul 2020 06:50:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:21977 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726763AbgGGKua (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 7 Jul 2020 06:50:30 -0400
IronPort-SDR: wyOosjDgA6pRUFt2UoiMUc+wJCWCYVS9j7MK+z/6WVN7uE19NWw6s2UdHZkKs3pjConCkZYcX2
 1QBr4j622f3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="212539479"
X-IronPort-AV: E=Sophos;i="5.75,323,1589266800"; 
   d="scan'208";a="212539479"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 03:50:29 -0700
IronPort-SDR: VD8l4oaUV47q+EsNXvXUoAjGI8pURRpiA3KaXA/CRo2bKp3PB5mEj6urT2WE54rfp/U/dz2Eee
 zpZ9DZc2cuSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,323,1589266800"; 
   d="scan'208";a="323506690"
Received: from lkp-server01.sh.intel.com (HELO f2047cb89c8e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Jul 2020 03:50:28 -0700
Received: from kbuild by f2047cb89c8e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jslBD-0000BC-OB; Tue, 07 Jul 2020 10:50:27 +0000
Date:   Tue, 07 Jul 2020 18:49:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 c6b522b0df2be6335e4f22b415e27d3f6709ce82
Message-ID: <5f045330.KklUYALv4pZiZNp0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: c6b522b0df2be6335e4f22b415e27d3f6709ce82  watchdog: booke_wdt: Add common nowayout parameter

elapsed time: 723m

configs tested: 137
configs skipped: 6

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
openrisc                         alldefconfig
mips                           ip27_defconfig
sh                          kfr2r09_defconfig
powerpc                      mgcoge_defconfig
sh                           se7750_defconfig
sh                        edosk7705_defconfig
sparc                            alldefconfig
mips                  mips_paravirt_defconfig
sh                        dreamcast_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     mpc5200_defconfig
arm                          tango4_defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
arm                          moxart_defconfig
parisc                              defconfig
arm                           spitz_defconfig
arm                            mps2_defconfig
m68k                          multi_defconfig
sh                          rsk7203_defconfig
arm                           corgi_defconfig
arm                       netwinder_defconfig
s390                             allmodconfig
arm                     davinci_all_defconfig
arm                     eseries_pxa_defconfig
arm                              zx_defconfig
parisc                generic-32bit_defconfig
mips                        bcm47xx_defconfig
arm                          pxa3xx_defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
arm                       aspeed_g5_defconfig
sh                          sdk7786_defconfig
mips                       bmips_be_defconfig
sh                           se7206_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
m68k                           sun3_defconfig
m68k                       m5208evb_defconfig
openrisc                            defconfig
powerpc                      ppc6xx_defconfig
riscv                             allnoconfig
arm                         s3c2410_defconfig
mips                        bcm63xx_defconfig
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
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
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
x86_64               randconfig-a012-20200707
x86_64               randconfig-a016-20200707
x86_64               randconfig-a014-20200707
x86_64               randconfig-a011-20200707
x86_64               randconfig-a015-20200707
x86_64               randconfig-a013-20200707
i386                 randconfig-a011-20200707
i386                 randconfig-a014-20200707
i386                 randconfig-a015-20200707
i386                 randconfig-a016-20200707
i386                 randconfig-a012-20200707
i386                 randconfig-a013-20200707
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
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
