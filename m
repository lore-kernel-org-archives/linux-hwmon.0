Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF5C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Nov 2022 06:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234773AbiKLGj6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Nov 2022 01:39:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234806AbiKLGjy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Nov 2022 01:39:54 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A294459850
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 22:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668235193; x=1699771193;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l7hzU1cCq4UZjyH0bYmQAZmlaIwp0dXqBZ2616x/QG0=;
  b=iHn73dK0UozFOpfz/LHi9mv8wIvhv1JAhyH0MqgCHhcNKZXxfyKOQJM+
   y+qvXiDDXRQORGXm7/mozgpuspxWYZ0Qo0m4ROf4rdIpE3LZ01SXnrlTh
   4EYCquGGamOvkJRI83OJJYKpPXbpbvBEV40AIIPsc5jjWz/0MGt1dHTR0
   xfKDsPPtHhJLOO9tjNFiJa/U3gGVOBlQifChlVyy2xhX7ftpqhZbcjIe5
   ugKOi8iISWURLyzPkkDTnN/xOwrXJ4WLVRUiDp7yZF4RqpPbpeWUj986t
   m1IttkZO3wMqcddUCg7H/cXH7nHStWOfQ2m4U7NmPJD1oAwV1y/r92Tkj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="309335232"
X-IronPort-AV: E=Sophos;i="5.96,158,1665471600"; 
   d="scan'208";a="309335232"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2022 22:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="588747175"
X-IronPort-AV: E=Sophos;i="5.96,158,1665471600"; 
   d="scan'208";a="588747175"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Nov 2022 22:39:35 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otkAx-0004ej-0p;
        Sat, 12 Nov 2022 06:39:35 +0000
Date:   Sat, 12 Nov 2022 14:39:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 3a9a5dcb14beaaca541f4b5961718881dbe61afa
Message-ID: <636f3f8f.k5UHtf0In1TOxSp6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 3a9a5dcb14beaaca541f4b5961718881dbe61afa  hwmon: (ina3221) Fix shunt sum critical calculation

elapsed time: 723m

configs tested: 101
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
i386                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a001
x86_64                        randconfig-a015
i386                          randconfig-a003
i386                          randconfig-a005
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
arm                                 defconfig
arc                  randconfig-r043-20221111
riscv                randconfig-r042-20221111
s390                 randconfig-r044-20221111
sh                               allmodconfig
x86_64                        randconfig-a002
arm                              allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                            allnoconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arm                       imx_v6_v7_defconfig
mips                 decstation_r4k_defconfig
arm                        oxnas_v6_defconfig
ia64                             allmodconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-c001
arm                      footbridge_defconfig
sh                        apsh4ad0a_defconfig
sh                   rts7751r2dplus_defconfig
sh                        sh7757lcr_defconfig
mips                      fuloong2e_defconfig
mips                            gpr_defconfig
arm                         axm55xx_defconfig
parisc                           alldefconfig
parisc64                            defconfig
openrisc                            defconfig
openrisc                  or1klitex_defconfig
m68k                       m5208evb_defconfig
mips                           jazz_defconfig
mips                      loongson3_defconfig
powerpc                      cm5200_defconfig
sparc                       sparc32_defconfig
arm                        spear6xx_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      ppc40x_defconfig
arm                        mvebu_v7_defconfig
mips                 randconfig-c004-20221111
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r045-20221111
hexagon              randconfig-r041-20221111
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
riscv                            alldefconfig
powerpc                      ppc44x_defconfig
mips                           rs90_defconfig
arm                          sp7021_defconfig
powerpc                 mpc8560_ads_defconfig
x86_64                        randconfig-k001
powerpc                  mpc885_ads_defconfig
mips                        qi_lb60_defconfig
mips                  cavium_octeon_defconfig
powerpc                     skiroot_defconfig
powerpc                  mpc866_ads_defconfig
riscv                    nommu_virt_defconfig
arm                       cns3420vb_defconfig
arm                           omap1_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc8272_ads_defconfig
mips                           ip27_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
