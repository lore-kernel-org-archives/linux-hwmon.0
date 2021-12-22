Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BA4C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 15:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237709AbhLVP2z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Dec 2021 10:28:55 -0500
Received: from mga18.intel.com ([134.134.136.126]:48269 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233787AbhLVP2z (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Dec 2021 10:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640186934; x=1671722934;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hdwBDHbnG0X7Q/XxhTeDn1rDz+265uxI3p5aThMKqiw=;
  b=BHM+FeuLqE0FnxKlEcPlVqluzFNYLn1hNpxRlg/Ed0rKWhcPHEc8tIrE
   BUQGeBzDXcvxeKmhbY8KjwrlIDNFPDIOheuDJCJyKWhdAIUny+F9PZq17
   PrytJerY6Lz0DfssOQEEH1hLwXcSq0iXgxPM6N2w2NnME9LOOGZ4kdPQG
   r6FfPgZY2LF9gH/wHXfQ98hFFnrlgRDblgg2GfyhjCQqLrb42wZYwAPbb
   zJ0E+wPbzi6eVygG8cdKnNTjPHopYipbDv6NC6SuM8+sURmPowXHPFhfh
   XHKKPk4VgiuOww0iz2EIGQoVg424pWIU9fLm0G9XRaRgUfwjLlJRA5Dzf
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227491275"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="227491275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 07:28:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="549511067"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Dec 2021 07:28:53 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n03Xw-0000hl-JM; Wed, 22 Dec 2021 15:28:52 +0000
Date:   Wed, 22 Dec 2021 23:27:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 01b619f3c6399948f118d5f2886a44e517d1606b
Message-ID: <61c343fc.vqw+AW0Y7W4brq/I%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 01b619f3c6399948f118d5f2886a44e517d1606b  hwmon: (dell-smm) Pack the whole smm_regs struct

elapsed time: 1165m

configs tested: 159
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211222
arm                       aspeed_g4_defconfig
m68k                         apollo_defconfig
powerpc                     pseries_defconfig
parisc                              defconfig
arm                         shannon_defconfig
openrisc                  or1klitex_defconfig
mips                            gpr_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
microblaze                          defconfig
powerpc                     tqm8541_defconfig
sh                          r7780mp_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
arm                             pxa_defconfig
sh                          rsk7203_defconfig
m68k                       m5249evb_defconfig
arm64                            alldefconfig
powerpc                      katmai_defconfig
arm                  colibri_pxa300_defconfig
sh                          landisk_defconfig
xtensa                  audio_kc705_defconfig
sh                            shmin_defconfig
mips                        vocore2_defconfig
arm                         cm_x300_defconfig
powerpc                       ebony_defconfig
arm                            pleb_defconfig
xtensa                          iss_defconfig
mips                           ip32_defconfig
m68k                             allyesconfig
mips                          rm200_defconfig
mips                       bmips_be_defconfig
mips                        bcm47xx_defconfig
sh                             shx3_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
powerpc                      chrp32_defconfig
arm                            qcom_defconfig
powerpc                      mgcoge_defconfig
sh                            titan_defconfig
powerpc                       ppc64_defconfig
xtensa                           alldefconfig
sh                               j2_defconfig
arm                          exynos_defconfig
ia64                      gensparse_defconfig
arm                    vt8500_v6_v7_defconfig
xtensa                generic_kc705_defconfig
arm                         socfpga_defconfig
arm                            dove_defconfig
xtensa                  cadence_csp_defconfig
powerpc                    amigaone_defconfig
m68k                          amiga_defconfig
powerpc                     tqm8555_defconfig
alpha                               defconfig
openrisc                    or1ksim_defconfig
powerpc                       maple_defconfig
powerpc                    mvme5100_defconfig
sh                   sh7770_generic_defconfig
mips                      loongson3_defconfig
ia64                         bigsur_defconfig
m68k                          multi_defconfig
arm                  randconfig-c002-20211222
arm                  randconfig-c002-20211220
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211222
x86_64               randconfig-a003-20211222
x86_64               randconfig-a005-20211222
x86_64               randconfig-a006-20211222
x86_64               randconfig-a004-20211222
x86_64               randconfig-a002-20211222
i386                 randconfig-a006-20211222
i386                 randconfig-a004-20211222
i386                 randconfig-a002-20211222
i386                 randconfig-a003-20211222
i386                 randconfig-a001-20211222
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a006-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a005-20211222
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a002-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
i386                 randconfig-a006-20211221
i386                 randconfig-a004-20211221
i386                 randconfig-a002-20211221
i386                 randconfig-a003-20211221
i386                 randconfig-a005-20211221
i386                 randconfig-a001-20211221
i386                 randconfig-a012-20211222
i386                 randconfig-a011-20211222
i386                 randconfig-a014-20211222
i386                 randconfig-a016-20211222
i386                 randconfig-a015-20211222
i386                 randconfig-a013-20211222
hexagon              randconfig-r041-20211222
hexagon              randconfig-r045-20211222
riscv                randconfig-r042-20211222
s390                 randconfig-r044-20211222
hexagon              randconfig-r041-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
