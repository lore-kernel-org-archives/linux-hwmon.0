Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DE6C47088
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Dec 2022 06:12:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbiLBGMD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Dec 2022 01:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbiLBGMC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Dec 2022 01:12:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F76DC858
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Dec 2022 22:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669961521; x=1701497521;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z1HkNfBeYcEbvtQCDo8O89DmuSHTuHK1+D69SQMeqb0=;
  b=YIsXPjDwZTaNEgNlR/O6gUV1KGOr4PyYXiWdp/J5go6PqhkbkbwsrHex
   9t1OrQBenML/1G6ockCGUyTTr+XCWBd7ONo+qHlEe1oCEN9vbFGH8MgnJ
   b+e3QgNryCjaumFidp49lqqm7BPHMEswwB6hwWu7ii+xLGOwD2k6Iq5mE
   w6xyh8NFcQ+WIXo6Bhr4IganRJwtWsMKQKhYKDXR9b6JACdBK9SU3F8xZ
   asBpJYs0mN3kfdmPshZi6hBDxSwO+zlzL6VUb8VeTa9ZjbmIa0Xum4QgK
   kdcSoOgrMpvZzDOrF46S200KxmU7/99xT8rhrSfQDPTHBQfo5HHLQM7sO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="295579166"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="295579166"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 22:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="787176145"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="787176145"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2022 22:12:00 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p0zHD-000DKr-1F;
        Fri, 02 Dec 2022 06:11:59 +0000
Date:   Fri, 02 Dec 2022 14:10:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b77fdd9d6f9faf77243988d27b2007059aa3738b
Message-ID: <638996f3.OnTGK5q/nh6NEPNp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b77fdd9d6f9faf77243988d27b2007059aa3738b  hwmon: (oxp-sensors) Fix pwm reading

elapsed time: 726m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                                 defconfig
alpha                               defconfig
powerpc                           allnoconfig
s390                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
s390                                defconfig
alpha                            allyesconfig
ia64                             allmodconfig
x86_64                              defconfig
s390                             allyesconfig
sh                               allmodconfig
x86_64                               rhel-8.3
mips                             allyesconfig
x86_64                        randconfig-a013
arc                  randconfig-r043-20221201
powerpc                          allmodconfig
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64                        randconfig-a015
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                            allnoconfig
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig

clang tested configs:
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221201
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221201
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
