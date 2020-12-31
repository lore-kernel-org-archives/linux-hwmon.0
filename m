Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A311C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Dec 2020 04:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC49F2158C
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Dec 2020 04:41:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgLaEli (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Dec 2020 23:41:38 -0500
Received: from mga03.intel.com ([134.134.136.65]:45947 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbgLaEli (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Dec 2020 23:41:38 -0500
IronPort-SDR: pcPqWP2x0nmHbBjpU/Bx/OX7AyTiWb22sSPV7RqG8nnrzu8tgx1TkoiT7HqfBsTDQ+W/qhYV2s
 BkfmJCe6M9mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="176765861"
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="176765861"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 20:40:57 -0800
IronPort-SDR: 6M1a4WylPTIi4ijuFNc2kjyk5JalED9nb44qRcg2qEYxqPXonRsHNMwXYm+P7aH7zc20Vrb04W
 zkn8EAd6v/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="393680090"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 30 Dec 2020 20:40:56 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kuplf-0004h6-NJ; Thu, 31 Dec 2020 04:40:55 +0000
Date:   Thu, 31 Dec 2020 12:39:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 bae99e301bea3902b29f6b17cc13f7e9c1088a4f
Message-ID: <5fed561b.Mjy7DVIhpCVdnNzz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: bae99e301bea3902b29f6b17cc13f7e9c1088a4f  hwmon: (pwm-fan) Support multiple fan tachometers

elapsed time: 722m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                         virt_defconfig
mips                            ar7_defconfig
powerpc                      ppc6xx_defconfig
c6x                        evmc6474_defconfig
sh                          urquell_defconfig
arc                      axs103_smp_defconfig
arm                        realview_defconfig
mips                         mpc30x_defconfig
sh                           se7343_defconfig
xtensa                  cadence_csp_defconfig
mips                        qi_lb60_defconfig
arm                         vf610m4_defconfig
microblaze                          defconfig
sh                     sh7710voipgw_defconfig
arm                         s3c6400_defconfig
mips                           rs90_defconfig
h8300                    h8300h-sim_defconfig
sh                             shx3_defconfig
mips                   sb1250_swarm_defconfig
m68k                         apollo_defconfig
sh                          sdk7780_defconfig
mips                    maltaup_xpa_defconfig
arm                        cerfcube_defconfig
mips                      maltaaprp_defconfig
powerpc                      tqm8xx_defconfig
arm                        mvebu_v5_defconfig
arm                           u8500_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     skiroot_defconfig
arm                        oxnas_v6_defconfig
s390                       zfcpdump_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
parisc                           allyesconfig
powerpc                  iss476-smp_defconfig
mips                     loongson1b_defconfig
mips                     loongson1c_defconfig
x86_64                           alldefconfig
m68k                           sun3_defconfig
mips                           ip22_defconfig
powerpc                      ppc44x_defconfig
powerpc                    sam440ep_defconfig
arc                     haps_hs_smp_defconfig
ia64                             alldefconfig
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
x86_64               randconfig-a005-20201230
x86_64               randconfig-a001-20201230
x86_64               randconfig-a006-20201230
x86_64               randconfig-a002-20201230
x86_64               randconfig-a004-20201230
x86_64               randconfig-a003-20201230
i386                 randconfig-a005-20201230
i386                 randconfig-a006-20201230
i386                 randconfig-a004-20201230
i386                 randconfig-a003-20201230
i386                 randconfig-a002-20201230
i386                 randconfig-a001-20201230
x86_64               randconfig-a015-20201231
x86_64               randconfig-a014-20201231
x86_64               randconfig-a011-20201231
x86_64               randconfig-a016-20201231
x86_64               randconfig-a013-20201231
x86_64               randconfig-a012-20201231
i386                 randconfig-a016-20201230
i386                 randconfig-a014-20201230
i386                 randconfig-a012-20201230
i386                 randconfig-a015-20201230
i386                 randconfig-a011-20201230
i386                 randconfig-a013-20201230
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
x86_64               randconfig-a015-20201230
x86_64               randconfig-a014-20201230
x86_64               randconfig-a016-20201230
x86_64               randconfig-a011-20201230
x86_64               randconfig-a013-20201230
x86_64               randconfig-a012-20201230

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
