Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604F9C00140
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Aug 2022 02:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiHKCvT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 10 Aug 2022 22:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbiHKCvT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Aug 2022 22:51:19 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A4C883C2
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Aug 2022 19:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660186278; x=1691722278;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2x/cs6+SarVBtQU+gyL0FRpdfzUygIRr3mHIeOb7VSM=;
  b=kUugrHeMTOvUmczrbx7lc7IYZ544Zk9k/OpmjhuFIKdgURs7mI97L3pi
   FVWeRWofqCmSYCNqQAMRVD7MtJS96+8wCueQJaBsIreI+uhfpq7JQkUPj
   iQlWOqYw5lnXaGBB9XmjbZRuxiF7JncBL06tfH0PzevE36pHT8o4wQ3S8
   x5mSz2hHZJ9J09P6ADbCjbelR1RF7LCPh5BceVNtX6k6YtA1J/mj8QY1O
   cAtUGKmigFDYYwtEsPpt2A5NJgvYVAYaIC+Ns5cn8D3X6nsmYBX+FSbpb
   IMCjBN9MKTH6xN0tWgV/JmAYdqZRCHINsQ5216yDfvjSClY+RNhR4M1Zc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="355245480"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="355245480"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 19:51:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="638337356"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Aug 2022 19:51:17 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oLyI0-00010Y-1U;
        Thu, 11 Aug 2022 02:51:16 +0000
Date:   Thu, 11 Aug 2022 10:50:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 f4e6960f4f16b1ca5da16cec7612ecc86402ac05
Message-ID: <62f46e76.zLh3QdwAAwDsyRQ8%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f4e6960f4f16b1ca5da16cec7612ecc86402ac05  hwmon: (nct6775) Fix platform driver suspend regression

elapsed time: 718m

configs tested: 53
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                              defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
um                           x86_64_defconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           allyesconfig
riscv                randconfig-r042-20220810
i386                                defconfig
arc                  randconfig-r043-20220810
powerpc                           allnoconfig
s390                 randconfig-r044-20220810
arm                                 defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
arc                              allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a013
alpha                            allyesconfig
x86_64                        randconfig-a011
sh                               allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a006
mips                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arm                              allyesconfig
arm64                            allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
ia64                             allmodconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220810
hexagon              randconfig-r045-20220810
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
