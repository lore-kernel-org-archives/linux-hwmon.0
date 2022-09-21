Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93902C6FA8B
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 06:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbiIUGML (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 02:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiIUGMK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 02:12:10 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E8E7F13D
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 23:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663740728; x=1695276728;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nCZmIVAgKYq43mMfaN2Ze3TMlHPvh7i9mAGHRBiNfas=;
  b=masGONxnIwOjbV1y8bAe6lfv6Na/KGSniMvU5iLiJgqzu0Y8XXuyR4P3
   5808wMSdadBM3FTfbRdQiKkwQDWWkEshh/qmiD1xbZV7fw0n5n0lhxFAF
   7cclaLmZ9wHxigSK6wVng2JkVhXlA+m5YBC61ytQbLFJYra88sPf2Q5f5
   OR3+u8gDsY/Z8JSoPt6DK732tD2umYeTJpOCgV5M8BTiZ7XTo9Ra6Vefd
   UGoKkuh9WMCxyJxZo0LArz0GH+qWJbj2s0FefOElKE1W+HLrAVsmJTdJF
   IAWwDXY0yTCbbx+MNN0dMrEpCwCkbcmPIyk1CpYB5a3lm6N4baMspeBij
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="299898561"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="299898561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 23:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="570398353"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Sep 2022 23:12:07 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oasxq-0003JC-0s;
        Wed, 21 Sep 2022 06:12:06 +0000
Date:   Wed, 21 Sep 2022 14:11:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 21432fc22c48295652f989ea316e3cec69583729
Message-ID: <632aab18.OSEbTts/uECNLF8G%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 21432fc22c48295652f989ea316e3cec69583729  hwmon: (vt8231) Reorder symbols to get rid of a few forward declarations

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                  randconfig-r043-20220921
riscv                randconfig-r042-20220921
arc                              allyesconfig
s390                 randconfig-r044-20220921
ia64                             allmodconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a012
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a016
x86_64                        randconfig-a015
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220921
hexagon              randconfig-r045-20220921
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
x86_64                        randconfig-a012
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a004
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
