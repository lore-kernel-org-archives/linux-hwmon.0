Return-Path: <SRS0=gPXQ=AF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1879C433DF
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jun 2020 02:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90816206E2
	for <linux-hwmon@archiver.kernel.org>; Wed, 24 Jun 2020 02:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387985AbgFXClG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Jun 2020 22:41:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:18819 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387719AbgFXClG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Jun 2020 22:41:06 -0400
IronPort-SDR: rVa6SgtPZadSQFWEJSvKOXnmEiQF0Jn4ySWzBQ68muycYF9aou5+QGMODRdm2C6xZM0bwRTeDB
 wO/wpge7Abww==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="141793688"
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; 
   d="scan'208";a="141793688"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2020 19:41:05 -0700
IronPort-SDR: a9pi9Ou6AhSIUnjYYBi2n9cW0vjTuYcG4Y4rGuWL4PFsUMVkSQD7gZLS53qV2Wm0Z6s6w5SVWq
 bsc63lRWNOBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; 
   d="scan'208";a="311503561"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jun 2020 19:41:04 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jnvLT-0000e4-SQ; Wed, 24 Jun 2020 02:41:03 +0000
Date:   Wed, 24 Jun 2020 10:40:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 b4c8af4c2a226fc9c25e1decbd26fdab1b0993ee
Message-ID: <5ef2bd29.QEM/00tWu2rzCAsg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: b4c8af4c2a226fc9c25e1decbd26fdab1b0993ee  hwmon: (pmbus) Fix page vs. register when accessing fans

elapsed time: 725m

configs tested: 135
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
mips                malta_kvm_guest_defconfig
sh                          rsk7203_defconfig
arc                         haps_hs_defconfig
xtensa                          iss_defconfig
arm                          lpd270_defconfig
h8300                     edosk2674_defconfig
sh                           se7722_defconfig
nios2                            alldefconfig
m68k                            q40_defconfig
arm                            pleb_defconfig
arm                           h3600_defconfig
sh                          sdk7780_defconfig
x86_64                              defconfig
ia64                             allyesconfig
mips                           ip28_defconfig
alpha                            alldefconfig
arc                             nps_defconfig
arm                      integrator_defconfig
arm                      tct_hammer_defconfig
mips                        omega2p_defconfig
powerpc                          g5_defconfig
c6x                         dsk6455_defconfig
arm                          tango4_defconfig
powerpc                      ppc44x_defconfig
m68k                             allyesconfig
mips                           ip27_defconfig
m68k                         amcore_defconfig
powerpc                    gamecube_defconfig
arc                          axs101_defconfig
powerpc                      mgcoge_defconfig
mips                     cu1000-neo_defconfig
sparc                            alldefconfig
sparc64                             defconfig
mips                        nlm_xlr_defconfig
sh                        sh7757lcr_defconfig
arm                        multi_v7_defconfig
arm                          gemini_defconfig
powerpc                 mpc8272_ads_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
arm                        clps711x_defconfig
parisc                              defconfig
sh                     sh7710voipgw_defconfig
arm                            mps2_defconfig
mips                    maltaup_xpa_defconfig
mips                       bmips_be_defconfig
ia64                            zx1_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200623
i386                 randconfig-a002-20200623
i386                 randconfig-a003-20200623
i386                 randconfig-a001-20200623
i386                 randconfig-a005-20200623
i386                 randconfig-a004-20200623
i386                 randconfig-a013-20200623
i386                 randconfig-a016-20200623
i386                 randconfig-a012-20200623
i386                 randconfig-a014-20200623
i386                 randconfig-a015-20200623
i386                 randconfig-a011-20200623
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
