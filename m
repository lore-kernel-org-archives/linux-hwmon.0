Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1500C433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 May 2021 18:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B259E611EE
	for <linux-hwmon@archiver.kernel.org>; Tue, 18 May 2021 18:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbhERSMd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 May 2021 14:12:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:63847 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233467AbhERSMd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 May 2021 14:12:33 -0400
IronPort-SDR: y8oDybK/OovRR1mYilm7/t2cMQRbrnjZHz+8ajjaPVr72JChMy1QDcwMQd/tuSFtgJCE189Rpg
 qXZzcd3GsNNw==
X-IronPort-AV: E=McAfee;i="6200,9189,9988"; a="200477479"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="200477479"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 11:11:12 -0700
IronPort-SDR: +weI7OxV3baWPHxhxvuftJLbLPnNneiQt/7XjgSn5UAY/I2qLlGEVjifnQ0PH3YfqHIX+4OUzy
 qbnLLr8nfS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="542073441"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 May 2021 11:11:11 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lj4BT-0002IP-8D; Tue, 18 May 2021 18:11:11 +0000
Date:   Wed, 19 May 2021 02:10:25 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 cdb1cc5611cc27ab03b4b4d275265ad5c7d513ba
Message-ID: <60a40311.eNylVYkU82PyJ6VU%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: cdb1cc5611cc27ab03b4b4d275265ad5c7d513ba  watchdog: diag288_wdt: Remove redundant assignment

elapsed time: 722m

configs tested: 166
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
parisc                              defconfig
openrisc                            defconfig
m68k                          multi_defconfig
powerpc64                           defconfig
m68k                          atari_defconfig
powerpc                     ep8248e_defconfig
alpha                               defconfig
arm                          lpd270_defconfig
xtensa                         virt_defconfig
powerpc                     powernv_defconfig
arm                           omap1_defconfig
sh                           se7619_defconfig
powerpc                      ppc44x_defconfig
sh                     magicpanelr2_defconfig
m68k                             allmodconfig
arm                          ixp4xx_defconfig
m68k                        stmark2_defconfig
sh                          landisk_defconfig
arc                      axs103_smp_defconfig
mips                           xway_defconfig
csky                             alldefconfig
powerpc                     tqm8555_defconfig
m68k                          hp300_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
arm                       imx_v6_v7_defconfig
arm64                            alldefconfig
mips                           ip28_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      cm5200_defconfig
mips                           rs90_defconfig
arm                           viper_defconfig
arc                        nsimosci_defconfig
powerpc                     akebono_defconfig
nios2                         3c120_defconfig
m68k                          sun3x_defconfig
powerpc                       ppc64_defconfig
microblaze                          defconfig
mips                       capcella_defconfig
mips                         mpc30x_defconfig
mips                        nlm_xlr_defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
arm                             ezx_defconfig
mips                            gpr_defconfig
mips                        vocore2_defconfig
xtensa                generic_kc705_defconfig
nds32                               defconfig
arc                                 defconfig
arm                         assabet_defconfig
powerpc                  iss476-smp_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      acadia_defconfig
arm                         s3c2410_defconfig
arc                     nsimosci_hs_defconfig
arc                          axs103_defconfig
um                               allmodconfig
powerpc                     redwood_defconfig
mips                  maltasmvp_eva_defconfig
arm                        multi_v5_defconfig
mips                           ci20_defconfig
arm                         axm55xx_defconfig
arc                         haps_hs_defconfig
arm                           u8500_defconfig
powerpc                         wii_defconfig
arm                          simpad_defconfig
powerpc                     tqm8541_defconfig
xtensa                    smp_lx200_defconfig
mips                        qi_lb60_defconfig
x86_64                            allnoconfig
m68k                           sun3_defconfig
powerpc                        cell_defconfig
sh                     sh7710voipgw_defconfig
sh                        sh7785lcr_defconfig
arm                         nhk8815_defconfig
mips                     loongson2k_defconfig
sparc                               defconfig
arm                          ep93xx_defconfig
arm                           h5000_defconfig
riscv                             allnoconfig
xtensa                  nommu_kc705_defconfig
mips                        workpad_defconfig
sh                          rsk7269_defconfig
sh                         apsh4a3a_defconfig
powerpc                      bamboo_defconfig
powerpc                     mpc83xx_defconfig
powerpc                 mpc834x_itx_defconfig
s390                             allyesconfig
i386                             alldefconfig
sh                          r7785rp_defconfig
arm                      integrator_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210518
i386                 randconfig-a001-20210518
i386                 randconfig-a005-20210518
i386                 randconfig-a004-20210518
i386                 randconfig-a002-20210518
i386                 randconfig-a006-20210518
x86_64               randconfig-a003-20210518
x86_64               randconfig-a004-20210518
x86_64               randconfig-a005-20210518
x86_64               randconfig-a001-20210518
x86_64               randconfig-a002-20210518
x86_64               randconfig-a006-20210518
i386                 randconfig-a014-20210518
i386                 randconfig-a016-20210518
i386                 randconfig-a011-20210518
i386                 randconfig-a015-20210518
i386                 randconfig-a012-20210518
i386                 randconfig-a013-20210518
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
um                               allyesconfig
um                                allnoconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210518
x86_64               randconfig-a015-20210518
x86_64               randconfig-a012-20210518
x86_64               randconfig-a013-20210518
x86_64               randconfig-a011-20210518
x86_64               randconfig-a016-20210518
x86_64               randconfig-a014-20210518

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
