Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B143DC04A68
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Jul 2022 17:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiG1R3h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Jul 2022 13:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiG1R3g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Jul 2022 13:29:36 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91AA3E76A
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Jul 2022 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659029375; x=1690565375;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XURScfbz/cLQmJxODWd3wIMRqdxSxL5kRP/w9v7Qyyc=;
  b=bN5jvivoDdZNbedEtJwMwiWF4b/d0G6PUweQuQitQm9iYzzbVyxV/DOz
   d2UEA32YTpo/sJme6yYZqwljZf7XWBfRzqoDzlk7MhNtoRkDangEPdKxo
   G1Z7cW0x47+CBkF5TBoexfL4b0qvc1BCtyytRLF9ANphDq11J7JhWNkMG
   blJB8YzA+oZSc7iRnlfAGaKHAGlg/o185xaoesIbhLR/oQQ5yzXV2cCUC
   4zcCy6R8x71NvcjuPaGi/Z1A5I9ZjIW4yuWonoZeuEDMEaf81hAyhmDkF
   MwbEYmrPSy6W1rDwnV4aV2Jr/nyaPh65eansDjfZGXU5i8kjmPop6gCE7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="374875079"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="374875079"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 10:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="659829799"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Jul 2022 10:29:34 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oH7KH-000AQu-36;
        Thu, 28 Jul 2022 17:29:33 +0000
Date:   Fri, 29 Jul 2022 01:29:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 cdbe34da01e32024e56fff5c6854a263a012d7ff
Message-ID: <62e2c777./Vw1QIMiH/p39OGs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: cdbe34da01e32024e56fff5c6854a263a012d7ff  hwmon: (aquacomputer_d5next) Add support for Aquacomputer Quadro fan controller

elapsed time: 1690m

configs tested: 173
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
arc                  randconfig-r043-20220727
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
um                           x86_64_defconfig
um                             i386_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
loongarch                           defconfig
loongarch                         allnoconfig
mips                     decstation_defconfig
xtensa                  cadence_csp_defconfig
arc                                 defconfig
powerpc                      pasemi_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arc                        vdk_hs38_defconfig
mips                            ar7_defconfig
m68k                        stmark2_defconfig
sh                          lboxre2_defconfig
i386                          randconfig-c001
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                         amcore_defconfig
arm                            lart_defconfig
powerpc                     sequoia_defconfig
sh                           se7712_defconfig
arc                              alldefconfig
powerpc                        cell_defconfig
m68k                                defconfig
mips                           gcw0_defconfig
m68k                            q40_defconfig
sh                            titan_defconfig
m68k                          sun3x_defconfig
mips                      fuloong2e_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-c001
arm                  randconfig-c002-20220727
sparc                       sparc32_defconfig
powerpc                      mgcoge_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                        sh7763rdp_defconfig
powerpc                         wii_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      makalu_defconfig
alpha                               defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                         ps3_defconfig
arm                        mvebu_v7_defconfig
arm                         vf610m4_defconfig
xtensa                       common_defconfig
sparc                       sparc64_defconfig
arm                           sama5_defconfig
arm                            qcom_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
arm                            hisi_defconfig
m68k                        m5272c3_defconfig
sh                          rsk7264_defconfig
mips                  decstation_64_defconfig
arm                         assabet_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc8540_ads_defconfig
sh                   sh7770_generic_defconfig
m68k                          amiga_defconfig
arm                         cm_x300_defconfig
ia64                                defconfig
xtensa                    smp_lx200_defconfig
parisc64                            defconfig
csky                             alldefconfig
arm                           viper_defconfig
mips                 randconfig-c004-20220728
powerpc              randconfig-c003-20220728
s390                 randconfig-r044-20220728
riscv                randconfig-r042-20220728
arc                  randconfig-r043-20220728
xtensa                           allyesconfig
arm                           u8500_defconfig
powerpc                 linkstation_defconfig
powerpc                     taishan_defconfig
s390                                defconfig
s390                             allmodconfig
s390                             allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
powerpc                    amigaone_defconfig
sh                          landisk_defconfig
ia64                        generic_defconfig
arc                            hsdk_defconfig
sparc                               defconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arc                           tb10x_defconfig
m68k                       m5475evb_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20220727
i386                          randconfig-a006
hexagon              randconfig-r041-20220727
riscv                randconfig-r042-20220727
x86_64                        randconfig-a001
s390                 randconfig-r044-20220727
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                    nommu_virt_defconfig
arm                        neponset_defconfig
powerpc                        fsp2_defconfig
powerpc                  mpc885_ads_defconfig
mips                     decstation_defconfig
powerpc                      pasemi_defconfig
arm                             mxs_defconfig
x86_64                        randconfig-k001
powerpc                     tqm5200_defconfig
arm                         s5pv210_defconfig
hexagon              randconfig-r041-20220728
hexagon              randconfig-r045-20220728
powerpc                    mvme5100_defconfig
powerpc                      pmac32_defconfig
arm                        spear3xx_defconfig
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                 mpc8315_rdb_defconfig
mips                      pic32mzda_defconfig
hexagon                             defconfig
arm                          ixp4xx_defconfig
arm                     davinci_all_defconfig
mips                 randconfig-c004-20220728
x86_64                        randconfig-c007
s390                 randconfig-c005-20220728
powerpc              randconfig-c003-20220728
i386                          randconfig-c001
riscv                randconfig-c006-20220728
arm                  randconfig-c002-20220728
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
arm                          collie_defconfig
arm                       imx_v4_v5_defconfig
arm                       versatile_defconfig
powerpc                      obs600_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
