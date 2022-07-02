Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B349EC43334
	for <linux-hwmon@archiver.kernel.org>; Sat,  2 Jul 2022 07:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiGBH7p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 2 Jul 2022 03:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbiGBH7o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 2 Jul 2022 03:59:44 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA60A1AF33
        for <linux-hwmon@vger.kernel.org>; Sat,  2 Jul 2022 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656748784; x=1688284784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Mp+nh/6tnUYEKl0QoZDA1hDzroZPPf43LW+uzDPDibw=;
  b=R5bgvAuYKpUrZ2arqujZ2gX3CbsjaQNNGsZrbPKsFSbPaVBz+EBZY2wc
   A6ipPlMXskRDgI9W+isP6Gwiuu5tMEDlcdyAoFZD/oB3cAm0ov0Y5F7no
   KWeE5aFVnjoaTFRioBflhvlH5egZO7pjziLTAQErQ8lJa/rpzZQYkOfPl
   Owe/uCNpf7ErxkJzpeBqz09PwFp5G8zs8e4X+bgwOidk6lYYPm8U0vHmu
   W5+YXDGmaCAIMB3Tn/mOa05i+YCfuOFpXInPVF9voyNhWp8HwO8RhFWUL
   a2pC8aFDMvsT3fzN8ukHmhYXxtZJrKXSC0mVWBhObztUA11CJNwVAgMGA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="283913219"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="283913219"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 00:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="624516204"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Jul 2022 00:59:42 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o7Y2X-000Ez0-Fn;
        Sat, 02 Jul 2022 07:59:41 +0000
Date:   Sat, 02 Jul 2022 15:58:58 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 d0e51022a025ca5350fafb8e413a6fe5d4baf833
Message-ID: <62bffac2.7doQBhr3DXakZ6XD%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: d0e51022a025ca5350fafb8e413a6fe5d4baf833  hwmon: (ibmaem) don't call platform_device_del() if platform_device_add() fails

elapsed time: 725m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
sh                               allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220629
s390                 randconfig-r044-20220629
riscv                randconfig-r042-20220629
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220629
hexagon              randconfig-r041-20220629

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
