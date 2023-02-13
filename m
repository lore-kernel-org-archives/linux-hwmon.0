Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCF8C636D7
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Feb 2023 04:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjBMEWI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Feb 2023 23:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjBMEWH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Feb 2023 23:22:07 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DB0A27B
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Feb 2023 20:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676262126; x=1707798126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fpRBszslz3t6mEWsROaHBmhvdiQxYiwB51UyWmDuwho=;
  b=WU3M+BpZ7LWeaouwzOOSP8Xk+A7UE8dSvf3AxkMPvGxvnKTW/STlwWaG
   g2/PsA8GNiMMlAtgkeXHux0VCO43l9BHNd/ED7N0zNLEPHnrjYB4BEiQZ
   gaO7M0RD8eux1PIud85WTsZVWSYZUMkl9M5OFganUsdK6DfzT/g4mXofB
   qCWAtzbLDXSk+Wrto+7MJGcR82d4fBmh/bORH61XFesoShPZdWq8SwHk6
   34X9vU9XZcGMwyrChxEp00gjbiTfZloQ1ymBxltqHc1xEd+U+yFKLdyLl
   IXQ5C5hSrPgZ2voxlDC79AC9mhaggAefkgORzi/eUEpz/GSorbbgX75lz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="328511029"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="328511029"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 20:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701124025"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="701124025"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Feb 2023 20:22:04 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pRQLs-0007Yb-0i;
        Mon, 13 Feb 2023 04:22:04 +0000
Date:   Mon, 13 Feb 2023 12:21:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a1ffd3c46267ee5c807acd780e15df9bb692223f
Message-ID: <63e9bae5.aGeLEWpBLBxFokf3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a1ffd3c46267ee5c807acd780e15df9bb692223f  hwmon: (mlxreg-fan) Return zero speed for broken fan

elapsed time: 766m

configs tested: 73
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                  randconfig-r043-20230212
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm                  randconfig-r046-20230212
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
sh                               allmodconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
x86_64                               rhel-8.3

clang tested configs:
hexagon              randconfig-r041-20230212
hexagon              randconfig-r045-20230212
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20230212
s390                 randconfig-r044-20230212
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
