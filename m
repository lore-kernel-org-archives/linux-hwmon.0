Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE236C64EC7
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Mar 2023 04:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjCAEGL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 28 Feb 2023 23:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjCAEGJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 28 Feb 2023 23:06:09 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F481ACE5
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Feb 2023 20:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677643565; x=1709179565;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2uwNIafFdBMoDeO8JHAxxsDincc1JX3jEm1jHbNZKRc=;
  b=emEWIgeTcoNEdKYkgr/qfJXoPeuobkNMNWpEVz/aufQGuTEhH+gAXz1Y
   DfEI0Cyh0SRimhV/B6TmW78galFaSTtGGwmZ0o+r/K9t0J58amIk1twJc
   +kzwBoycB7v8Iokaqj5N0toG7aN4OcmuFL4vUihTt+ZQyT8v679Fx+oL0
   dVbLjPvJKRRbvs9+IKHI32oeHfklEwUH4zDyk21+m/vr+1isU9j/3KxlY
   l++Q++RGeG0waWYY4kAfuo0psGqpkKLkBBcEqJmKnVitH6ydy4OcNh+de
   z4T3xWkZUP/0etEV7NGh7S52QaXg/QT35Ojrv5Q3Etz+cmTxcHTvQafNW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="314739127"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="314739127"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 20:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676589452"
X-IronPort-AV: E=Sophos;i="5.98,223,1673942400"; 
   d="scan'208";a="676589452"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Feb 2023 20:06:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pXDj8-0005rr-33;
        Wed, 01 Mar 2023 04:06:02 +0000
Date:   Wed, 01 Mar 2023 12:06:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 034176b0befeba530ef95affc93510a0a413618f
Message-ID: <63fecf28.8b9EMgqJOvTcT3xX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 034176b0befeba530ef95affc93510a0a413618f  watchdog: imx2_wdg: Declare local symbols static

elapsed time: 722m

configs tested: 137
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230227   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230227   gcc  
alpha                randconfig-r006-20230227   gcc  
alpha                randconfig-r033-20230228   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230226   gcc  
arc                  randconfig-r016-20230226   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230227   clang
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230226   gcc  
arm                  randconfig-r023-20230226   gcc  
arm                  randconfig-r024-20230227   clang
arm                  randconfig-r025-20230228   gcc  
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r004-20230227   clang
arm64                               defconfig   gcc  
arm64                randconfig-r021-20230226   clang
arm64                randconfig-r026-20230227   gcc  
csky         buildonly-randconfig-r001-20230227   gcc  
csky         buildonly-randconfig-r003-20230227   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r034-20230228   gcc  
hexagon      buildonly-randconfig-r001-20230226   clang
hexagon      buildonly-randconfig-r005-20230227   clang
hexagon              randconfig-r022-20230228   clang
hexagon              randconfig-r024-20230228   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230226   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                 randconfig-a002-20230227   clang
i386                 randconfig-a003-20230227   clang
i386                 randconfig-a004-20230227   clang
i386                 randconfig-a005-20230227   clang
i386                 randconfig-a006-20230227   clang
i386                 randconfig-a011-20230227   gcc  
i386                 randconfig-a012-20230227   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                 randconfig-a014-20230227   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                 randconfig-a016-20230227   gcc  
i386                 randconfig-r023-20230227   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r002-20230226   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230226   gcc  
ia64                 randconfig-r012-20230226   gcc  
ia64                 randconfig-r022-20230227   gcc  
ia64                 randconfig-r023-20230228   gcc  
ia64                 randconfig-r024-20230226   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230227   gcc  
loongarch    buildonly-randconfig-r006-20230226   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r003-20230226   gcc  
loongarch            randconfig-r012-20230227   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r003-20230226   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r036-20230228   gcc  
microblaze   buildonly-randconfig-r006-20230227   gcc  
microblaze           randconfig-r025-20230226   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r006-20230227   gcc  
nios2        buildonly-randconfig-r002-20230227   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230226   gcc  
nios2                randconfig-r031-20230228   gcc  
openrisc     buildonly-randconfig-r002-20230227   gcc  
openrisc             randconfig-r004-20230226   gcc  
openrisc             randconfig-r013-20230226   gcc  
openrisc             randconfig-r022-20230226   gcc  
openrisc             randconfig-r026-20230228   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r001-20230227   clang
powerpc              randconfig-r006-20230226   gcc  
powerpc              randconfig-r015-20230227   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r005-20230226   clang
riscv                               defconfig   gcc  
riscv                randconfig-r016-20230227   gcc  
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230227   gcc  
sh                   randconfig-r025-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r026-20230226   gcc  
sparc64      buildonly-randconfig-r004-20230226   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64               randconfig-a002-20230227   clang
x86_64               randconfig-a003-20230227   clang
x86_64               randconfig-a004-20230227   clang
x86_64               randconfig-a005-20230227   clang
x86_64               randconfig-a006-20230227   clang
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230227   gcc  
xtensa               randconfig-r013-20230227   gcc  
xtensa               randconfig-r021-20230228   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
