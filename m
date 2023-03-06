Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A9CC678D4
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Mar 2023 13:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjCFNbX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Mar 2023 08:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjCFNbW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2023 08:31:22 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB582E816
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Mar 2023 05:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678109481; x=1709645481;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BytLaEtTgfsHv2/bP5i++vz0wIyR+VvxCKPLOHjegGw=;
  b=l05n++SfahWUEML6X5nGB75vPWJbo//u3Gq4G42ykg4B/ykuwblAs391
   Boba8WlNlsTR1BzXwpL8sYDf5p05wV6svxTBoDcVb1h1Y1UumbQ53SLmI
   2xkWDgO2bl7x2pjjl/G7pnCavtng5V2y//wC7HRlJRMngTt481/kZ2PIK
   jCTDG6J5J/i5mwfHtvw9d75KOa1ITUczzhrY3Wt4DqBCqqTDqbB7eOgfN
   dvfb0MEYJEz09o3AUjxp3eI9ium3H57V+whEgSoOfc8oG0K1kOXW9XW2x
   u8/npoUDiXVzNMmFQYpovEJ/OjA+tagWFqZ/jgysdJjBwogGcRC1Xdl3Q
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315946564"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="315946564"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 05:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678474538"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="678474538"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 05:31:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZAvv-0000LO-0b;
        Mon, 06 Mar 2023 13:31:19 +0000
Date:   Mon, 06 Mar 2023 21:31:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7032d784a133f63b61c0afb1c62570a7f67f966a
Message-ID: <6405eb1d.4FuHGKkJo/ga2F18%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7032d784a133f63b61c0afb1c62570a7f67f966a  hwmon: (nct6775) Drop unneeded casting and conjunction

elapsed time: 790m

configs tested: 125
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230305   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r004-20230305   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230305   gcc  
arc                  randconfig-r015-20230306   gcc  
arc                  randconfig-r025-20230306   gcc  
arc                  randconfig-r043-20230305   gcc  
arc                  randconfig-r043-20230306   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r011-20230306   gcc  
arm                  randconfig-r035-20230305   gcc  
arm                  randconfig-r036-20230305   gcc  
arm                  randconfig-r046-20230305   clang
arm                  randconfig-r046-20230306   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r003-20230306   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230306   clang
csky                                defconfig   gcc  
hexagon              randconfig-r003-20230305   clang
hexagon              randconfig-r031-20230306   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r041-20230306   clang
hexagon              randconfig-r045-20230305   clang
hexagon              randconfig-r045-20230306   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230306   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230306   gcc  
i386                 randconfig-a002-20230306   gcc  
i386                 randconfig-a003-20230306   gcc  
i386                 randconfig-a004-20230306   gcc  
i386                 randconfig-a005-20230306   gcc  
i386                 randconfig-a006-20230306   gcc  
i386                 randconfig-a011-20230306   clang
i386                 randconfig-a012-20230306   clang
i386                 randconfig-a013-20230306   clang
i386                 randconfig-a014-20230306   clang
i386                 randconfig-a015-20230306   clang
i386                 randconfig-a016-20230306   clang
i386                 randconfig-r003-20230306   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r004-20230305   gcc  
ia64                 randconfig-r014-20230305   gcc  
ia64                 randconfig-r024-20230306   gcc  
ia64                 randconfig-r033-20230306   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r035-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230306   gcc  
m68k                 randconfig-r005-20230305   gcc  
m68k                 randconfig-r006-20230305   gcc  
m68k                 randconfig-r022-20230306   gcc  
m68k                 randconfig-r034-20230306   gcc  
microblaze           randconfig-r016-20230306   gcc  
microblaze           randconfig-r033-20230305   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230306   clang
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230306   gcc  
openrisc     buildonly-randconfig-r002-20230306   gcc  
openrisc             randconfig-r032-20230306   gcc  
parisc       buildonly-randconfig-r002-20230305   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r032-20230305   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r004-20230306   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230305   gcc  
riscv                randconfig-r016-20230305   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                randconfig-r042-20230306   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230306   clang
s390         buildonly-randconfig-r006-20230305   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r034-20230305   clang
s390                 randconfig-r044-20230305   gcc  
s390                 randconfig-r044-20230306   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r021-20230306   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r003-20230305   gcc  
sparc64              randconfig-r001-20230306   gcc  
sparc64              randconfig-r015-20230305   gcc  
sparc64              randconfig-r026-20230306   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r006-20230306   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230306   gcc  
x86_64               randconfig-a002-20230306   gcc  
x86_64               randconfig-a003-20230306   gcc  
x86_64               randconfig-a004-20230306   gcc  
x86_64               randconfig-a005-20230306   gcc  
x86_64               randconfig-a006-20230306   gcc  
x86_64               randconfig-a011-20230306   clang
x86_64               randconfig-a012-20230306   clang
x86_64               randconfig-a013-20230306   clang
x86_64               randconfig-a014-20230306   clang
x86_64               randconfig-a015-20230306   clang
x86_64               randconfig-a016-20230306   clang
x86_64               randconfig-r006-20230306   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r036-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
