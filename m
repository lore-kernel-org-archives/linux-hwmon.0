Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E98C32771
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 10:07:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbiIZKHj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235013AbiIZKHB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 06:07:01 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C63246D88
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664186802; x=1695722802;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mvEgjJSP/eg+MRF2k9T4ETKHmTDUYbz8e5pm5TQNa+E=;
  b=Tw+XtmLZj55VlTMznh0g1WS4uVULREKUvyM7juujz53CuZwexYqi+Z6U
   qg2Adg/jul6HoGNHnnT+t8MvnI0vfhYJbLk0wrfyL0GE3LPgRQOGG6Vl7
   3InfzBQbw3ObH0J7JUXybLWYgX2kW7DAG22jLbm+RoBf9Vp/S9a/xn01S
   lPuTu6ps23XUug9pCsjvkyKsArI82rzYmhVuPiE+g1ticdsDO50ZeyIny
   +xV0O2C5vNPmzjFZFU1/0VYsltLvL0E5HaIn1M/IxElgkT5ys66Tn18Lv
   i2hWtzVZSTNIAUN94FOzDzMFp28uwAkruus/CT3qRb+brgqtVDoD3F8QF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="365021891"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="365021891"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 03:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="651767986"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="651767986"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Sep 2022 03:06:42 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocl0b-0008tO-13;
        Mon, 26 Sep 2022 10:06:41 +0000
Date:   Mon, 26 Sep 2022 18:05:45 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2d5604c822e91c3eebaa0f9d0691acb954071ef1
Message-ID: <63317979.Voy5xs5lzVUyr8p0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2d5604c822e91c3eebaa0f9d0691acb954071ef1  hwmon: (ina3221) Use DEFINE_RUNTIME_DEV_PM_OPS() and pm_ptr()

elapsed time: 724m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64                              defconfig
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
arc                  randconfig-r043-20220925
x86_64               randconfig-a006-20220926
x86_64                               rhel-8.3
riscv                randconfig-r042-20220925
x86_64                          rhel-8.3-func
i386                 randconfig-a001-20220926
arc                              allyesconfig
i386                 randconfig-a004-20220926
arc                                 defconfig
i386                 randconfig-a005-20220926
x86_64                        randconfig-a015
alpha                            allyesconfig
x86_64                    rhel-8.3-kselftests
powerpc                           allnoconfig
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                         rhel-8.3-kunit
arc                  randconfig-r043-20220926
powerpc                          allmodconfig
m68k                             allmodconfig
i386                 randconfig-a006-20220926
i386                 randconfig-a002-20220926
mips                             allyesconfig
s390                 randconfig-r044-20220925
x86_64                           rhel-8.3-kvm
i386                 randconfig-a003-20220926
s390                             allmodconfig
x86_64                        randconfig-a011
arm                                 defconfig
m68k                             allyesconfig
alpha                               defconfig
s390                             allyesconfig
s390                                defconfig
x86_64                           allyesconfig
arm                              allyesconfig
i386                                defconfig
sh                               allmodconfig
arm64                            allyesconfig
i386                             allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
i386                 randconfig-a011-20220926
x86_64                        randconfig-a016
s390                 randconfig-r044-20220926
x86_64                        randconfig-a012
i386                 randconfig-a014-20220926
x86_64                        randconfig-a014
i386                 randconfig-a013-20220926
i386                 randconfig-a016-20220926
i386                 randconfig-a012-20220926
i386                 randconfig-a015-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
