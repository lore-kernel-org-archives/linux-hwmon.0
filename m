Return-Path: <SRS0=6S3t=7O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	LONGWORDS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D614CC433E0
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Jun 2020 05:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8DB52073E
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Jun 2020 05:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgFAFUi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Jun 2020 01:20:38 -0400
Received: from mga18.intel.com ([134.134.136.126]:47707 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727061AbgFAFUi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 1 Jun 2020 01:20:38 -0400
IronPort-SDR: PCm4f5QkyDsVefwDyiO6FDER+l0h5abbUnnxdHxS0kxX4hLfbFWaq3El7dg/YrLAnIIN5v5GJn
 CN2ROCOwGJkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 22:20:37 -0700
IronPort-SDR: zgiHTpyr0D1T/v4HYaueUMfvFDuCqFkrV1S0CeFrER2PUqCbxPMhzVjSqYkl/a4Wm/QM58OsMn
 lC9JpetSHF7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="scan'208";a="293067664"
Received: from lkp-server01.sh.intel.com (HELO 49d03d9b0ee7) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 31 May 2020 22:20:36 -0700
Received: from kbuild by 49d03d9b0ee7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jfcsF-0000Fk-Ey; Mon, 01 Jun 2020 05:20:35 +0000
Date:   Mon, 01 Jun 2020 13:19:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:watchdog-next] BUILD SUCCESS
 217d7150b3398e2097fb9218c2d2ed9611623acd
Message-ID: <5ed48fcf.rnLlbaGnO3YFuIB2%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  watchdog-next
branch HEAD: 217d7150b3398e2097fb9218c2d2ed9611623acd  Merge branch 'watchdog-mlx-immutable' into watchdog-next

elapsed time: 3226m

configs tested: 135
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                          pxa3xx_defconfig
arm                         palmz72_defconfig
sh                            shmin_defconfig
ia64                            zx1_defconfig
riscv                          rv32_defconfig
powerpc                      tqm8xx_defconfig
i386                             allyesconfig
sh                          polaris_defconfig
mips                           mtx1_defconfig
arm                       spear13xx_defconfig
um                           x86_64_defconfig
m68k                       m5249evb_defconfig
sh                   sh7770_generic_defconfig
arm                         vf610m4_defconfig
arm                        trizeps4_defconfig
powerpc                      pasemi_defconfig
sparc                       sparc64_defconfig
mips                  decstation_64_defconfig
mips                          ath79_defconfig
mips                         bigsur_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                      bmips_stb_defconfig
parisc                generic-64bit_defconfig
ia64                              allnoconfig
arm                            mps2_defconfig
sh                          rsk7269_defconfig
mips                             allyesconfig
ia64                        generic_defconfig
arm                             pxa_defconfig
c6x                        evmc6678_defconfig
m68k                        m5407c3_defconfig
sh                               j2_defconfig
arm                        multi_v7_defconfig
sh                          rsk7264_defconfig
arm                        spear6xx_defconfig
m68k                           sun3_defconfig
sh                           se7619_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
arm                        keystone_defconfig
arm                           viper_defconfig
arc                          axs101_defconfig
powerpc                       maple_defconfig
nds32                             allnoconfig
sh                               allmodconfig
um                               alldefconfig
arm                            qcom_defconfig
powerpc                    amigaone_defconfig
nios2                         10m50_defconfig
arm                         s3c6400_defconfig
openrisc                            defconfig
arc                           tb10x_defconfig
arm                        mvebu_v7_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
s390                       zfcpdump_defconfig
s390                             allyesconfig
arm                       cns3420vb_defconfig
arm                        spear3xx_defconfig
i386                              allnoconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a011-20200531
x86_64               randconfig-a016-20200531
x86_64               randconfig-a012-20200531
x86_64               randconfig-a014-20200531
x86_64               randconfig-a013-20200531
x86_64               randconfig-a015-20200531
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
