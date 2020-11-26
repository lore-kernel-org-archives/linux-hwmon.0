Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFA8C56201
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 03:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89856216C4
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Nov 2020 03:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgKZDBj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Nov 2020 22:01:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:2602 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731887AbgKZDBi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Nov 2020 22:01:38 -0500
IronPort-SDR: QUdTX7nuqyr3Ol1Eii+wxX9QyZa3R9y1QkQxsWQmn1xgQr2VNulpfFCQNvZfiP8bayTUFrTqTB
 6aRbNqxn9s+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="233835282"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="233835282"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 19:01:37 -0800
IronPort-SDR: XRf05/uHz10Q+K9cXEew5CLZyAaBTFhvxP/XJ3ax+qe39lEC8TZ92wwGCt7EE4u3vwQo0etEpO
 wzRQ3ezw4U0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; 
   d="scan'208";a="547546782"
Received: from lkp-server01.sh.intel.com (HELO dd79da36dde1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2020 19:01:36 -0800
Received: from kbuild by dd79da36dde1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1ki7XL-00002i-HI; Thu, 26 Nov 2020 03:01:35 +0000
Date:   Thu, 26 Nov 2020 11:00:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 e6e2c18f63c62df778ce484945fccad088594533
Message-ID: <5fbf1a68.4lzSmq44U4m3UbqG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: e6e2c18f63c62df778ce484945fccad088594533  docs: hwmon: Document max127 driver

elapsed time: 724m

configs tested: 118
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
mips                     loongson1c_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
sh                          rsk7201_defconfig
nios2                            alldefconfig
m68k                       m5208evb_defconfig
powerpc                      obs600_defconfig
arm                            pleb_defconfig
powerpc                        warp_defconfig
arm                            mps2_defconfig
mips                         rt305x_defconfig
openrisc                         alldefconfig
powerpc                       ebony_defconfig
sh                          r7785rp_defconfig
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
arm                            qcom_defconfig
m68k                        mvme147_defconfig
arm                            dove_defconfig
sh                   rts7751r2dplus_defconfig
mips                  cavium_octeon_defconfig
i386                             alldefconfig
powerpc                    socrates_defconfig
c6x                         dsk6455_defconfig
nios2                               defconfig
xtensa                         virt_defconfig
arc                      axs103_smp_defconfig
arm                           h5000_defconfig
c6x                        evmc6472_defconfig
powerpc                     tqm8541_defconfig
mips                      pic32mzda_defconfig
riscv                            allyesconfig
arm                        neponset_defconfig
xtensa                           allyesconfig
powerpc                     tqm5200_defconfig
powerpc                       holly_defconfig
um                            kunit_defconfig
sh                           se7206_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc64e_defconfig
arm                         cm_x300_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                   lite5200b_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8540_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
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
i386                 randconfig-a004-20201125
i386                 randconfig-a003-20201125
i386                 randconfig-a002-20201125
i386                 randconfig-a005-20201125
i386                 randconfig-a001-20201125
i386                 randconfig-a006-20201125
x86_64               randconfig-a015-20201125
x86_64               randconfig-a011-20201125
x86_64               randconfig-a014-20201125
x86_64               randconfig-a016-20201125
x86_64               randconfig-a012-20201125
x86_64               randconfig-a013-20201125
i386                 randconfig-a012-20201125
i386                 randconfig-a013-20201125
i386                 randconfig-a011-20201125
i386                 randconfig-a016-20201125
i386                 randconfig-a014-20201125
i386                 randconfig-a015-20201125
riscv                    nommu_k210_defconfig
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
