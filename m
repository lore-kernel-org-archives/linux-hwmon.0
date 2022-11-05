Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3D2C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Nov 2022 12:40:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiKEMke (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Nov 2022 08:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiKEMkc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Nov 2022 08:40:32 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86F216591
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Nov 2022 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667652030; x=1699188030;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kGLPEaIDSsWkD4937dkxROLVrNa8Pkjcr2WeJpH0Hgw=;
  b=Z4LVKN6qC/3gNQ9UKQxRNKKuKVyRmWnDZAURLrBZo8UQTZaXzZRoaJaM
   nEEQ15rkWIvAApW2EAvefLugi0dIkNPAaYjf3UTCs6Fa+b1ef9Bw8AqK+
   dDxbkwG46hx5oph1zT9PBQRkx257k11LmenFt1vFDvzoixbltIQ3xQAvq
   TMDq3CmnZWULG3v0UERNgmy16XTJ/OjMp63jcwS4jYPkle5rifZoHglBK
   ln+a5A2cCviiboGRUX+gQiMbtCJzO8d1PHsQQjTG7rFSbn+1Q+sGK0wrN
   eqhwvHusp72FPzR55B+ETUk/KFeTfCspLPyqGxsv37ufRbEcKwFfUdasT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="372277961"
X-IronPort-AV: E=Sophos;i="5.96,140,1665471600"; 
   d="scan'208";a="372277961"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2022 05:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="613373925"
X-IronPort-AV: E=Sophos;i="5.96,140,1665471600"; 
   d="scan'208";a="613373925"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2022 05:40:29 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1orITM-000Hzz-2H;
        Sat, 05 Nov 2022 12:40:28 +0000
Date:   Sat, 05 Nov 2022 20:39:34 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 1e699e177e339e462cdc8571e3d0fcf29665608e
Message-ID: <63665986.SFOt9IYMfHQzaGis%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 1e699e177e339e462cdc8571e3d0fcf29665608e  Revert "hwmon: (pmbus) Add regulator supply into macro"

elapsed time: 724m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
um                           x86_64_defconfig
um                             i386_defconfig
arc                                 defconfig
alpha                               defconfig
i386                          randconfig-a001
s390                                defconfig
i386                          randconfig-a003
s390                             allmodconfig
i386                          randconfig-a005
arc                  randconfig-r043-20221104
x86_64                        randconfig-a013
powerpc                          allmodconfig
riscv                randconfig-r042-20221104
x86_64                        randconfig-a011
mips                             allyesconfig
s390                 randconfig-r044-20221104
powerpc                           allnoconfig
sh                               allmodconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                              defconfig
i386                          randconfig-a014
m68k                             allmodconfig
x86_64                        randconfig-a006
arc                              allyesconfig
i386                          randconfig-a012
alpha                            allyesconfig
i386                          randconfig-a016
i386                                defconfig
x86_64                           allyesconfig
m68k                             allyesconfig
arm                                 defconfig
i386                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arm                              allyesconfig
arm64                            allyesconfig
powerpc                      ppc40x_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 linkstation_defconfig
arm                         cm_x300_defconfig
m68k                       m5208evb_defconfig
sh                   sh7724_generic_defconfig
powerpc                   currituck_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64                        randconfig-a014
hexagon              randconfig-r041-20221104
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a016
i386                          randconfig-a004
hexagon              randconfig-r045-20221104
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a001
i386                          randconfig-a011
x86_64                        randconfig-a003
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
