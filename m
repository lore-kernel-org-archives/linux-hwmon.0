Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF06EC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Feb 2022 14:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbiB1OKq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Feb 2022 09:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbiB1OKZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Feb 2022 09:10:25 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B38E7EA25
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Feb 2022 06:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646057362; x=1677593362;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uhCLnY9EmouIpxlZWRNaIbIn0bPs7/jq39+NuGwbxUQ=;
  b=W0p5pXAfV35jI5eW9NtsB/rzmM6/33TIawVH0LWtpDH/PhQ/RkYD9W8F
   RT2rgqD5XXC4gpa2I4vw1aqNKhVpQa23/vq7369oAmgrHJrGPHiL/39y5
   Gm3nHHZPjA7Qv1DAu8/CtXK2s1J5sKH3H6bLol8azuzmuUpcBX3jf8h5a
   RxYWN6gFPhFIa22i7Pyiq1q/BnDJFgv9jW3CFDYiAODw/lSEiln9xM4RB
   g+fESg7cWFtBRsO/77EgN8pHye5BLVJsZ/SkniZqS8zEPDa/3g06PJxjS
   yiSOZzTbRA0oAJ5x7JFiKV4iZv0AWFWkPbbD2YGl0fp6YZWzoB0PNIhOF
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="277547199"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="277547199"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 06:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; 
   d="scan'208";a="510097088"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Feb 2022 06:05:08 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nOgeC-0007QJ-33; Mon, 28 Feb 2022 14:05:08 +0000
Date:   Mon, 28 Feb 2022 22:04:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2fd3eec19c6e0a2c218853db9df27d4e74921673
Message-ID: <621cd685.Mke9jD390sCdhqHl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2fd3eec19c6e0a2c218853db9df27d4e74921673  hwmon: (aquacomputer_d5next) Add support for Aquacomputer Farbwerk 360

elapsed time: 723m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220228
i386                          randconfig-c001
powerpc                    sam440ep_defconfig
sparc                            allyesconfig
mips                           xway_defconfig
sh                        sh7785lcr_defconfig
arm                          lpd270_defconfig
arm                            zeus_defconfig
mips                           ip32_defconfig
m68k                           sun3_defconfig
mips                      loongson3_defconfig
arc                         haps_hs_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
s390                       zfcpdump_defconfig
sparc                               defconfig
xtensa                    smp_lx200_defconfig
microblaze                          defconfig
sh                          rsk7264_defconfig
arc                     haps_hs_smp_defconfig
openrisc                 simple_smp_defconfig
riscv                    nommu_k210_defconfig
openrisc                         alldefconfig
sh                   rts7751r2dplus_defconfig
arc                     nsimosci_hs_defconfig
parisc                              defconfig
mips                             allyesconfig
sh                        sh7757lcr_defconfig
arm                      integrator_defconfig
xtensa                          iss_defconfig
m68k                                defconfig
sh                          r7780mp_defconfig
mips                           jazz_defconfig
xtensa                  cadence_csp_defconfig
arc                          axs103_defconfig
sh                      rts7751r2d1_defconfig
sh                          polaris_defconfig
sh                             sh03_defconfig
sh                           se7705_defconfig
arm                           h3600_defconfig
m68k                       m5249evb_defconfig
sh                           se7206_defconfig
arc                        vdk_hs38_defconfig
nds32                               defconfig
arm                             ezx_defconfig
powerpc                      mgcoge_defconfig
arm                            pleb_defconfig
arm                        multi_v7_defconfig
sh                          urquell_defconfig
m68k                        mvme16x_defconfig
powerpc                     rainier_defconfig
arm                          pxa910_defconfig
arm                  randconfig-c002-20220228
arm                  randconfig-c002-20220227
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20220228
x86_64               randconfig-a015-20220228
x86_64               randconfig-a014-20220228
x86_64               randconfig-a013-20220228
x86_64               randconfig-a016-20220228
x86_64               randconfig-a012-20220228
i386                 randconfig-a016-20220228
i386                 randconfig-a012-20220228
i386                 randconfig-a015-20220228
i386                 randconfig-a011-20220228
i386                 randconfig-a013-20220228
i386                 randconfig-a014-20220228
s390                 randconfig-r044-20220228
arc                  randconfig-r043-20220228
arc                  randconfig-r043-20220227
riscv                randconfig-r042-20220228
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
powerpc              randconfig-c003-20220227
x86_64                        randconfig-c007
arm                  randconfig-c002-20220227
mips                 randconfig-c004-20220227
i386                          randconfig-c001
riscv                randconfig-c006-20220227
s390                 randconfig-c005-20220227
arm                          imote2_defconfig
riscv                            alldefconfig
mips                        qi_lb60_defconfig
mips                          rm200_defconfig
hexagon                          alldefconfig
mips                   sb1250_swarm_defconfig
mips                      bmips_stb_defconfig
riscv                    nommu_virt_defconfig
powerpc                     ksi8560_defconfig
powerpc                        icon_defconfig
mips                      maltaaprp_defconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220228
x86_64               randconfig-a005-20220228
x86_64               randconfig-a002-20220228
x86_64               randconfig-a006-20220228
x86_64               randconfig-a001-20220228
x86_64               randconfig-a004-20220228
i386                 randconfig-a002-20220228
i386                 randconfig-a001-20220228
i386                 randconfig-a005-20220228
i386                 randconfig-a003-20220228
i386                 randconfig-a006-20220228
i386                 randconfig-a004-20220228
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220227
hexagon              randconfig-r041-20220228
hexagon              randconfig-r045-20220227
hexagon              randconfig-r041-20220227
hexagon              randconfig-r045-20220228
s390                 randconfig-r044-20220227

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
