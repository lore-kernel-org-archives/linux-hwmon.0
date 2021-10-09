Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C18C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 02:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5792260D07
	for <linux-hwmon@archiver.kernel.org>; Sat,  9 Oct 2021 02:32:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhJICed (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 22:34:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:29684 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232255AbhJICed (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Oct 2021 22:34:33 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="225398463"
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="scan'208";a="225398463"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 19:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,360,1624345200"; 
   d="scan'208";a="489700464"
Received: from lkp-server02.sh.intel.com (HELO 1950922c5479) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 08 Oct 2021 19:32:35 -0700
Received: from kbuild by 1950922c5479 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mZ2A7-0000zy-5W; Sat, 09 Oct 2021 02:32:35 +0000
Date:   Sat, 09 Oct 2021 10:32:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 9ba3edb8dd44b4253b7bdaf5d4a91f97df9370f0
Message-ID: <6160ff35.B8NynAJCjyCmC97w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 9ba3edb8dd44b4253b7bdaf5d4a91f97df9370f0  watchdog: mtk: add disable_wdt_extrst support

elapsed time: 1360m

configs tested: 206
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211008
powerpc              randconfig-c003-20211008
s390                          debug_defconfig
parisc                generic-32bit_defconfig
m68k                       bvme6000_defconfig
arm                            hisi_defconfig
sh                            hp6xx_defconfig
m68k                        mvme16x_defconfig
mips                         tb0226_defconfig
arm                          pxa168_defconfig
powerpc                     akebono_defconfig
mips                  cavium_octeon_defconfig
sh                          rsk7269_defconfig
sh                               alldefconfig
arm                        oxnas_v6_defconfig
arm                         orion5x_defconfig
openrisc                            defconfig
m68k                         amcore_defconfig
arm                      pxa255-idp_defconfig
mips                          rb532_defconfig
mips                            gpr_defconfig
m68k                          hp300_defconfig
mips                     loongson1b_defconfig
mips                        qi_lb60_defconfig
xtensa                       common_defconfig
powerpc                  mpc866_ads_defconfig
arm                         bcm2835_defconfig
powerpc                      cm5200_defconfig
microblaze                      mmu_defconfig
powerpc                    socrates_defconfig
m68k                          amiga_defconfig
arm                        realview_defconfig
mips                      loongson3_defconfig
sh                   secureedge5410_defconfig
ia64                        generic_defconfig
mips                        maltaup_defconfig
powerpc                      ppc64e_defconfig
xtensa                  audio_kc705_defconfig
alpha                            allyesconfig
mips                         rt305x_defconfig
arm                            zeus_defconfig
arm                         socfpga_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
xtensa                    xip_kc705_defconfig
nds32                             allnoconfig
powerpc                 mpc8560_ads_defconfig
mips                       lemote2f_defconfig
m68k                        stmark2_defconfig
sh                          sdk7786_defconfig
powerpc                       holly_defconfig
arm                     am200epdkit_defconfig
sh                            migor_defconfig
arc                      axs103_smp_defconfig
powerpc                      bamboo_defconfig
arm                        keystone_defconfig
m68k                        mvme147_defconfig
ia64                             allyesconfig
sh                           se7721_defconfig
powerpc                      pasemi_defconfig
mips                       rbtx49xx_defconfig
powerpc                   currituck_defconfig
ia64                             alldefconfig
mips                     cu1830-neo_defconfig
arm                        shmobile_defconfig
riscv                    nommu_virt_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath25_defconfig
mips                        nlm_xlp_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            xcep_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                          g5_defconfig
riscv                               defconfig
arm                     eseries_pxa_defconfig
mips                           rs90_defconfig
arm                         palmz72_defconfig
arm                        vexpress_defconfig
mips                         tb0219_defconfig
arc                            hsdk_defconfig
mips                  decstation_64_defconfig
sh                        sh7785lcr_defconfig
m68k                         apollo_defconfig
powerpc                      arches_defconfig
m68k                            mac_defconfig
mips                           mtx1_defconfig
mips                           jazz_defconfig
sparc64                          alldefconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                   lite5200b_defconfig
arm                       multi_v4t_defconfig
arm                        multi_v7_defconfig
h8300                       h8s-sim_defconfig
sh                         ecovec24_defconfig
sh                           se7705_defconfig
sh                          r7785rp_defconfig
mips                     loongson1c_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
arm                          ep93xx_defconfig
powerpc                   microwatt_defconfig
riscv                            alldefconfig
arc                        nsim_700_defconfig
sh                     sh7710voipgw_defconfig
arm                         s3c6400_defconfig
powerpc                     tqm8560_defconfig
powerpc                      tqm8xx_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                      gensparse_defconfig
x86_64               randconfig-c001-20211008
arm                  randconfig-c002-20211008
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
parisc                              defconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211008
x86_64               randconfig-a012-20211008
x86_64               randconfig-a016-20211008
x86_64               randconfig-a013-20211008
x86_64               randconfig-a011-20211008
x86_64               randconfig-a014-20211008
x86_64               randconfig-a015-20211004
x86_64               randconfig-a012-20211004
x86_64               randconfig-a016-20211004
x86_64               randconfig-a014-20211004
x86_64               randconfig-a013-20211004
x86_64               randconfig-a011-20211004
i386                 randconfig-a013-20211008
i386                 randconfig-a016-20211008
i386                 randconfig-a014-20211008
i386                 randconfig-a011-20211008
i386                 randconfig-a012-20211008
i386                 randconfig-a015-20211008
arc                  randconfig-r043-20211008
s390                 randconfig-r044-20211008
riscv                randconfig-r042-20211008
arc                  randconfig-r043-20211007
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-c007-20211008
i386                 randconfig-c001-20211008
arm                  randconfig-c002-20211008
s390                 randconfig-c005-20211008
powerpc              randconfig-c003-20211008
riscv                randconfig-c006-20211008
mips                 randconfig-c004-20211008
x86_64               randconfig-a003-20211008
x86_64               randconfig-a005-20211008
x86_64               randconfig-a001-20211008
x86_64               randconfig-a002-20211008
x86_64               randconfig-a004-20211008
x86_64               randconfig-a006-20211008
i386                 randconfig-a001-20211008
i386                 randconfig-a003-20211008
i386                 randconfig-a005-20211008
i386                 randconfig-a004-20211008
i386                 randconfig-a002-20211008
i386                 randconfig-a006-20211008
i386                 randconfig-a001-20211004
i386                 randconfig-a003-20211004
i386                 randconfig-a005-20211004
i386                 randconfig-a002-20211004
i386                 randconfig-a004-20211004
i386                 randconfig-a006-20211004
hexagon              randconfig-r045-20211007
hexagon              randconfig-r041-20211007
s390                 randconfig-r044-20211007
riscv                randconfig-r042-20211007

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
