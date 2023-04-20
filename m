Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362F9C77B72
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Apr 2023 04:28:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbjDTE23 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Apr 2023 00:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjDTE22 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Apr 2023 00:28:28 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D4040C9
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Apr 2023 21:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681964908; x=1713500908;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qnNt+NRyxFy9Q9iUhl1uWaR5kAu25Asdu/w5P5Zqx2g=;
  b=itholSNgK5dsO5Z04qJA+l0mTQUq78yoZW2V/sBuEnS/9VGpUsv5YQdq
   UN5XhE+wt2O3Vd8D+KxjPwyqRUkofVg1hyOow+rIxDwsolohSa7EMURpW
   j3dxBak9gYJOnzXVM3dr29lQDD2JZI2qbntJdECSbrP9KT9nj21fHlg8U
   75WODp8miq2fovbXRVyCFHVowwYVrcbyoZJspI7EuXRA3QSCtA7Jc6ELI
   qkqWvdLvdICK94vznNvIm/sRv/Yz6zoCKzEil7PxyuyG5mm2JgtKgaGJW
   Oudb5D8nFvG8zw1PIe6SOI21f+ssUk+uMtHf9Ra32WSWKY6pzJnOBni8R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347490046"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="347490046"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 21:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760994649"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="760994649"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 21:28:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ppLuD-000fT8-1w;
        Thu, 20 Apr 2023 04:28:25 +0000
Date:   Thu, 20 Apr 2023 12:28:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8a51184ed91ba8a82fb31a69b511cc5dc7a9fa07
Message-ID: <6440bf53.nHlbBS1MNSMhwdX7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8a51184ed91ba8a82fb31a69b511cc5dc7a9fa07  hwmon: (adt7475) Use device_property APIs when configuring polarity

elapsed time: 727m

configs tested: 88
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230416   clang
arm                  randconfig-r046-20230418   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
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
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r024-20230417   gcc  
m68k                 randconfig-r026-20230417   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r025-20230417   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
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
sh                          r7785rp_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230417   gcc  
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
xtensa                          iss_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
