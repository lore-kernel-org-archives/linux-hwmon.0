Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22005C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Dec 2021 13:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhLMN3t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Dec 2021 08:29:49 -0500
Received: from mga02.intel.com ([134.134.136.20]:60360 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236835AbhLMN3t (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Dec 2021 08:29:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639402189; x=1670938189;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nmT+MoFh/alz6Z9hqDegr7CJFrUuaZr0kmMQCgs0WFY=;
  b=Gp9EoHjpZkjmP5PflStZlhxMDDYKX+E/FiCITkivJ7D8qCLCKWL/BmmP
   1KqBpKXvEIfp0P44tr8Uc83HNokT5Pgz3XvHi7Z2bs1MvfmyBscqAwckj
   cQwVQ2J3/gBr6JzxJ68L/KSe8Z8LUAoN7PMQ1DQGzqaKCZ9LjP3slIQY+
   bQnUgpBXmQTuzyCpEE3LUOxa6QX9LjY1uzuweBTxp5u6K+754I/BC4Nd2
   vyTNuHVauOd9OzErn5x3QJljgbG6xlH1nLfCk9qYjdUY0q5WCOWxtZd0x
   ESvA/Q9+MbBjIDc1SEnmnk4RBK3g65nMzzb9YFLv32LxyTq7DfwK+rmo5
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="226007195"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="226007195"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 05:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="613823669"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 05:29:47 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mwlOk-0006i9-KV; Mon, 13 Dec 2021 13:29:46 +0000
Date:   Mon, 13 Dec 2021 21:29:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 df159e2b2601febe38eba814476bcaa0084f8430
Message-ID: <61b74aa5.6yqzbovSjWofgdfv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: df159e2b2601febe38eba814476bcaa0084f8430  hwmon: (ntc_thermistor) Move DT matches to the driver block

elapsed time: 729m

configs tested: 176
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211213
s390                          debug_defconfig
powerpc                   bluestone_defconfig
arm                         s3c6400_defconfig
m68k                       bvme6000_defconfig
powerpc                     ppa8548_defconfig
powerpc                      pasemi_defconfig
mips                        jmr3927_defconfig
powerpc                       holly_defconfig
powerpc                          allmodconfig
powerpc                      ep88xc_defconfig
arm                           h3600_defconfig
sh                        edosk7760_defconfig
sh                        sh7757lcr_defconfig
powerpc                     ep8248e_defconfig
arm                           omap1_defconfig
mips                  decstation_64_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
powerpc                      pcm030_defconfig
mips                     loongson1b_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
ia64                      gensparse_defconfig
m68k                          amiga_defconfig
powerpc                     pseries_defconfig
sh                           se7750_defconfig
powerpc                         wii_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                       imx_v6_v7_defconfig
sh                        apsh4ad0a_defconfig
arc                           tb10x_defconfig
mips                     cu1830-neo_defconfig
mips                     loongson1c_defconfig
mips                           mtx1_defconfig
mips                         rt305x_defconfig
arm                       mainstone_defconfig
parisc                generic-64bit_defconfig
m68k                            mac_defconfig
powerpc                     mpc83xx_defconfig
arc                        vdk_hs38_defconfig
arc                                 defconfig
xtensa                              defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                       aspeed_g4_defconfig
sh                         ap325rxa_defconfig
sh                             shx3_defconfig
arm                          pxa168_defconfig
arc                          axs103_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                     pq2fads_defconfig
arm                       cns3420vb_defconfig
arm                            hisi_defconfig
powerpc                      pmac32_defconfig
xtensa                  cadence_csp_defconfig
m68k                                defconfig
xtensa                  nommu_kc705_defconfig
sh                          kfr2r09_defconfig
sh                          r7785rp_defconfig
sh                           sh2007_defconfig
arc                     nsimosci_hs_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
sh                            migor_defconfig
sh                        edosk7705_defconfig
powerpc                     tqm8541_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         at91_dt_defconfig
powerpc                      ppc64e_defconfig
mips                       rbtx49xx_defconfig
nds32                               defconfig
arm                      tct_hammer_defconfig
mips                           ip32_defconfig
h8300                    h8300h-sim_defconfig
powerpc64                        alldefconfig
i386                             alldefconfig
powerpc                     tqm8540_defconfig
powerpc                     skiroot_defconfig
microblaze                          defconfig
arm                          lpd270_defconfig
mips                         tb0287_defconfig
arm                          pxa3xx_defconfig
sh                          r7780mp_defconfig
ia64                        generic_defconfig
mips                           ip27_defconfig
sh                         apsh4a3a_defconfig
arm                          iop32x_defconfig
arm                              alldefconfig
riscv                    nommu_k210_defconfig
arm                            pleb_defconfig
arm                             rpc_defconfig
um                                  defconfig
arm                  randconfig-c002-20211213
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
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
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20211213
x86_64               randconfig-a012-20211213
x86_64               randconfig-a014-20211213
x86_64               randconfig-a013-20211213
x86_64               randconfig-a016-20211213
x86_64               randconfig-a015-20211213
i386                 randconfig-a013-20211213
i386                 randconfig-a011-20211213
i386                 randconfig-a014-20211213
i386                 randconfig-a015-20211213
i386                 randconfig-a012-20211213
i386                 randconfig-a016-20211213
s390                 randconfig-r044-20211213
riscv                randconfig-r042-20211213
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211213
arm                  randconfig-c002-20211213
riscv                randconfig-c006-20211213
mips                 randconfig-c004-20211213
i386                 randconfig-c001-20211213
s390                 randconfig-c005-20211213
powerpc              randconfig-c003-20211213
x86_64               randconfig-a001-20211213
x86_64               randconfig-a002-20211213
x86_64               randconfig-a003-20211213
x86_64               randconfig-a004-20211213
x86_64               randconfig-a006-20211213
x86_64               randconfig-a005-20211213
i386                 randconfig-a001-20211213
i386                 randconfig-a002-20211213
i386                 randconfig-a005-20211213
i386                 randconfig-a003-20211213
i386                 randconfig-a006-20211213
i386                 randconfig-a004-20211213
hexagon              randconfig-r045-20211213
hexagon              randconfig-r041-20211213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
