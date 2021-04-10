Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A274C433B4
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Apr 2021 06:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE68E61042
	for <linux-hwmon@archiver.kernel.org>; Sat, 10 Apr 2021 06:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbhDJGVg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 10 Apr 2021 02:21:36 -0400
Received: from mga14.intel.com ([192.55.52.115]:37125 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229992AbhDJGVg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Apr 2021 02:21:36 -0400
IronPort-SDR: FgqdV1bo5onFXLZGRql4c1aQU/PNVDIYzBoUrXQNxdpCIkgJDpvuBctgTVk8cBt71erk28nqNh
 Q9TboHbzbwtQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="193444013"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="193444013"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 23:21:21 -0700
IronPort-SDR: QeeJHJRNGN507vPkPukVSyqydSxm1azmufqSeA26P83Is0E3Gyn9JFsKczyTRx/JcPppZkmErZ
 7IssRcyNY1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="423035339"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Apr 2021 23:21:20 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lV6zf-000Hxe-SR; Sat, 10 Apr 2021 06:21:19 +0000
Date:   Sat, 10 Apr 2021 14:20:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 e13013d489cfaee08021fe566a48da8aef4a060d
Message-ID: <607143c4.xlzDZw3ySGejVkko%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: e13013d489cfaee08021fe566a48da8aef4a060d  hwmon: (amd_energy) Restore visibility of energy counters

elapsed time: 727m

configs tested: 142
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
sh                           se7750_defconfig
powerpc                       ebony_defconfig
mips                           xway_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
arm                          gemini_defconfig
powerpc                     ep8248e_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    socrates_defconfig
sh                           se7751_defconfig
arm                         s3c6400_defconfig
sh                         apsh4a3a_defconfig
mips                        bcm63xx_defconfig
powerpc                      tqm8xx_defconfig
openrisc                         alldefconfig
arm                            mmp2_defconfig
um                             i386_defconfig
powerpc64                           defconfig
sh                             espt_defconfig
arm                         vf610m4_defconfig
mips                          rb532_defconfig
mips                            gpr_defconfig
arc                     haps_hs_smp_defconfig
arm                             mxs_defconfig
powerpc                      arches_defconfig
sh                        dreamcast_defconfig
arm                             rpc_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                      mmu_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        multi_v5_defconfig
h8300                               defconfig
mips                         tb0287_defconfig
mips                         tb0219_defconfig
sh                          urquell_defconfig
arm                        spear6xx_defconfig
sh                            titan_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
riscv                            allmodconfig
arm                             pxa_defconfig
powerpc                      walnut_defconfig
mips                      loongson3_defconfig
mips                       lemote2f_defconfig
arm                         shannon_defconfig
sh                           se7619_defconfig
xtensa                  audio_kc705_defconfig
arm                          badge4_defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
sh                          lboxre2_defconfig
sh                          r7785rp_defconfig
powerpc                     asp8347_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      mgcoge_defconfig
m68k                        m5407c3_defconfig
csky                                defconfig
i386                                defconfig
arm                        vexpress_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210409
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
x86_64               randconfig-a014-20210409
x86_64               randconfig-a015-20210409
x86_64               randconfig-a012-20210409
x86_64               randconfig-a011-20210409
x86_64               randconfig-a013-20210409
x86_64               randconfig-a016-20210409
i386                 randconfig-a014-20210409
i386                 randconfig-a011-20210409
i386                 randconfig-a016-20210409
i386                 randconfig-a012-20210409
i386                 randconfig-a013-20210409
i386                 randconfig-a015-20210409
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
