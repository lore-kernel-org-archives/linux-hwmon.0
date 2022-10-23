Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0774EC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Oct 2022 04:38:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiJWEiT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Oct 2022 00:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJWEiS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Oct 2022 00:38:18 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D707B1C3
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Oct 2022 21:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666499897; x=1698035897;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oTWh1CK86g2uZUoVWw8PrAgIIkxDcj7RIeshg4A/aKY=;
  b=DIUR/bi6itdOOuUwxdzfKCnKz84vVJleVcsqTR36wTHO0HPQ+Rk9zLy1
   DDQ7Wp/tjYHNH1xmR2L1E2BvIRbenV1FC5TWvHAqw9Z4Twb7lcQ5iJCLY
   bDOvQYD0MANb49DOe+kjDnJflXtV6yyAM/i2zJ63myOcQ6iVe2am9o4Sg
   rufk4YpLqP3EBql3fE4ENSpupds1aDgtC6ylqOywZGknB++KK+1zXGkGk
   rj64cyyG5mjHDi9YyMQOcfIRfdwrwP7JljErCj9pb5JQRH3bnzNxUrbfi
   eCVSx21vGRRLuSIiMd3CYiQVU7j/HEUc2FB9skGNL92EZkN1SgUY3IhcE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="333814467"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="333814467"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 21:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="630914660"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="630914660"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Oct 2022 21:38:16 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1omSkZ-00047m-1o;
        Sun, 23 Oct 2022 04:38:15 +0000
Date:   Sun, 23 Oct 2022 12:38:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 82067edc4508ae448a5377c19814fe2bacb3a003
Message-ID: <6354c530.VM0KydUZ1RCOGeZ1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 82067edc4508ae448a5377c19814fe2bacb3a003  hwmon: (adm1177) simplify using devm_regulator_get_enable()

elapsed time: 801m

configs tested: 109
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arc                              allyesconfig
arc                                 defconfig
alpha                            allyesconfig
m68k                             allyesconfig
alpha                               defconfig
x86_64                              defconfig
s390                                defconfig
arm                                 defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a001
i386                          randconfig-a003
arm64                            allyesconfig
i386                          randconfig-a005
arm                              allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
i386                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
s390                 randconfig-r044-20221018
s390                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
arc                  randconfig-r043-20221020
arc                  randconfig-r043-20221022
x86_64                        randconfig-a015
s390                 randconfig-r044-20221020
arc                  randconfig-r043-20221018
i386                          randconfig-a012
i386                          randconfig-a016
riscv                randconfig-r042-20221020
x86_64                           rhel-8.3-kvm
riscv                randconfig-r042-20221022
i386                          randconfig-a014
x86_64                           rhel-8.3-syz
riscv                randconfig-r042-20221018
x86_64                         rhel-8.3-kunit
s390                 randconfig-r044-20221022
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                        nsimosci_defconfig
microblaze                          defconfig
powerpc                 mpc834x_mds_defconfig
arm                          lpd270_defconfig
arm                        clps711x_defconfig
mips                       bmips_be_defconfig
arm                            mps2_defconfig
arc                     nsimosci_hs_defconfig
i386                          randconfig-c001
m68k                         apollo_defconfig
powerpc                  iss476-smp_defconfig
sh                           se7619_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sh                           se7206_defconfig
sh                          r7780mp_defconfig
sparc64                          alldefconfig
m68k                             alldefconfig
powerpc                 mpc8540_ads_defconfig
powerpc                     tqm8555_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
powerpc                      makalu_defconfig
sh                     sh7710voipgw_defconfig
arm                      footbridge_defconfig
csky                              allnoconfig
arm                          exynos_defconfig
sh                          urquell_defconfig
m68k                             allmodconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
hexagon              randconfig-r041-20221022
i386                          randconfig-a006
hexagon              randconfig-r041-20221020
hexagon              randconfig-r045-20221022
x86_64                        randconfig-a012
hexagon              randconfig-r045-20221020
i386                          randconfig-a011
hexagon              randconfig-r041-20221018
hexagon              randconfig-r045-20221018
x86_64                        randconfig-a016
x86_64                        randconfig-a014
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-k001
mips                        bcm63xx_defconfig
mips                      bmips_stb_defconfig
mips                      maltaaprp_defconfig
powerpc                      walnut_defconfig
arm                            mmp2_defconfig
arm                      pxa255-idp_defconfig
arm                         socfpga_defconfig
arm                             mxs_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
