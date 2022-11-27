Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14582C4332F
	for <linux-hwmon@archiver.kernel.org>; Sun, 27 Nov 2022 14:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiK0Ogj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 27 Nov 2022 09:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiK0Ogi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 27 Nov 2022 09:36:38 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3611EE07
        for <linux-hwmon@vger.kernel.org>; Sun, 27 Nov 2022 06:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669559797; x=1701095797;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vNt2cVYZvmmh4hY4y2cJiGKLF3KkNlVBcw2TRQ9CK0Q=;
  b=XpEYIKldcyJAceHN8owmuC9kO/yGht6uTe9UmUgGYZviN87p0y0DRtkl
   1ETIbEp5VkeELz+WpATu41jv+fnABQjGZhfsNKfcpwgjEmQ3XjGq/zadF
   1TaByVCh1d4PjhpuiKHns5CblrXFwG5tk6PL6PzosxmEe6LWlRBDvC5fs
   fz5T3apFBBdI+T56QgRfbBvqF0KVCew+CBiM5QREv0nwdDQXb6hBlxM2V
   A5tDFBVem+5mer3T4MHFrEzkA8gDspETyuV3JKmdTG/3Su6MDpi+muoi+
   k9vI6FWyHVYtKx68tNLaYG4EfIZ8V2e6/B3lm9woOeq2NNBsjfX8PI5vA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="378932092"
X-IronPort-AV: E=Sophos;i="5.96,198,1665471600"; 
   d="scan'208";a="378932092"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2022 06:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="645213368"
X-IronPort-AV: E=Sophos;i="5.96,198,1665471600"; 
   d="scan'208";a="645213368"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Nov 2022 06:36:36 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ozIln-00074h-1J;
        Sun, 27 Nov 2022 14:36:35 +0000
Date:   Sun, 27 Nov 2022 22:35:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 9494c53e1389b120ba461899207ac8a3aab2632c
Message-ID: <638375bf.re/s/ol3r3IKJdgA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 9494c53e1389b120ba461899207ac8a3aab2632c  hwmon: (aquacomputer_d5next) Add support for Quadro flow sensor pulses

elapsed time: 1304m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20221127
powerpc                           allnoconfig
riscv                randconfig-r042-20221127
s390                 randconfig-r044-20221127
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
sh                               allmodconfig
x86_64                        randconfig-a015
alpha                            allyesconfig
arc                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
ia64                             allmodconfig
s390                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
s390                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                              defconfig
x86_64                        randconfig-a006
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
i386                                defconfig
i386                             allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221127
hexagon              randconfig-r041-20221127
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
