Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C6EECAAD5
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Aug 2022 03:26:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiH3D0C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Aug 2022 23:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiH3D0A (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2022 23:26:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D455B7C53B
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Aug 2022 20:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661829958; x=1693365958;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EDWcInWtfoQvhTRNs7fdwMQyKAwM9Jfq1T0y34nzCJY=;
  b=NPzbE3QRRdRWTb+dtZ4/NxQ2UH5x9+TABSnEu5Wzti7t2edbnfwJw0jO
   er/TaNikFsp/Jbc/cjqbUByl3q7cPYNKnNcvGjAzkUeDUwEhGBmJhgPb3
   7nlMUJ9STRFVd1kUSUObm3svuQ99lqSX9/Ls4/fd007w9P9NXAzV4GQOD
   7x4bmQ2EhRyZ7YaKJFsFm55xn3HIKoyzWzwfpAFNiVN93RAF/e6bTov9w
   SzhPbH4RWLCQaMVvQCh8mnYhQDrhu+23E/DCOgMnbfR+Ef+s7hrgLN4YP
   SElm5KoiV9Wk0BKOegM6IQqiMnITi1IC9ORb4mqrr54LDWPmKa3GNO+hb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="359030496"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="359030496"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 20:25:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="641191399"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 29 Aug 2022 20:25:57 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oSrsy-0000Ty-2A;
        Tue, 30 Aug 2022 03:25:56 +0000
Date:   Tue, 30 Aug 2022 11:25:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2b3fb63eeb9491ff4b83be4ef193e52276703cb6
Message-ID: <630d832a.rDMgcQQBwczSLgYh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2b3fb63eeb9491ff4b83be4ef193e52276703cb6  pwm: core: Make of_pwm_get() static

elapsed time: 722m

configs tested: 151
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
powerpc                         wii_defconfig
m68k                       m5475evb_defconfig
powerpc                        cell_defconfig
arm                          simpad_defconfig
x86_64               randconfig-a003-20220829
xtensa                    xip_kc705_defconfig
x86_64               randconfig-a004-20220829
arm                       aspeed_g5_defconfig
x86_64               randconfig-a005-20220829
i386                 randconfig-a001-20220829
arm                         lpc18xx_defconfig
i386                 randconfig-a003-20220829
arc                              allyesconfig
sh                        apsh4ad0a_defconfig
i386                 randconfig-a002-20220829
x86_64               randconfig-a002-20220829
i386                                defconfig
i386                 randconfig-a004-20220829
i386                 randconfig-a005-20220829
x86_64               randconfig-a006-20220829
arc                  randconfig-r043-20220829
i386                 randconfig-a006-20220829
ia64                             allmodconfig
x86_64               randconfig-a001-20220829
alpha                            allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
powerpc                          allmodconfig
m68k                             allmodconfig
mips                             allyesconfig
x86_64                    rhel-8.3-kselftests
sparc                            allyesconfig
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arm                                 defconfig
i386                             allyesconfig
i386                 randconfig-c001-20220829
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
xtensa                           alldefconfig
sh                            migor_defconfig
sh                      rts7751r2d1_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                         s3c6400_defconfig
powerpc                      tqm8xx_defconfig
arm                         vf610m4_defconfig
powerpc                     tqm8548_defconfig
arm                  randconfig-c002-20220829
x86_64               randconfig-c001-20220829
m68k                        m5407c3_defconfig
sh                          r7780mp_defconfig
m68k                          multi_defconfig
sh                                  defconfig
sh                        sh7763rdp_defconfig
m68k                          atari_defconfig
mips                  decstation_64_defconfig
m68k                        m5307c3_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sh                             sh03_defconfig
powerpc                      makalu_defconfig
arm                           h5000_defconfig
arm                        keystone_defconfig
arm64                            alldefconfig
arc                          axs103_defconfig
sh                          lboxre2_defconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
x86_64                                  kexec
i386                          randconfig-c001
powerpc              randconfig-c003-20220830
mips                 randconfig-c004-20220830
arm                       imx_v6_v7_defconfig
powerpc                       maple_defconfig
mips                    maltaup_xpa_defconfig
arm                         at91_dt_defconfig
defconfig                              x86_64
randconfig-c001                              arm
randconfig-c002-20220830                          powerpc
allyesconfig                            riscv
defconfig                               riscv
allmodconfig                            riscv
allyesconfig                              arm
pxa910_defconfig                          powerpc
pasemi_defconfig                             mips
maltasmvp_eva_defconfig                             s390
zfcpdump_defconfig                              arm
mps2_defconfig                                 

clang tested configs:
x86_64               randconfig-a011-20220829
i386                 randconfig-a011-20220829
i386                 randconfig-a014-20220829
i386                 randconfig-a013-20220829
i386                 randconfig-a015-20220829
x86_64               randconfig-a014-20220829
x86_64               randconfig-a016-20220829
i386                 randconfig-a016-20220829
i386                 randconfig-a012-20220829
x86_64               randconfig-a015-20220829
x86_64               randconfig-a012-20220829
hexagon              randconfig-r041-20220829
x86_64               randconfig-a013-20220829
riscv                randconfig-r042-20220829
s390                 randconfig-r044-20220829
hexagon              randconfig-r045-20220829
arm                        mvebu_v5_defconfig
powerpc                     kilauea_defconfig
x86_64               randconfig-k001-20220829
i386                             allyesconfig
powerpc                     powernv_defconfig
mips                     cu1000-neo_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
