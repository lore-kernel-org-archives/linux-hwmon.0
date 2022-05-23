Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AFCC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 May 2022 08:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbiEWISu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 May 2022 04:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiEWISt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 May 2022 04:18:49 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7354B13D39
        for <linux-hwmon@vger.kernel.org>; Mon, 23 May 2022 01:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653293928; x=1684829928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1I+dybgJGxlVqiyI1uuJcedaddkP/yNWN/0Funl5FDM=;
  b=QhbbW5z4UAM8ZV9cC9FcMT7VeSMoiLYw0chg4gw+WiJAILX7vGMDJhnm
   3DOVbvzz4O/9PNDvHBTu11KLKRuM1V90z+6WH/qRa1d6mf9fCZ2NQjPs3
   GF9lnqeKyNq5NuSymFipCG2CqS1jr3kmRpty/gPlMG3HToJtQTlNYxpok
   m2b6D18eQGqqXOJ/IJdLULQR+oUN0yI3ncy591iezsZUHH6C177EP7bgW
   uNM75BzzA7azRCIUMdu8HzAU1qd+cQo32Sul/fke9qFtWz14XVnERhaOr
   KkTh6Rbgf2DW9VJ6Ze/uLjOlkFNY2OHMSWYL0QBqehLxBNtEMvmlZaOoY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="260749122"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="260749122"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2022 01:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; 
   d="scan'208";a="558533394"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 May 2022 01:18:46 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nt3H3-0000ze-VM;
        Mon, 23 May 2022 08:18:45 +0000
Date:   Mon, 23 May 2022 16:18:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8877ecb0fc8d7662218a8e7ebb0650f320467935
Message-ID: <628b435b.FEyKEppZjsEWCHfS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8877ecb0fc8d7662218a8e7ebb0650f320467935  hwmon: (aquacomputer_d5next) Fix an error handling path in aqc_probe()

elapsed time: 725m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
arc                        vdk_hs38_defconfig
mips                      fuloong2e_defconfig
arm                            hisi_defconfig
parisc                              defconfig
sh                            shmin_defconfig
xtensa                           allyesconfig
arm                         lpc18xx_defconfig
mips                        bcm47xx_defconfig
m68k                        mvme16x_defconfig
powerpc                     asp8347_defconfig
powerpc                         ps3_defconfig
arm                           corgi_defconfig
mips                         tb0226_defconfig
sparc                               defconfig
csky                             alldefconfig
um                             i386_defconfig
arm                        clps711x_defconfig
arm                          pxa3xx_defconfig
mips                           jazz_defconfig
arm                        mvebu_v7_defconfig
sh                     magicpanelr2_defconfig
arm                          pxa910_defconfig
openrisc                         alldefconfig
arc                                 defconfig
arc                              alldefconfig
mips                     decstation_defconfig
m68k                             allyesconfig
arm                           sunxi_defconfig
m68k                                defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
i386                 randconfig-a001-20220523
i386                 randconfig-a006-20220523
i386                 randconfig-a002-20220523
i386                 randconfig-a005-20220523
i386                 randconfig-a003-20220523
i386                 randconfig-a004-20220523
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64               randconfig-a003-20220523
x86_64               randconfig-a002-20220523
x86_64               randconfig-a001-20220523
x86_64               randconfig-a005-20220523
x86_64               randconfig-a006-20220523
x86_64               randconfig-a004-20220523
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220523
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
arc                  randconfig-r043-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                  randconfig-c002-20220522
x86_64                        randconfig-c007
s390                 randconfig-c005-20220522
i386                          randconfig-c001
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
arm                         orion5x_defconfig
mips                     cu1000-neo_defconfig
powerpc                          allyesconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc44x_defconfig
arm                      pxa255-idp_defconfig
mips                           ip27_defconfig
arm                           omap1_defconfig
s390                             alldefconfig
arm                            mmp2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        magician_defconfig
mips                     cu1830-neo_defconfig
arm                          moxart_defconfig
mips                         tb0219_defconfig
powerpc                   bluestone_defconfig
powerpc                     ppa8548_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220523
hexagon              randconfig-r041-20220522
s390                 randconfig-r044-20220523
hexagon              randconfig-r045-20220522
riscv                randconfig-r042-20220523
hexagon              randconfig-r041-20220523

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
