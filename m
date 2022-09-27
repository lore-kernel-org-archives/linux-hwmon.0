Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4E2C6FA83
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Sep 2022 11:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiI0LNy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Sep 2022 07:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbiI0LNs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 07:13:48 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB8463BD
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Sep 2022 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664277226; x=1695813226;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I47qwT94o9uW6+7lXaY2zRaESKXC4XKil+brAc0wHhM=;
  b=LvW/Oacc01N702xgGq35KWcUctL4erPVL84AtHYMNBqbKPBMBoFaBFqN
   /1Snz5g3X3hHYhUKwZIShOC9VL1lVRETC2vxRZWW6Q0W7FIaXW9sYUGhn
   Ohf1nuttYPWiPmzGFGr5E0Khn4m5sgrWYDt1vmob9PiVxvothSDNGIIJ6
   Hcz/Py8EpHgqZzsUoes1gmC/Zthwf7iErJejJCeCsKaRiEbb1xOwyRfgl
   b7Y7phbsw+5BfbCcKYEWaj0yaUQsOtkiF+XokjLDRwX92WbCJp5K8pDjR
   08qZ5YLhrIm+mcwHL+9tJVfbfjA+yb0O3uqbAdE3Rn3jOfHuxcps6G8eU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327644770"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="327644770"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 04:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763838622"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="763838622"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2022 04:13:35 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1od8Ws-0000wG-1w;
        Tue, 27 Sep 2022 11:13:34 +0000
Date:   Tue, 27 Sep 2022 19:13:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 760bda91cb4f5f778a6193b20c22726209579164
Message-ID: <6332dadc.M81wTx7WlWwI3taX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 760bda91cb4f5f778a6193b20c22726209579164  hwmon: w83627hf: Reorder symbols to get rid of a few forward declarations

elapsed time: 726m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
s390                             allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                                defconfig
arm                                 defconfig
x86_64                           allyesconfig
i386                 randconfig-a001-20220926
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
powerpc                           allnoconfig
i386                 randconfig-a004-20220926
x86_64               randconfig-a002-20220926
i386                 randconfig-a005-20220926
x86_64               randconfig-a005-20220926
mips                             allyesconfig
x86_64               randconfig-a004-20220926
i386                 randconfig-a006-20220926
m68k                             allmodconfig
x86_64               randconfig-a001-20220926
arc                  randconfig-r043-20220925
arc                              allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220926
i386                             allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
x86_64               randconfig-a006-20220926
m68k                             allyesconfig
riscv                randconfig-r042-20220925
arm                              allyesconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
arm64                            allyesconfig
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a016-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
x86_64               randconfig-a015-20220926
hexagon              randconfig-r045-20220926
x86_64               randconfig-a012-20220926
hexagon              randconfig-r041-20220925
x86_64               randconfig-a014-20220926
riscv                randconfig-r042-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a013-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a011-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
