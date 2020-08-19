Return-Path: <SRS0=Cu32=B5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDE5C433E3
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Aug 2020 00:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9887B207FB
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Aug 2020 00:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgHSAsI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 18 Aug 2020 20:48:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:60201 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726862AbgHSAsF (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Aug 2020 20:48:05 -0400
IronPort-SDR: EPfEez1hGmk0IwjsjJqxd4StuiIjRvyqMb29n+vVKocix/dI8y4aUG5vvJUSN2K0LpuALAjU+k
 kdhy9YJE1/2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="173075703"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="173075703"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 17:48:04 -0700
IronPort-SDR: 9LlkMCOhe27QfpoYLfjsOnNGtPW+W/oQ3UpJK4aFlKVAMdSjXMiK08eEcnV4ab9Jf0Kq7KCpSn
 9M6lhyw6bq8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; 
   d="scan'208";a="371073417"
Received: from lkp-server02.sh.intel.com (HELO 2f0d8b563e65) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Aug 2020 17:48:02 -0700
Received: from kbuild by 2f0d8b563e65 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k8CGo-0001Ua-6u; Wed, 19 Aug 2020 00:48:02 +0000
Date:   Wed, 19 Aug 2020 08:47:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 4f31c8c48312dad01ce36a3eb993709bed6651b4
Message-ID: <5f3c7696.MCnSki6MT6cGKMWE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 4f31c8c48312dad01ce36a3eb993709bed6651b4  hwmon: (ltc2947) use simple i2c probe

elapsed time: 2931m

configs tested: 159
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                        apsh4ad0a_defconfig
arm                            hisi_defconfig
ia64                             allyesconfig
powerpc                       holly_defconfig
arm                          collie_defconfig
m68k                        stmark2_defconfig
riscv                    nommu_k210_defconfig
powerpc                         ps3_defconfig
h8300                     edosk2674_defconfig
sh                          urquell_defconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
csky                                defconfig
sh                        edosk7760_defconfig
sh                           se7712_defconfig
arm                         s5pv210_defconfig
arm                        mvebu_v7_defconfig
um                           x86_64_defconfig
sh                           se7724_defconfig
sh                               allmodconfig
mips                           rs90_defconfig
powerpc                      ppc64e_defconfig
sh                         ecovec24_defconfig
m68k                          amiga_defconfig
ia64                             alldefconfig
powerpc                    adder875_defconfig
nds32                             allnoconfig
mips                          rb532_defconfig
powerpc                     mpc83xx_defconfig
mips                      malta_kvm_defconfig
sparc                            alldefconfig
mips                       capcella_defconfig
powerpc                      ppc6xx_defconfig
arm                             mxs_defconfig
mips                        omega2p_defconfig
mips                       rbtx49xx_defconfig
mips                         cobalt_defconfig
mips                malta_kvm_guest_defconfig
mips                malta_qemu_32r6_defconfig
arm                          pcm027_defconfig
ia64                            zx1_defconfig
mips                         mpc30x_defconfig
alpha                               defconfig
arm                           tegra_defconfig
arm                         s3c2410_defconfig
m68k                          hp300_defconfig
arm                        clps711x_defconfig
mips                      pic32mzda_defconfig
mips                      maltasmvp_defconfig
arm                           sunxi_defconfig
riscv                    nommu_virt_defconfig
powerpc                      pmac32_defconfig
arm                      footbridge_defconfig
mips                        nlm_xlr_defconfig
microblaze                      mmu_defconfig
arm                        oxnas_v6_defconfig
sh                               j2_defconfig
sh                             espt_defconfig
h8300                    h8300h-sim_defconfig
mips                  decstation_64_defconfig
sh                          kfr2r09_defconfig
sh                          sdk7786_defconfig
arm                           spitz_defconfig
powerpc                        cell_defconfig
powerpc                      ppc44x_defconfig
sh                         ap325rxa_defconfig
mips                  maltasmvp_eva_defconfig
mips                            gpr_defconfig
sh                        sh7785lcr_defconfig
m68k                       m5208evb_defconfig
arm                   milbeaut_m10v_defconfig
c6x                        evmc6472_defconfig
sh                           sh2007_defconfig
mips                        nlm_xlp_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200817
x86_64               randconfig-a001-20200817
x86_64               randconfig-a005-20200817
x86_64               randconfig-a003-20200817
x86_64               randconfig-a002-20200817
x86_64               randconfig-a004-20200817
i386                 randconfig-a005-20200817
i386                 randconfig-a001-20200817
i386                 randconfig-a002-20200817
i386                 randconfig-a003-20200817
i386                 randconfig-a006-20200817
i386                 randconfig-a004-20200817
i386                 randconfig-a005-20200818
i386                 randconfig-a002-20200818
i386                 randconfig-a001-20200818
i386                 randconfig-a006-20200818
i386                 randconfig-a003-20200818
i386                 randconfig-a004-20200818
x86_64               randconfig-a013-20200818
x86_64               randconfig-a016-20200818
x86_64               randconfig-a012-20200818
x86_64               randconfig-a011-20200818
x86_64               randconfig-a014-20200818
x86_64               randconfig-a015-20200818
i386                 randconfig-a016-20200817
i386                 randconfig-a011-20200817
i386                 randconfig-a013-20200817
i386                 randconfig-a015-20200817
i386                 randconfig-a014-20200817
i386                 randconfig-a012-20200817
i386                 randconfig-a016-20200818
i386                 randconfig-a011-20200818
i386                 randconfig-a015-20200818
i386                 randconfig-a013-20200818
i386                 randconfig-a012-20200818
i386                 randconfig-a014-20200818
x86_64               randconfig-a006-20200819
x86_64               randconfig-a001-20200819
x86_64               randconfig-a003-20200819
x86_64               randconfig-a005-20200819
x86_64               randconfig-a004-20200819
x86_64               randconfig-a002-20200819
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
