Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81332C433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 12:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E9B7613B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 12:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhELMb5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 08:31:57 -0400
Received: from mga07.intel.com ([134.134.136.100]:64102 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232316AbhELMb5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 08:31:57 -0400
IronPort-SDR: pJOxwznYeGkGkRtt27/TAGJaLs+7L+dCMHG8zwe8GAeg2PgacNbN/Q3DVG40U+pfzmiwkEenC/
 ogP/iW4RttKA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="263620785"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="263620785"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 05:30:46 -0700
IronPort-SDR: pDs+iY90/w9dxYJEJdjqyp8jv21ls7/gF0bFPyPqrAqJ27balX2RA2hlBZxeqkuxLwILf5qcUQ
 BItKowdnfcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="455575232"
Received: from lkp-server01.sh.intel.com (HELO 1e931876798f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 12 May 2021 05:30:45 -0700
Received: from kbuild by 1e931876798f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lgo0i-0000Hq-Eh; Wed, 12 May 2021 12:30:44 +0000
Date:   Wed, 12 May 2021 20:29:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 607040aaa8b5ef1d721e232c8f7129f31634401e
Message-ID: <609bca44.1hze+OkuZiGScpAY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 607040aaa8b5ef1d721e232c8f7129f31634401e  dt-bindings: Add MP2888 voltage regulator device

elapsed time: 1036m

configs tested: 125
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
riscv                            allyesconfig
powerpc                      pcm030_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                            hisi_defconfig
powerpc                     tqm8560_defconfig
mips                        nlm_xlp_defconfig
openrisc                  or1klitex_defconfig
m68k                          amiga_defconfig
mips                           xway_defconfig
sh                           se7712_defconfig
arm                          collie_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    socrates_defconfig
arm                         s5pv210_defconfig
arm                        magician_defconfig
arm                         mv78xx0_defconfig
arm                       aspeed_g4_defconfig
mips                      malta_kvm_defconfig
parisc                generic-32bit_defconfig
powerpc                     sequoia_defconfig
sh                           se7619_defconfig
arc                          axs101_defconfig
powerpc                      ep88xc_defconfig
mips                        jmr3927_defconfig
um                            kunit_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc8315_rdb_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7264_defconfig
powerpc                       holly_defconfig
mips                         mpc30x_defconfig
mips                  decstation_64_defconfig
powerpc                      tqm8xx_defconfig
mips                      bmips_stb_defconfig
arm                            xcep_defconfig
arm                        vexpress_defconfig
sh                         ecovec24_defconfig
parisc                           alldefconfig
powerpc                        fsp2_defconfig
m68k                       m5275evb_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
arm                         at91_dt_defconfig
powerpc64                           defconfig
arm                          pcm027_defconfig
arm                             rpc_defconfig
arm                         shannon_defconfig
powerpc                    ge_imp3a_defconfig
sh                            titan_defconfig
sh                   sh7770_generic_defconfig
powerpc                         ps3_defconfig
powerpc                      chrp32_defconfig
sh                           se7343_defconfig
x86_64                            allnoconfig
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
parisc                              defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210512
x86_64               randconfig-a004-20210512
x86_64               randconfig-a001-20210512
x86_64               randconfig-a005-20210512
x86_64               randconfig-a002-20210512
x86_64               randconfig-a006-20210512
i386                 randconfig-a003-20210512
i386                 randconfig-a001-20210512
i386                 randconfig-a005-20210512
i386                 randconfig-a004-20210512
i386                 randconfig-a002-20210512
i386                 randconfig-a006-20210512
i386                 randconfig-a016-20210512
i386                 randconfig-a014-20210512
i386                 randconfig-a011-20210512
i386                 randconfig-a015-20210512
i386                 randconfig-a012-20210512
i386                 randconfig-a013-20210512
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
