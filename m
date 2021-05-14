Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00ACC433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 07:45:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A22B61406
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 May 2021 07:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhENHqX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 May 2021 03:46:23 -0400
Received: from mga17.intel.com ([192.55.52.151]:30404 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231206AbhENHqW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 May 2021 03:46:22 -0400
IronPort-SDR: clPODSWZJgsj1mE2mL50L8LC+PPgtJlI0ACzWQhXcBOeNJ7vSiefmbjuS335GP7Q/3sQvUuUYy
 tv5HOBrAHCyw==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="180406795"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
   d="scan'208";a="180406795"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2021 00:45:11 -0700
IronPort-SDR: 9HCt6MULnqUSqPa91rJbD7KmHEXycj/Njk6sOQJgHF0UF0mBSz2+uF81mcq2s1Vo/J6+gIMtYp
 JtXUHhQawTUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; 
   d="scan'208";a="409909112"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 14 May 2021 00:45:10 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lhSVR-0000d8-MQ; Fri, 14 May 2021 07:45:09 +0000
Date:   Fri, 14 May 2021 15:44:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 95b798bdb19930bd748f45c4f0ffb1fc7ac4fdac
Message-ID: <609e2a7a.HqXDKwFqeAajxOZQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 95b798bdb19930bd748f45c4f0ffb1fc7ac4fdac  hwmon: (dell-smm-hwmon) Fix index values

elapsed time: 721m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
sh                                  defconfig
arc                              allyesconfig
powerpc                 mpc8313_rdb_defconfig
m68k                        mvme16x_defconfig
m68k                       m5249evb_defconfig
arc                          axs103_defconfig
sh                         ap325rxa_defconfig
mips                  maltasmvp_eva_defconfig
mips                           mtx1_defconfig
arm                           u8500_defconfig
powerpc                     taishan_defconfig
mips                        workpad_defconfig
powerpc                 linkstation_defconfig
mips                malta_qemu_32r6_defconfig
um                             i386_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc836x_mds_defconfig
riscv                    nommu_virt_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                              alldefconfig
m68k                                defconfig
riscv                    nommu_k210_defconfig
powerpc                   lite5200b_defconfig
sh                   sh7770_generic_defconfig
powerpc                    gamecube_defconfig
arm                          simpad_defconfig
powerpc                      ppc44x_defconfig
xtensa                           allyesconfig
sh                           se7712_defconfig
m68k                       bvme6000_defconfig
mips                      maltaaprp_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                     sequoia_defconfig
powerpc                      makalu_defconfig
powerpc                        icon_defconfig
xtensa                  cadence_csp_defconfig
arm                       imx_v4_v5_defconfig
powerpc                     tqm5200_defconfig
h8300                               defconfig
sh                        sh7785lcr_defconfig
arc                                 defconfig
m68k                           sun3_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
mips                           ip22_defconfig
arm                          moxart_defconfig
sh                          urquell_defconfig
sh                        sh7763rdp_defconfig
mips                        jmr3927_defconfig
mips                       rbtx49xx_defconfig
sh                            migor_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
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
i386                 randconfig-a003-20210514
i386                 randconfig-a001-20210514
i386                 randconfig-a004-20210514
i386                 randconfig-a005-20210514
i386                 randconfig-a002-20210514
i386                 randconfig-a006-20210514
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
x86_64               randconfig-a004-20210514
x86_64               randconfig-a003-20210514
x86_64               randconfig-a001-20210514
x86_64               randconfig-a005-20210514
x86_64               randconfig-a002-20210514
x86_64               randconfig-a006-20210514
riscv                            allyesconfig
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

clang tested configs:
x86_64               randconfig-a003-20210513
x86_64               randconfig-a004-20210513
x86_64               randconfig-a001-20210513
x86_64               randconfig-a005-20210513
x86_64               randconfig-a002-20210513
x86_64               randconfig-a006-20210513

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
