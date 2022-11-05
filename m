Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA0DC43217
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Nov 2022 12:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiKEMjw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Nov 2022 08:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiKEMjc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Nov 2022 08:39:32 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98C4165A3
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Nov 2022 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667651970; x=1699187970;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0BxhlU1Qt92lqcDmQmSFB7iOHVKpcypRegQMX1D2Z+s=;
  b=IWmyPpY5HSk3BX83PZ9RivrIoRCbKN5Vx3XAom1dfSt9Hc3AGc8TAuzT
   5odoWNt8QJLAsSz7PRYQ+r3BeFAgeQL0E1GfunUJMx1ymajbwvWPU0ZBU
   PfqhdK6r80ofjIAv61KNkRKj+IhuACIGwdhd8RNiAszydkyKGkIHOxfP5
   mW9VOlguKcTtH/b5uU2d1cutAWVYSt9n+GujE/73hcnOs5nbrzJmxkHuS
   M8Y8LXJl269aakktiHrrHusUGjll17KhRYkA+V1Vf7lCFtyyqEFE0oJBg
   KZDjXdafBHpb6sMyPTNLUros3hH/6Gb0n0SE/I5aZdfqsEDEId57nYz7U
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="396468352"
X-IronPort-AV: E=Sophos;i="5.96,140,1665471600"; 
   d="scan'208";a="396468352"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2022 05:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="635397533"
X-IronPort-AV: E=Sophos;i="5.96,140,1665471600"; 
   d="scan'208";a="635397533"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2022 05:39:29 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1orISO-000Hzm-21;
        Sat, 05 Nov 2022 12:39:28 +0000
Date:   Sat, 05 Nov 2022 20:39:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 8c72b88e52c0062aadc207fcc6b17a4988d3c858
Message-ID: <6366597b.yABR53fyY7ZhOilY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 8c72b88e52c0062aadc207fcc6b17a4988d3c858  docs: hwmon: (smpro-hwmon) Improve grammar and formatting

elapsed time: 723m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-syz
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a006
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                               rhel-8.3
powerpc                          allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
m68k                             allyesconfig
sh                               allmodconfig
arc                                 defconfig
m68k                             allmodconfig
s390                             allmodconfig
arc                  randconfig-r043-20221104
alpha                               defconfig
x86_64                        randconfig-a013
s390                                defconfig
x86_64                        randconfig-a011
riscv                randconfig-r042-20221104
i386                                defconfig
x86_64                              defconfig
i386                          randconfig-a012
s390                 randconfig-r044-20221104
arm                                 defconfig
s390                             allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a016
i386                          randconfig-a014
arm                              allyesconfig
arm64                            allyesconfig
i386                             allyesconfig
x86_64                           allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
hexagon              randconfig-r041-20221104
hexagon              randconfig-r045-20221104
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
