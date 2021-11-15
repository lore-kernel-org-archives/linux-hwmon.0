Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F30C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Nov 2021 21:42:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3F0E6322A
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Nov 2021 21:42:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351165AbhKOVpm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Nov 2021 16:45:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:33009 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236530AbhKOVgw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Nov 2021 16:36:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="220425859"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="220425859"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 13:33:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; 
   d="scan'208";a="671673014"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2021 13:33:51 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mmjbq-000N2W-AS; Mon, 15 Nov 2021 21:33:50 +0000
Date:   Tue, 16 Nov 2021 05:32:55 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 214f525255069a55b4664842c68bc15b2ee049f0
Message-ID: <6192d207.NL7P6xsjw2k1ewrj%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 214f525255069a55b4664842c68bc15b2ee049f0  hwmon: (nct6775) mask out bank number in nct6775_wmi_read_value()

elapsed time: 1174m

configs tested: 255
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211115
arm                            zeus_defconfig
nios2                         10m50_defconfig
arm                          pcm027_defconfig
arm                         assabet_defconfig
arm                           tegra_defconfig
h8300                            alldefconfig
sh                          landisk_defconfig
arm                         at91_dt_defconfig
powerpc64                           defconfig
arc                                 defconfig
sh                           se7751_defconfig
arm                        mini2440_defconfig
mips                        bcm63xx_defconfig
sh                           se7721_defconfig
s390                          debug_defconfig
arm64                            alldefconfig
arc                            hsdk_defconfig
arm                         lpc32xx_defconfig
powerpc                      pasemi_defconfig
powerpc                      walnut_defconfig
powerpc                     sequoia_defconfig
arm                        mvebu_v7_defconfig
sh                     sh7710voipgw_defconfig
arm                       omap2plus_defconfig
arm                       cns3420vb_defconfig
sh                            shmin_defconfig
sh                        sh7763rdp_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
arm                          collie_defconfig
arm                        multi_v7_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                  audio_kc705_defconfig
arm                          ixp4xx_defconfig
m68k                          multi_defconfig
arm                      jornada720_defconfig
powerpc                    sam440ep_defconfig
nios2                               defconfig
mips                         bigsur_defconfig
sh                        edosk7760_defconfig
um                                  defconfig
riscv                               defconfig
arm                       netwinder_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                    vt8500_v6_v7_defconfig
mips                           rs90_defconfig
sh                      rts7751r2d1_defconfig
nios2                            alldefconfig
mips                         db1xxx_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
mips                          rb532_defconfig
mips                          ath79_defconfig
arc                        nsimosci_defconfig
h8300                     edosk2674_defconfig
m68k                          amiga_defconfig
alpha                            allyesconfig
openrisc                 simple_smp_defconfig
sh                          r7780mp_defconfig
ia64                                defconfig
arm                            xcep_defconfig
sh                        apsh4ad0a_defconfig
m68k                        m5307c3_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                        nsim_700_defconfig
mips                       capcella_defconfig
arm                        cerfcube_defconfig
powerpc                      katmai_defconfig
arm                         cm_x300_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
arm                        vexpress_defconfig
h8300                    h8300h-sim_defconfig
openrisc                  or1klitex_defconfig
mips                     loongson1c_defconfig
powerpc                        warp_defconfig
powerpc                        icon_defconfig
arm                         hackkit_defconfig
arm                        clps711x_defconfig
powerpc                     tqm5200_defconfig
mips                        vocore2_defconfig
powerpc                           allnoconfig
arm                       aspeed_g4_defconfig
powerpc                     tqm8541_defconfig
m68k                            mac_defconfig
m68k                       m5475evb_defconfig
mips                          ath25_defconfig
arm                        spear3xx_defconfig
mips                         tb0219_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc8560_ads_defconfig
arm                          iop32x_defconfig
powerpc                     ep8248e_defconfig
sh                          rsk7203_defconfig
arm                            qcom_defconfig
arm                        multi_v5_defconfig
microblaze                      mmu_defconfig
arm                          pxa3xx_defconfig
mips                             allyesconfig
arm                           sama7_defconfig
riscv                    nommu_virt_defconfig
arm                          pxa168_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
sh                        sh7757lcr_defconfig
powerpc                     redwood_defconfig
arc                         haps_hs_defconfig
powerpc                       holly_defconfig
powerpc                       ppc64_defconfig
powerpc                  iss476-smp_defconfig
sh                          polaris_defconfig
powerpc                   currituck_defconfig
powerpc                     kmeter1_defconfig
sh                          sdk7786_defconfig
mips                       rbtx49xx_defconfig
mips                            e55_defconfig
arm                          pxa910_defconfig
xtensa                  nommu_kc705_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
sparc64                             defconfig
alpha                            alldefconfig
arm                            dove_defconfig
parisc                           alldefconfig
sh                ecovec24-romimage_defconfig
powerpc                 mpc832x_mds_defconfig
arm                        trizeps4_defconfig
sh                          urquell_defconfig
arm                     eseries_pxa_defconfig
powerpc                 xes_mpc85xx_defconfig
x86_64                           allyesconfig
powerpc                     taishan_defconfig
mips                           ip28_defconfig
arm                         socfpga_defconfig
arm                        shmobile_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      ppc64e_defconfig
mips                           ip32_defconfig
m68k                         amcore_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
mips                      malta_kvm_defconfig
arm                      pxa255-idp_defconfig
powerpc                  mpc866_ads_defconfig
arc                      axs103_smp_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                        m5272c3_defconfig
powerpc                     pq2fads_defconfig
arm                         palmz72_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                     mpc83xx_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 linkstation_defconfig
parisc                generic-32bit_defconfig
arm                     am200epdkit_defconfig
arm                          lpd270_defconfig
h8300                               defconfig
mips                      maltaaprp_defconfig
xtensa                    xip_kc705_defconfig
mips                  decstation_64_defconfig
sh                           se7206_defconfig
powerpc                      pcm030_defconfig
sparc                            allyesconfig
sh                           se7343_defconfig
arm                             mxs_defconfig
parisc                generic-64bit_defconfig
arm                        mvebu_v5_defconfig
powerpc                     pseries_defconfig
sh                          r7785rp_defconfig
m68k                        stmark2_defconfig
arm                           sunxi_defconfig
arm                  randconfig-c002-20211115
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
s390                                defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20211115
x86_64               randconfig-a003-20211115
x86_64               randconfig-a002-20211115
x86_64               randconfig-a001-20211115
x86_64               randconfig-a006-20211115
x86_64               randconfig-a004-20211115
i386                 randconfig-a006-20211115
i386                 randconfig-a003-20211115
i386                 randconfig-a005-20211115
i386                 randconfig-a001-20211115
i386                 randconfig-a004-20211115
i386                 randconfig-a002-20211115
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211115
i386                 randconfig-c001-20211115
arm                  randconfig-c002-20211115
riscv                randconfig-c006-20211115
powerpc              randconfig-c003-20211115
s390                 randconfig-c005-20211115
mips                 randconfig-c004-20211115
x86_64               randconfig-a015-20211115
x86_64               randconfig-a013-20211115
x86_64               randconfig-a011-20211115
x86_64               randconfig-a012-20211115
x86_64               randconfig-a016-20211115
x86_64               randconfig-a014-20211115
i386                 randconfig-a014-20211115
i386                 randconfig-a016-20211115
i386                 randconfig-a012-20211115
i386                 randconfig-a013-20211115
i386                 randconfig-a011-20211115
i386                 randconfig-a015-20211115
hexagon              randconfig-r045-20211115
hexagon              randconfig-r041-20211115
s390                 randconfig-r044-20211115
riscv                randconfig-r042-20211115

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
