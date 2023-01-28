Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F13EC54EAA
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 02:53:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbjA1CxR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Jan 2023 21:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjA1CxR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Jan 2023 21:53:17 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F7010B
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 18:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674874396; x=1706410396;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vlWV317Gx+i1vDmdzIGDNddgKTHnMvVBeQW0pRLtPJU=;
  b=B5SrWkgQpnpN/9Csd+/Abu7Rbw+D3PphM1vfP5MhMRmGveJMmkPf9cLV
   kndtg/Tfl/y9jaX13k6YnBUZZ7nEY0hVgSNl2hCzBQI0N4OmqX+bNo/Pg
   dGezT5GwqAuFCXeB5jP5nfx8XDUQbNn6E4tJztTkHryL7i+jijicUl+24
   I10sonSB2JgcnBICQHi3hWHu30E7e/JX1PmB7lSj/QkeeD9AlLPy17HYh
   oQnJiGXepnunzNTKfWB2MCnEVRg3Yt6HzpcQWUVRtxiCcjb4buyN0Fza8
   RHsnKebwdnB7McvHQn+ZyRo7fgm3kFZrAq+7UWCLVtByEZ7pckS6NAIdW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="307599814"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="307599814"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 18:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="640912208"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; 
   d="scan'208";a="640912208"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Jan 2023 18:53:14 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLbL7-0000Kf-2l;
        Sat, 28 Jan 2023 02:53:13 +0000
Date:   Sat, 28 Jan 2023 10:52:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 f9b70de51c899be761b9270ca618597ecc877402
Message-ID: <63d48dec.7Eu5CqXFhYilpVE0%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: f9b70de51c899be761b9270ca618597ecc877402  hwmon: add initial NXP MC34VR500 PMIC monitoring support

elapsed time: 3715m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
x86_64                              defconfig
alpha                               defconfig
m68k                             allyesconfig
x86_64                           allyesconfig
s390                             allyesconfig
powerpc                           allnoconfig
s390                                defconfig
m68k                             allmodconfig
s390                             allmodconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20230123
i386                                defconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                          rhel-8.3-func
arm                  randconfig-r046-20230123
i386                             allyesconfig
sh                               allmodconfig
alpha                            allyesconfig
mips                             allyesconfig
i386                          randconfig-a014
i386                 randconfig-a003-20230123
i386                 randconfig-a002-20230123
i386                 randconfig-a001-20230123
i386                          randconfig-a012
i386                 randconfig-a004-20230123
ia64                             allmodconfig
x86_64                               rhel-8.3
i386                 randconfig-a005-20230123
i386                 randconfig-a006-20230123
i386                          randconfig-a016
arm                                 defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                              allyesconfig
arm64                            allyesconfig
x86_64               randconfig-a002-20230123
x86_64               randconfig-a001-20230123
x86_64               randconfig-a004-20230123
x86_64               randconfig-a003-20230123

clang tested configs:
hexagon              randconfig-r041-20230123
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230123
s390                 randconfig-r044-20230123
i386                          randconfig-a013
i386                          randconfig-a011
riscv                randconfig-r042-20230123
i386                          randconfig-a015
x86_64               randconfig-a013-20230123
x86_64               randconfig-a011-20230123
x86_64               randconfig-a012-20230123
x86_64               randconfig-a014-20230123
x86_64               randconfig-a016-20230123
x86_64               randconfig-a015-20230123

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
