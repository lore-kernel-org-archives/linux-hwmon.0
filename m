Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D76C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 01:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6985461937
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Mar 2021 01:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhCVBLB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 21 Mar 2021 21:11:01 -0400
Received: from mga06.intel.com ([134.134.136.31]:4738 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229692AbhCVBK0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 21 Mar 2021 21:10:26 -0400
IronPort-SDR: MiEh5o9q+Z6jlEUgwOL1lxc7LQzPQdoI4Tz8syvR5D6IMGevmyer9Dg6C86kH6PR7jY8+N8Wa0
 17pjB9tX+epg==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="251533438"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="251533438"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:10:24 -0700
IronPort-SDR: QRBd5+Gsxu5udQ/26nWwFggsJGJdt57DDBnhJnSTiy1W7yP1xNTejcEXb1fwQoN1Ve+p80BVl1
 e7M5kShAZYSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="414278396"
Received: from lkp-server01.sh.intel.com (HELO cf98f15ee95b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Mar 2021 18:10:23 -0700
Received: from kbuild by cf98f15ee95b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lO95K-00009M-Hm; Mon, 22 Mar 2021 01:10:22 +0000
Date:   Sun, 21 Mar 2021 21:52:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 93a4163605f1b2c8b7031775026865ab9cf4192f
Message-ID: <60574f90.iOygR2AJb+6PJ5Vy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 93a4163605f1b2c8b7031775026865ab9cf4192f  hwmon: (pmbus) Replace - with _ in device names before registration

elapsed time: 724m

configs tested: 94
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
sparc                            alldefconfig
mips                        jmr3927_defconfig
powerpc                      ppc64e_defconfig
mips                 decstation_r4k_defconfig
arm                        trizeps4_defconfig
powerpc                     mpc5200_defconfig
m68k                       m5208evb_defconfig
powerpc                 linkstation_defconfig
mips                           xway_defconfig
arm                       netwinder_defconfig
arm                         socfpga_defconfig
mips                         db1xxx_defconfig
powerpc                   lite5200b_defconfig
powerpc                          allmodconfig
sh                        dreamcast_defconfig
powerpc                   motionpro_defconfig
mips                        qi_lb60_defconfig
powerpc                       holly_defconfig
arm                           spitz_defconfig
mips                      maltasmvp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210321
x86_64               randconfig-a003-20210321
x86_64               randconfig-a006-20210321
x86_64               randconfig-a001-20210321
x86_64               randconfig-a005-20210321
x86_64               randconfig-a004-20210321
i386                 randconfig-a003-20210321
i386                 randconfig-a004-20210321
i386                 randconfig-a001-20210321
i386                 randconfig-a002-20210321
i386                 randconfig-a006-20210321
i386                 randconfig-a005-20210321
i386                 randconfig-a014-20210321
i386                 randconfig-a011-20210321
i386                 randconfig-a015-20210321
i386                 randconfig-a016-20210321
i386                 randconfig-a013-20210321
i386                 randconfig-a012-20210321
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210321
x86_64               randconfig-a015-20210321
x86_64               randconfig-a013-20210321
x86_64               randconfig-a014-20210321
x86_64               randconfig-a011-20210321
x86_64               randconfig-a016-20210321

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
