Return-Path: <SRS0=KPlX=DO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DA1C4363D
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Oct 2020 12:02:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C201820782
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Oct 2020 12:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgJGMCb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:02:31 -0400
Received: from mga04.intel.com ([192.55.52.120]:27336 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbgJGMCb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Oct 2020 08:02:31 -0400
IronPort-SDR: P6dkiEHxduXmV/ISukcMflQv4jF63V7mldpM3ZshzR59Wwn9Eb2wDk5Ovkn1rC4MjqltoDoFB0
 HGaPHEwKQxag==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="162292288"
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="162292288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 05:02:30 -0700
IronPort-SDR: o+u++rjMSU9SUGap968fIof64d6nOiSSPrAvjjeIpUUEBUsA8GrtWzmUJiezcGmZU0udQMfHKz
 Shy/Dft7qRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="353954129"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2020 05:02:28 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kQ89M-0001do-9j; Wed, 07 Oct 2020 12:02:28 +0000
Date:   Wed, 07 Oct 2020 20:02:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 d3a4aaad9860709d57c39ac655f3d23a499c621f
Message-ID: <5f7dae4b.6Of+iHFa5FHCQi+p%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: d3a4aaad9860709d57c39ac655f3d23a499c621f  watchdog: Add Toshiba Visconti watchdog driver

elapsed time: 720m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  cavium_octeon_defconfig
arm                         hackkit_defconfig
arm                         socfpga_defconfig
sh                          r7780mp_defconfig
sh                            migor_defconfig
riscv                            allmodconfig
sh                           se7724_defconfig
mips                      pic32mzda_defconfig
m68k                       m5275evb_defconfig
arm                       aspeed_g4_defconfig
powerpc                      ep88xc_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      arches_defconfig
arm                         palmz72_defconfig
powerpc                  mpc885_ads_defconfig
openrisc                         alldefconfig
arm                         at91_dt_defconfig
arm                         s5pv210_defconfig
powerpc                     mpc5200_defconfig
arm                            zeus_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      obs600_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                     sh7710voipgw_defconfig
sh                   sh7724_generic_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                           sunxi_defconfig
arm                       imx_v4_v5_defconfig
powerpc                    adder875_defconfig
m68k                       bvme6000_defconfig
powerpc                        warp_defconfig
microblaze                      mmu_defconfig
arm                          pxa168_defconfig
mips                 pnx8335_stb225_defconfig
arm                         s3c6400_defconfig
sh                           se7619_defconfig
mips                 decstation_r4k_defconfig
arm                          moxart_defconfig
sh                          urquell_defconfig
arm                            mmp2_defconfig
m68k                         amcore_defconfig
sparc64                          alldefconfig
powerpc                 mpc8560_ads_defconfig
arc                           tb10x_defconfig
powerpc                         wii_defconfig
h8300                            alldefconfig
mips                        workpad_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                           h3600_defconfig
arm                              zx_defconfig
powerpc                 canyonlands_defconfig
m68k                          hp300_defconfig
arm                         mv78xx0_defconfig
mips                            e55_defconfig
sh                        edosk7705_defconfig
nios2                            alldefconfig
m68k                       m5208evb_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
mips                        nlm_xlr_defconfig
powerpc                     redwood_defconfig
sh                          rsk7269_defconfig
arm                              alldefconfig
powerpc                 xes_mpc85xx_defconfig
sh                          sdk7786_defconfig
mips                         mpc30x_defconfig
powerpc                     mpc83xx_defconfig
arm                           corgi_defconfig
m68k                          amiga_defconfig
mips                     cu1000-neo_defconfig
alpha                            allyesconfig
arm                    vt8500_v6_v7_defconfig
nios2                               defconfig
s390                             allyesconfig
arm                         vf610m4_defconfig
arm                          simpad_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201006
x86_64               randconfig-a002-20201006
x86_64               randconfig-a001-20201006
x86_64               randconfig-a005-20201006
x86_64               randconfig-a003-20201006
x86_64               randconfig-a006-20201006
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a014-20201005
i386                 randconfig-a015-20201005
i386                 randconfig-a013-20201005
i386                 randconfig-a016-20201005
i386                 randconfig-a011-20201005
i386                 randconfig-a012-20201005
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201005
x86_64               randconfig-a002-20201005
x86_64               randconfig-a001-20201005
x86_64               randconfig-a003-20201005
x86_64               randconfig-a005-20201005
x86_64               randconfig-a006-20201005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
