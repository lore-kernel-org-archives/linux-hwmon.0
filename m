Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C32C07E9D
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Sep 2022 09:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbiI0Jxg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Sep 2022 05:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiI0Jxf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Sep 2022 05:53:35 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECDC8A1ED
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Sep 2022 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664272414; x=1695808414;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5NjVvgXgxEj8kanQJzd3mo6dCi9BVaBgvVEOzpyIqyM=;
  b=S7P1/PpzhgKMWmEiAeDt+MQOTTMnYcfGE77i+gNz56tybTA//yTWpHPP
   qZB8sStxahpjla//IHtx/orWQo7RK0MC5eZnMWP7VeBPmhxLSQ1fybLqL
   d8ZXlNkKXHO7TOj9nNWk27+6+lHkbJdrefvNkanCMFaCzO82kNz1zGNl7
   JTyI5D/NO3vIRROrsBhCx+EzDMd8Em3jeTzZoPOzcgezb9Lo0LHslmiH/
   99jOCNNGB7NK/APMMkPOO+EoEjE+LtxiuwkQOqqhzBranHQCBenrQ7874
   pGDULMnixts8biyKagt33GdXVLrNizMp0fET0QfaCP02kXEN1swUxvgGm
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302185188"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="302185188"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 02:53:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="623699684"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="623699684"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2022 02:53:33 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1od7HQ-0000t0-1p;
        Tue, 27 Sep 2022 09:53:32 +0000
Date:   Tue, 27 Sep 2022 17:53:09 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 ff6088c3ee1dd34bbd80b471dc18c9b5c0ea9c60
Message-ID: <6332c805.YhX33tBcScGFlAvZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: ff6088c3ee1dd34bbd80b471dc18c9b5c0ea9c60  dt-bindings: watchdog: migrate mt7621 text bindings to YAML

elapsed time: 720m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
s390                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                           allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
i386                                defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
m68k                             allyesconfig
arm                                 defconfig
sh                               allmodconfig
mips                             allyesconfig
i386                 randconfig-a001-20220926
powerpc                          allmodconfig
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a006-20220926
i386                 randconfig-a005-20220926
i386                             allyesconfig
x86_64               randconfig-a002-20220926
arm                              allyesconfig
x86_64               randconfig-a005-20220926
arm64                            allyesconfig
x86_64               randconfig-a004-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a006-20220926
arc                  randconfig-r043-20220925
riscv                randconfig-r042-20220925
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
ia64                             allmodconfig

clang tested configs:
i386                 randconfig-a011-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a016-20220926
x86_64               randconfig-a012-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64               randconfig-a016-20220926
x86_64               randconfig-a015-20220926
x86_64               randconfig-a014-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
