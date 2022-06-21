Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73357C43334
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Jun 2022 20:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353286AbiFUUAP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Jun 2022 16:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353085AbiFUUAO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Jun 2022 16:00:14 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF52A2DFE
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jun 2022 13:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655841613; x=1687377613;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WNvhgVHP7m2ZC1QkJ30KtsBXJgepkSGHcCb6XRfawq8=;
  b=KlsaZ1Hyos44YW5WDzGKDVNBS8QZ3RGOuGH6+8dbtdYO1DfYms7mFden
   3VSs1Q+V410MCms8GEfkeGwM646WOPLwLV3xL7E/nRURG4EX3FWRyXp7i
   M78tuVMCXmAHZj6hl11ADbYzbL6WnAbQ87UzLTg5M6gRr47jrGMhR47B+
   Ch19wYnjsKlr1AGpJRUkZeN9VcaE27ZgbFsGKW9EAtBKmuiJ7RfQKMxYs
   PpbL60moNzhphe4y1EPzZwEIuiNGVsfTcyHq44w90kpnPdOM9Z2IpYkCY
   WvYjTbVovwl98oUE8ufuRhI2+OELQu9xYjxvMzGCcQqChfcynzEprfMw2
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="341907315"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="341907315"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 13:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; 
   d="scan'208";a="643796338"
Received: from lkp-server02.sh.intel.com (HELO a67cc04a5eeb) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2022 13:00:12 -0700
Received: from kbuild by a67cc04a5eeb with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o3k2l-0000M3-OC;
        Tue, 21 Jun 2022 20:00:11 +0000
Date:   Wed, 22 Jun 2022 03:59:31 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c59ed392a4a31fcb0ce2209a59e2001344767141
Message-ID: <62b22323.E1fVBMdD3KbeR4OU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c59ed392a4a31fcb0ce2209a59e2001344767141  hwmon: (dell-smm) Improve assembly code

elapsed time: 917m

configs tested: 84
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
arc                              alldefconfig
mips                         rt305x_defconfig
m68k                          hp300_defconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
m68k                          sun3x_defconfig
m68k                          multi_defconfig
xtensa                       common_defconfig
arm                       imx_v6_v7_defconfig
um                                  defconfig
sh                               j2_defconfig
powerpc                       ppc64_defconfig
m68k                       m5249evb_defconfig
arm64                            alldefconfig
mips                           ci20_defconfig
xtensa                  nommu_kc705_defconfig
m68k                            q40_defconfig
arm                           stm32_defconfig
sh                          kfr2r09_defconfig
powerpc                 linkstation_defconfig
mips                            gpr_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allmodconfig
i386                 randconfig-a005-20220620
i386                 randconfig-a001-20220620
i386                 randconfig-a006-20220620
i386                 randconfig-a004-20220620
i386                 randconfig-a003-20220620
i386                 randconfig-a002-20220620
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-k001
hexagon              randconfig-r041-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r045-20220622
riscv                randconfig-r042-20220622
hexagon              randconfig-r041-20220621
hexagon              randconfig-r045-20220621

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
