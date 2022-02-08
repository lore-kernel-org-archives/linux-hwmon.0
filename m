Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1008C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Feb 2022 11:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239854AbiBHL1z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Feb 2022 06:27:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356423AbiBHKpX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Feb 2022 05:45:23 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92BCC03FEC0
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Feb 2022 02:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644317122; x=1675853122;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XR+x70Pq8GRYjv2Z99SMY9H9L5DiBPOCUay+Yf+Da2c=;
  b=QsX97gAVxSJn/syTJ1Yy7fG3lqVCsn66Z32Z1JcEDKx5GhZ5OAXhOLbI
   I20zvDWfa0KEr88X2YL/d1rz5iL0llltgG44w+io0AhoXWDRkEc1mp2s1
   dEypG8fWgJwix/doo1i32nZTpKqu3BJsF/gsYUNinrrapn+TrFa6B0aYe
   WXo66RmErdSDiwtA1EaW46sv2sK01CU4kzXRHJ65gjfgns6XxHnVGM3OE
   +QKAeTEEPUV69MYSylIOQ24G868lW6oTA4H2qQ0ro6ylt3KWMl97sGiXD
   ldDpMEJx/tVee7kpYS5QxQVfs3Gl2RZZ9rTL92znRbNGUgt6mjVqG1Mo3
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="273451114"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="273451114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 02:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; 
   d="scan'208";a="540545426"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Feb 2022 02:45:20 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nHNzr-00003N-Pi; Tue, 08 Feb 2022 10:45:19 +0000
Date:   Tue, 08 Feb 2022 18:44:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 d7334d0558117653c72394782c0d6b7f71d02482
Message-ID: <6202498b.3YEanm/4+mJxNOCC%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: d7334d0558117653c72394782c0d6b7f71d02482  hwmon: (adt7x10) Use hwmon_notify_event

elapsed time: 722m

configs tested: 150
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220207
arm                             pxa_defconfig
arm                          iop32x_defconfig
arm                          exynos_defconfig
sparc                       sparc32_defconfig
powerpc                     pq2fads_defconfig
arc                     haps_hs_smp_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      loongson3_defconfig
sh                           se7619_defconfig
nios2                            alldefconfig
arm                           stm32_defconfig
sh                     magicpanelr2_defconfig
powerpc                      ep88xc_defconfig
sh                           se7751_defconfig
powerpc                     ep8248e_defconfig
m68k                       m5249evb_defconfig
arc                        nsimosci_defconfig
nds32                            alldefconfig
sparc64                             defconfig
arm                        cerfcube_defconfig
sh                            migor_defconfig
powerpc                    adder875_defconfig
m68k                         amcore_defconfig
mips                          rb532_defconfig
powerpc                 linkstation_defconfig
csky                             alldefconfig
arm                         assabet_defconfig
h8300                       h8s-sim_defconfig
sh                   sh7724_generic_defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
parisc                           allyesconfig
sh                          rsk7201_defconfig
m68k                       m5475evb_defconfig
m68k                        m5407c3_defconfig
sh                           se7343_defconfig
powerpc                        cell_defconfig
arm                            zeus_defconfig
mips                      fuloong2e_defconfig
powerpc                  storcenter_defconfig
powerpc                      ppc6xx_defconfig
arm                             ezx_defconfig
mips                      maltasmvp_defconfig
i386                                defconfig
arm                       omap2plus_defconfig
powerpc                     rainier_defconfig
powerpc                  iss476-smp_defconfig
riscv                            allyesconfig
powerpc                      pcm030_defconfig
arm                           corgi_defconfig
xtensa                    xip_kc705_defconfig
arc                         haps_hs_defconfig
powerpc                           allnoconfig
arm                  randconfig-c002-20220207
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
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64               randconfig-a013-20220207
x86_64               randconfig-a016-20220207
x86_64               randconfig-a015-20220207
x86_64               randconfig-a012-20220207
x86_64               randconfig-a014-20220207
x86_64               randconfig-a011-20220207
i386                 randconfig-a012-20220207
i386                 randconfig-a013-20220207
i386                 randconfig-a015-20220207
i386                 randconfig-a014-20220207
i386                 randconfig-a016-20220207
i386                 randconfig-a011-20220207
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220207
i386                 randconfig-c001-20220207
powerpc              randconfig-c003-20220207
x86_64               randconfig-c007-20220207
mips                 randconfig-c004-20220207
arm                  randconfig-c002-20220207
mips                          rm200_defconfig
mips                        maltaup_defconfig
powerpc                     mpc512x_defconfig
arm                        spear3xx_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_mds_defconfig
mips                           mtx1_defconfig
arm                            dove_defconfig
arm                       aspeed_g4_defconfig
arm                    vt8500_v6_v7_defconfig
riscv                          rv32_defconfig
x86_64               randconfig-a006-20220207
x86_64               randconfig-a004-20220207
x86_64               randconfig-a005-20220207
x86_64               randconfig-a003-20220207
x86_64               randconfig-a002-20220207
x86_64               randconfig-a001-20220207
i386                 randconfig-a005-20220207
i386                 randconfig-a004-20220207
i386                 randconfig-a003-20220207
i386                 randconfig-a006-20220207
i386                 randconfig-a001-20220207
i386                 randconfig-a002-20220207
hexagon              randconfig-r045-20220207
hexagon              randconfig-r041-20220207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
