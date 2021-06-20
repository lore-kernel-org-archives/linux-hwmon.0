Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39452C48BE5
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Jun 2021 00:18:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1636461183
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Jun 2021 00:18:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhFTAUq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 19 Jun 2021 20:20:46 -0400
Received: from mga03.intel.com ([134.134.136.65]:1055 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhFTAUp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Jun 2021 20:20:45 -0400
IronPort-SDR: nGwPTk2VEyO3Q2FpbX3kYZ2mxHm4JyHUVvLYu3OgUJKIHhbsg/+ExkaGMRTVfujV53HN5Vy8q6
 OOO9e/j9wgHA==
X-IronPort-AV: E=McAfee;i="6200,9189,10020"; a="206733955"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; 
   d="scan'208";a="206733955"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2021 17:18:33 -0700
IronPort-SDR: cH3qKJ/zdA9Eb99KvtG6THdaaJpVXFWRY6vz8+b5O0ytUrKOqkUuoVDOfdR31F/TnSWKW7+x7a
 pOHa+FaPkcJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; 
   d="scan'208";a="422577580"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2021 17:18:32 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lulAV-0003qn-I0; Sun, 20 Jun 2021 00:18:31 +0000
Date:   Sun, 20 Jun 2021 08:17:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 4c7f85a321a1ac265159c22a6998ef4f2a60c21d
Message-ID: <60ce8930.7+dtY2gAQkrj3bUf%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 4c7f85a321a1ac265159c22a6998ef4f2a60c21d  hwmon: (lm90) Disable interrupt on suspend

elapsed time: 721m

configs tested: 165
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson2k_defconfig
powerpc                     ep8248e_defconfig
sh                             espt_defconfig
mips                          ath79_defconfig
um                            kunit_defconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                   currituck_defconfig
xtensa                  nommu_kc705_defconfig
sh                   sh7724_generic_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
arm                         palmz72_defconfig
sh                            hp6xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           rs90_defconfig
m68k                        m5272c3_defconfig
mips                         cobalt_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
csky                                defconfig
powerpc                        cell_defconfig
arc                          axs101_defconfig
sh                          sdk7786_defconfig
powerpc                     pseries_defconfig
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
powerpc                     tqm5200_defconfig
x86_64                            allnoconfig
arm                           sunxi_defconfig
powerpc                           allnoconfig
sh                          urquell_defconfig
x86_64                           allyesconfig
arm                       imx_v6_v7_defconfig
arm                          pxa168_defconfig
mips                 decstation_r4k_defconfig
arm                  colibri_pxa300_defconfig
nds32                             allnoconfig
powerpc                       ebony_defconfig
mips                            ar7_defconfig
um                             i386_defconfig
powerpc                     mpc512x_defconfig
sh                          landisk_defconfig
powerpc                      ppc6xx_defconfig
arm                     davinci_all_defconfig
powerpc                     redwood_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        nlm_xlp_defconfig
powerpc                    socrates_defconfig
m68k                       m5249evb_defconfig
arm                       cns3420vb_defconfig
mips                  decstation_64_defconfig
arm                         s3c2410_defconfig
s390                                defconfig
powerpc                   bluestone_defconfig
powerpc                        warp_defconfig
arm                         assabet_defconfig
mips                      loongson3_defconfig
mips                         db1xxx_defconfig
powerpc                          g5_defconfig
arm                            hisi_defconfig
mips                        nlm_xlr_defconfig
arm                        clps711x_defconfig
arm                     am200epdkit_defconfig
powerpc                 mpc8540_ads_defconfig
parisc                generic-64bit_defconfig
m68k                             allyesconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a001-20210620
i386                 randconfig-a002-20210620
i386                 randconfig-a003-20210620
i386                 randconfig-a006-20210620
i386                 randconfig-a005-20210620
i386                 randconfig-a004-20210620
i386                 randconfig-a002-20210618
i386                 randconfig-a006-20210618
i386                 randconfig-a004-20210618
i386                 randconfig-a001-20210618
i386                 randconfig-a005-20210618
i386                 randconfig-a003-20210618
x86_64               randconfig-a012-20210620
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
x86_64               randconfig-a015-20210618
x86_64               randconfig-a011-20210618
x86_64               randconfig-a012-20210618
x86_64               randconfig-a014-20210618
x86_64               randconfig-a016-20210618
x86_64               randconfig-a013-20210618
i386                 randconfig-a011-20210620
i386                 randconfig-a014-20210620
i386                 randconfig-a013-20210620
i386                 randconfig-a015-20210620
i386                 randconfig-a012-20210620
i386                 randconfig-a016-20210620
i386                 randconfig-a015-20210618
i386                 randconfig-a016-20210618
i386                 randconfig-a013-20210618
i386                 randconfig-a014-20210618
i386                 randconfig-a012-20210618
i386                 randconfig-a011-20210618
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-b001-20210618
x86_64               randconfig-a002-20210618
x86_64               randconfig-a001-20210618
x86_64               randconfig-a004-20210618
x86_64               randconfig-a003-20210618
x86_64               randconfig-a006-20210618
x86_64               randconfig-a005-20210618
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a003-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a006-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
