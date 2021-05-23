Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E837AC2B9F2
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 May 2021 00:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC2C161151
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 May 2021 00:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhEWAJt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 May 2021 20:09:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:56176 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231447AbhEWAJs (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 May 2021 20:09:48 -0400
IronPort-SDR: gynsflDa6WGxIli3D7yr5uOXL16cffMwUMgyvOInZLg4FV4xRN4J/i80XBRj3pY+CmE5ecJ6Jl
 SjgvF16KKx2A==
X-IronPort-AV: E=McAfee;i="6200,9189,9992"; a="262928203"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="262928203"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2021 17:08:23 -0700
IronPort-SDR: cXkflr5bZLm7k0nJtQmeP+hbnFjWWNLTj9iDoZ0NGd/ELEX7EPjmyD/PjHq3Fj31s+9L8nYQwv
 xcJmxlkY7kPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="632226389"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 May 2021 17:08:21 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lkbfJ-0000YG-7I; Sun, 23 May 2021 00:08:21 +0000
Date:   Sun, 23 May 2021 08:08:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 34569e775e39e7ead3ce812e0e20372e0b2f95aa
Message-ID: <60a99ce2.S280yrQwspEMe7t5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 34569e775e39e7ead3ce812e0e20372e0b2f95aa  docs: hwmon: Add an entry for mp2888

elapsed time: 755m

configs tested: 208
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
openrisc                         alldefconfig
powerpc                 xes_mpc85xx_defconfig
i386                                defconfig
mips                          ath79_defconfig
sh                        sh7785lcr_defconfig
mips                     cu1830-neo_defconfig
mips                       bmips_be_defconfig
powerpc                     tqm8560_defconfig
sh                               j2_defconfig
arm                            pleb_defconfig
arm                         lubbock_defconfig
arm                        mvebu_v7_defconfig
sh                           se7619_defconfig
arm                             pxa_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                          amiga_defconfig
powerpc                     ppa8548_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
powerpc                    adder875_defconfig
m68k                        m5307c3_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        nlm_xlr_defconfig
sh                          rsk7264_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                     mpc512x_defconfig
arm                          pxa3xx_defconfig
powerpc                          g5_defconfig
sh                ecovec24-romimage_defconfig
xtensa                       common_defconfig
powerpc                       ebony_defconfig
sh                        edosk7760_defconfig
powerpc                      cm5200_defconfig
s390                             allmodconfig
powerpc                        cell_defconfig
xtensa                generic_kc705_defconfig
ia64                          tiger_defconfig
arm                             ezx_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         tb0226_defconfig
sh                             shx3_defconfig
powerpc                      makalu_defconfig
mips                           ip27_defconfig
sh                          kfr2r09_defconfig
mips                malta_qemu_32r6_defconfig
arm64                            alldefconfig
powerpc                     mpc5200_defconfig
powerpc                    amigaone_defconfig
m68k                       m5208evb_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           u8500_defconfig
m68k                        m5272c3_defconfig
mips                        qi_lb60_defconfig
arm                          pxa910_defconfig
sh                        sh7757lcr_defconfig
powerpc                     tqm8541_defconfig
mips                      bmips_stb_defconfig
riscv                               defconfig
mips                        bcm63xx_defconfig
sh                          rsk7203_defconfig
sh                         apsh4a3a_defconfig
arm                             rpc_defconfig
arm                           sunxi_defconfig
arc                           tb10x_defconfig
arm                        magician_defconfig
mips                       lemote2f_defconfig
arm                     davinci_all_defconfig
m68k                        m5407c3_defconfig
arm                         assabet_defconfig
arm                         nhk8815_defconfig
m68k                          sun3x_defconfig
m68k                           sun3_defconfig
arm                        neponset_defconfig
powerpc                      pasemi_defconfig
powerpc                      obs600_defconfig
um                             i386_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                 decstation_r4k_defconfig
powerpc                     akebono_defconfig
arm                         palmz72_defconfig
m68k                        mvme147_defconfig
arm                           tegra_defconfig
mips                  decstation_64_defconfig
arc                     haps_hs_smp_defconfig
arm                         vf610m4_defconfig
h8300                               defconfig
sh                      rts7751r2d1_defconfig
mips                         tb0219_defconfig
arm                          gemini_defconfig
mips                            gpr_defconfig
arc                          axs103_defconfig
sh                           se7750_defconfig
arm                           corgi_defconfig
mips                          malta_defconfig
mips                         mpc30x_defconfig
m68k                            mac_defconfig
m68k                            q40_defconfig
sh                        sh7763rdp_defconfig
powerpc                      katmai_defconfig
powerpc                     stx_gp3_defconfig
sh                     magicpanelr2_defconfig
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
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
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
x86_64               randconfig-a001-20210522
x86_64               randconfig-a006-20210522
x86_64               randconfig-a005-20210522
x86_64               randconfig-a003-20210522
x86_64               randconfig-a004-20210522
x86_64               randconfig-a002-20210522
i386                 randconfig-a001-20210523
i386                 randconfig-a005-20210523
i386                 randconfig-a002-20210523
i386                 randconfig-a003-20210523
i386                 randconfig-a004-20210523
i386                 randconfig-a006-20210523
i386                 randconfig-a001-20210522
i386                 randconfig-a005-20210522
i386                 randconfig-a002-20210522
i386                 randconfig-a004-20210522
i386                 randconfig-a003-20210522
i386                 randconfig-a006-20210522
x86_64               randconfig-a013-20210523
x86_64               randconfig-a014-20210523
x86_64               randconfig-a012-20210523
x86_64               randconfig-a016-20210523
x86_64               randconfig-a015-20210523
x86_64               randconfig-a011-20210523
i386                 randconfig-a016-20210523
i386                 randconfig-a011-20210523
i386                 randconfig-a015-20210523
i386                 randconfig-a012-20210523
i386                 randconfig-a014-20210523
i386                 randconfig-a013-20210523
i386                 randconfig-a016-20210522
i386                 randconfig-a011-20210522
i386                 randconfig-a015-20210522
i386                 randconfig-a012-20210522
i386                 randconfig-a014-20210522
i386                 randconfig-a013-20210522
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210522
x86_64               randconfig-b001-20210523
x86_64               randconfig-a006-20210523
x86_64               randconfig-a001-20210523
x86_64               randconfig-a005-20210523
x86_64               randconfig-a003-20210523
x86_64               randconfig-a004-20210523
x86_64               randconfig-a002-20210523
x86_64               randconfig-a013-20210522
x86_64               randconfig-a014-20210522
x86_64               randconfig-a012-20210522
x86_64               randconfig-a016-20210522
x86_64               randconfig-a015-20210522
x86_64               randconfig-a011-20210522

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
