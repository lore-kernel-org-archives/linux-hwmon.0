Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F39C433FE
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Nov 2022 04:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiKAEoo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Nov 2022 00:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiKAEon (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 1 Nov 2022 00:44:43 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449201741B
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Oct 2022 21:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667277882; x=1698813882;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+UccJlywgv6Z2jNxZ9ZTcWcf1an6JcwACquk3PGnVeE=;
  b=JPmoKnt4dcwpJ9UKeNi0/i2y1HXE0PKOwD+n7F/vXKTvIJ7xke2xIM38
   kWI8eNl5GnQpUXOniKt9H7y+bM5CeRj2rhco4o/5lTZGG9jaZrZ1Wz3uF
   Ru3om4K3inPL2G5qie80Kzm5UOqPzv/fvoIn1E5cLSLyXBvrIFT86KjPA
   p3J00vUpanJE30+BT1C981r5IQ6e6B69dSF5GLfm4GFZ46cojHuFWkQai
   MyLSVlkqrX0nxPmy+rqEyj3f+GjWIMNb2F3SFBAYSVTPZGtRtQNvdDVYp
   Rn+jXV+SpH7fvW/oSTfgPStit36X2DpuxhKgnpqsZZhXEOOVanNa0Tww5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="310159223"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; 
   d="scan'208";a="310159223"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 21:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="963015896"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; 
   d="scan'208";a="963015896"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2022 21:44:40 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1opj8i-000DKm-0H;
        Tue, 01 Nov 2022 04:44:40 +0000
Date:   Tue, 01 Nov 2022 12:44:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 6b780408be034213edfb5946889882cb29f8f159
Message-ID: <6360a424.rrR67lqHreMReSKQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6b780408be034213edfb5946889882cb29f8f159  hwmon: (pmbus/ltc2978) add support for LTC7132

elapsed time: 839m

configs tested: 57
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
arc                                 defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
alpha                               defconfig
x86_64                              defconfig
mips                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
x86_64                           allyesconfig
arm                                 defconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
arm                              allyesconfig
s390                             allmodconfig
alpha                            allyesconfig
arc                  randconfig-r043-20221031
arm64                            allyesconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
s390                                defconfig
riscv                randconfig-r042-20221031
i386                 randconfig-a011-20221031
arc                  randconfig-r043-20221030
i386                 randconfig-a012-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a015-20221031
i386                 randconfig-a014-20221031
m68k                             allyesconfig
s390                 randconfig-r044-20221031
i386                 randconfig-a016-20221031
i386                                defconfig
x86_64               randconfig-a012-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
x86_64               randconfig-a014-20221031
x86_64               randconfig-a015-20221031
x86_64               randconfig-a016-20221031
i386                             allyesconfig

clang tested configs:
x86_64               randconfig-a003-20221031
hexagon              randconfig-r045-20221031
x86_64               randconfig-a002-20221031
hexagon              randconfig-r041-20221030
riscv                randconfig-r042-20221030
x86_64               randconfig-a001-20221031
x86_64               randconfig-a004-20221031
s390                 randconfig-r044-20221030
hexagon              randconfig-r041-20221031
x86_64               randconfig-a005-20221031
hexagon              randconfig-r045-20221030
x86_64               randconfig-a006-20221031

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
