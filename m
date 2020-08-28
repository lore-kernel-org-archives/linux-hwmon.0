Return-Path: <SRS0=3rXj=CG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81C3C433E6
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Aug 2020 07:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF9E720CC7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Aug 2020 07:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgH1H72 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Aug 2020 03:59:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:57849 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgH1H72 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Aug 2020 03:59:28 -0400
IronPort-SDR: XOBy11Fs8vOxF7eUMab3B3fgU1aT434E8p8RtxoZTe3sEsBH7f8E+dMp6agqrEILJLeDiKExgR
 Tg98IwbdDFTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="154042262"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="154042262"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 00:59:27 -0700
IronPort-SDR: iUQkdioCnnok3vH/irg4VPn35dEklP7YatyGcQsU+RdhoC2QUoBDq+7kxSaDtgSO0AjoJKgj6s
 BqxkXI0y3wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,362,1592895600"; 
   d="scan'208";a="300145544"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2020 00:59:25 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBZID-0002Zj-57; Fri, 28 Aug 2020 07:59:25 +0000
Date:   Fri, 28 Aug 2020 15:59:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 c1ae18d313e24bc7833e1749dd36dba5d47f259c
Message-ID: <5f48b94e.mXWpv/Ezx1ww+nj4%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: c1ae18d313e24bc7833e1749dd36dba5d47f259c  hwmon: (gsc-hwmon) Scale temperature to millidegrees

elapsed time: 723m

configs tested: 146
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
mips                           ip32_defconfig
sh                           se7721_defconfig
sparc                               defconfig
sh                           se7206_defconfig
s390                             alldefconfig
mips                         bigsur_defconfig
sh                   sh7770_generic_defconfig
arm                          iop32x_defconfig
c6x                              alldefconfig
arm                          pxa168_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
m68k                        m5272c3_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                      ep88xc_defconfig
powerpc                      pmac32_defconfig
arm                            zeus_defconfig
arm                       aspeed_g4_defconfig
mips                           xway_defconfig
mips                     loongson1c_defconfig
mips                            gpr_defconfig
sparc64                          alldefconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7763rdp_defconfig
arm                         orion5x_defconfig
arm                            qcom_defconfig
mips                  maltasmvp_eva_defconfig
nios2                            allyesconfig
powerpc                           allnoconfig
arc                            hsdk_defconfig
powerpc                     pseries_defconfig
arc                           tb10x_defconfig
sh                        sh7757lcr_defconfig
mips                      maltaaprp_defconfig
arm                    vt8500_v6_v7_defconfig
arc                              allyesconfig
sh                             sh03_defconfig
arm                         mv78xx0_defconfig
m68k                       m5275evb_defconfig
mips                       rbtx49xx_defconfig
arm                        neponset_defconfig
sh                     magicpanelr2_defconfig
nios2                               defconfig
arc                                 defconfig
mips                             allyesconfig
mips                    maltaup_xpa_defconfig
sh                             shx3_defconfig
arm                            u300_defconfig
arm                       mainstone_defconfig
m68k                             allmodconfig
c6x                         dsk6455_defconfig
powerpc                     powernv_defconfig
mips                          rb532_defconfig
ia64                         bigsur_defconfig
arm                        multi_v5_defconfig
sh                         ecovec24_defconfig
sh                          sdk7780_defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
sh                         apsh4a3a_defconfig
mips                           rs90_defconfig
sparc64                             defconfig
mips                      pistachio_defconfig
c6x                        evmc6678_defconfig
arc                    vdk_hs38_smp_defconfig
sh                        apsh4ad0a_defconfig
powerpc                      pasemi_defconfig
sh                           se7712_defconfig
arm                           omap1_defconfig
arm                         at91_dt_defconfig
sh                          kfr2r09_defconfig
arm                          pcm027_defconfig
powerpc                      ppc6xx_defconfig
arm                         bcm2835_defconfig
mips                     loongson1b_defconfig
mips                            ar7_defconfig
alpha                               defconfig
arm                          exynos_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                             defconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200827
i386                 randconfig-a004-20200827
i386                 randconfig-a003-20200827
i386                 randconfig-a005-20200827
i386                 randconfig-a006-20200827
i386                 randconfig-a001-20200827
i386                 randconfig-a013-20200827
i386                 randconfig-a012-20200827
i386                 randconfig-a011-20200827
i386                 randconfig-a016-20200827
i386                 randconfig-a015-20200827
i386                 randconfig-a014-20200827
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
