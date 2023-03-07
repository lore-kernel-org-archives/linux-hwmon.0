Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69952C64EC4
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Mar 2023 01:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjCGBPt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Mar 2023 20:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjCGBPs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2023 20:15:48 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F634742A
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Mar 2023 17:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678151747; x=1709687747;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7PGM/T1015kSy/8L+rSBNosT/qLfGF2KcnKSN9g3Fd8=;
  b=QWvCbOT1TA46G5tv+qOErRX2xYeq7u5Dn8Eli4tIcRlpz/fZ41glrnyb
   nN1F/LgIkei4YIobuR67nI84V0hQ6/cChlh04ojJaZSIRmgg8FxrBcJUg
   iPM/0OlwDbcL7Uz5lmcaOmBQlXylV19yHwUUN2Vx9eyfROgVSRUxx7TsT
   jCaNTji3Qq4FCpHanM1QhVb8f0RpHBpjUFjE/q8COOSVDKQ23mF5Qdjk9
   8+8cRcjeFce3QW+EKziOnzpgtKcFR9PSGhCOg9dyBiPEoDuLUK0lPElm2
   FVcflJZilBMPOSU0hpasqZph56CacSkk+7/JP/cYVNzS3UKSeLa/qHyee
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="324036239"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="324036239"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 17:15:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786491301"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="786491301"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2023 17:15:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pZLvc-0000pp-2W;
        Tue, 07 Mar 2023 01:15:44 +0000
Date:   Tue, 07 Mar 2023 09:15:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e36b87219dd625be0b31905bbeef1984bdee0191
Message-ID: <64069037.Gyeze7XAsPrlJ5/O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e36b87219dd625be0b31905bbeef1984bdee0191  hwmon: (nzxt-smart2) add another USB ID

elapsed time: 1495m

configs tested: 119
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230305   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230305   gcc  
arc                  randconfig-r016-20230306   gcc  
arc                  randconfig-r034-20230305   gcc  
arc                  randconfig-r043-20230305   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r001-20230306   clang
arm                  randconfig-r005-20230306   clang
arm                  randconfig-r025-20230305   clang
arm                  randconfig-r036-20230305   gcc  
arm                  randconfig-r046-20230305   clang
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r035-20230305   gcc  
csky                 randconfig-r036-20230306   gcc  
hexagon      buildonly-randconfig-r001-20230305   clang
hexagon      buildonly-randconfig-r002-20230305   clang
hexagon              randconfig-r014-20230305   clang
hexagon              randconfig-r041-20230305   clang
hexagon              randconfig-r045-20230305   clang
i386                             allyesconfig   gcc  
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
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230306   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r013-20230305   gcc  
ia64                 randconfig-r033-20230306   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230306   gcc  
loongarch            randconfig-r015-20230305   gcc  
loongarch            randconfig-r031-20230306   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r006-20230306   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r035-20230306   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r026-20230305   clang
nios2        buildonly-randconfig-r004-20230306   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230306   gcc  
nios2                randconfig-r022-20230305   gcc  
openrisc     buildonly-randconfig-r006-20230305   gcc  
openrisc             randconfig-r014-20230306   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r003-20230305   gcc  
powerpc      buildonly-randconfig-r005-20230305   gcc  
powerpc      buildonly-randconfig-r005-20230306   clang
powerpc              randconfig-r004-20230306   gcc  
powerpc              randconfig-r024-20230305   gcc  
powerpc              randconfig-r026-20230306   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230305   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230305   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230305   gcc  
sh                   randconfig-r012-20230306   gcc  
sh                   randconfig-r015-20230306   gcc  
sh                   randconfig-r023-20230305   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230306   gcc  
sparc                randconfig-r013-20230306   gcc  
sparc                randconfig-r016-20230305   gcc  
sparc                randconfig-r023-20230306   gcc  
sparc64              randconfig-r004-20230305   gcc  
sparc64              randconfig-r006-20230305   gcc  
sparc64              randconfig-r034-20230306   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
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
x86_64               randconfig-r022-20230306   clang
x86_64               randconfig-r025-20230306   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r002-20230306   gcc  
xtensa               randconfig-r021-20230305   gcc  
xtensa               randconfig-r024-20230306   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
