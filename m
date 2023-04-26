Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F69FC77B78
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Apr 2023 16:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbjDZQ1r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Apr 2023 12:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjDZQ1q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Apr 2023 12:27:46 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EE5769E
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Apr 2023 09:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682526465; x=1714062465;
  h=date:from:to:cc:subject:message-id;
  bh=tCCf87wqw7aU4fTzPuM/VGvAeVQQbFlhTQhj6MRw1+w=;
  b=hQPGCqUiPL6gT15VkQvcb7fhoF8muLnA5o+m+VCR5WC1omPyobb0xAVm
   6z1t9Os+7UyrtKcE7VE8SDivm+4cKWk7T8A2aV0t3wGBUd1Rd3z/LuDaX
   RRjImIjNWm5txUVK5c31xG6AcdrKxCRpr2LlK5++E+qirHlmY+ozc7km0
   xH82A7qpHbCsiJZs7ceEtdVC/ik5yH1TqtHVeZRtxrl7tGYYFFGbg/y3z
   hd3SxbHfW90etgzjm3g+Eh3VpC0WxGyXeAxsCHiB0P9nEP5AosX0TFvd2
   kGL8uEaVwC1yc8xu5tp7EHISA8VGzrHVCYH6/sCtWCDfMrgtm87jmywft
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="345919714"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="345919714"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 09:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="763387646"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; 
   d="scan'208";a="763387646"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 26 Apr 2023 09:27:44 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1prhzb-0000Mq-2F;
        Wed, 26 Apr 2023 16:27:43 +0000
Date:   Thu, 27 Apr 2023 00:26:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 4b4c88a11480ab3a0ea37c81f15b1e6999b5652b
Message-ID: <20230426162649.vII5O%lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 4b4c88a11480ab3a0ea37c81f15b1e6999b5652b  watchdog: starfive: Fix the probe return error if PM and early_enable are both disabled

elapsed time: 732m

configs tested: 105
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r003-20230426   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230423   gcc  
alpha                randconfig-r014-20230426   gcc  
alpha                randconfig-r015-20230426   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230426   gcc  
arc                  randconfig-r003-20230424   gcc  
arc                  randconfig-r026-20230426   gcc  
arc                  randconfig-r043-20230426   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230426   gcc  
arm                  randconfig-r046-20230426   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230426   clang
csky                                defconfig   gcc  
csky                 randconfig-r002-20230424   gcc  
csky                 randconfig-r023-20230426   gcc  
hexagon      buildonly-randconfig-r005-20230426   clang
hexagon              randconfig-r006-20230426   clang
hexagon              randconfig-r034-20230426   clang
hexagon              randconfig-r041-20230426   clang
hexagon              randconfig-r045-20230426   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230424   clang
i386                 randconfig-a002-20230424   clang
i386                 randconfig-a003-20230424   clang
i386                 randconfig-a004-20230424   clang
i386                 randconfig-a005-20230424   clang
i386                 randconfig-a006-20230424   clang
i386                 randconfig-a011-20230424   gcc  
i386                 randconfig-a012-20230424   gcc  
i386                 randconfig-a013-20230424   gcc  
i386                 randconfig-a014-20230424   gcc  
i386                 randconfig-a015-20230424   gcc  
i386                 randconfig-a016-20230424   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r001-20230424   gcc  
ia64                 randconfig-r012-20230426   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r006-20230426   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r005-20230423   gcc  
m68k                 randconfig-r036-20230426   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230424   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r035-20230426   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230423   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r025-20230426   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230424   clang
riscv                randconfig-r016-20230426   gcc  
riscv                randconfig-r042-20230426   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r002-20230426   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230423   gcc  
s390                 randconfig-r024-20230426   gcc  
s390                 randconfig-r032-20230426   clang
s390                 randconfig-r044-20230426   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230426   gcc  
sh           buildonly-randconfig-r004-20230426   gcc  
sh                   randconfig-r011-20230426   gcc  
sh                   randconfig-r031-20230426   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230423   gcc  
sparc                randconfig-r021-20230426   gcc  
sparc64              randconfig-r004-20230424   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a011-20230424   gcc  
x86_64               randconfig-a012-20230424   gcc  
x86_64               randconfig-a013-20230424   gcc  
x86_64               randconfig-a014-20230424   gcc  
x86_64               randconfig-a015-20230424   gcc  
x86_64               randconfig-a016-20230424   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r022-20230426   gcc  
xtensa               randconfig-r033-20230426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
