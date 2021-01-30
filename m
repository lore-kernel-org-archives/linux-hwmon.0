Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 710E7C433DB
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Jan 2021 06:07:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37E8464DE4
	for <linux-hwmon@archiver.kernel.org>; Sat, 30 Jan 2021 06:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbhA3GGb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 30 Jan 2021 01:06:31 -0500
Received: from mga12.intel.com ([192.55.52.136]:33284 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233822AbhA3Fdb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 30 Jan 2021 00:33:31 -0500
IronPort-SDR: 8W5uPUDeo28ib7+9A4o0kqcwyNInOPUnn/3CGL728E3gfHvp1cymUoTSEfyytvgglDBh1Oc8i5
 6ousqaJDqR4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9879"; a="159682270"
X-IronPort-AV: E=Sophos;i="5.79,387,1602572400"; 
   d="scan'208";a="159682270"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2021 21:32:48 -0800
IronPort-SDR: d63ixPmbIi8j15yHFqncJr5iJ8iSM17K5a82R+vUv/VmvE/4tADvjYPNYYbBrjJvlSo3RJIoeh
 RMaDk8NQhJ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,387,1602572400"; 
   d="scan'208";a="404762645"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2021 21:32:47 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l5isI-0004Jt-Qa; Sat, 30 Jan 2021 05:32:46 +0000
Date:   Sat, 30 Jan 2021 13:32:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 66102281f94afdf1f41cf6147c7ddce73a8e75f2
Message-ID: <6014ef6b.Gz0njxkhD9/XMkw3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 66102281f94afdf1f41cf6147c7ddce73a8e75f2  hwmon: (pmbus/max16601) Add support for MAX16508

elapsed time: 727m

configs tested: 74
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          sdk7786_defconfig
sh                             espt_defconfig
nios2                         3c120_defconfig
arm                             rpc_defconfig
sh                             shx3_defconfig
h8300                       h8s-sim_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      walnut_defconfig
sh                             sh03_defconfig
sh                         ecovec24_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
csky                                defconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
h8300                            allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210129
x86_64               randconfig-a003-20210129
x86_64               randconfig-a001-20210129
x86_64               randconfig-a005-20210129
x86_64               randconfig-a006-20210129
x86_64               randconfig-a004-20210129
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210129
x86_64               randconfig-a015-20210129
x86_64               randconfig-a016-20210129
x86_64               randconfig-a011-20210129
x86_64               randconfig-a013-20210129
x86_64               randconfig-a014-20210129

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
