Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C51C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Feb 2022 11:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239713AbiBQL2E (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Feb 2022 06:28:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbiBQL2C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Feb 2022 06:28:02 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBE3196A38
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Feb 2022 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645097268; x=1676633268;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7WWcd2qBp3KWpNDr/tRm/PbzhO49qEstMFB9ONhl1Nc=;
  b=GlTa4cnjkkMY0UmdFqsbqF2UF7sjSQMLf+EydjBxyHyARnIPxnAnJkAV
   TTbfwj5GMME2lq594iiDbaoSfx/hKUEkHTlGzNCnXd2BU+SVR5lwR1/DH
   RkODGCjnksSgaVLryTF1f0srGiutSkTFcrJqqdgiGFmvcNWse5OMU8lWP
   DuEdDXQ6AqG7kZxj6TzhZVg5TdN6qTjoXIBUJo+Mvur6FNf/LmClFHHpH
   9CryL2sgr6OgpC37TCMHRS4JePl4d/4QGgRDK1rhBquvKRfWATF7R9lKm
   vYTWqZcIaBhKX0SDQQxBUwSBxLBLJfnEIR1m6R46hpYC/8FLqB49s6Va2
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311597051"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="311597051"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 03:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="604888535"
Received: from lkp-server01.sh.intel.com (HELO 6f05bf9e3301) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2022 03:27:46 -0800
Received: from kbuild by 6f05bf9e3301 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nKews-00007g-66; Thu, 17 Feb 2022 11:27:46 +0000
Date:   Thu, 17 Feb 2022 19:27:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 572dfaf0bc2db25ab44ec9471a21bced91b2efae
Message-ID: <620e310e.WGfhni79h4vrUTtT%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 572dfaf0bc2db25ab44ec9471a21bced91b2efae  hwmon: (asus-ec-sensors) merge setup functions

elapsed time: 733m

configs tested: 152
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
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
sparc                       sparc32_defconfig
mips                            gpr_defconfig
m68k                          hp300_defconfig
powerpc                      cm5200_defconfig
powerpc                      makalu_defconfig
powerpc                    amigaone_defconfig
sh                               alldefconfig
sh                          r7780mp_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                  iss476-smp_defconfig
xtensa                  audio_kc705_defconfig
arm                           h5000_defconfig
xtensa                       common_defconfig
powerpc                     stx_gp3_defconfig
ia64                             alldefconfig
powerpc64                           defconfig
mips                            ar7_defconfig
arc                           tb10x_defconfig
powerpc                     asp8347_defconfig
arm                             rpc_defconfig
arc                              alldefconfig
sh                           se7619_defconfig
nds32                            alldefconfig
mips                       bmips_be_defconfig
xtensa                          iss_defconfig
mips                           ci20_defconfig
arm                        multi_v7_defconfig
nios2                            alldefconfig
nds32                             allnoconfig
sh                  sh7785lcr_32bit_defconfig
mips                           gcw0_defconfig
sh                          sdk7786_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                  maltasmvp_eva_defconfig
mips                         mpc30x_defconfig
arm                          exynos_defconfig
sh                        sh7785lcr_defconfig
arm                         nhk8815_defconfig
ia64                         bigsur_defconfig
powerpc64                        alldefconfig
m68k                            q40_defconfig
h8300                            alldefconfig
s390                       zfcpdump_defconfig
mips                           jazz_defconfig
sh                            migor_defconfig
powerpc                 canyonlands_defconfig
m68k                        stmark2_defconfig
sh                 kfr2r09-romimage_defconfig
sh                   sh7724_generic_defconfig
sh                           se7712_defconfig
arm                  randconfig-c002-20220217
arm                  randconfig-c002-20220216
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
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
riscv                randconfig-c006-20220217
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220217
arm                  randconfig-c002-20220217
i386                          randconfig-c001
mips                 randconfig-c004-20220217
mips                           ip27_defconfig
mips                     loongson1c_defconfig
arm                          ixp4xx_defconfig
arm                        neponset_defconfig
mips                          malta_defconfig
arm                     davinci_all_defconfig
mips                        workpad_defconfig
mips                     loongson2k_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      ppc44x_defconfig
powerpc                          allmodconfig
powerpc                     mpc5200_defconfig
powerpc                   microwatt_defconfig
arm                        magician_defconfig
powerpc                     ppa8548_defconfig
mips                           ip22_defconfig
arm                          imote2_defconfig
powerpc                 mpc836x_mds_defconfig
mips                  cavium_octeon_defconfig
mips                     cu1830-neo_defconfig
arm                       aspeed_g4_defconfig
powerpc                          allyesconfig
arm                          pcm027_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220216
hexagon              randconfig-r041-20220216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
