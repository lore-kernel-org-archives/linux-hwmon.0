Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A078EC636CD
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Feb 2023 04:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjBAEOR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Jan 2023 23:14:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjBAEOQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Jan 2023 23:14:16 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF985422F
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Jan 2023 20:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675224855; x=1706760855;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c1LsUIRmTUmbzqoyWAdHaLqpRe64iZIosrRqjS+jNlA=;
  b=f2F8sbZMh+4eu9uGrk2OJtnXCbwBP3joEELBMQueTFnUpsEOMJF3BaWT
   3yKp/oV8Wv+CCfGfME0A7uOL+JKcUg4PVH0fUY6r5dMtm8rrwlcWOimZ2
   Vl2SVrWXb+Ekf8TzcsZVf2xaIyM8FwLLMpE5abcZoJN2Ld2TgZYHQA1oj
   3d0CVZAbuqWEuIgKiw3yMqUg3S0sFxO8M+cDxu8WycPGm8RjYqf9exQa7
   Gl5lDX8Y6OpqdF6reDRnn1jGmM1rE1X8bGN3sHlfLyhXPJpToCsrPim3F
   9gv6FAlT7orjnkVfiTZOETorulUBkkgbLK6fAi5OY5A7s6hkHLn5BrS1G
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392589368"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392589368"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 20:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="838628552"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="838628552"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2023 20:12:43 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pN4UE-000530-2h;
        Wed, 01 Feb 2023 04:12:42 +0000
Date:   Wed, 01 Feb 2023 12:12:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 5e5c0d0341059c332284384df9dece084713f5ac
Message-ID: <63d9e6b6.LoQIc2fGuyBr28t3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 5e5c0d0341059c332284384df9dece084713f5ac  hwmon: (aquacomputer_d5next) Add support for Aquacomputer Poweradjust 3

elapsed time: 720m

configs tested: 81
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                            allnoconfig
x86_64               randconfig-a001-20230130
s390                                defconfig
x86_64               randconfig-a003-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a002-20230130
s390                             allyesconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a005-20230130
powerpc                           allnoconfig
i386                                defconfig
x86_64                              defconfig
um                           x86_64_defconfig
um                             i386_defconfig
ia64                             allmodconfig
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a003-20230130
x86_64                               rhel-8.3
i386                 randconfig-a002-20230130
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a005-20230130
m68k                             allyesconfig
i386                 randconfig-a006-20230130
arc                              allyesconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20230129
arm                  randconfig-r046-20230129
arm                  randconfig-r046-20230130
arc                  randconfig-r043-20230130
i386                             allyesconfig
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm                              allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                          randconfig-c001
arm                            pleb_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                       holly_defconfig
arm                            mps2_defconfig
arm                      jornada720_defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230129
hexagon              randconfig-r045-20230130
hexagon              randconfig-r041-20230130
hexagon              randconfig-r045-20230129
i386                 randconfig-a013-20230130
i386                 randconfig-a012-20230130
s390                 randconfig-r044-20230129
i386                 randconfig-a014-20230130
riscv                randconfig-r042-20230129
riscv                randconfig-r042-20230130
s390                 randconfig-r044-20230130
i386                 randconfig-a011-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001
x86_64               randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
