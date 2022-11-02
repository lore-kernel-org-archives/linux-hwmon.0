Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF08C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Nov 2022 03:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbiKBDXn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Nov 2022 23:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiKBDXm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Nov 2022 23:23:42 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0851324962
        for <linux-hwmon@vger.kernel.org>; Tue,  1 Nov 2022 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667359421; x=1698895421;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=M4iaj9TOH0YSds2JdhWDJngEGxaBvDTakHTlEfVSEL0=;
  b=QHJJgngI7vbct3bqy2Jj99RfKLZ3nZ9ZGBY6qft/DmM238VJXADTRifm
   crI1vDC8lTT/q115+M3AXbMf2ZTtBUiOqIqUwJNjrjBvRAil3FL1YaXmG
   oBL9o85vZnXKhEY7lGDAn6wCPUiZamNI+qC9UIKwj9zZlQbYx0HO/i1Um
   uUOaxTsOvIw8i2aukNaZPt3HSk25wS8+K6qO9ai4iUYpKutJGLRfDoPcX
   OrbT6OTYKmkeNy4S3MHhbiHyqLpXYhqhyPkMFWfKGZwaXCwUUdRhR0SDx
   M+MZsMSkWPZ6WwZesbzjBGgmtDcLJWfTHmnZbZoBDct2HoOnnPxYw3vBO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="289690451"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="289690451"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 20:23:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="634099975"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="634099975"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 01 Nov 2022 20:23:40 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oq4Lr-000EOM-1X;
        Wed, 02 Nov 2022 03:23:39 +0000
Date:   Wed, 02 Nov 2022 11:22:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 d9a6e10e51ac6b774bab68836cb2eae005a47bfc
Message-ID: <6361e292.QaGYAfpH2gQPHvDt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: d9a6e10e51ac6b774bab68836cb2eae005a47bfc  hwmon: (jc42) Consistently use bit and bitfield macros in the driver

elapsed time: 724m

configs tested: 70
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
mips                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
sh                               allmodconfig
i386                 randconfig-a011-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a014-20221031
i386                 randconfig-a015-20221031
arc                                 defconfig
alpha                               defconfig
i386                 randconfig-a016-20221031
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                           rhel-8.3-syz
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
s390                             allmodconfig
i386                                defconfig
s390                                defconfig
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221101
s390                             allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a013
m68k                             allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a011
arm                                 defconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                        randconfig-a015
arm64                            allyesconfig
x86_64                           allyesconfig
arm                              allyesconfig
i386                             allyesconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
x86_64                        randconfig-a012
riscv                randconfig-r042-20221101
i386                 randconfig-a001-20221031
i386                 randconfig-a003-20221031
i386                 randconfig-a002-20221031
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a004-20221031
i386                 randconfig-a006-20221031
i386                 randconfig-a005-20221031
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a005-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
