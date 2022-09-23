Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B74C6FA8B
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Sep 2022 13:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiIWNP5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Sep 2022 09:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbiIWNP4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Sep 2022 09:15:56 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F9713A94D
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Sep 2022 06:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663938954; x=1695474954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oyvBFUZgA+pbIOU7IZ3DeIY3BV+OwGxON7IgfcX9b4Q=;
  b=I+W/PlBoDhYb2KseUrYsPq9MJsTCKUNOmvUvsrCFL1UEy6Q4FUr4df9d
   Pj3TuChVV/C9vQtR1zWvVwVa14nhBm6Ix0p6Dx288WdOeeOxCImq8zF6u
   pcC4UlOTQcIjDgaPIEi925/tsdOwzFklrgtxM1m/HPvlH2mf9yy2bAFHN
   +CCQvEbKHj8K5uTz8yyIyVItMLdZuEiGIemuCqrvlyapxcanbt1B7cGxw
   Q3SukJpZneASAKWxj3YQY/QwV0/2Ttbc4OJ/1hKl5uhAVvg+nWfLkRYRq
   x1eH570kNw+hdULx+0V0lZcxhcYnq4CTTfXp7cYwPwgKr8+NSzxw1IXmP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="280310965"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="280310965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2022 06:15:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; 
   d="scan'208";a="597863733"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 23 Sep 2022 06:15:52 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obiX2-0005gc-0d;
        Fri, 23 Sep 2022 13:15:52 +0000
Date:   Fri, 23 Sep 2022 21:15:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7fe8edd2423375069bd36a079fdb9dc7a1a21452
Message-ID: <632db176.sS35aXqTvky9xwMS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7fe8edd2423375069bd36a079fdb9dc7a1a21452  hwmon: Make use of devm_clk_get_enabled()

elapsed time: 723m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                  randconfig-r043-20220922
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
i386                                defconfig
mips                             allyesconfig
arm                                 defconfig
x86_64                           allyesconfig
i386                          randconfig-a001
x86_64                        randconfig-a013
m68k                             allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a004
powerpc                           allnoconfig
powerpc                          allmodconfig
m68k                             allmodconfig
i386                          randconfig-a003
sh                               allmodconfig
x86_64                        randconfig-a002
i386                          randconfig-a005
x86_64                        randconfig-a015
ia64                             allmodconfig
i386                          randconfig-a014
x86_64                        randconfig-a006
arm64                            allyesconfig
i386                          randconfig-a012
arm                              allyesconfig
i386                          randconfig-a016
i386                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
arm                        mini2440_defconfig
powerpc                 mpc8540_ads_defconfig

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a012
i386                          randconfig-a002
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a013
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a015
arm                          moxart_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
