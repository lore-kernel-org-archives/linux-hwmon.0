Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01879C5519F
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Nov 2020 03:32:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF5D920727
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Nov 2020 03:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbgKWDcD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Nov 2020 22:32:03 -0500
Received: from mga14.intel.com ([192.55.52.115]:59363 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbgKWDcD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Nov 2020 22:32:03 -0500
IronPort-SDR: v9DLHTrWHLv31OMshjmwmuHYjC1+tb5cvKHe1NAT8xyoovvxciTfpGEmDtgQJ02/db1UJvdOoG
 T8wz75MctI6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="170911950"
X-IronPort-AV: E=Sophos;i="5.78,361,1599548400"; 
   d="scan'208";a="170911950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2020 19:32:02 -0800
IronPort-SDR: T80OoMIJ2P5XTMvRK36RGaROQ4NFnXdKAdovOiX+9rsAwUO2mQUx0byeFoXUie7yXXBBpgd6s/
 qdf8nFFuWLAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,361,1599548400"; 
   d="scan'208";a="369889294"
Received: from lkp-server01.sh.intel.com (HELO ce8054c7261d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2020 19:32:01 -0800
Received: from kbuild by ce8054c7261d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kh2a8-0000Q6-JT; Mon, 23 Nov 2020 03:32:00 +0000
Date:   Mon, 23 Nov 2020 11:31:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 232937dc35694a934f39dd1cd7246d5132e1f4f3
Message-ID: <5fbb2cf8.0UkCC2SLh+h9wpMT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 232937dc35694a934f39dd1cd7246d5132e1f4f3  docs: hwmon: (amd_energy) update documentation

elapsed time: 721m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
mips                         bigsur_defconfig
mips                          malta_defconfig
arm                      footbridge_defconfig
arc                           tb10x_defconfig
arm                       spear13xx_defconfig
sh                           se7750_defconfig
xtensa                         virt_defconfig
powerpc                      acadia_defconfig
powerpc                     mpc83xx_defconfig
sh                           se7721_defconfig
powerpc                     akebono_defconfig
powerpc                      cm5200_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc40x_defconfig
arm                             pxa_defconfig
mips                           ip27_defconfig
arm                        mvebu_v5_defconfig
powerpc                     tqm8560_defconfig
ia64                             alldefconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
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
i386                 randconfig-a004-20201122
i386                 randconfig-a003-20201122
i386                 randconfig-a002-20201122
i386                 randconfig-a005-20201122
i386                 randconfig-a001-20201122
i386                 randconfig-a006-20201122
i386                 randconfig-a012-20201122
i386                 randconfig-a013-20201122
i386                 randconfig-a011-20201122
i386                 randconfig-a016-20201122
i386                 randconfig-a014-20201122
i386                 randconfig-a015-20201122
x86_64               randconfig-a006-20201122
x86_64               randconfig-a003-20201122
x86_64               randconfig-a004-20201122
x86_64               randconfig-a005-20201122
x86_64               randconfig-a001-20201122
x86_64               randconfig-a002-20201122
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201122
x86_64               randconfig-a011-20201122
x86_64               randconfig-a014-20201122
x86_64               randconfig-a016-20201122
x86_64               randconfig-a012-20201122
x86_64               randconfig-a013-20201122

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
