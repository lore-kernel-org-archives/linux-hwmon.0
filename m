Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DF7C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 12 Nov 2022 10:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbiKLKQn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 12 Nov 2022 05:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234017AbiKLKQn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 12 Nov 2022 05:16:43 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645FA21824
        for <linux-hwmon@vger.kernel.org>; Sat, 12 Nov 2022 02:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668248202; x=1699784202;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oa/8HYF0U8J2E/8n45A2M+clz7XKofHpbMNBz/Y7gQQ=;
  b=FpFqS3grUx8xy27i2yvxl3xh70dSgAcuL9xqdNoN0xVTFsNQwy5QNu9U
   vaO6D9kYRaR479WpE0Ohoor/OPHoYczi0N651hP0SvXoU9AfLexN27ZNZ
   NxG5hHepuywFXalebghtDsDzfK9z3Pknrl/4r/xlhzV8HMjk/9n7xAVxu
   kLDgYkm1IaIDJVlGiV5zZtnoVhVKschKwS9h4/4fyDMXYf9GQlXbJQ5rf
   6arXJkesPilMFAlHxcmWv8wbarytK+IIx4MAYGJowWNMyYx+/1E+AnIze
   T216lfquVidSKrDXYUNRDjMBxaeh50k77O+xfKjacdHkAroFgm7b6bSPr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="299235385"
X-IronPort-AV: E=Sophos;i="5.96,159,1665471600"; 
   d="scan'208";a="299235385"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2022 02:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="637815062"
X-IronPort-AV: E=Sophos;i="5.96,159,1665471600"; 
   d="scan'208";a="637815062"
Received: from lkp-server01.sh.intel.com (HELO e783503266e8) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Nov 2022 02:16:40 -0800
Received: from kbuild by e783503266e8 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1otnZ2-0004mP-0a;
        Sat, 12 Nov 2022 10:16:40 +0000
Date:   Sat, 12 Nov 2022 18:15:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2512910c126a4d4cf75af48c8459ed56d3be17c9
Message-ID: <636f7258.rnbwnSE6mx+uuhs5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2512910c126a4d4cf75af48c8459ed56d3be17c9  hwmon: (coretemp) Remove obsolete temp_data->valid

elapsed time: 725m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                               rhel-8.3
arm                                 defconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
x86_64                           allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
alpha                               defconfig
s390                                defconfig
x86_64                        randconfig-a002
s390                             allmodconfig
x86_64                        randconfig-a006
m68k                             allyesconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
m68k                             allmodconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
i386                             allyesconfig
x86_64                        randconfig-a004
sh                               allmodconfig
arm                              allyesconfig
arc                  randconfig-r043-20221111
arm64                            allyesconfig
x86_64                        randconfig-a013
s390                             allyesconfig
riscv                randconfig-r042-20221111
s390                 randconfig-r044-20221111
x86_64                        randconfig-a011
mips                             allyesconfig
x86_64                        randconfig-a015
i386                          randconfig-a001
i386                          randconfig-a003
ia64                             allmodconfig
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
hexagon              randconfig-r045-20221111
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221111
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
