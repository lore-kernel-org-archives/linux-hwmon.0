Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEC0C49EA5
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 03:28:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9C9A613FB
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Jun 2021 03:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhFYDav (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Jun 2021 23:30:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:54528 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232917AbhFYDau (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Jun 2021 23:30:50 -0400
IronPort-SDR: L3czQMprTgu6/2S7LxoJZBx5rb/Qv6emn8xt4QM/+xlD/q+hYF2tZP4SN/W1E0c4mVnZTh+Pci
 Kfb7b8PbBiuw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="187289600"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; 
   d="scan'208";a="187289600"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2021 20:28:28 -0700
IronPort-SDR: iGounwskdySMb2fb3ySBnVffDKvvxn8SOxB0rydBqNrA71tb8vlWs3Yq8lkUzW1yvpPAvPvOqu
 EwLQ+eg7zBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; 
   d="scan'208";a="488026385"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jun 2021 20:28:27 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lwcW1-0006sJ-NU; Fri, 25 Jun 2021 03:28:25 +0000
Date:   Fri, 25 Jun 2021 11:27:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 a5f6c0f85a09f46c88c0ac53f3d2f70eef105a65
Message-ID: <60d54d3c.dojOue6DTvOYOdAt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a5f6c0f85a09f46c88c0ac53f3d2f70eef105a65  hwmon: Support set_trips() of thermal device ops

elapsed time: 790m

configs tested: 148
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             rpc_defconfig
arm                        magician_defconfig
mips                      maltasmvp_defconfig
s390                                defconfig
powerpc                      ppc44x_defconfig
mips                     decstation_defconfig
arm                       aspeed_g5_defconfig
mips                     loongson1c_defconfig
sh                        dreamcast_defconfig
sh                        sh7785lcr_defconfig
powerpc                     akebono_defconfig
ia64                             allmodconfig
xtensa                generic_kc705_defconfig
openrisc                    or1ksim_defconfig
mips                        workpad_defconfig
sh                          urquell_defconfig
mips                        omega2p_defconfig
sh                         ecovec24_defconfig
mips                         rt305x_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
powerpc                 mpc8540_ads_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8555_defconfig
xtensa                       common_defconfig
powerpc                     stx_gp3_defconfig
xtensa                  cadence_csp_defconfig
arm                      pxa255-idp_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                        edosk7705_defconfig
mips                         tb0287_defconfig
arm                     davinci_all_defconfig
parisc                generic-64bit_defconfig
powerpc                    gamecube_defconfig
parisc                           allyesconfig
m68k                        m5307c3_defconfig
m68k                         amcore_defconfig
xtensa                          iss_defconfig
arm                       multi_v4t_defconfig
mips                    maltaup_xpa_defconfig
um                                  defconfig
riscv                          rv32_defconfig
arm                        clps711x_defconfig
sh                           se7343_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc834x_mds_defconfig
arm                           sunxi_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                   milbeaut_m10v_defconfig
arm                           tegra_defconfig
s390                          debug_defconfig
powerpc                       ebony_defconfig
powerpc                       holly_defconfig
powerpc                     sbc8548_defconfig
arm                         palmz72_defconfig
m68k                        mvme147_defconfig
arm                          ixp4xx_defconfig
arm                          pxa910_defconfig
powerpc                     ppa8548_defconfig
x86_64                            allnoconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210622
i386                 randconfig-a002-20210622
i386                 randconfig-a003-20210622
i386                 randconfig-a006-20210622
i386                 randconfig-a005-20210622
i386                 randconfig-a004-20210622
i386                 randconfig-a002-20210623
i386                 randconfig-a001-20210623
i386                 randconfig-a003-20210623
i386                 randconfig-a006-20210623
i386                 randconfig-a005-20210623
i386                 randconfig-a004-20210623
x86_64               randconfig-a012-20210622
x86_64               randconfig-a016-20210622
x86_64               randconfig-a015-20210622
x86_64               randconfig-a014-20210622
x86_64               randconfig-a013-20210622
x86_64               randconfig-a011-20210622
i386                 randconfig-a011-20210623
i386                 randconfig-a014-20210623
i386                 randconfig-a013-20210623
i386                 randconfig-a015-20210623
i386                 randconfig-a012-20210623
i386                 randconfig-a016-20210623
i386                 randconfig-a011-20210622
i386                 randconfig-a014-20210622
i386                 randconfig-a013-20210622
i386                 randconfig-a015-20210622
i386                 randconfig-a012-20210622
i386                 randconfig-a016-20210622
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210622
x86_64               randconfig-a002-20210622
x86_64               randconfig-a001-20210622
x86_64               randconfig-a005-20210622
x86_64               randconfig-a003-20210622
x86_64               randconfig-a004-20210622
x86_64               randconfig-a006-20210622

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
