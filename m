Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92166C43460
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 15:21:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6823261176
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 15:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234610AbhEMPWr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 11:22:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:1638 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234765AbhEMPWg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 11:22:36 -0400
IronPort-SDR: FSJGXSfX9Fhq2pt8V0KPHfYX/Mt/PiXYQeP5gdk/7qB/OGOzmKlRaZ7X4DAYv0Yft6qVOqw7Et
 EzNKgZmPeG2g==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="199652330"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="199652330"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2021 08:21:25 -0700
IronPort-SDR: XcqkedOW2/uNUiyMleczt6JEC+GbulQuXl0LdxX815728Vj7f9HteVlTk2MR7Hpgy98E1HyFpm
 NfmDhJw14+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; 
   d="scan'208";a="610410295"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2021 08:21:23 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lhD9O-0000Jj-PF; Thu, 13 May 2021 15:21:22 +0000
Date:   Thu, 13 May 2021 23:20:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 3b5169c2eb81e822445469a077223f8eb0729a59
Message-ID: <609d43d5.JfPU/z6mSYg/kQI4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 3b5169c2eb81e822445469a077223f8eb0729a59  hwmon: (adm9240) Fix writes into inX_max attributes

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
arm                       aspeed_g4_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      mgcoge_defconfig
powerpc                   lite5200b_defconfig
sparc64                          alldefconfig
sh                 kfr2r09-romimage_defconfig
m68k                         apollo_defconfig
sh                          r7785rp_defconfig
arm                        mini2440_defconfig
powerpc                   currituck_defconfig
xtensa                              defconfig
mips                            ar7_defconfig
mips                             allyesconfig
sh                        sh7763rdp_defconfig
arm                            pleb_defconfig
arc                            hsdk_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                       maple_defconfig
powerpc                 linkstation_defconfig
powerpc                  storcenter_defconfig
ia64                             alldefconfig
powerpc                     powernv_defconfig
sh                             sh03_defconfig
powerpc                 mpc8313_rdb_defconfig
m68k                       m5249evb_defconfig
arm                         s5pv210_defconfig
arc                     nsimosci_hs_defconfig
m68k                          hp300_defconfig
arm                      footbridge_defconfig
sh                         ecovec24_defconfig
powerpc                  iss476-smp_defconfig
powerpc                       ebony_defconfig
arm                            lart_defconfig
m68k                           sun3_defconfig
um                            kunit_defconfig
riscv                          rv32_defconfig
mips                      malta_kvm_defconfig
arm                       imx_v6_v7_defconfig
arm                         lubbock_defconfig
sh                              ul2_defconfig
sh                           se7619_defconfig
powerpc                      tqm8xx_defconfig
arm                       imx_v4_v5_defconfig
h8300                     edosk2674_defconfig
sh                          rsk7264_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                          rb532_defconfig
h8300                               defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210513
i386                 randconfig-a001-20210513
i386                 randconfig-a005-20210513
i386                 randconfig-a004-20210513
i386                 randconfig-a002-20210513
i386                 randconfig-a006-20210513
x86_64               randconfig-a012-20210513
x86_64               randconfig-a015-20210513
x86_64               randconfig-a011-20210513
x86_64               randconfig-a013-20210513
x86_64               randconfig-a016-20210513
x86_64               randconfig-a014-20210513
i386                 randconfig-a016-20210513
i386                 randconfig-a014-20210513
i386                 randconfig-a011-20210513
i386                 randconfig-a015-20210513
i386                 randconfig-a012-20210513
i386                 randconfig-a013-20210513
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                      rhel-8.3-kbuiltin
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210513
x86_64               randconfig-a004-20210513
x86_64               randconfig-a001-20210513
x86_64               randconfig-a005-20210513
x86_64               randconfig-a002-20210513
x86_64               randconfig-a006-20210513

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
