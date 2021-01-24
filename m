Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F47C433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Jan 2021 05:11:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 748EF224F9
	for <linux-hwmon@archiver.kernel.org>; Sun, 24 Jan 2021 05:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbhAXFL3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 24 Jan 2021 00:11:29 -0500
Received: from mga17.intel.com ([192.55.52.151]:19558 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbhAXFL1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 24 Jan 2021 00:11:27 -0500
IronPort-SDR: 3BoN9CBKnPJDyudMTlr99TCdfsxJLHldGavuwL+1VOPCPtoyqbFJz5l5ZQ+xwh0YZ+/Oy/zUdH
 +WC3gSAIDPLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9873"; a="159373010"
X-IronPort-AV: E=Sophos;i="5.79,370,1602572400"; 
   d="scan'208";a="159373010"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2021 21:10:46 -0800
IronPort-SDR: BvU1DhaQ5edJUELmi3/TUHFiSBoQhjWsnhZaiyEuG4xDnwv3jJ/ZYcP8j8XIRSZ7lsawG9c/2R
 hyp9Y+lwzfYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,370,1602572400"; 
   d="scan'208";a="386691548"
Received: from lkp-server01.sh.intel.com (HELO 27c4e0a4b6d9) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Jan 2021 21:10:45 -0800
Received: from kbuild by 27c4e0a4b6d9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l3Xfg-00002m-Oh; Sun, 24 Jan 2021 05:10:44 +0000
Date:   Sun, 24 Jan 2021 13:10:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 f6aed68e8a2a646c78801f6c545f9c4db2f4e610
Message-ID: <600d013d.+/1UPgUV/JIshwfF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f6aed68e8a2a646c78801f6c545f9c4db2f4e610  hwmon: (ina2) update ti,ina2xx.yaml reference in documentation

elapsed time: 3308m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    amigaone_defconfig
mips                malta_qemu_32r6_defconfig
mips                        maltaup_defconfig
powerpc                     tqm8560_defconfig
powerpc                 mpc8315_rdb_defconfig
sh                          r7785rp_defconfig
arm                        magician_defconfig
arm                           sunxi_defconfig
mips                      maltaaprp_defconfig
powerpc                  mpc885_ads_defconfig
h8300                       h8s-sim_defconfig
c6x                        evmc6678_defconfig
mips                          rb532_defconfig
powerpc                       holly_defconfig
powerpc                  storcenter_defconfig
powerpc                     taishan_defconfig
powerpc                     mpc5200_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                    mvme5100_defconfig
powerpc                        fsp2_defconfig
sh                           se7712_defconfig
mips                        bcm47xx_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                   sh7724_generic_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     tqm8541_defconfig
arm                        clps711x_defconfig
powerpc                 linkstation_defconfig
arm                         s3c6400_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210121
x86_64               randconfig-a003-20210121
x86_64               randconfig-a001-20210121
x86_64               randconfig-a005-20210121
x86_64               randconfig-a006-20210121
x86_64               randconfig-a004-20210121
i386                 randconfig-a001-20210121
i386                 randconfig-a002-20210121
i386                 randconfig-a004-20210121
i386                 randconfig-a006-20210121
i386                 randconfig-a005-20210121
i386                 randconfig-a003-20210121
i386                 randconfig-a013-20210121
i386                 randconfig-a011-20210121
i386                 randconfig-a012-20210121
i386                 randconfig-a014-20210121
i386                 randconfig-a015-20210121
i386                 randconfig-a016-20210121
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
