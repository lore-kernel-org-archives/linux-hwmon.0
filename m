Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF45AC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun, 20 Feb 2022 21:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245066AbiBTVVP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Feb 2022 16:21:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244172AbiBTVVP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Feb 2022 16:21:15 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45EC4BFF9
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Feb 2022 13:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645392053; x=1676928053;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qqJfKIgBbk2U2LART7CzGh8a0+HVF2Ehz7AboIpnURw=;
  b=SZaiAU24K6ODhoWybzJyV3qNgNg5Q3H5sBGcDQw6lylS8NCSrlJuxVtV
   QdYiDUbYQBaB4646PLgaQ2AliF9G7h/E++AjSc4krVSJWGpziPCx8gXjE
   e/PucvdvBF5k/vJTScgfCxaOZ779EqZ5UgKKTjFmXT+bIQ7aHepzZyYnO
   yuoEp02et3YLygUxg+zFJoiapMeZJzLt6lI+q8VfAwiKXsWCVOJHkE0tZ
   N4aGuNApJNZak+VqRuB8oKJw9ip6co0y2aQjM5aTqZ5EVBWfPs5QjV/Dx
   WuS8Sofwp49eaSFxvuCEvkQ8ZZYL7P4hOFfKaQGLiBrW1gqAsPdkP0E7N
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="275993341"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="275993341"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 13:20:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="683019963"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2022 13:20:52 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nLtdU-0000me-1X; Sun, 20 Feb 2022 21:20:52 +0000
Date:   Mon, 21 Feb 2022 05:20:27 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 1f2d6895d0828a5a7bd1f1b42262b83b1b7d38b4
Message-ID: <6212b09b.jTAodDmYs6wd2h5u%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 1f2d6895d0828a5a7bd1f1b42262b83b1b7d38b4  hwmon: (dell-smm) Improve temperature sensors detection

elapsed time: 731m

configs tested: 110
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
sh                          landisk_defconfig
powerpc                     redwood_defconfig
arm                          badge4_defconfig
arm                         lpc18xx_defconfig
powerpc                     pq2fads_defconfig
mips                             allyesconfig
ia64                         bigsur_defconfig
mips                      maltasmvp_defconfig
xtensa                    smp_lx200_defconfig
xtensa                          iss_defconfig
powerpc                      ppc40x_defconfig
arm                       multi_v4t_defconfig
powerpc                    klondike_defconfig
m68k                        m5272c3_defconfig
xtensa                              defconfig
powerpc                      pcm030_defconfig
mips                       bmips_be_defconfig
h8300                            alldefconfig
nios2                         10m50_defconfig
arm                         lubbock_defconfig
sh                         ecovec24_defconfig
mips                           xway_defconfig
mips                      loongson3_defconfig
um                           x86_64_defconfig
sh                           se7751_defconfig
arm                            zeus_defconfig
sh                        sh7763rdp_defconfig
powerpc                      bamboo_defconfig
nds32                               defconfig
powerpc                      ppc6xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220220
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
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
powerpc                           allnoconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
powerpc              randconfig-c003-20220220
x86_64                        randconfig-c007
arm                  randconfig-c002-20220220
mips                 randconfig-c004-20220220
i386                          randconfig-c001
riscv                randconfig-c006-20220220
powerpc                    mvme5100_defconfig
powerpc                        fsp2_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     mpc5200_defconfig
powerpc                     kilauea_defconfig
mips                        workpad_defconfig
powerpc                   bluestone_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220220
hexagon              randconfig-r041-20220220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
