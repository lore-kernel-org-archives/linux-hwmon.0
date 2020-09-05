Return-Path: <SRS0=Sfjw=CO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3C6C433E2
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FC72206B8
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Sep 2020 14:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgIEOpl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Sep 2020 10:45:41 -0400
Received: from mga18.intel.com ([134.134.136.126]:3768 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727875AbgIEOpe (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Sep 2020 10:45:34 -0400
IronPort-SDR: wcT4TVt1AqfdAYJytRa+GJ4+PI9IoRSt2KcUAA7GYdAz6YGwGeIT2zgxYO6LsGzsn5EeH7coxb
 8f6dwiEA3MAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9734"; a="145568642"
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; 
   d="scan'208";a="145568642"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2020 07:45:27 -0700
IronPort-SDR: GMkVccxkoQ4odHP0ifVQDCjo+I7MBa2m4G2kjCNF3V7j9TN6oWNekIdQ9e/soXbZh/VKmg9Mpx
 f7teRsaYzliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,394,1592895600"; 
   d="scan'208";a="283474177"
Received: from lkp-server02.sh.intel.com (HELO c089623da072) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 05 Sep 2020 07:45:26 -0700
Received: from kbuild by c089623da072 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kEZRV-0000Ex-Rq; Sat, 05 Sep 2020 14:45:25 +0000
Date:   Sat, 05 Sep 2020 22:44:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 d50e0d75000410249090297ca55ee895f518ee27
Message-ID: <5f53a458.Lpi18T6SR5qbqwdk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: d50e0d75000410249090297ca55ee895f518ee27  hwmon: (sparx5) Fix initial reading of temperature

elapsed time: 1179m

configs tested: 135
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                     haps_hs_smp_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
m68k                       m5249evb_defconfig
arm                         mv78xx0_defconfig
sh                        edosk7705_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          atari_defconfig
mips                     loongson1c_defconfig
mips                       bmips_be_defconfig
xtensa                              defconfig
mips                      maltaaprp_defconfig
arm                         axm55xx_defconfig
xtensa                    xip_kc705_defconfig
m68k                                defconfig
powerpc                          allmodconfig
s390                                defconfig
arc                         haps_hs_defconfig
arm                              zx_defconfig
powerpc                      ppc64e_defconfig
arm                        mvebu_v5_defconfig
mips                          malta_defconfig
openrisc                 simple_smp_defconfig
arm                         nhk8815_defconfig
sh                          rsk7264_defconfig
powerpc                          allyesconfig
sh                           se7751_defconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
arm                      tct_hammer_defconfig
sh                             sh03_defconfig
mips                      loongson3_defconfig
powerpc                           allnoconfig
alpha                            alldefconfig
mips                        qi_lb60_defconfig
arm                     am200epdkit_defconfig
sh                     sh7710voipgw_defconfig
arm                        multi_v7_defconfig
nios2                            alldefconfig
sh                          landisk_defconfig
mips                            ar7_defconfig
sh                           se7619_defconfig
arc                              allyesconfig
sh                   sh7724_generic_defconfig
riscv                             allnoconfig
ia64                         bigsur_defconfig
arc                     nsimosci_hs_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
powerpc                     skiroot_defconfig
sh                         ecovec24_defconfig
arm                            qcom_defconfig
powerpc                  storcenter_defconfig
arm                          iop32x_defconfig
xtensa                generic_kc705_defconfig
ia64                          tiger_defconfig
xtensa                           allyesconfig
mips                           xway_defconfig
m68k                       m5275evb_defconfig
m68k                          sun3x_defconfig
mips                      pistachio_defconfig
arm                            mps2_defconfig
openrisc                    or1ksim_defconfig
openrisc                         alldefconfig
m68k                        stmark2_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200905
x86_64               randconfig-a004-20200905
x86_64               randconfig-a003-20200905
x86_64               randconfig-a005-20200905
x86_64               randconfig-a001-20200905
x86_64               randconfig-a002-20200905
i386                 randconfig-a004-20200904
i386                 randconfig-a005-20200904
i386                 randconfig-a006-20200904
i386                 randconfig-a002-20200904
i386                 randconfig-a003-20200904
i386                 randconfig-a001-20200904
x86_64               randconfig-a013-20200904
x86_64               randconfig-a011-20200904
x86_64               randconfig-a016-20200904
x86_64               randconfig-a012-20200904
x86_64               randconfig-a015-20200904
x86_64               randconfig-a014-20200904
i386                 randconfig-a016-20200905
i386                 randconfig-a015-20200905
i386                 randconfig-a011-20200905
i386                 randconfig-a013-20200905
i386                 randconfig-a014-20200905
i386                 randconfig-a012-20200905
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20200904
x86_64               randconfig-a004-20200904
x86_64               randconfig-a003-20200904
x86_64               randconfig-a005-20200904
x86_64               randconfig-a001-20200904
x86_64               randconfig-a002-20200904

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
