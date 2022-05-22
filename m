Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76F1C433EF
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 May 2022 06:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240677AbiEVGnQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 May 2022 02:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239914AbiEVGnO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 May 2022 02:43:14 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2C920BDC
        for <linux-hwmon@vger.kernel.org>; Sat, 21 May 2022 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653201793; x=1684737793;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mJ5ZfJEaj2RmN+GyzLEj5Q+xCZ5K9VnFRwTN+lnZdgU=;
  b=AQHlJGDKU8s+UVNYOcqKYjttcB+3lI9T7ntLh8qsG7dCCUhRPB4jNvVA
   t7kfBUYkUe9Vfbe5WdZxF5t/iuZLp/50oEEcZWsywvEgAi67TduTGxYbN
   xFj/CoFCt7hs08plJ4jnqsVTcM7caFx3ZiG5p1dzmgtbTDATwu0PzFK95
   dNl+nCfG7mm6tVGAfF/UdX5/A7Iua6sWW9LJPUKQ4uNWEv/7AUY4Ohz24
   6Q4QViqq+lc2j2NvnkvGXJ1HuDgOx2lc5IPch+rrZpkj+wgQDoc9ZeQpS
   Kja2z7uvwzFyXkgZEQ2snlGoPmmY9vUtA9MrITe304tY3xl2hR+8Obrxa
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="271777019"
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="271777019"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2022 23:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,243,1647327600"; 
   d="scan'208";a="702445695"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 May 2022 23:43:11 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nsfJ1-000069-6I;
        Sun, 22 May 2022 06:43:11 +0000
Date:   Sun, 22 May 2022 14:42:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-lm90] BUILD SUCCESS
 748141ef8e8a948c557df8109100cf4f7e99bcfb
Message-ID: <6289db70.QRs0DFCNd88/lnAO%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-lm90
branch HEAD: 748141ef8e8a948c557df8109100cf4f7e99bcfb  hwmon: (lm90) Support temp_samples attribute

elapsed time: 1572m

configs tested: 218
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc64                           defconfig
powerpc                     asp8347_defconfig
m68k                            mac_defconfig
ia64                            zx1_defconfig
arm                       imx_v6_v7_defconfig
arm                           imxrt_defconfig
parisc                           alldefconfig
mips                     loongson1b_defconfig
sh                            titan_defconfig
sh                            migor_defconfig
sh                               j2_defconfig
um                                  defconfig
um                               alldefconfig
arm                        shmobile_defconfig
mips                      maltasmvp_defconfig
powerpc                    sam440ep_defconfig
powerpc                      cm5200_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
sh                          rsk7269_defconfig
powerpc                     pq2fads_defconfig
parisc                           allyesconfig
ia64                        generic_defconfig
powerpc                      chrp32_defconfig
s390                          debug_defconfig
mips                  maltasmvp_eva_defconfig
riscv                            allyesconfig
arm                        mini2440_defconfig
xtensa                           allyesconfig
m68k                            q40_defconfig
sh                           se7721_defconfig
arm                           tegra_defconfig
ia64                          tiger_defconfig
sh                           se7750_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
arm                           corgi_defconfig
xtensa                          iss_defconfig
xtensa                  audio_kc705_defconfig
arm                            lart_defconfig
arc                                 defconfig
sh                          r7785rp_defconfig
powerpc                        cell_defconfig
sh                                  defconfig
powerpc                    klondike_defconfig
sh                           se7206_defconfig
arm                           h3600_defconfig
parisc                generic-64bit_defconfig
sh                           se7619_defconfig
arm                           h5000_defconfig
arm                        multi_v7_defconfig
ia64                         bigsur_defconfig
sh                          landisk_defconfig
alpha                            allyesconfig
arm                        realview_defconfig
powerpc                     sequoia_defconfig
arm                            qcom_defconfig
sh                          urquell_defconfig
x86_64                           alldefconfig
powerpc                 canyonlands_defconfig
powerpc                       eiger_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                   motionpro_defconfig
arc                          axs103_defconfig
arm                      jornada720_defconfig
s390                       zfcpdump_defconfig
arm                           sama5_defconfig
powerpc                        warp_defconfig
powerpc                 mpc837x_mds_defconfig
arm                           viper_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc837x_rdb_defconfig
h8300                     edosk2674_defconfig
arc                           tb10x_defconfig
m68k                          multi_defconfig
nios2                            alldefconfig
arm                        keystone_defconfig
h8300                       h8s-sim_defconfig
openrisc                 simple_smp_defconfig
xtensa                generic_kc705_defconfig
powerpc                       holly_defconfig
arc                          axs101_defconfig
alpha                               defconfig
m68k                       m5208evb_defconfig
powerpc                      mgcoge_defconfig
arc                         haps_hs_defconfig
m68k                           sun3_defconfig
ia64                      gensparse_defconfig
powerpc                     rainier_defconfig
sparc64                             defconfig
arm                            xcep_defconfig
m68k                       bvme6000_defconfig
mips                           ci20_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                mpc7448_hpc2_defconfig
nios2                         3c120_defconfig
powerpc                      ppc6xx_defconfig
m68k                          amiga_defconfig
sh                         microdev_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220519
arm                  randconfig-c002-20220522
ia64                                defconfig
ia64                             allmodconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
arc                  randconfig-r043-20220519
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
s390                 randconfig-c005-20220519
powerpc              randconfig-c003-20220519
x86_64                        randconfig-c007
riscv                randconfig-c006-20220519
mips                 randconfig-c004-20220519
i386                          randconfig-c001
arm                  randconfig-c002-20220519
arm                  randconfig-c002-20220522
s390                 randconfig-c005-20220522
powerpc              randconfig-c003-20220522
riscv                randconfig-c006-20220522
mips                 randconfig-c004-20220522
mips                      pic32mzda_defconfig
arm                          ep93xx_defconfig
mips                      malta_kvm_defconfig
arm                          ixp4xx_defconfig
arm                              alldefconfig
powerpc                     tqm5200_defconfig
i386                             allyesconfig
powerpc                          g5_defconfig
powerpc                    socrates_defconfig
arm                     davinci_all_defconfig
arm                         mv78xx0_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                 mpc8560_ads_defconfig
arm                       spear13xx_defconfig
mips                           rs90_defconfig
powerpc                          allmodconfig
arm                      tct_hammer_defconfig
arm                         s5pv210_defconfig
powerpc                 mpc8315_rdb_defconfig
arm                        mvebu_v5_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    gamecube_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220522
hexagon              randconfig-r041-20220522
s390                 randconfig-r044-20220519
hexagon              randconfig-r045-20220519
riscv                randconfig-r042-20220519
hexagon              randconfig-r045-20220521
hexagon              randconfig-r041-20220519
hexagon              randconfig-r041-20220521
s390                 randconfig-r044-20220521
riscv                randconfig-r042-20220521

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
