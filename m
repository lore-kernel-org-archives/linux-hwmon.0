Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFFFC433B4
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 15:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89CB61182
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 15:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhEMPWk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 11:22:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:17861 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234610AbhEMPWf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 11:22:35 -0400
IronPort-SDR: 40+lEnXPa2O/VMVOW9hUILAklwb9d6vfcIamxnd4UVjgTAtjXHVrZMBS3L3MFk0HNJu6d24cac
 Rc0eB8wAq6MA==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="200025154"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="200025154"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2021 08:21:24 -0700
IronPort-SDR: wig3tRpGt2DUKed2QFjtXp5dTlIOm+kSoCw4LchmuQZg7tgTDMn/FG0zirODSjvJg1w0Ooerkj
 Czz9mtI8r2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="542523923"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 May 2021 08:21:23 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lhD9O-0000Jg-OG; Thu, 13 May 2021 15:21:22 +0000
Date:   Thu, 13 May 2021 23:20:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 38edc7847dc559f8838ab6581ccb0538db0586bb
Message-ID: <609d43d6.MqAYD0G+6K1EVsS2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 38edc7847dc559f8838ab6581ccb0538db0586bb  hwmon: (adm1275) enable adm1272 temperature reporting

elapsed time: 722m

configs tested: 78
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
h8300                       h8s-sim_defconfig
sh                         ap325rxa_defconfig
arm                      tct_hammer_defconfig
powerpc                 linkstation_defconfig
arm                           u8500_defconfig
x86_64                            allnoconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210513
i386                 randconfig-a001-20210513
i386                 randconfig-a005-20210513
i386                 randconfig-a004-20210513
i386                 randconfig-a002-20210513
i386                 randconfig-a006-20210513
x86_64               randconfig-a012-20210513
x86_64               randconfig-a015-20210513
x86_64               randconfig-a011-20210513
x86_64               randconfig-a013-20210513
x86_64               randconfig-a016-20210513
x86_64               randconfig-a014-20210513
i386                 randconfig-a016-20210513
i386                 randconfig-a014-20210513
i386                 randconfig-a011-20210513
i386                 randconfig-a015-20210513
i386                 randconfig-a012-20210513
i386                 randconfig-a013-20210513
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
