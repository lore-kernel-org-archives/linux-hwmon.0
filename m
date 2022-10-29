Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E03C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 08:09:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiJ2IJS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 04:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJ2IJS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 04:09:18 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB1FC7B7AD
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 01:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667030957; x=1698566957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ylKAa9z2lgpzaCKeogQul/V3yyN5+g5I6l0rEvDzR4E=;
  b=ORd5Glr6mPz364kh9nTCXRc8PACDJK/FVKezf0XXrLOS3sP41C27PT3L
   iKIMmDTNTexaGFki+C22mqoW52H7z/7g5yrMcsNLL0P3e1yqi3MIywMBA
   dI+4KDsTFfKBojtglABCMXE9P4cSI+oAYEArJdOHopLUjFFWtqp0mUq0m
   J0DWuD42tOdprP4WJjr2dG4qamd6LZDBZh8NvkApVkwgQ0tSZAOlHwL5U
   pvunqmzKxPUAhLr+bbDm000DFSc/5kUczsGs2XBzdE1PX0Kiobboxvu4l
   j93m0TodvgDRl3qD3rk/5xaDe8sImFnUrCT9Ioe/V1XGl4bdDLkkOgs8n
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="288364290"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="288364290"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 01:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="610994405"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="610994405"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Oct 2022 01:09:16 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oogu3-000AnR-1i;
        Sat, 29 Oct 2022 08:09:15 +0000
Date:   Sat, 29 Oct 2022 16:09:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 e9fab0e2edf917b825608a6b8ca77135a295636a
Message-ID: <635cdfa0.1IAUfygvdFy66o1t%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: e9fab0e2edf917b825608a6b8ca77135a295636a  hwmon: (pmbus/ltc2978) add support for LTC7132

elapsed time: 796m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                          allmodconfig
arc                                 defconfig
mips                             allyesconfig
powerpc                           allnoconfig
alpha                               defconfig
sh                               allmodconfig
s390                             allmodconfig
s390                                defconfig
um                             i386_defconfig
um                           x86_64_defconfig
ia64                             allmodconfig
arc                              allyesconfig
x86_64                              defconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
i386                                defconfig
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
arc                  randconfig-r043-20221028
x86_64                    rhel-8.3-kselftests
riscv                randconfig-r042-20221028
s390                 randconfig-r044-20221028
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a002
i386                          randconfig-a016
i386                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a004
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a006
x86_64                        randconfig-a015
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
m68k                             allmodconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
xtensa                  nommu_kc705_defconfig
sparc64                          alldefconfig
powerpc                      ep88xc_defconfig
powerpc                       ppc64_defconfig
powerpc                      makalu_defconfig
arm                           u8500_defconfig
arm                         lpc18xx_defconfig
arm                      jornada720_defconfig
i386                          randconfig-c001
sparc                            allyesconfig
powerpc                    sam440ep_defconfig
csky                             alldefconfig
m68k                        mvme16x_defconfig
powerpc                 canyonlands_defconfig

clang tested configs:
hexagon              randconfig-r041-20221028
hexagon              randconfig-r045-20221028
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a001
i386                          randconfig-a015
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a005
i386                          randconfig-a002
x86_64                        randconfig-a012
i386                          randconfig-a004
x86_64                        randconfig-a016
i386                          randconfig-a006
s390                 randconfig-r044-20221029
hexagon              randconfig-r041-20221029
hexagon              randconfig-r045-20221029
riscv                randconfig-r042-20221029
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
