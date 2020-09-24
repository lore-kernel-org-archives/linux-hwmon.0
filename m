Return-Path: <SRS0=A7RS=DB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AEAC2D0E2
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 04:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EB9F23899
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 04:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgIXE6a (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Sep 2020 00:58:30 -0400
Received: from mga07.intel.com ([134.134.136.100]:65107 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726683AbgIXE63 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Sep 2020 00:58:29 -0400
IronPort-SDR: w/HVB61kiHD0rmKgchBBIlnuvhpIICD9GHbvTgZPI8tI59zIlf1fdDws9hIh2XYRYFOzZKUm4O
 qbh79mq2CiIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="225237593"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="225237593"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 21:58:29 -0700
IronPort-SDR: VxHIDq0mvneEtC7n4H8+6YikeTW6f1L2IVjTI9hwYyOxv2I+NefkhXJTcKpqM4Twraoq/hUjD2
 ZpjlGuL4bjEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="347683713"
Received: from lkp-server01.sh.intel.com (HELO 9f27196b5390) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2020 21:58:28 -0700
Received: from kbuild by 9f27196b5390 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLJKt-0000WU-Di; Thu, 24 Sep 2020 04:58:27 +0000
Date:   Thu, 24 Sep 2020 12:58:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 18360b33a071e5883250fd1e04bfdeff8c3887a3
Message-ID: <5f6c276c.Q076AM1PiI6xboVp%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 18360b33a071e5883250fd1e04bfdeff8c3887a3  hwmon: (w83627ehf) Fix a resource leak in probe

elapsed time: 724m

configs tested: 181
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                             pxa_defconfig
xtensa                         virt_defconfig
sh                          rsk7269_defconfig
arm                       imx_v6_v7_defconfig
arm                             rpc_defconfig
riscv                               defconfig
arm                       omap2plus_defconfig
powerpc                 mpc8540_ads_defconfig
ia64                          tiger_defconfig
mips                             allmodconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
powerpc                    sam440ep_defconfig
arm                         ebsa110_defconfig
sh                          rsk7264_defconfig
powerpc                 mpc8313_rdb_defconfig
h8300                       h8s-sim_defconfig
sh                             espt_defconfig
arm                          iop32x_defconfig
arm                       spear13xx_defconfig
arm                          simpad_defconfig
powerpc                 mpc837x_rdb_defconfig
i386                             alldefconfig
arm                        mini2440_defconfig
mips                         tb0226_defconfig
m68k                           sun3_defconfig
microblaze                          defconfig
powerpc                      tqm8xx_defconfig
powerpc                    ge_imp3a_defconfig
mips                          rm200_defconfig
csky                                defconfig
arm                          lpd270_defconfig
i386                                defconfig
powerpc                     ep8248e_defconfig
sh                   secureedge5410_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7619_defconfig
arm                        neponset_defconfig
powerpc                      makalu_defconfig
arm                       aspeed_g4_defconfig
arm                         axm55xx_defconfig
m68k                            q40_defconfig
sh                           se7712_defconfig
arm                           corgi_defconfig
mips                 pnx8335_stb225_defconfig
arc                     nsimosci_hs_defconfig
powerpc                    amigaone_defconfig
nios2                         10m50_defconfig
arm                         s3c6400_defconfig
mips                           rs90_defconfig
microblaze                    nommu_defconfig
powerpc                      cm5200_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
riscv                             allnoconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
sh                           se7206_defconfig
m68k                         apollo_defconfig
arc                            hsdk_defconfig
mips                          ath79_defconfig
arm                          imote2_defconfig
sh                          rsk7203_defconfig
sh                        sh7763rdp_defconfig
arm                      footbridge_defconfig
m68k                       bvme6000_defconfig
arm                         assabet_defconfig
sh                   rts7751r2dplus_defconfig
arm                           u8500_defconfig
powerpc                     sbc8548_defconfig
mips                       rbtx49xx_defconfig
riscv                          rv32_defconfig
mips                  maltasmvp_eva_defconfig
arm                       cns3420vb_defconfig
arc                             nps_defconfig
arm                         orion5x_defconfig
mips                      malta_kvm_defconfig
arm                             mxs_defconfig
powerpc                      katmai_defconfig
openrisc                 simple_smp_defconfig
arm                          pxa910_defconfig
mips                           ip27_defconfig
xtensa                    xip_kc705_defconfig
mips                        qi_lb60_defconfig
alpha                               defconfig
powerpc                     kilauea_defconfig
sh                      rts7751r2d1_defconfig
c6x                              allyesconfig
sh                        sh7757lcr_defconfig
sh                                  defconfig
mips                          ath25_defconfig
mips                        nlm_xlp_defconfig
sh                           se7721_defconfig
powerpc                          g5_defconfig
powerpc                      acadia_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                         tb0287_defconfig
arm                          gemini_defconfig
mips                      pic32mzda_defconfig
arm                            pleb_defconfig
arm                            mmp2_defconfig
powerpc                   currituck_defconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200923
i386                 randconfig-a006-20200923
i386                 randconfig-a003-20200923
i386                 randconfig-a004-20200923
i386                 randconfig-a005-20200923
i386                 randconfig-a001-20200923
x86_64               randconfig-a011-20200923
x86_64               randconfig-a013-20200923
x86_64               randconfig-a014-20200923
x86_64               randconfig-a015-20200923
x86_64               randconfig-a012-20200923
x86_64               randconfig-a016-20200923
i386                 randconfig-a012-20200923
i386                 randconfig-a014-20200923
i386                 randconfig-a016-20200923
i386                 randconfig-a013-20200923
i386                 randconfig-a011-20200923
i386                 randconfig-a015-20200923
i386                 randconfig-a012-20200924
i386                 randconfig-a014-20200924
i386                 randconfig-a016-20200924
i386                 randconfig-a013-20200924
i386                 randconfig-a011-20200924
i386                 randconfig-a015-20200924
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200923
x86_64               randconfig-a003-20200923
x86_64               randconfig-a004-20200923
x86_64               randconfig-a002-20200923
x86_64               randconfig-a006-20200923
x86_64               randconfig-a001-20200923
x86_64               randconfig-a011-20200924
x86_64               randconfig-a013-20200924
x86_64               randconfig-a014-20200924
x86_64               randconfig-a015-20200924
x86_64               randconfig-a012-20200924
x86_64               randconfig-a016-20200924

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
