Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D5BC28D13
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Aug 2022 02:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238811AbiHTCfY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Aug 2022 22:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiHTCfX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2022 22:35:23 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800479590
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Aug 2022 19:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660962922; x=1692498922;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BDc0gyosEvuYKg0ydylK780gYwQbgNMoLRc2aWTD3Uo=;
  b=GBCGgVEiGxt9Jl6z+xdDRZRVBitEmvvE1oQ4rYPWwpB019CsbNjniEck
   9jDg3mgoUW+ex8z6GuQIMH9LbqoZbT0IFS8aWDylv9X4FRxIALidtKy93
   /aM2Ayn7AK7I4mmGWIE+nNT5gp1lHn9WQFBBN4oyc7dTjXkrW6ME0PApW
   aKVP6A9wq8jSD44wJw6Igm8hU3Zx+33ojWWokYQ8PtsaEEyZgb9th3R8J
   qb0mgfNb0G+5e8lIgqv/IQn6LZWY8OYKgWSFDOWedBtoh2TDiq6Y/RK+e
   EDOHIohAEQAJnk4tEdoANMKbiBPvNUYFT5ortBzkaubo3rj56pJfE2O1T
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="319171736"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="319171736"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 19:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="853946131"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Aug 2022 19:35:21 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPEKW-00022R-1w;
        Sat, 20 Aug 2022 02:35:20 +0000
Date:   Sat, 20 Aug 2022 10:35:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 ed3590561f5d3343a1717396307d0942eda472ed
Message-ID: <6300485b.YAtxNEVowFwwG9uZ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: ed3590561f5d3343a1717396307d0942eda472ed  hwmon: (pmbus) Fix vout margin caching

elapsed time: 726m

configs tested: 124
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220819
x86_64                              defconfig
x86_64                               rhel-8.3
arc                              allyesconfig
alpha                            allyesconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allmodconfig
m68k                             allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a014
i386                          randconfig-a005
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a012
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
randconfig                      r005-20220819
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a015
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
riscv             nommu_k210_sdcard_defconfig
i386                          randconfig-c001
loongarch                           defconfig
loongarch                         allnoconfig
riscv                randconfig-r042-20220820
s390                 randconfig-r044-20220820
arc                  randconfig-r043-20220820
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
powerpc                    amigaone_defconfig
arm                         lpc18xx_defconfig
arm                          iop32x_defconfig
arm                        mini2440_defconfig
microblaze                          defconfig
powerpc                 linkstation_defconfig
arm                             ezx_defconfig
ia64                                defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                           u8500_defconfig
ia64                        generic_defconfig
powerpc                  storcenter_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                                defconfig
powerpc                     asp8347_defconfig
mips                             allmodconfig
powerpc                         wii_defconfig
arm                         at91_dt_defconfig
powerpc                     ep8248e_defconfig
mips                         db1xxx_defconfig
s390                          debug_defconfig
powerpc                     rainier_defconfig
csky                                defconfig
loongarch                 loongson3_defconfig
openrisc                 simple_smp_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
sh                      rts7751r2d1_defconfig
mips                      fuloong2e_defconfig
powerpc                    klondike_defconfig
m68k                             alldefconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
sh                            hp6xx_defconfig
sh                     sh7710voipgw_defconfig
xtensa                generic_kc705_defconfig
um                                  defconfig
arm                          simpad_defconfig
powerpc                  iss476-smp_defconfig
s390                       zfcpdump_defconfig
mips                           jazz_defconfig
m68k                            mac_defconfig

clang tested configs:
hexagon              randconfig-r045-20220819
hexagon              randconfig-r041-20220819
riscv                randconfig-r042-20220819
s390                 randconfig-r044-20220819
x86_64                        randconfig-a012
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                      ppc64e_defconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-k001
mips                        omega2p_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
arm                         orion5x_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
