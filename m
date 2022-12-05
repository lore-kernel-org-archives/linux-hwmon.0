Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C76C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 16:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbiLEQt1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 11:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiLEQtD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 11:49:03 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86071F60C
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 08:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670258880; x=1701794880;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4Q3mUQKqiUYtXHGizMb6tQwGyegfGO6CFLttue9yvz0=;
  b=ivxdVlU9/b1KzFp9L59NndDQcWebCkluqYHDMrikPuwir5jyM/tJmV5M
   C4SYyHd2RCUhTshBNwFZEC78xUqrwjWxUDs8JrP6NK5RHLnhxeSmkf/7X
   48xhTowipLIFws24hGbMCdOlf7ro0u5dGNjNBIGOgPB4BUN2heGQkbvUb
   liASV64ZW7KdoiUoVi47KEsUNZq8OPlEL7qaakQP/hC0dfyOPsmyTmgzD
   dp9LPkmnyrogED5pJrwT2XYiahJTaInYh9yPHXphKcL9vsph0O7q9FIqK
   ztr42lZVs4/kPVm9t1CJhWOJUMwoZi2fRwuOIekQ/dEZzdfHy3rJY7z4n
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="380692016"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="380692016"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 08:48:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="648004532"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="648004532"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Dec 2022 08:47:59 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1p2EdK-0000EL-1S;
        Mon, 05 Dec 2022 16:47:58 +0000
Date:   Tue, 06 Dec 2022 00:47:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 688fcd047ef0f0aeee16d0fefaff065fa69eb642
Message-ID: <638e209a.uIzh8jaUq1z9GenS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 688fcd047ef0f0aeee16d0fefaff065fa69eb642  hwmon: (dell-smm) Move error message to make probing silent

elapsed time: 726m

configs tested: 63
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
arc                  randconfig-r043-20221205
s390                                defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
s390                 randconfig-r044-20221205
i386                                defconfig
riscv                randconfig-r042-20221205
arm                                 defconfig
x86_64                              defconfig
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
arc                              allyesconfig
arm                              allyesconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
arm64                            allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
powerpc                           allnoconfig
x86_64               randconfig-a014-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
i386                 randconfig-a014-20221205
x86_64               randconfig-a016-20221205
i386                 randconfig-a013-20221205
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a016-20221205
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig

clang tested configs:
x86_64               randconfig-a003-20221205
x86_64               randconfig-a004-20221205
arm                  randconfig-r046-20221205
x86_64               randconfig-a001-20221205
x86_64               randconfig-a002-20221205
hexagon              randconfig-r041-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a006-20221205
hexagon              randconfig-r045-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a003-20221205
i386                 randconfig-a006-20221205
i386                 randconfig-a005-20221205
hexagon              randconfig-r041-20221204
riscv                randconfig-r042-20221204
hexagon              randconfig-r045-20221204
s390                 randconfig-r044-20221204

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
