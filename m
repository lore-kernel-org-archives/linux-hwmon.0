Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD93FC7EE37
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 May 2023 11:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjE3LlJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 May 2023 07:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbjE3Lk4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 May 2023 07:40:56 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD3E100
        for <linux-hwmon@vger.kernel.org>; Tue, 30 May 2023 04:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685446855; x=1716982855;
  h=date:from:to:cc:subject:message-id;
  bh=sBfoVDXQM4N1MhKI2h239kR6WgI8r3xqsFTrVgi74Wg=;
  b=WWyAS1Ofa5/dZfLJ9uNpr7zpIkYcjoEM3iPE6c8nzi8lpdaZPFzvrkGh
   kQQK3evmWpp48Cm3Hwyd6CAqRGw0mLGEW7imBM9mAK1tnzP/Um6xQz9sH
   cMWS7PFrQF40Rly73dIuIKT6cvdTBYnJVkcORGl5Ijss2iM+yWEoojdKk
   u3HrRuRuqdi3ciJgNfgMNgck0hF919brpN/LZRyrj2nPAr9lfTjeN5szc
   c6Ymsm1NNI1xWGRnhpK15cx2Pw5G7e4maLQSObPCuvt9LuzUWbW42LKfU
   NCQMWr9rWwgHVE8oY1deRa/oG/EZH3ovS7mvXB6ATuRcEKeRQrW+GIALp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="383144897"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="383144897"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 04:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="953104171"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="953104171"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 04:40:50 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q3xic-00006B-0F;
        Tue, 30 May 2023 11:40:50 +0000
Date:   Tue, 30 May 2023 19:39:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 70e0b7722c58005e666037cdbc9c624581f5b93d
Message-ID: <20230530113959.a-6lk%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 70e0b7722c58005e666037cdbc9c624581f5b93d  hwmon: (pmbus/adm1266) Drop unnecessary error check for debugfs_create_dir

elapsed time: 5178m

configs tested: 178
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230526   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230526   gcc  
alpha                randconfig-r025-20230526   gcc  
alpha                randconfig-r034-20230526   gcc  
alpha                randconfig-r036-20230526   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230526   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                  randconfig-r043-20230526   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                  randconfig-r014-20230526   gcc  
arm                  randconfig-r046-20230526   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r024-20230526   clang
csky                                defconfig   gcc  
hexagon              randconfig-r031-20230526   clang
hexagon              randconfig-r041-20230526   clang
hexagon              randconfig-r045-20230526   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230526   gcc  
i386                 randconfig-i002-20230526   gcc  
i386                 randconfig-i003-20230526   gcc  
i386                 randconfig-i004-20230526   gcc  
i386                 randconfig-i005-20230526   gcc  
i386                 randconfig-i006-20230526   gcc  
i386                 randconfig-i011-20230526   clang
i386                 randconfig-i012-20230526   clang
i386                 randconfig-i013-20230526   clang
i386                 randconfig-i014-20230526   clang
i386                 randconfig-i015-20230526   clang
i386                 randconfig-i016-20230526   clang
i386                 randconfig-i051-20230526   gcc  
i386                 randconfig-i052-20230526   gcc  
i386                 randconfig-i053-20230526   gcc  
i386                 randconfig-i054-20230526   gcc  
i386                 randconfig-i055-20230526   gcc  
i386                 randconfig-i056-20230526   gcc  
i386                 randconfig-i061-20230526   gcc  
i386                 randconfig-i062-20230526   gcc  
i386                 randconfig-i063-20230526   gcc  
i386                 randconfig-i064-20230526   gcc  
i386                 randconfig-i065-20230526   gcc  
i386                 randconfig-i066-20230526   gcc  
i386                 randconfig-i071-20230526   clang
i386                 randconfig-i072-20230526   clang
i386                 randconfig-i073-20230526   clang
i386                 randconfig-i074-20230526   clang
i386                 randconfig-i075-20230526   clang
i386                 randconfig-i076-20230526   clang
i386                 randconfig-i081-20230526   clang
i386                 randconfig-i082-20230526   clang
i386                 randconfig-i083-20230526   clang
i386                 randconfig-i084-20230526   clang
i386                 randconfig-i085-20230526   clang
i386                 randconfig-i086-20230526   clang
i386                 randconfig-i091-20230526   gcc  
i386                 randconfig-i092-20230526   gcc  
i386                 randconfig-i093-20230526   gcc  
i386                 randconfig-i094-20230526   gcc  
i386                 randconfig-i095-20230526   gcc  
i386                 randconfig-i096-20230526   gcc  
i386                 randconfig-r015-20230526   clang
ia64                          tiger_defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230526   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r005-20230526   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                     loongson2k_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                          malta_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r026-20230526   gcc  
nios2                               defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230526   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230526   clang
powerpc                      cm5200_defconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                 mpc85xx_cds_defconfig   gcc  
powerpc              randconfig-r023-20230526   clang
powerpc                  storcenter_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230526   clang
riscv                randconfig-r042-20230526   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230526   gcc  
s390                 randconfig-r044-20230526   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230526   gcc  
sh                   randconfig-r033-20230526   gcc  
sh                           se7712_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                               defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230526   gcc  
x86_64       buildonly-randconfig-r002-20230526   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230526   gcc  
x86_64               randconfig-a002-20230526   gcc  
x86_64               randconfig-a003-20230526   gcc  
x86_64               randconfig-a004-20230526   gcc  
x86_64               randconfig-a005-20230526   gcc  
x86_64               randconfig-a006-20230526   gcc  
x86_64               randconfig-a011-20230526   clang
x86_64               randconfig-a012-20230526   clang
x86_64               randconfig-a013-20230526   clang
x86_64               randconfig-a014-20230526   clang
x86_64               randconfig-a015-20230526   clang
x86_64               randconfig-a016-20230526   clang
x86_64               randconfig-k001-20230529   gcc  
x86_64               randconfig-r016-20230526   clang
x86_64               randconfig-r021-20230526   clang
x86_64               randconfig-x051-20230526   clang
x86_64               randconfig-x052-20230526   clang
x86_64               randconfig-x053-20230526   clang
x86_64               randconfig-x054-20230526   clang
x86_64               randconfig-x055-20230526   clang
x86_64               randconfig-x056-20230526   clang
x86_64               randconfig-x061-20230527   gcc  
x86_64               randconfig-x062-20230527   gcc  
x86_64               randconfig-x063-20230527   gcc  
x86_64               randconfig-x064-20230527   gcc  
x86_64               randconfig-x065-20230527   gcc  
x86_64               randconfig-x066-20230527   gcc  
x86_64               randconfig-x071-20230526   gcc  
x86_64               randconfig-x072-20230526   gcc  
x86_64               randconfig-x073-20230526   gcc  
x86_64               randconfig-x074-20230526   gcc  
x86_64               randconfig-x075-20230526   gcc  
x86_64               randconfig-x076-20230526   gcc  
x86_64               randconfig-x081-20230526   gcc  
x86_64               randconfig-x082-20230526   gcc  
x86_64               randconfig-x083-20230526   gcc  
x86_64               randconfig-x084-20230526   gcc  
x86_64               randconfig-x085-20230526   gcc  
x86_64               randconfig-x086-20230526   gcc  
x86_64               randconfig-x091-20230526   clang
x86_64               randconfig-x092-20230526   clang
x86_64               randconfig-x093-20230526   clang
x86_64               randconfig-x094-20230526   clang
x86_64               randconfig-x095-20230526   clang
x86_64               randconfig-x096-20230526   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
