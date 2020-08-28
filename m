Return-Path: <SRS0=3rXj=CG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9352C433E2
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Aug 2020 07:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AE0020C56
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 Aug 2020 07:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728218AbgH1H72 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 Aug 2020 03:59:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:41635 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726834AbgH1H72 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Aug 2020 03:59:28 -0400
IronPort-SDR: QCDwXopo+XntIPU1YOIc/1K5/5RZ3mZuVo5b+27X29ipgSxulrC006HA/1dJgtmltiYlvWVWcU
 5ujmvPLUQJDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="241440770"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; 
   d="scan'208";a="241440770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 00:59:26 -0700
IronPort-SDR: FRdvD6YPQv4EVkVOp0Tsi//uhcrrsnRVBkpBAVN6AgEdDk/UAD1qVh93P6oe3j0svg7hEPUbWu
 6Z0+V+ux826Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,362,1592895600"; 
   d="scan'208";a="337436039"
Received: from lkp-server01.sh.intel.com (HELO 4f455964fc6c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2020 00:59:25 -0700
Received: from kbuild by 4f455964fc6c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kBZID-0002Zm-9J; Fri, 28 Aug 2020 07:59:25 +0000
Date:   Fri, 28 Aug 2020 15:59:14 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 97568defeee16fc48e4936787f865d61c6f0f136
Message-ID: <5f48b952.mYjBy0ZYQfHc+XIP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon-next
branch HEAD: 97568defeee16fc48e4936787f865d61c6f0f136  hwmon: (k10temp) Define SVI telemetry and current factors for Zen2 CPUs

elapsed time: 723m

configs tested: 110
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                ecovec24-romimage_defconfig
arm                      pxa255-idp_defconfig
mips                           ip32_defconfig
sh                           se7721_defconfig
mips                         bigsur_defconfig
sh                   sh7770_generic_defconfig
arm                          iop32x_defconfig
c6x                              alldefconfig
arm                          pxa168_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
m68k                        m5272c3_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
sparc64                          alldefconfig
powerpc                mpc7448_hpc2_defconfig
arc                           tb10x_defconfig
sh                        sh7757lcr_defconfig
mips                      maltaaprp_defconfig
arm                    vt8500_v6_v7_defconfig
arc                              allyesconfig
sh                             sh03_defconfig
arm                         mv78xx0_defconfig
m68k                       m5275evb_defconfig
mips                       rbtx49xx_defconfig
arm                        neponset_defconfig
sh                     magicpanelr2_defconfig
sh                          sdk7780_defconfig
c6x                         dsk6455_defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
c6x                        evmc6678_defconfig
sparc                               defconfig
arc                    vdk_hs38_smp_defconfig
sh                        apsh4ad0a_defconfig
arm                         at91_dt_defconfig
sh                          kfr2r09_defconfig
arm                          pcm027_defconfig
powerpc                      ppc6xx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200827
i386                 randconfig-a004-20200827
i386                 randconfig-a003-20200827
i386                 randconfig-a005-20200827
i386                 randconfig-a006-20200827
i386                 randconfig-a001-20200827
i386                 randconfig-a013-20200827
i386                 randconfig-a012-20200827
i386                 randconfig-a011-20200827
i386                 randconfig-a016-20200827
i386                 randconfig-a015-20200827
i386                 randconfig-a014-20200827
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
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
