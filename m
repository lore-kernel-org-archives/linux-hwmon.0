Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7664C55ABD
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 03:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8495321D46
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Nov 2020 03:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgKMDIQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 22:08:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:65239 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726011AbgKMDIQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 22:08:16 -0500
IronPort-SDR: uUjk1C9lW3qWkpkZOoVD2wJ5ywfeCermJXxYowj/2pNddAv+/6V/pxhLmj87IIDnc/0d0cqUWj
 Iys2S77EYTQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="232036694"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="232036694"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 19:08:15 -0800
IronPort-SDR: DbwOzuw4lROp2eUAIkgo3itQXceS47SOhTjxQvO53kXRMIaoH0xYA3niXuHXx9E4GX60gLYljd
 EHqN8mbDk+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="366587838"
Received: from lkp-server02.sh.intel.com (HELO 697932c29306) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Nov 2020 19:08:13 -0800
Received: from kbuild by 697932c29306 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kdPRd-00000n-7e; Fri, 13 Nov 2020 03:08:13 +0000
Date:   Fri, 13 Nov 2020 11:07:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 d7e445a92e1bea606ba0e8a9fdb31ca7831efb81
Message-ID: <5fadf86a.fRZIL3aR/BphFzeA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: d7e445a92e1bea606ba0e8a9fdb31ca7831efb81  hwmon: (ibmpowernv) Silence strncpy() warning

elapsed time: 722m

configs tested: 160
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          r7785rp_defconfig
m68k                         amcore_defconfig
sh                   sh7770_generic_defconfig
arm                          collie_defconfig
sh                         microdev_defconfig
powerpc                      katmai_defconfig
sh                            hp6xx_defconfig
riscv                            allmodconfig
powerpc                    ge_imp3a_defconfig
arm                        shmobile_defconfig
sparc                               defconfig
sparc64                          alldefconfig
sh                        dreamcast_defconfig
powerpc                       maple_defconfig
openrisc                            defconfig
powerpc                      acadia_defconfig
sh                          rsk7201_defconfig
mips                        workpad_defconfig
m68k                         apollo_defconfig
sh                ecovec24-romimage_defconfig
riscv                            alldefconfig
arm                          pxa3xx_defconfig
powerpc                     pq2fads_defconfig
arm                           tegra_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                         virt_defconfig
arm                         at91_dt_defconfig
sh                             espt_defconfig
sparc                       sparc64_defconfig
arm                           h3600_defconfig
m68k                        m5407c3_defconfig
m68k                        mvme16x_defconfig
sh                          rsk7203_defconfig
mips                     loongson1b_defconfig
arm                             mxs_defconfig
powerpc                    mvme5100_defconfig
sh                          sdk7786_defconfig
mips                       bmips_be_defconfig
nds32                            alldefconfig
powerpc64                           defconfig
arm                       imx_v6_v7_defconfig
arm                        cerfcube_defconfig
m68k                        mvme147_defconfig
arm                         shannon_defconfig
powerpc                     asp8347_defconfig
powerpc                         wii_defconfig
sh                           sh2007_defconfig
mips                malta_kvm_guest_defconfig
i386                             alldefconfig
mips                        maltaup_defconfig
powerpc                        warp_defconfig
arm                         mv78xx0_defconfig
mips                          malta_defconfig
arm                      footbridge_defconfig
xtensa                              defconfig
mips                 decstation_r4k_defconfig
arm                         nhk8815_defconfig
c6x                        evmc6457_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                   lite5200b_defconfig
mips                       lemote2f_defconfig
powerpc                 mpc832x_mds_defconfig
arm                         assabet_defconfig
arm                          pxa168_defconfig
microblaze                          defconfig
m68k                             alldefconfig
powerpc                      ep88xc_defconfig
arc                         haps_hs_defconfig
ia64                      gensparse_defconfig
arm                      jornada720_defconfig
powerpc                      obs600_defconfig
arm64                            alldefconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
arm                         orion5x_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201111
i386                 randconfig-a005-20201111
i386                 randconfig-a002-20201111
i386                 randconfig-a001-20201111
i386                 randconfig-a003-20201111
i386                 randconfig-a004-20201111
i386                 randconfig-a006-20201112
i386                 randconfig-a005-20201112
i386                 randconfig-a002-20201112
i386                 randconfig-a001-20201112
i386                 randconfig-a003-20201112
i386                 randconfig-a004-20201112
x86_64               randconfig-a015-20201111
x86_64               randconfig-a011-20201111
x86_64               randconfig-a014-20201111
x86_64               randconfig-a013-20201111
x86_64               randconfig-a016-20201111
x86_64               randconfig-a012-20201111
i386                 randconfig-a012-20201111
i386                 randconfig-a014-20201111
i386                 randconfig-a016-20201111
i386                 randconfig-a011-20201111
i386                 randconfig-a015-20201111
i386                 randconfig-a013-20201111
i386                 randconfig-a012-20201113
i386                 randconfig-a014-20201113
i386                 randconfig-a016-20201113
i386                 randconfig-a011-20201113
i386                 randconfig-a015-20201113
i386                 randconfig-a013-20201113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201111
x86_64               randconfig-a005-20201111
x86_64               randconfig-a004-20201111
x86_64               randconfig-a002-20201111
x86_64               randconfig-a006-20201111
x86_64               randconfig-a001-20201111

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
