Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2066C28D13
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Aug 2022 02:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiHTCeY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Aug 2022 22:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiHTCeY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Aug 2022 22:34:24 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4717884ECC
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Aug 2022 19:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660962863; x=1692498863;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uYrN3a2J5JESK3nMc75KjwoXQUaDh9FnLtpoHNIsA/M=;
  b=LSbWuCgFKSx4GTx+4MR2rCfg5UtHez3Tn6zCoH0j24dEIDt/XIZHH0pv
   Ye1CrDEy+Bp0dSAwUZlb5M5PyeilWy9RCaDeCy5e0DBz5tM/BbcdVghIY
   uV6wHrXYNAFRI/XsKiqbwmbgllIdLWaDOsCyh3+kdybqaAtiYa9CpAkZp
   vOoemzcoqirTsNtXXbNFg6mjmZuLrEY3UBW9LZBWzv4OSj7v2O6ahYfWX
   8jk7gRd1W42Is8+wKaqEoaMPWb1/qEYjIcoTBa3UspQcuOV0beoVxlfJ+
   XMbiXiSB6BtUjdNFKvfSUmwzyb2kuK+q818viLEtWCMRSgJxMzcSMo0HT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="280106558"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="280106558"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 19:34:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="734587112"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Aug 2022 19:34:21 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPEJY-00022L-1r;
        Sat, 20 Aug 2022 02:34:20 +0000
Date:   Sat, 20 Aug 2022 10:33:33 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 1ad7a62d52e8af61b0b8b32e8fd38b68c0501ae5
Message-ID: <630047fd.d9yjlzO9guNVd09z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 1ad7a62d52e8af61b0b8b32e8fd38b68c0501ae5  MAINTAINERS: Update Juerg Haefliger's email address

elapsed time: 724m

configs tested: 120
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
i386                          randconfig-a012
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220819
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
alpha                            allyesconfig
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
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
um                                  defconfig
arm                          simpad_defconfig
powerpc                  iss476-smp_defconfig
s390                       zfcpdump_defconfig
mips                           jazz_defconfig
m68k                            mac_defconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220819
hexagon              randconfig-r045-20220819
s390                 randconfig-r044-20220819
riscv                randconfig-r042-20220819
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
powerpc                      ppc64e_defconfig
mips                malta_qemu_32r6_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
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
