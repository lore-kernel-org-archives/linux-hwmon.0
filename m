Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6432C4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Mar 2022 15:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233084AbiCJPha (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbiCJPh3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Mar 2022 10:37:29 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D85D16AA60
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Mar 2022 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646926588; x=1678462588;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u0lKqP9JXiz4WJBFFP1fX3YlwgsutnpMyFZM9ak5aQs=;
  b=BIIAWpEHYSSKF+DxZuEy8vO2wTFBxilCqUd2Xt9/KG75BGFPAOlk9+Nn
   WCo3xdh+AwE7HwTjV63pBjaZiB3V+wmWfT4bqdlOm7WSAuspHVxbILg05
   trCK+0v7ZMC+971HRMRaq/naxe8NbqQNJK49+3xAZvKohjKcZPdoV0Qku
   JFMYmW/2vO4sjTmWbcxVkJ0Rttpp5kytjvYasBmLUaV983oVt8EkE09IX
   mGr0jvYvsI+UHyPFcG/Mfa02H7YH6YxTNCV0fC012nOkMLYaR+57IZ6YN
   rGRg8c4nj9q9/w/GNZCt2r0w7ArjKnymt4yJUYxkIdx9AT4PpFtvwraEs
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255226076"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="255226076"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 07:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="642597446"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 10 Mar 2022 07:36:26 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSKq1-000542-OX; Thu, 10 Mar 2022 15:36:25 +0000
Date:   Thu, 10 Mar 2022 23:35:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD REGRESSION
 b6447e51682d2d364b82ba35606888e39251dfcf
Message-ID: <622a1ad7.Q+sQJmkJGkEnRQOe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: b6447e51682d2d364b82ba35606888e39251dfcf  dt-bindings: watchdog: renesas,wdt: Document RZ/V2L SoC

Error/Warning reports:

https://lore.kernel.org/llvm/202203101530.3l4W0JyC-lkp@intel.com

Error/Warning:

drivers/watchdog/mtk_wdt.c:13:10: fatal error: 'dt-bindings/reset/mt7986-resets.h' file not found

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-r001-20220310
|   `-- drivers-watchdog-mtk_wdt.c:fatal-error:dt-bindings-reset-mt7986-resets.h-file-not-found
`-- arm64-randconfig-r024-20220310
    `-- drivers-watchdog-mtk_wdt.c:fatal-error:dt-bindings-reset-mt7986-resets.h-file-not-found

elapsed time: 731m

configs tested: 123
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
i386                          randconfig-c001
m68k                          atari_defconfig
alpha                            alldefconfig
sh                 kfr2r09-romimage_defconfig
ia64                      gensparse_defconfig
powerpc                    sam440ep_defconfig
arm                     eseries_pxa_defconfig
powerpc                      makalu_defconfig
powerpc64                           defconfig
sparc64                          alldefconfig
m68k                        stmark2_defconfig
h8300                       h8s-sim_defconfig
mips                            gpr_defconfig
mips                 decstation_r4k_defconfig
h8300                    h8300h-sim_defconfig
powerpc                  storcenter_defconfig
sh                           se7722_defconfig
m68k                        mvme16x_defconfig
arm                           h5000_defconfig
mips                     loongson1b_defconfig
um                               alldefconfig
xtensa                    xip_kc705_defconfig
m68k                                defconfig
sh                     magicpanelr2_defconfig
csky                                defconfig
powerpc                        warp_defconfig
ia64                         bigsur_defconfig
arm                        oxnas_v6_defconfig
arm                  randconfig-c002-20220310
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
alpha                            allyesconfig
alpha                               defconfig
nds32                               defconfig
nios2                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
parisc                              defconfig
s390                                defconfig
parisc64                            defconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                   debian-10.3-kselftests
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220310
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                          ixp4xx_defconfig
arm                        vexpress_defconfig
arm                          collie_defconfig
arm                            mmp2_defconfig
mips                        bcm63xx_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     ppa8548_defconfig
powerpc                      ppc44x_defconfig
arm                         shannon_defconfig
mips                        maltaup_defconfig
powerpc                     kmeter1_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220310
hexagon              randconfig-r041-20220310
s390                 randconfig-r044-20220310
riscv                randconfig-r042-20220310

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
