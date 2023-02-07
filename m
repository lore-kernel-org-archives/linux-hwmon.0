Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A11C636CD
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Feb 2023 23:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjBGXnn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Feb 2023 18:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjBGXnm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Feb 2023 18:43:42 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCA12BEC5
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Feb 2023 15:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675813421; x=1707349421;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/zn5TEC4MLnYjI5WtMzt5PADyY8V16xJrt1Ukm2GzX0=;
  b=fTzil2a+wC8gQ7qx6Yu6NxZkuAvCTcemzs9hPAe/LOB+i9fk8uaBh1z7
   4LJn+dEfjeStbHzFtYKwFmJrZ0K1kAnUESa59o93TETb0re5zWj5F6fdY
   wIqaxR31e/fe3CQfHYKVTZSEjPkNCqHpcCNoq/kK4+j9Hi6ZQBkZ1lE1m
   HeHvh/p4ZY4JU7Q+F2eaPxGODLeAwcEelCBrPwlbmKpep5TM46yTFq/jV
   ZgvIwQHC3R+NkJYqXQrmiwsU+j1Y4i2s0ZuwGG8hNNxGVUsJ7UNtG9f/m
   sWIlCz1zsXIJQt11otjydiX1p3MZGCg6VkehGa/wj8Qu0n+w1/Nponn8P
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="331788972"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="331788972"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 15:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="660447627"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="660447627"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Feb 2023 15:43:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pPXch-0003yo-1E;
        Tue, 07 Feb 2023 23:43:39 +0000
Date:   Wed, 08 Feb 2023 07:43:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 e86ec1f70352ff7024bb58ecbfb29259202c7d16
Message-ID: <63e2e220.9aD+EPevRQbqsXXs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: e86ec1f70352ff7024bb58ecbfb29259202c7d16  dt-bindings: watchdog: qcom-wdt: add qcom,apss-wdt-sa8775p compatible

elapsed time: 1812m

configs tested: 75
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-bpf
arc                                 defconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                         rhel-8.3-kunit
alpha                               defconfig
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                              defconfig
s390                             allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
alpha                            allyesconfig
i386                 randconfig-a012-20230206
arc                              allyesconfig
i386                 randconfig-a013-20230206
mips                             allyesconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a015-20230206
sh                               allmodconfig
i386                 randconfig-a016-20230206
ia64                             allmodconfig
x86_64               randconfig-a014-20230206
x86_64                           allyesconfig
x86_64               randconfig-a013-20230206
x86_64               randconfig-a011-20230206
x86_64               randconfig-a015-20230206
x86_64               randconfig-a012-20230206
arm                                 defconfig
x86_64               randconfig-a016-20230206
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206
i386                                defconfig
riscv                    nommu_k210_defconfig
i386                             allyesconfig
i386                          randconfig-c001
powerpc              randconfig-c003-20230205
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a001-20230206
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
x86_64                          rhel-8.3-rust
x86_64               randconfig-a005-20230206
x86_64               randconfig-a006-20230206
i386                 randconfig-a002-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a005-20230206
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
i386                 randconfig-a006-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
hexagon              randconfig-r045-20230205
s390                 randconfig-r044-20230205
powerpc                    socrates_defconfig
powerpc                  mpc866_ads_defconfig
arm                         s5pv210_defconfig
s390                             alldefconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
