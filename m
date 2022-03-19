Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FE8C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 19 Mar 2022 11:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbiCSL4m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Mar 2022 07:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbiCSL4l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Mar 2022 07:56:41 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C8926934E
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Mar 2022 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647690920; x=1679226920;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aPz6eaXVJp4aKUh1Ln2/vVSRe6L25wbX/mYCk3PmXqg=;
  b=lyy0kS3yhvKQZyVgTqmC7KjMb7nNcomqeeeACMq3QcQjJSirar6SWYIY
   +8vhFIQEnWgMgUlIGw/rqb/7VbZPKUY57EzXRyLiT0ZTR4QL0jAIMKpRc
   ywS5J4mBpRZjt+cnKvvUl3SSHv9QSU0NR28ZeiTThg0ubFMBoZ1Z11fZc
   OrmZioetSwW9iBDKep3aOIpvl6OlpWiy08L9GR+mTCOQ7lclFmQIev+8Q
   S6/Ff5nLo4B0OPIYWbzwVlUXibVkF+w+B34/699Y2wnYiO5JiqHrhbhYl
   TR9cHeYBw0QxSZqX73TWcBA+F4Xtk97xSdeBsA9NudtpPclAY1sUWEyjY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="343731042"
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="343731042"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 04:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="517689964"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Mar 2022 04:55:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nVXfy-000Fw7-BY; Sat, 19 Mar 2022 11:55:18 +0000
Date:   Sat, 19 Mar 2022 19:55:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 6ba463edccb978e3c0248c3a193b759436b51ac8
Message-ID: <6235c495.YP/7ra1dSiUli3HY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6ba463edccb978e3c0248c3a193b759436b51ac8  hwmon: (dell-smm) Add Inspiron 3505 to fan type blacklist

elapsed time: 724m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
i386                          randconfig-c001
sh                         ap325rxa_defconfig
sh                             espt_defconfig
mips                       capcella_defconfig
arm                      footbridge_defconfig
m68k                          multi_defconfig
powerpc                    sam440ep_defconfig
arc                     haps_hs_smp_defconfig
sh                   sh7770_generic_defconfig
csky                             alldefconfig
arm                        mini2440_defconfig
arm                        mvebu_v7_defconfig
arm                        multi_v7_defconfig
mips                         rt305x_defconfig
ia64                        generic_defconfig
arm                        keystone_defconfig
xtensa                           alldefconfig
arc                                 defconfig
m68k                        m5307c3_defconfig
mips                         mpc30x_defconfig
m68k                           sun3_defconfig
sh                        edosk7705_defconfig
alpha                            alldefconfig
arm                             rpc_defconfig
powerpc                       maple_defconfig
alpha                               defconfig
mips                      maltasmvp_defconfig
arm                            xcep_defconfig
xtensa                       common_defconfig
ia64                             alldefconfig
arm                  randconfig-c002-20220318
arm                  randconfig-c002-20220317
arm                  randconfig-c002-20220319
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220318
arc                  randconfig-r043-20220317
s390                 randconfig-r044-20220317
riscv                randconfig-r042-20220317
riscv                    nommu_k210_defconfig
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
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220318
arm                  randconfig-c002-20220317
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220318
riscv                randconfig-c006-20220318
riscv                randconfig-c006-20220317
powerpc              randconfig-c003-20220317
mips                 randconfig-c004-20220317
mips                 randconfig-c004-20220318
i386                          randconfig-c001
powerpc                        icon_defconfig
powerpc                     mpc5200_defconfig
mips                        workpad_defconfig
powerpc                      obs600_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220318
hexagon              randconfig-r041-20220318
hexagon              randconfig-r041-20220317
hexagon              randconfig-r045-20220317
riscv                randconfig-r042-20220318
s390                 randconfig-r044-20220318

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
