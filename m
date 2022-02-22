Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEF6C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Feb 2022 09:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbiBVJ27 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Feb 2022 04:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiBVJ26 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Feb 2022 04:28:58 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E184E153385
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Feb 2022 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645522113; x=1677058113;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zsciTfic/FjSvUzU8W+QlYE7Xz0iZ2dbLsAdpfHVj+E=;
  b=bd57YUv4r01pcDLohWNDILm1322/sXN79/hpKoNKhFJwvwAj8MNNLW4F
   xHw7tZFYEYZrbN0sgqDBkXFFwUzcce/VdjQJlwc7nmLbaq8qr7f4QA5ex
   du5HqGXvQ6qmgWcxqvMuBgSWk5LMnWmQ4ZvR3SAlc0NlE/sLjWBVatDRj
   4D1e3WveJoxasaia6+xarZ73GbNOJJrGPlW+EVegwuTyTB3mSD/IpcSn5
   IxtdxSdqnZFsb0ZZ+v539tjb5LtLr0BjNmXxHOkGNgyJz+CTu1IHHuBZ1
   9RXcft22S/Lc9FyYtZfQaxWTSzfX82D11v1aj5OgAJKfLVT5FO/YVgCIw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251418054"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="251418054"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 01:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="505471742"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Feb 2022 01:28:32 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nMRTD-00004R-J2; Tue, 22 Feb 2022 09:28:31 +0000
Date:   Tue, 22 Feb 2022 17:28:10 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 178ae2e431688a19793bb091cc4bcd6a43d3d7a9
Message-ID: <6214acaa./tUBce7DTtsmQFPc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 178ae2e431688a19793bb091cc4bcd6a43d3d7a9  hwmon: (dell-smm) Improve temperature sensors detection

elapsed time: 722m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220221
sh                 kfr2r09-romimage_defconfig
arm                           corgi_defconfig
ia64                             alldefconfig
sh                          kfr2r09_defconfig
powerpc                         wii_defconfig
sh                   rts7751r2dplus_defconfig
m68k                          hp300_defconfig
arm                            xcep_defconfig
xtensa                       common_defconfig
sh                           se7721_defconfig
alpha                            alldefconfig
sh                           se7724_defconfig
mips                             allyesconfig
arm                      jornada720_defconfig
m68k                       m5208evb_defconfig
s390                             allmodconfig
mips                       bmips_be_defconfig
m68k                        m5407c3_defconfig
s390                             allyesconfig
m68k                       m5475evb_defconfig
ia64                          tiger_defconfig
sh                             shx3_defconfig
powerpc                           allnoconfig
arm                         nhk8815_defconfig
arm                          pxa3xx_defconfig
powerpc                        warp_defconfig
sh                           sh2007_defconfig
arm                        clps711x_defconfig
arm                            pleb_defconfig
powerpc                       holly_defconfig
sh                   sh7770_generic_defconfig
xtensa                  cadence_csp_defconfig
powerpc                         ps3_defconfig
mips                        jmr3927_defconfig
microblaze                          defconfig
arm                  randconfig-c002-20220221
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220221
x86_64               randconfig-a002-20220221
x86_64               randconfig-a005-20220221
x86_64               randconfig-a006-20220221
x86_64               randconfig-a001-20220221
x86_64               randconfig-a004-20220221
i386                 randconfig-a002-20220221
i386                 randconfig-a001-20220221
i386                 randconfig-a005-20220221
i386                 randconfig-a003-20220221
i386                 randconfig-a006-20220221
i386                 randconfig-a004-20220221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220222
x86_64                        randconfig-c007
arm                  randconfig-c002-20220222
mips                 randconfig-c004-20220222
i386                          randconfig-c001
riscv                randconfig-c006-20220222
powerpc              randconfig-c003-20220221
x86_64               randconfig-c007-20220221
arm                  randconfig-c002-20220221
mips                 randconfig-c004-20220221
i386                 randconfig-c001-20220221
riscv                randconfig-c006-20220221
arm                  colibri_pxa300_defconfig
powerpc                      ppc44x_defconfig
x86_64               randconfig-a011-20220221
x86_64               randconfig-a015-20220221
x86_64               randconfig-a014-20220221
x86_64               randconfig-a016-20220221
x86_64               randconfig-a013-20220221
x86_64               randconfig-a012-20220221
i386                 randconfig-a016-20220221
i386                 randconfig-a012-20220221
i386                 randconfig-a015-20220221
i386                 randconfig-a011-20220221
i386                 randconfig-a014-20220221
i386                 randconfig-a013-20220221
hexagon              randconfig-r045-20220221
hexagon              randconfig-r041-20220221
riscv                randconfig-r042-20220221
hexagon              randconfig-r045-20220222
hexagon              randconfig-r041-20220222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
