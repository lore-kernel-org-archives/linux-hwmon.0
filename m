Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FBC2C4338F
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Aug 2021 23:49:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 505F1601FF
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Aug 2021 23:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhHOXu3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Aug 2021 19:50:29 -0400
Received: from mga05.intel.com ([192.55.52.43]:10167 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230124AbhHOXu2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Aug 2021 19:50:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="301357650"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="301357650"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 16:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="678864047"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2021 16:49:55 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mFPt5-000QDQ-4i; Sun, 15 Aug 2021 23:49:55 +0000
Date:   Mon, 16 Aug 2021 07:49:03 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 b51f752c586c2a5b93790896093713e5537f849f
Message-ID: <6119a7ef.5IjtUfKqfOfbLHQN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b51f752c586c2a5b93790896093713e5537f849f  hwmon: (dell-smm) Rework SMM function debugging

elapsed time: 720m

configs tested: 186
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210816
i386                 randconfig-c001-20210815
sh                          rsk7264_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                   currituck_defconfig
powerpc                     tqm8560_defconfig
sh                           se7780_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
sh                           se7712_defconfig
arm                        trizeps4_defconfig
mips                      fuloong2e_defconfig
powerpc                     asp8347_defconfig
arm                             rpc_defconfig
xtensa                       common_defconfig
arm                      jornada720_defconfig
sh                   secureedge5410_defconfig
powerpc                     tqm8540_defconfig
arm                        neponset_defconfig
powerpc                     stx_gp3_defconfig
m68k                          hp300_defconfig
arm                         at91_dt_defconfig
powerpc                      mgcoge_defconfig
m68k                          sun3x_defconfig
xtensa                          iss_defconfig
nios2                         10m50_defconfig
powerpc                    klondike_defconfig
mips                malta_qemu_32r6_defconfig
arm                        mini2440_defconfig
arc                              alldefconfig
h8300                     edosk2674_defconfig
arm                          moxart_defconfig
arm                          ixp4xx_defconfig
mips                        bcm63xx_defconfig
arm                  colibri_pxa300_defconfig
sh                 kfr2r09-romimage_defconfig
arm                           viper_defconfig
sh                          r7785rp_defconfig
m68k                       m5275evb_defconfig
mips                   sb1250_swarm_defconfig
powerpc                         ps3_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                         lubbock_defconfig
arm                        magician_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                            ar7_defconfig
i386                                defconfig
openrisc                    or1ksim_defconfig
powerpc                     pq2fads_defconfig
sh                             espt_defconfig
arm                   milbeaut_m10v_defconfig
mips                            gpr_defconfig
powerpc                     mpc5200_defconfig
i386                             alldefconfig
powerpc                 mpc832x_rdb_defconfig
arm                        spear6xx_defconfig
sparc                       sparc64_defconfig
sh                          polaris_defconfig
powerpc                    amigaone_defconfig
powerpc                     mpc83xx_defconfig
sh                          lboxre2_defconfig
xtensa                generic_kc705_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
m68k                        m5407c3_defconfig
mips                           ip22_defconfig
arm                         shannon_defconfig
mips                        workpad_defconfig
m68k                        mvme16x_defconfig
arm                          badge4_defconfig
arm                        clps711x_defconfig
riscv                    nommu_virt_defconfig
arm                          iop32x_defconfig
xtensa                  audio_kc705_defconfig
powerpc                        cell_defconfig
sh                        sh7785lcr_defconfig
powerpc                     redwood_defconfig
mips                         tb0226_defconfig
arm                         orion5x_defconfig
powerpc                      bamboo_defconfig
csky                             alldefconfig
alpha                               defconfig
arm                          collie_defconfig
arm                             pxa_defconfig
m68k                          atari_defconfig
arm                          pxa910_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc836x_rdk_defconfig
mips                         tb0219_defconfig
arm                      tct_hammer_defconfig
arm                      integrator_defconfig
sh                               j2_defconfig
ia64                      gensparse_defconfig
powerpc                     ksi8560_defconfig
x86_64                            allnoconfig
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
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20210815
i386                 randconfig-a001-20210815
i386                 randconfig-a002-20210815
i386                 randconfig-a003-20210815
i386                 randconfig-a006-20210815
i386                 randconfig-a005-20210815
i386                 randconfig-a004-20210816
i386                 randconfig-a003-20210816
i386                 randconfig-a002-20210816
i386                 randconfig-a001-20210816
i386                 randconfig-a006-20210816
i386                 randconfig-a005-20210816
x86_64               randconfig-a013-20210815
x86_64               randconfig-a011-20210815
x86_64               randconfig-a016-20210815
x86_64               randconfig-a012-20210815
x86_64               randconfig-a014-20210815
x86_64               randconfig-a015-20210815
i386                 randconfig-a011-20210815
i386                 randconfig-a015-20210815
i386                 randconfig-a014-20210815
i386                 randconfig-a013-20210815
i386                 randconfig-a016-20210815
i386                 randconfig-a012-20210815
i386                 randconfig-a011-20210816
i386                 randconfig-a015-20210816
i386                 randconfig-a013-20210816
i386                 randconfig-a014-20210816
i386                 randconfig-a016-20210816
i386                 randconfig-a012-20210816
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210815
x86_64               randconfig-a004-20210815
x86_64               randconfig-a006-20210815
x86_64               randconfig-a003-20210815
x86_64               randconfig-a001-20210815
x86_64               randconfig-a002-20210815
x86_64               randconfig-a005-20210815
x86_64               randconfig-a011-20210816
x86_64               randconfig-a013-20210816
x86_64               randconfig-a016-20210816
x86_64               randconfig-a012-20210816
x86_64               randconfig-a015-20210816
x86_64               randconfig-a014-20210816

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
