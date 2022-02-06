Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8703BC433EF
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Feb 2022 07:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbiBFHGL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Feb 2022 02:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiBFHGL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 6 Feb 2022 02:06:11 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Feb 2022 23:06:09 PST
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B93C06173B
        for <linux-hwmon@vger.kernel.org>; Sat,  5 Feb 2022 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644131169; x=1675667169;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tJpCrlYEVteUvn3o7f/3BWnHCWl15TXN37cTwxLxGa0=;
  b=liH1u2jD/pP0W9xX+dW4ZNAm/fVrGlfISY/8fuXdtNBdfr9pexkCNI/t
   6fJa/9NRTHjHQhAwaQOQN8tYoC19DSsAW6zLNYuM7s0d0iavLw//98NQ/
   McSMCGN0eO9qpifno1rZa+ZQdBOqvhLPxfPaa9yCFMzL8uAxHPvaOmKRO
   YJ8fEqk+7qC6ioSTW3Gje2KTSLng6oZT2GPSzwFgCiDEe8VENCTiKkE3b
   OTtPEiIPvI80EwbafQ+b6hw+2MZ2gobbbLmq65Gn2HdvOz7wiLPVgYZvw
   lwDEWp0gjosGgCXtsqPznKDXcKHsZMmZgh7REbAQnsSMORKHEC2NAtR7C
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10249"; a="273073305"
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="273073305"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2022 23:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,347,1635231600"; 
   d="scan'208";a="498881118"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Feb 2022 23:05:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nGbbc-000a0l-Vi; Sun, 06 Feb 2022 07:05:04 +0000
Date:   Sun, 06 Feb 2022 15:04:42 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2d894d63ecb9cef943af99c605fa87c655c2714c
Message-ID: <61ff730a.4oACYUmdkzYO5IbS%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2d894d63ecb9cef943af99c605fa87c655c2714c  hwmon: (asus-ec-sensors) read sensors as signed ints

elapsed time: 720m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
m68k                          sun3x_defconfig
powerpc                  storcenter_defconfig
s390                                defconfig
alpha                            allyesconfig
mips                         bigsur_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           ci20_defconfig
m68k                        stmark2_defconfig
powerpc                       maple_defconfig
csky                                defconfig
sh                           se7780_defconfig
sh                             sh03_defconfig
powerpc64                           defconfig
arm                            mps2_defconfig
powerpc                         ps3_defconfig
arc                                 defconfig
mips                        bcm47xx_defconfig
mips                         tb0226_defconfig
sh                         ecovec24_defconfig
arm                          iop32x_defconfig
powerpc                   motionpro_defconfig
sparc                            alldefconfig
arc                          axs101_defconfig
sh                      rts7751r2d1_defconfig
openrisc                         alldefconfig
powerpc                    amigaone_defconfig
sh                            titan_defconfig
sparc64                             defconfig
riscv                               defconfig
arm                         at91_dt_defconfig
arm                         lubbock_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220206
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220206
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220206
mips                 randconfig-c004-20220206
i386                          randconfig-c001
arm                  randconfig-c002-20220206
s390                 randconfig-c005-20220206
powerpc                  mpc866_ads_defconfig
arm                         s5pv210_defconfig
powerpc                     tqm8560_defconfig
arm                         orion5x_defconfig
powerpc                       ebony_defconfig
mips                       rbtx49xx_defconfig
mips                      maltaaprp_defconfig
mips                        bcm63xx_defconfig
arm                       versatile_defconfig
powerpc                     powernv_defconfig
arm                       imx_v4_v5_defconfig
mips                     cu1830-neo_defconfig
mips                          ath79_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220206
riscv                randconfig-r042-20220206
hexagon              randconfig-r041-20220206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
