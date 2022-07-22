Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78ACC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Jul 2022 03:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiGVDJQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Jul 2022 23:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiGVDJP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jul 2022 23:09:15 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FECD8C588
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2022 20:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658459354; x=1689995354;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UGYRl0/XCq18IqVJaxMFEeWOrxQiosNNpx80pwLlYmw=;
  b=CMXIxGX+eGD9kvxCVm8hSPytBcja33qPhK684kMqugMSr5mvBxlA8T5g
   0ljQVvQjHFtrK51Q4nNu0Qbxt07kVDNDY4DVqJop0fhFZrlIeKAuxW+r3
   C90HUR4KgpXkpJHxSBs9b2PjMmOk0EbVzRvwDXk6LD9Lnxg4MRUZJ22WR
   vzem2+6odYtGwqQpl276B47W8Wg0cAWH40qXjRnRrta0h3BaKQ3YLtbyy
   JbbQbDuA/dAB9tRPmS3KbACqIC2jNthWjX7KGEWrCUS1fBydjsgHZypzL
   tCFxS2G9LzlSdBQy8WOMNV8OnsyLZsC13xZvgjQHsPBV9rYuVoMMB5191
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="312946959"
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="312946959"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 20:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,184,1654585200"; 
   d="scan'208";a="626391094"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Jul 2022 20:09:11 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oEj2N-0000ts-04;
        Fri, 22 Jul 2022 03:09:11 +0000
Date:   Fri, 22 Jul 2022 11:08:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0eabb1396656f215a5333a9444158b17b0fd3247
Message-ID: <62da14a3.laem1INP2+1Kpm6O%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0eabb1396656f215a5333a9444158b17b0fd3247  hwmon: (tps23861) fix byte order in current and voltage registers

elapsed time: 722m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                               j2_defconfig
arc                          axs101_defconfig
alpha                               defconfig
mips                         cobalt_defconfig
arm                      jornada720_defconfig
sh                              ul2_defconfig
powerpc                        cell_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                           xway_defconfig
mips                          rb532_defconfig
powerpc                 mpc834x_mds_defconfig
m68k                        mvme147_defconfig
mips                     loongson1b_defconfig
arm                         at91_dt_defconfig
nios2                         10m50_defconfig
sh                               alldefconfig
powerpc                     tqm8555_defconfig
arm                             pxa_defconfig
powerpc                      tqm8xx_defconfig
mips                           gcw0_defconfig
arm                        oxnas_v6_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220721
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3

clang tested configs:
arm                          ixp4xx_defconfig
powerpc                  mpc866_ads_defconfig
mips                      malta_kvm_defconfig
arm                                 defconfig
arm                           spitz_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220721
hexagon              randconfig-r045-20220721
riscv                randconfig-r042-20220721
s390                 randconfig-r044-20220721

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
