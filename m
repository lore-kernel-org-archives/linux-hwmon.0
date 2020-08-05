Return-Path: <SRS0=IPe0=BP=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95175C433E1
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E442173E
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgHEJyv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Aug 2020 05:54:51 -0400
Received: from mga07.intel.com ([134.134.136.100]:32130 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726635AbgHEJwL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 5 Aug 2020 05:52:11 -0400
IronPort-SDR: bKtOdrvKZRHLcMJlpE+yn2ShOiXucBsZaamNbrY4+pz1BMFVJZdohHhhS2B2fQCxsom2SoTo/5
 26zGOwWJJkeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="216869087"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="216869087"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 02:52:08 -0700
IronPort-SDR: ZlrCcJULc+EOV0ODEJwrQdCS9AGLl+v6pQ80Rl2wFVSAd6RiDRDkUz6hVXTM7xIcHEFxgAhMt4
 K0J06a97QZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; 
   d="scan'208";a="324964841"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2020 02:52:06 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k3G5d-0000iU-TO; Wed, 05 Aug 2020 09:52:05 +0000
Date:   Wed, 05 Aug 2020 17:51:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 e2f75e6b5d766195d2ca584d92995a0dfe467fc7
Message-ID: <5f2a8133.t6uJscaG06WFKP30%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: e2f75e6b5d766195d2ca584d92995a0dfe467fc7  hwmon: (adc128d818) Fix advanced configuration register init

elapsed time: 722m

configs tested: 89
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          rsk7264_defconfig
x86_64                           allyesconfig
parisc                generic-32bit_defconfig
arm                        mvebu_v7_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                         tb0287_defconfig
sh                          rsk7269_defconfig
mips                        jmr3927_defconfig
xtensa                          iss_defconfig
mips                     loongson1b_defconfig
powerpc64                           defconfig
sh                         apsh4a3a_defconfig
m68k                       m5249evb_defconfig
sh                            hp6xx_defconfig
sh                           se7750_defconfig
sh                             espt_defconfig
arm                           u8500_defconfig
arm                        spear3xx_defconfig
arm                     eseries_pxa_defconfig
m68k                          atari_defconfig
sh                          sdk7786_defconfig
powerpc                       holly_defconfig
arm                        keystone_defconfig
powerpc                     mpc83xx_defconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20200805
i386                 randconfig-a004-20200805
i386                 randconfig-a001-20200805
i386                 randconfig-a003-20200805
i386                 randconfig-a002-20200805
i386                 randconfig-a006-20200805
x86_64               randconfig-a013-20200805
x86_64               randconfig-a011-20200805
x86_64               randconfig-a012-20200805
x86_64               randconfig-a016-20200805
x86_64               randconfig-a015-20200805
x86_64               randconfig-a014-20200805
i386                 randconfig-a011-20200805
i386                 randconfig-a012-20200805
i386                 randconfig-a013-20200805
i386                 randconfig-a014-20200805
i386                 randconfig-a015-20200805
i386                 randconfig-a016-20200805
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
