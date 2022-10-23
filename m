Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB58BC433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Oct 2022 03:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiJWDTL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 Oct 2022 23:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiJWDTI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Oct 2022 23:19:08 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE786B8E6
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Oct 2022 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666495146; x=1698031146;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GbepCLHaIO1Qxcp1LFCiDTh/sz246K56IihhLe/xyhI=;
  b=fq8RIYz6+8JqEtV1IBw3UcA+C4hjuPsVl5uHv4huPE70KZFzaqD64ERg
   BFgAnm55uhkMlx+94dcU9AavS6vyhe/l9tICjGmA47kneUvg3Dyx4HW3u
   PysjVvWdpf7xTCKLtAmcmKQCgS6ke7xa6zMlqvAZdAcvptuPNlIcodMwT
   aPd5GXS3HG/REUv6gKQlcOfPF/hD7JxqrNnaqaC4+5++OsCSvxncqA2py
   VvpJHB+SO0fj0Aqjbd1TC9BOcO3nxY6WesNMMDLBF6JMHomXJ1aut1USz
   YTuL9WZ7htm2XzDoyGYWBFzvwYBuTHZK55PrhY0EthHjDgZAYG+FaTbQL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="307221458"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="307221458"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2022 20:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10508"; a="960052404"
X-IronPort-AV: E=Sophos;i="5.95,206,1661842800"; 
   d="scan'208";a="960052404"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Oct 2022 20:18:58 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1omRVp-00045m-1w;
        Sun, 23 Oct 2022 03:18:57 +0000
Date:   Sun, 23 Oct 2022 11:18:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 5619c6609130bce910736a61724a5ee033a0822c
Message-ID: <6354b29a.6DHmqrTDqT35cbil%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 5619c6609130bce910736a61724a5ee033a0822c  hwmon: (corsair-psu) Add USB id of the new HX1500i psu

elapsed time: 723m

configs tested: 105
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
i386                                defconfig
um                           x86_64_defconfig
i386                          randconfig-a001
arc                                 defconfig
x86_64                              defconfig
s390                             allmodconfig
alpha                               defconfig
i386                          randconfig-a003
x86_64                               rhel-8.3
s390                                defconfig
i386                          randconfig-a005
arm                                 defconfig
x86_64                        randconfig-a002
arm                              allyesconfig
x86_64                           allyesconfig
x86_64                        randconfig-a013
i386                          randconfig-a014
x86_64                        randconfig-a004
x86_64                        randconfig-a011
arm64                            allyesconfig
x86_64                        randconfig-a006
i386                          randconfig-a012
s390                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
i386                          randconfig-a016
x86_64                        randconfig-a015
powerpc                          allmodconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
s390                 randconfig-r044-20221018
sh                               allmodconfig
s390                 randconfig-r044-20221022
m68k                             allmodconfig
x86_64                           rhel-8.3-syz
arc                              allyesconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
arc                  randconfig-r043-20221020
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221022
m68k                             allyesconfig
s390                 randconfig-r044-20221020
arc                  randconfig-r043-20221018
riscv                randconfig-r042-20221020
riscv                randconfig-r042-20221022
riscv                randconfig-r042-20221018
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

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221022
hexagon              randconfig-r041-20221020
hexagon              randconfig-r045-20221022
hexagon              randconfig-r045-20221020
hexagon              randconfig-r041-20221018
hexagon              randconfig-r045-20221018
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
