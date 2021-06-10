Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCAFC48BDF
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Jun 2021 15:42:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61690613D9
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Jun 2021 15:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhFJPoS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:44:18 -0400
Received: from mga04.intel.com ([192.55.52.120]:18601 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231356AbhFJPoS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Jun 2021 11:44:18 -0400
IronPort-SDR: BEQK8phq6ZEj+151uGyE4hMf4+nYzGYSSc/ltXSDgBl0ukNaRXFk5NSZ2tIMQN5LDTg2GmGKDm
 Dom0nUvYmrjQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="203476890"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="203476890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 08:42:21 -0700
IronPort-SDR: rTUpeehpImEaZpKOFPpvMHQYyQY7YkK1kEQKetwdg+hrkHhjSG6/BTFZJWVyDcCyyOPhyq6kBK
 H8mBU54nwymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="450418588"
Received: from lkp-server02.sh.intel.com (HELO 3cb98b298c7e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jun 2021 08:42:20 -0700
Received: from kbuild by 3cb98b298c7e with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lrMp2-0000BF-Gd; Thu, 10 Jun 2021 15:42:20 +0000
Date:   Thu, 10 Jun 2021 23:42:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 2d4acf6c1e5e25e1a020c24db4583a41e75484db
Message-ID: <60c232cc.pE90adqwDKqCflM6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2d4acf6c1e5e25e1a020c24db4583a41e75484db  MAINTAINERS: Add Delta DPS920AB PSU driver

elapsed time: 720m

configs tested: 116
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                                defconfig
arm                       cns3420vb_defconfig
s390                             alldefconfig
sh                            shmin_defconfig
arm                          collie_defconfig
powerpc                  mpc885_ads_defconfig
arm                         lpc18xx_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          pxa910_defconfig
xtensa                  cadence_csp_defconfig
powerpc                      pasemi_defconfig
sh                          r7785rp_defconfig
s390                                defconfig
arm                              alldefconfig
arc                          axs101_defconfig
mips                      pic32mzda_defconfig
sparc                       sparc64_defconfig
riscv                             allnoconfig
s390                       zfcpdump_defconfig
powerpc                    socrates_defconfig
ia64                        generic_defconfig
arm                          badge4_defconfig
arm                  colibri_pxa270_defconfig
xtensa                       common_defconfig
mips                         tb0287_defconfig
powerpc                    mvme5100_defconfig
powerpc                 mpc8560_ads_defconfig
sh                           se7721_defconfig
arm                      tct_hammer_defconfig
parisc                generic-64bit_defconfig
powerpc                       holly_defconfig
powerpc                     tqm8555_defconfig
sh                          kfr2r09_defconfig
sh                             espt_defconfig
mips                     loongson1c_defconfig
microblaze                          defconfig
m68k                          multi_defconfig
powerpc                     tqm8541_defconfig
x86_64                           allyesconfig
arc                            hsdk_defconfig
powerpc                       ppc64_defconfig
arm                        neponset_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210610
i386                 randconfig-a006-20210610
i386                 randconfig-a004-20210610
i386                 randconfig-a001-20210610
i386                 randconfig-a005-20210610
i386                 randconfig-a003-20210610
x86_64               randconfig-a015-20210610
x86_64               randconfig-a016-20210610
x86_64               randconfig-a011-20210610
x86_64               randconfig-a012-20210610
x86_64               randconfig-a014-20210610
x86_64               randconfig-a013-20210610
i386                 randconfig-a015-20210610
i386                 randconfig-a013-20210610
i386                 randconfig-a016-20210610
i386                 randconfig-a014-20210610
i386                 randconfig-a012-20210610
i386                 randconfig-a011-20210610
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210610
x86_64               randconfig-a001-20210610
x86_64               randconfig-a004-20210610
x86_64               randconfig-a003-20210610
x86_64               randconfig-a006-20210610
x86_64               randconfig-a005-20210610

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
