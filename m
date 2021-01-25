Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF89C43333
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jan 2021 05:58:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39B8A221EA
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jan 2021 05:58:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbhAZF6N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:58:13 -0500
Received: from mga12.intel.com ([192.55.52.136]:38047 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727860AbhAYMOO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Jan 2021 07:14:14 -0500
IronPort-SDR: 2SCDhJwiF1lGikXUNtSdvnXu+v2dzk44o1IWu0PF6c2aeXBMc3ntJjPyY0NMqqvMhMV9M54Gd/
 6Z/wtj3LWyfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="158890090"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="158890090"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 04:01:21 -0800
IronPort-SDR: zuBiPLybsi7Q81v5siUdt647rx1nv66TsrkIpACTiz9W1CFmOVTnK31gJKQ0bKXkpEyDFH4CGR
 zFj6NcdmBFcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="scan'208";a="387335344"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Jan 2021 04:01:19 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l40YY-00007X-Tx; Mon, 25 Jan 2021 12:01:18 +0000
Date:   Mon, 25 Jan 2021 20:00:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 4c879cf1b5c3935cf19b6aed759f6dbe2b6ac924
Message-ID: <600eb2d1.0dlwFTFjmFeKAKB0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 4c879cf1b5c3935cf19b6aed759f6dbe2b6ac924  watchdog: mei_wdt: request stop on unregister

elapsed time: 726m

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
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
c6x                                 defconfig
powerpc                 mpc832x_mds_defconfig
sparc                               defconfig
arm                       aspeed_g5_defconfig
arm                          pcm027_defconfig
mips                        qi_lb60_defconfig
mips                  decstation_64_defconfig
powerpc                      chrp32_defconfig
arm                             mxs_defconfig
mips                     cu1000-neo_defconfig
powerpc                     tqm8560_defconfig
powerpc64                        alldefconfig
sh                        sh7757lcr_defconfig
arm                         hackkit_defconfig
sparc                            allyesconfig
sh                               j2_defconfig
powerpc                        fsp2_defconfig
mips                       rbtx49xx_defconfig
mips                        bcm47xx_defconfig
arm                          pxa3xx_defconfig
sh                            shmin_defconfig
powerpc                     mpc512x_defconfig
arm                      integrator_defconfig
arm                        realview_defconfig
arm                  colibri_pxa270_defconfig
h8300                               defconfig
powerpc                  iss476-smp_defconfig
h8300                       h8s-sim_defconfig
powerpc                      mgcoge_defconfig
arm                           h5000_defconfig
sh                     sh7710voipgw_defconfig
arm                          imote2_defconfig
nios2                            allyesconfig
sh                   sh7770_generic_defconfig
sh                         ecovec24_defconfig
sh                           se7712_defconfig
x86_64                              defconfig
powerpc                      acadia_defconfig
powerpc                      pmac32_defconfig
arm                           viper_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     ep8248e_defconfig
sh                        sh7763rdp_defconfig
arm                        mini2440_defconfig
arm                            mps2_defconfig
sh                           se7751_defconfig
mips                         bigsur_defconfig
csky                             alldefconfig
arm                          pxa168_defconfig
um                           x86_64_defconfig
sparc                       sparc32_defconfig
arm                          ixp4xx_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
arm                     eseries_pxa_defconfig
powerpc                 linkstation_defconfig
xtensa                  cadence_csp_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210125
i386                 randconfig-a002-20210125
i386                 randconfig-a004-20210125
i386                 randconfig-a006-20210125
i386                 randconfig-a005-20210125
i386                 randconfig-a003-20210125
i386                 randconfig-a013-20210124
i386                 randconfig-a011-20210124
i386                 randconfig-a012-20210124
i386                 randconfig-a015-20210124
i386                 randconfig-a014-20210124
i386                 randconfig-a016-20210124
i386                 randconfig-a013-20210125
i386                 randconfig-a011-20210125
i386                 randconfig-a012-20210125
i386                 randconfig-a015-20210125
i386                 randconfig-a014-20210125
i386                 randconfig-a016-20210125
x86_64               randconfig-a003-20210125
x86_64               randconfig-a002-20210125
x86_64               randconfig-a001-20210125
x86_64               randconfig-a005-20210125
x86_64               randconfig-a006-20210125
x86_64               randconfig-a004-20210125
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
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210125
x86_64               randconfig-a016-20210125
x86_64               randconfig-a015-20210125
x86_64               randconfig-a011-20210125
x86_64               randconfig-a013-20210125
x86_64               randconfig-a014-20210125
x86_64               randconfig-a003-20210124
x86_64               randconfig-a002-20210124
x86_64               randconfig-a001-20210124
x86_64               randconfig-a005-20210124
x86_64               randconfig-a006-20210124
x86_64               randconfig-a004-20210124

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
