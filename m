Return-Path: <SRS0=3IGE=BE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,LONGWORDS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6B3C433E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Jul 2020 08:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12914206C1
	for <linux-hwmon@archiver.kernel.org>; Sat, 25 Jul 2020 08:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgGYIOL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 25 Jul 2020 04:14:11 -0400
Received: from mga04.intel.com ([192.55.52.120]:16105 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgGYIOL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Jul 2020 04:14:11 -0400
IronPort-SDR: IjYGUtAu/BGQDb5/jNzHQwMd3IJVufBg+G+cxzpOXZ3lZP6JO5TYTtYfTeOA3xjjkh8mrJuk69
 HAJPr+aWLHjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="148308216"
X-IronPort-AV: E=Sophos;i="5.75,392,1589266800"; 
   d="scan'208";a="148308216"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2020 01:14:09 -0700
IronPort-SDR: OCjD7Xp7QpDE+FYdEAC8XcEzUq5FyAIzX9RV5GtghTQCza9v6BqAAjy3W0po5pvPNxWeE7GHb/
 xX8n6FixALiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,392,1589266800"; 
   d="scan'208";a="272788586"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2020 01:14:08 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jzFJn-0000pt-Un; Sat, 25 Jul 2020 08:14:07 +0000
Date:   Sat, 25 Jul 2020 16:13:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 2fdf8f7f086712bbe296d1d4d4049ca88e7a662d
Message-ID: <5f1be999.mQpM9lBqL+lv3MXW%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 2fdf8f7f086712bbe296d1d4d4049ca88e7a662d  hwmon: (sparx5) Make symbol 's5_temp_match' static

elapsed time: 1014m

configs tested: 92
configs skipped: 1

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
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
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
i386                 randconfig-a003-20200724
i386                 randconfig-a005-20200724
i386                 randconfig-a004-20200724
i386                 randconfig-a006-20200724
i386                 randconfig-a002-20200724
i386                 randconfig-a001-20200724
x86_64               randconfig-a014-20200724
x86_64               randconfig-a016-20200724
x86_64               randconfig-a015-20200724
x86_64               randconfig-a012-20200724
x86_64               randconfig-a013-20200724
x86_64               randconfig-a011-20200724
i386                 randconfig-a016-20200725
i386                 randconfig-a013-20200725
i386                 randconfig-a012-20200725
i386                 randconfig-a015-20200725
i386                 randconfig-a014-20200725
i386                 randconfig-a011-20200725
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
