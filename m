Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C824C77B76
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Apr 2023 13:28:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbjDTN2p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Apr 2023 09:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbjDTN2p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Apr 2023 09:28:45 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E8444AD
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Apr 2023 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681997324; x=1713533324;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NP+kf8Nbir0XU/kpyf0JX6fo/DphW+8Lg1eNEvZ4Zdk=;
  b=Phdagazh8N+NQl0IWyPmxSQ1voUih4KJEnb76FBTorjwbJnTncucq6Xy
   rxlMm3ldBHeyoBaCaMxWHUHhS8sB+iqg3LU3+l3NCwunrmeMP+EJUt8M8
   x7hwx49CWLfO+IWjcOse5JBZAnfaFkta6QGLdM//OJ44mXZRwr4XecT54
   boMNvHbrOi0U4dmxNSNYt2PQqZ/KWF52kk7wxc2dYkZMYeWKwJOn5/wZ4
   Fj9B0QohZRBlU8ToNnncY2nsoAZUaifV2BnKr/hcinFbFY6CRyH2qAxq7
   GgcQQZ1MMXTboP4WyEOUsDeIPEZpGEa/mrcJhKdmj2vUiO0grkLBz/xiT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="326061983"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="326061983"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 06:28:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816015067"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="816015067"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 06:28:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppUL3-000frQ-2S;
        Thu, 20 Apr 2023 13:28:41 +0000
Date:   Thu, 20 Apr 2023 21:28:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 0c072385348e3ac5229145644055d3e2afb5b3db
Message-ID: <64413dfa.5cJ1I+kRqKyaq/ku%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 0c072385348e3ac5229145644055d3e2afb5b3db  hwmon: (k10temp) Check range scale when CUR_TEMP register is read-write

elapsed time: 1269m

configs tested: 92
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r006-20230417   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r002-20230416   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230418   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230417   gcc  
arm64                randconfig-r022-20230416   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230416   gcc  
hexagon              randconfig-r041-20230416   clang
hexagon              randconfig-r041-20230417   clang
hexagon              randconfig-r041-20230418   clang
hexagon              randconfig-r045-20230416   clang
hexagon              randconfig-r045-20230417   clang
hexagon              randconfig-r045-20230418   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230417   gcc  
i386                 randconfig-a002-20230417   gcc  
i386                 randconfig-a003-20230417   gcc  
i386                 randconfig-a004-20230417   gcc  
i386                 randconfig-a005-20230417   gcc  
i386                 randconfig-a006-20230417   gcc  
i386                 randconfig-a011-20230417   clang
i386                 randconfig-a012-20230417   clang
i386                 randconfig-a013-20230417   clang
i386                 randconfig-a014-20230417   clang
i386                 randconfig-a015-20230417   clang
i386                 randconfig-a016-20230417   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230416   gcc  
m68k                 randconfig-r024-20230417   gcc  
m68k                 randconfig-r026-20230417   gcc  
microblaze           randconfig-r004-20230418   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230417   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230416   gcc  
nios2                randconfig-r003-20230418   gcc  
openrisc             randconfig-r005-20230418   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r005-20230417   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc              randconfig-r026-20230416   gcc  
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230417   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230417   clang
sh                               allmodconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230417   gcc  
sparc64              randconfig-r003-20230416   gcc  
sparc64              randconfig-r021-20230416   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a011-20230417   clang
x86_64               randconfig-a012-20230417   clang
x86_64               randconfig-a013-20230417   clang
x86_64               randconfig-a014-20230417   clang
x86_64               randconfig-a015-20230417   clang
x86_64               randconfig-a016-20230417   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
