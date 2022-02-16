Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C65C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Feb 2022 03:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiBPDKf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Feb 2022 22:10:35 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234897AbiBPDKe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Feb 2022 22:10:34 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8755A9A998
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Feb 2022 19:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644981023; x=1676517023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PSRosTnhWn86QVBCrzwR7hsrvw+bxFaCdNCQZ/VudDE=;
  b=IRhiwtduYKF+c835od1Q1yb5riaeORQg1TggTmj57inKjS7oKnPuxFkU
   uuZZqVC/s0VSe10iXgGPI5RKkB/zV2wCMo4VNCxYldNvW2X9TPmohbJh0
   1cnQX+Vg6AjU8wgKLMH45F+ljbw6xQkWph+Ur8VrTv7hhCgHKIfPUdMAn
   uybMbKX3sacJCOrOpA7W8MzuWTPVuQtAoaJk2H1rxX8DRDTe3w/w+u5xv
   Jm75k9PiIytCdq8YfI4u1rT0vn/+zFflSzHxqO6Yqx12Cuyik8gSdwZvp
   G5GItKe5NnP4rCSYip3ioMs0+ZM+4zHwV01E5OUcuRV15+0C74iFeXDvu
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="249343902"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="249343902"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 19:10:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="681318045"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2022 19:10:22 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKAhx-000ALA-JU; Wed, 16 Feb 2022 03:10:21 +0000
Date:   Wed, 16 Feb 2022 11:10:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 4cd16de2667ab2aba623e9d559185ddc31191f78
Message-ID: <620c6b10.dz6pFbCRS0X5BE9I%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 4cd16de2667ab2aba623e9d559185ddc31191f78  watchdog: ixp4xx: Implement restart

elapsed time: 723m

configs tested: 154
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220214
mips                 randconfig-c004-20220214
mips                      fuloong2e_defconfig
sh                        sh7763rdp_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
arm                          simpad_defconfig
csky                                defconfig
nios2                               defconfig
arm                        spear6xx_defconfig
mips                         mpc30x_defconfig
powerpc                     mpc83xx_defconfig
sh                   sh7724_generic_defconfig
mips                  maltasmvp_eva_defconfig
arm                         s3c6400_defconfig
h8300                    h8300h-sim_defconfig
mips                        vocore2_defconfig
powerpc                 mpc8540_ads_defconfig
arm                       imx_v6_v7_defconfig
sh                            shmin_defconfig
arm                          gemini_defconfig
m68k                             allmodconfig
powerpc                         wii_defconfig
mips                       bmips_be_defconfig
powerpc                      arches_defconfig
arm                          pxa910_defconfig
arm                            pleb_defconfig
mips                           xway_defconfig
mips                          rb532_defconfig
sh                           se7721_defconfig
xtensa                    xip_kc705_defconfig
mips                         db1xxx_defconfig
sh                            titan_defconfig
sh                          kfr2r09_defconfig
arm                            xcep_defconfig
m68k                        stmark2_defconfig
s390                                defconfig
sh                        edosk7705_defconfig
nds32                               defconfig
arm                        shmobile_defconfig
openrisc                 simple_smp_defconfig
m68k                          atari_defconfig
arm64                            alldefconfig
sh                        sh7757lcr_defconfig
openrisc                  or1klitex_defconfig
powerpc                        warp_defconfig
arm                        keystone_defconfig
powerpc                        cell_defconfig
sparc                            allyesconfig
sh                             espt_defconfig
mips                       capcella_defconfig
arm                        cerfcube_defconfig
mips                      loongson3_defconfig
sh                          rsk7269_defconfig
powerpc                      ppc6xx_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20220214
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allmodconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20220214
x86_64               randconfig-a014-20220214
x86_64               randconfig-a012-20220214
x86_64               randconfig-a015-20220214
x86_64               randconfig-a011-20220214
x86_64               randconfig-a016-20220214
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                 randconfig-a013-20220214
i386                 randconfig-a016-20220214
i386                 randconfig-a012-20220214
i386                 randconfig-a015-20220214
i386                 randconfig-a011-20220214
i386                 randconfig-a014-20220214
riscv                randconfig-r042-20220214
arc                  randconfig-r043-20220214
s390                 randconfig-r044-20220214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
riscv                randconfig-c006-20220214
i386                 randconfig-c001-20220214
x86_64               randconfig-c007-20220214
powerpc              randconfig-c003-20220214
arm                  randconfig-c002-20220214
mips                 randconfig-c004-20220214
arm                        neponset_defconfig
powerpc                      ppc44x_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                             allnoconfig
powerpc               mpc834x_itxgp_defconfig
mips                          rm200_defconfig
arm                         palmz72_defconfig
arm                         mv78xx0_defconfig
powerpc                     kmeter1_defconfig
powerpc                     tqm8560_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
arm                         lpc32xx_defconfig
x86_64               randconfig-a002-20220214
x86_64               randconfig-a006-20220214
x86_64               randconfig-a005-20220214
x86_64               randconfig-a004-20220214
x86_64               randconfig-a003-20220214
x86_64               randconfig-a001-20220214
i386                 randconfig-a004-20220214
i386                 randconfig-a005-20220214
i386                 randconfig-a006-20220214
i386                 randconfig-a002-20220214
i386                 randconfig-a003-20220214
i386                 randconfig-a001-20220214
hexagon              randconfig-r045-20220214
hexagon              randconfig-r041-20220214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
