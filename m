Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342FDC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Nov 2022 12:47:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbiKGMrv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Nov 2022 07:47:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbiKGMrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Nov 2022 07:47:51 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1119418E18
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Nov 2022 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667825266; x=1699361266;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MgrS309SOXek86FsxyAVfugr09hCqaHkr45Idv8QUpI=;
  b=jrsQQbTuSP5Cwk4HVmhO/75+c6prHXUVjp81y23m6Z2ar/4Ue6XB0MEE
   5vzfhVGm1n4pLClr3CqYqz6Z04sQJ5JKdir/MHCuvEY7t8dfqfxvaZi3F
   YOZZuXES1rmvApSaWtVCcm9o7M2TvyjI8cnzqEDDEAnR2ioywv2w8xL7v
   tMv6UPp20wk0TyFb2p5ohisZILpBZtuNHEGV8psLtkIJ65rOk4h69tjTR
   nV2SwYlLKrjFDUYsRWJdNOdzI1ONwVN+/757ZhLyRYMZ03stYhYU1eFrC
   2oRdNSo1vzMQJcA5P8RjZf+td5zcNH+kT14aann23HAHG0VDpku4fUK9F
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="337119832"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="337119832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 04:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="725126509"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="725126509"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2022 04:47:45 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1os1XV-0000gc-04;
        Mon, 07 Nov 2022 12:47:45 +0000
Date:   Mon, 07 Nov 2022 20:47:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 4abf03c1fb6c1e2c347ae131b423d54c95983dc8
Message-ID: <6368fe60.FcwfQ/PG49G8G0w7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 4abf03c1fb6c1e2c347ae131b423d54c95983dc8  docs: hwmon: (smpro-hwmon) Improve grammar and formatting

elapsed time: 723m

configs tested: 64
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                                defconfig
s390                             allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-a001-20221107
i386                 randconfig-a006-20221107
i386                 randconfig-a003-20221107
i386                 randconfig-a002-20221107
i386                 randconfig-a005-20221107
i386                 randconfig-a004-20221107
ia64                             allmodconfig
i386                 randconfig-c001-20221107
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
m68k                         apollo_defconfig
powerpc                     taishan_defconfig
arm                         lpc18xx_defconfig
mips                         rt305x_defconfig
microblaze                      mmu_defconfig
csky                             alldefconfig
ia64                      gensparse_defconfig
sh                     magicpanelr2_defconfig
sh                          sdk7786_defconfig
sh                         microdev_defconfig

clang tested configs:
i386                 randconfig-a013-20221107
i386                 randconfig-a015-20221107
i386                 randconfig-a016-20221107
i386                 randconfig-a011-20221107
i386                 randconfig-a014-20221107
i386                 randconfig-a012-20221107
x86_64               randconfig-a014-20221107
x86_64               randconfig-a011-20221107
x86_64               randconfig-a013-20221107
x86_64               randconfig-a012-20221107
x86_64               randconfig-a015-20221107
x86_64               randconfig-a016-20221107
mips                     cu1000-neo_defconfig
arm                         orion5x_defconfig
powerpc                    mvme5100_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
