Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59544C7EE24
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Jun 2023 10:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjFCKjc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Jun 2023 06:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbjFCKjb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Jun 2023 06:39:31 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1981B7
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Jun 2023 03:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685788770; x=1717324770;
  h=date:from:to:cc:subject:message-id;
  bh=tvMbNZ3RCZg/peWHtQciNkKNb4V2Vp9ggeiPACAd6xA=;
  b=bosaX1hSM/0pZLl5eL8wshKwHTDRP0y1w20sUb7N4Qpax/scGprRk2N2
   0hAEzp4vZLDm/V74He9RiqCpneXMQasUwUsUemzcyQtffG75zrEXX4OYK
   FsJiDpYTTVKHzhcmr4FiStIT3/HFIOidQtcGKPHDFk2v2JXsStxw2QLV0
   nrlOdKZUduJ8qDa5rG93WUPGPQj92stw7ui5acKhnqolE8i53xb2ADuik
   Gn3zeaE/l/8schMee9D7I66T1l+Zy3RYwTZAMY8gLM2HpCqwuZ/4iQ9hK
   552FbxWGlVoHNlE7ZNfR68BvQZvNBozAIfXSrNeTuhvyoUJZKd+bEHFJr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="335677193"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="335677193"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 03:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="737824189"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="737824189"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2023 03:38:30 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q5OeT-0001Wh-1j;
        Sat, 03 Jun 2023 10:38:29 +0000
Date:   Sat, 03 Jun 2023 18:38:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 473595b01086f98e63e597b4821a965f02033129
Message-ID: <20230603103807.HbRou%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 473595b01086f98e63e597b4821a965f02033129  hwmon: (hp-wmi-sensors) fix debugfs check

elapsed time: 720m

configs tested: 179
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230601   gcc  
alpha                randconfig-r033-20230602   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230531   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                  randconfig-r024-20230531   gcc  
arm                  randconfig-r046-20230531   gcc  
arm                             rpc_defconfig   gcc  
arm                           sama7_defconfig   clang
arm                           spitz_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230602   gcc  
arm64                randconfig-r036-20230602   gcc  
csky         buildonly-randconfig-r005-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r023-20230531   gcc  
hexagon              randconfig-r016-20230601   clang
hexagon              randconfig-r022-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i011-20230603   gcc  
i386                 randconfig-i012-20230603   gcc  
i386                 randconfig-i013-20230603   gcc  
i386                 randconfig-i014-20230603   gcc  
i386                 randconfig-i015-20230603   gcc  
i386                 randconfig-i016-20230603   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i051-20230602   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i052-20230602   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i053-20230602   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i054-20230602   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i055-20230602   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i056-20230602   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-r003-20230531   gcc  
i386                 randconfig-r035-20230602   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230531   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230531   gcc  
loongarch            randconfig-r023-20230531   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k         buildonly-randconfig-r001-20230531   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r013-20230601   gcc  
m68k                 randconfig-r014-20230601   gcc  
m68k                 randconfig-r016-20230601   gcc  
m68k                 randconfig-r034-20230602   gcc  
m68k                        stmark2_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r021-20230531   gcc  
microblaze           randconfig-r022-20230531   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips         buildonly-randconfig-r003-20230531   clang
mips                           ci20_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                 randconfig-r001-20230531   clang
mips                          rm200_defconfig   clang
nios2                            alldefconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230601   gcc  
nios2                randconfig-r026-20230531   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230601   gcc  
parisc               randconfig-r036-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      ep88xc_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                        icon_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r012-20230601   gcc  
powerpc              randconfig-r025-20230531   clang
powerpc              randconfig-r032-20230602   gcc  
powerpc                     tqm8560_defconfig   clang
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230531   clang
riscv                               defconfig   gcc  
riscv                randconfig-r034-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230601   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r002-20230531   gcc  
sh                        edosk7760_defconfig   gcc  
sh                             espt_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r015-20230601   gcc  
sh                   randconfig-r033-20230531   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230531   gcc  
sparc        buildonly-randconfig-r006-20230531   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r025-20230531   gcc  
sparc64              randconfig-r032-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-a011-20230603   gcc  
x86_64               randconfig-a012-20230603   gcc  
x86_64               randconfig-a013-20230603   gcc  
x86_64               randconfig-a014-20230603   gcc  
x86_64               randconfig-a015-20230603   gcc  
x86_64               randconfig-a016-20230603   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230531   gcc  
xtensa               randconfig-r031-20230531   gcc  
xtensa               randconfig-r035-20230531   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
