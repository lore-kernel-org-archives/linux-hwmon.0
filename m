Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676B3C433E6
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Mar 2021 08:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A70664F73
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 Mar 2021 08:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbhCSI1k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Mar 2021 04:27:40 -0400
Received: from mga12.intel.com ([192.55.52.136]:9392 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234225AbhCSI1S (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Mar 2021 04:27:18 -0400
IronPort-SDR: frsfYR6WMzB2ZhP/h+xQCYUG524ws960RAFTBmACmc00DcI9upR892EijlLxdhBZRlaJX7G7ld
 zKNz3TSII9uw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169151695"
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="169151695"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 01:27:17 -0700
IronPort-SDR: CHWB18Ia0FiVyaNoc49L4dx/rZ4cwMZ8d+v8Xly60Qwv+IkFG+e4ojTLwYFS0CUlM0FZiJeFY4
 8T9LH0Mk3H+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,261,1610438400"; 
   d="scan'208";a="434201223"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2021 01:27:16 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lNATU-0001gz-0O; Fri, 19 Mar 2021 08:27:16 +0000
Date:   Fri, 19 Mar 2021 16:26:48 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 c37e19c3791abf5814fa63fc081bd2fa2d7d9258
Message-ID: <60546048.yJkc22B3AGv9awF3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c37e19c3791abf5814fa63fc081bd2fa2d7d9258  hwmon: (ina2xx) Convert sysfs sprintf/snprintf family to sysfs_emit

elapsed time: 720m

configs tested: 143
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
riscv                            allyesconfig
i386                             allyesconfig
arc                          axs101_defconfig
sh                                  defconfig
ia64                        generic_defconfig
m68k                        mvme147_defconfig
riscv                    nommu_k210_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8560_defconfig
mips                        nlm_xlp_defconfig
arc                                 defconfig
mips                     loongson1b_defconfig
m68k                        m5407c3_defconfig
sh                           se7712_defconfig
m68k                       m5275evb_defconfig
arm                           sunxi_defconfig
ia64                             allmodconfig
s390                          debug_defconfig
mips                         bigsur_defconfig
powerpc                         wii_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            mps2_defconfig
powerpc                  storcenter_defconfig
x86_64                              defconfig
s390                             alldefconfig
arm                            dove_defconfig
mips                            e55_defconfig
powerpc                 linkstation_defconfig
xtensa                  audio_kc705_defconfig
mips                        vocore2_defconfig
xtensa                    xip_kc705_defconfig
powerpc                       ebony_defconfig
mips                          ath79_defconfig
sh                     sh7710voipgw_defconfig
s390                                defconfig
mips                      maltaaprp_defconfig
sh                          urquell_defconfig
arm                        mvebu_v5_defconfig
mips                       capcella_defconfig
powerpc                 mpc834x_mds_defconfig
mips                 decstation_r4k_defconfig
sh                          lboxre2_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                       maple_defconfig
powerpc                    adder875_defconfig
sh                          kfr2r09_defconfig
arm                         lpc32xx_defconfig
xtensa                         virt_defconfig
powerpc                 mpc832x_rdb_defconfig
csky                             alldefconfig
sh                   sh7724_generic_defconfig
mips                malta_qemu_32r6_defconfig
mips                          rb532_defconfig
sh                           se7721_defconfig
sh                     magicpanelr2_defconfig
powerpc                  mpc885_ads_defconfig
m68k                        m5307c3_defconfig
arm                        shmobile_defconfig
mips                      pic32mzda_defconfig
m68k                       m5249evb_defconfig
um                             i386_defconfig
arm                          pxa3xx_defconfig
m68k                       m5208evb_defconfig
m68k                       bvme6000_defconfig
powerpc                     kmeter1_defconfig
mips                     cu1830-neo_defconfig
powerpc                     pq2fads_defconfig
arm                          pcm027_defconfig
powerpc                      acadia_defconfig
sh                        edosk7705_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc8540_ads_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210318
i386                 randconfig-a005-20210318
i386                 randconfig-a003-20210318
i386                 randconfig-a002-20210318
i386                 randconfig-a006-20210318
i386                 randconfig-a004-20210318
x86_64               randconfig-a011-20210318
x86_64               randconfig-a016-20210318
x86_64               randconfig-a013-20210318
x86_64               randconfig-a015-20210318
x86_64               randconfig-a014-20210318
x86_64               randconfig-a012-20210318
i386                 randconfig-a013-20210318
i386                 randconfig-a016-20210318
i386                 randconfig-a011-20210318
i386                 randconfig-a014-20210318
i386                 randconfig-a015-20210318
i386                 randconfig-a012-20210318
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210318
x86_64               randconfig-a001-20210318
x86_64               randconfig-a005-20210318
x86_64               randconfig-a002-20210318
x86_64               randconfig-a003-20210318
x86_64               randconfig-a004-20210318

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
