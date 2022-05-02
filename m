Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AC2C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 09:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347794AbiEBJcB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 05:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380009AbiEBJcA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 05:32:00 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2EA33E19
        for <linux-hwmon@vger.kernel.org>; Mon,  2 May 2022 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651483712; x=1683019712;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y+UjMGyMsPoHC/7hbsKbb2FZ5X0IVRGfDmg+Fu0Jupk=;
  b=RrWeqf315otznSc2LemUsHMNNER/IoMnoMeYAKsgCFKl6taXiSGMy6VR
   GQlGhE7OKaRcT7pIwyLHHE25HPhZFxzWn4sUzNR90M2UGuN4PDmrs6MXQ
   B3PczaEAjAjSXP1afnXEzc7wUqjzmx+VSVEAo9i8I2IadO+TPZuOPMjkN
   jtibeOf64ru9tnzeDsHb+pWzuo4WyUKymcV9zpbqgzkaZNX/XruFbj0Ds
   xTbQxFGmaKruF/2KTVAW4iSIUmZ5qgdHcbjVllezBCB+c4EShS4zPTpJX
   hV3eliJkx7lRcTT+mDOCwx9vQKZ8YLBRy4Fq9oCpCkCcynejhB0y46YIg
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="330150592"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="330150592"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 02:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="535770676"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 May 2022 02:28:30 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nlSM1-0009S7-IR;
        Mon, 02 May 2022 09:28:29 +0000
Date:   Mon, 02 May 2022 17:27:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 08da09f028043fed9653331ae75bc310411f72e6
Message-ID: <626fa40f.FjZvXGPJeDHBL0In%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 08da09f028043fed9653331ae75bc310411f72e6  hwmon: (pmbus) delta-ahe50dc-fan: work around hardware quirk

elapsed time: 6969m

configs tested: 265
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                           se7724_defconfig
parisc                generic-32bit_defconfig
powerpc                      pcm030_defconfig
sh                           se7750_defconfig
xtensa                          iss_defconfig
m68k                         amcore_defconfig
arc                        nsim_700_defconfig
sh                           se7206_defconfig
ia64                          tiger_defconfig
mips                         cobalt_defconfig
mips                  decstation_64_defconfig
arm                            zeus_defconfig
arm                         lubbock_defconfig
m68k                                defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
arc                        nsimosci_defconfig
powerpc                      arches_defconfig
powerpc                 linkstation_defconfig
sh                     sh7710voipgw_defconfig
sh                        edosk7705_defconfig
powerpc                     ep8248e_defconfig
s390                                defconfig
mips                         tb0226_defconfig
sh                        edosk7760_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      ppc6xx_defconfig
arm                       multi_v4t_defconfig
arm                      jornada720_defconfig
sh                           se7619_defconfig
mips                  maltasmvp_eva_defconfig
sh                   secureedge5410_defconfig
sh                            shmin_defconfig
sh                          r7780mp_defconfig
sh                     magicpanelr2_defconfig
nios2                               defconfig
powerpc                     taishan_defconfig
sparc                       sparc64_defconfig
powerpc                        cell_defconfig
parisc                generic-64bit_defconfig
arm                         cm_x300_defconfig
ia64                         bigsur_defconfig
m68k                          sun3x_defconfig
arm                         nhk8815_defconfig
powerpc                     tqm8541_defconfig
powerpc                       holly_defconfig
mips                            gpr_defconfig
arm                            lart_defconfig
powerpc                         ps3_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc8540_ads_defconfig
alpha                               defconfig
m68k                           sun3_defconfig
arc                     nsimosci_hs_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5275evb_defconfig
m68k                        m5272c3_defconfig
sh                             shx3_defconfig
sh                           se7780_defconfig
mips                      maltasmvp_defconfig
m68k                       m5249evb_defconfig
xtensa                           alldefconfig
arm                          gemini_defconfig
sh                          landisk_defconfig
arm                         lpc18xx_defconfig
arc                         haps_hs_defconfig
m68k                       m5208evb_defconfig
xtensa                  cadence_csp_defconfig
arm                         assabet_defconfig
parisc                              defconfig
powerpc                     tqm8548_defconfig
sh                         ecovec24_defconfig
xtensa                         virt_defconfig
powerpc                      mgcoge_defconfig
powerpc                   motionpro_defconfig
m68k                       m5475evb_defconfig
powerpc                 mpc837x_mds_defconfig
m68k                       bvme6000_defconfig
arc                            hsdk_defconfig
arm                            qcom_defconfig
arm                          exynos_defconfig
m68k                          multi_defconfig
mips                         db1xxx_defconfig
mips                     loongson1b_defconfig
m68k                        m5307c3_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
arm                          lpd270_defconfig
openrisc                  or1klitex_defconfig
ia64                            zx1_defconfig
arm                          simpad_defconfig
nios2                            allyesconfig
arm                        cerfcube_defconfig
arm                      integrator_defconfig
um                               alldefconfig
sh                          rsk7201_defconfig
arm                        oxnas_v6_defconfig
arm                        multi_v7_defconfig
sh                ecovec24-romimage_defconfig
microblaze                          defconfig
powerpc                     pq2fads_defconfig
ia64                             alldefconfig
sh                          lboxre2_defconfig
mips                       capcella_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                             sh03_defconfig
sparc64                          alldefconfig
sh                  sh7785lcr_32bit_defconfig
arm                       aspeed_g5_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    amigaone_defconfig
sh                           se7721_defconfig
powerpc                           allnoconfig
powerpc                   currituck_defconfig
powerpc                      cm5200_defconfig
arm                           u8500_defconfig
arm                     eseries_pxa_defconfig
arm                           imxrt_defconfig
mips                    maltaup_xpa_defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
m68k                        mvme16x_defconfig
mips                           jazz_defconfig
powerpc                      makalu_defconfig
powerpc                      chrp32_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                         ap325rxa_defconfig
sh                   rts7751r2dplus_defconfig
parisc64                            defconfig
arm                        keystone_defconfig
powerpc                  storcenter_defconfig
x86_64                           alldefconfig
sh                          kfr2r09_defconfig
powerpc                    sam440ep_defconfig
arm                  randconfig-c002-20220427
x86_64                        randconfig-c001
arm                  randconfig-c002-20220428
arm                  randconfig-c002-20220429
arm                  randconfig-c002-20220501
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a016
i386                          randconfig-a014
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
arc                  randconfig-r043-20220428
arc                  randconfig-r043-20220429
s390                 randconfig-r044-20220429
riscv                randconfig-r042-20220429
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                                  kexec
x86_64                              defconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
powerpc              randconfig-c003-20220501
riscv                randconfig-c006-20220501
mips                 randconfig-c004-20220501
arm                  randconfig-c002-20220501
riscv                randconfig-c006-20220429
mips                 randconfig-c004-20220429
arm                  randconfig-c002-20220429
powerpc              randconfig-c003-20220429
powerpc                      ppc44x_defconfig
arm                         palmz72_defconfig
arm                       spear13xx_defconfig
mips                   sb1250_swarm_defconfig
arm                         shannon_defconfig
arm64                            allyesconfig
powerpc                     tqm8540_defconfig
arm                        vexpress_defconfig
arm                       cns3420vb_defconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                     cu1830-neo_defconfig
powerpc                    mvme5100_defconfig
arm                         s3c2410_defconfig
arm                            mmp2_defconfig
powerpc                      katmai_defconfig
arm                      pxa255-idp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      walnut_defconfig
arm                              alldefconfig
mips                            e55_defconfig
arm                          moxart_defconfig
mips                           mtx1_defconfig
powerpc                    socrates_defconfig
arm                         bcm2835_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                  mpc885_ads_defconfig
arm                       netwinder_defconfig
mips                          ath25_defconfig
x86_64                           allyesconfig
mips                           ip28_defconfig
mips                      maltaaprp_defconfig
mips                       rbtx49xx_defconfig
powerpc                          allmodconfig
riscv                          rv32_defconfig
mips                     cu1000-neo_defconfig
arm                             mxs_defconfig
powerpc                 linkstation_defconfig
powerpc                        fsp2_defconfig
mips                      bmips_stb_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      pmac32_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220428
riscv                randconfig-r042-20220428
hexagon              randconfig-r045-20220428

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
