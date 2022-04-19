Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770F5C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 19 Apr 2022 03:53:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiDSD4G (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Apr 2022 23:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbiDSD4F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Apr 2022 23:56:05 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61FD31C108
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Apr 2022 20:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650340404; x=1681876404;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t8w1itp6bq6WT2QHkur33Bom+bUZPi20L5a8ud84UkQ=;
  b=HoJRtVvp8MtUV+/0vKnYm1vklbLk0fM9n3TQ1hEZAa6bDCbL/c8q4E7o
   BbgmA7nBHcQDZzS52NKLT12uZ6nST6I1IRtfzlmk8B90qepmfDhRlIO7B
   13EzBwESGK3KBu9grzYr0CWb0PG/waaDBFAQrXmXCsOpZNqu8GWB4FU6s
   0/gm5+Rdvg5NW19LUMQ+K/C41D+D2FyM5AUilyuvNdfHNxURmCfpO9fb8
   lxGLnNfZeGW/4qHX7rAkgqDIjVcnFe3D9A7jHLjcdi+ymGOIdERGceHEQ
   xiMjgF8FuYUNzW4BLh11ZD6AUcuzaOr9S8j3Ug1QxM/ldyd0B/p1Kh1Kp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="244252035"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="244252035"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 20:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="529135815"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2022 20:53:22 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1ngevZ-0005JK-V1;
        Tue, 19 Apr 2022 03:53:21 +0000
Date:   Tue, 19 Apr 2022 11:52:38 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 4aaaaf0f279836f06d3b9d0ffeec7a1e1a04ceef
Message-ID: <625e3206.oXd2ujaNklbshbwr%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 4aaaaf0f279836f06d3b9d0ffeec7a1e1a04ceef  hwmon: (f71882fg) Fix negative temperature

elapsed time: 729m

configs tested: 167
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                               defconfig
mips                 randconfig-c004-20220418
i386                 randconfig-c001-20220418
i386                          randconfig-c001
m68k                       m5208evb_defconfig
mips                     decstation_defconfig
powerpc                      ep88xc_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
arm                          exynos_defconfig
arm                          simpad_defconfig
xtensa                  cadence_csp_defconfig
sparc                       sparc32_defconfig
mips                            ar7_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc834x_mds_defconfig
sparc                       sparc64_defconfig
powerpc                 mpc8540_ads_defconfig
sh                     magicpanelr2_defconfig
nios2                               defconfig
sh                           sh2007_defconfig
arm                             ezx_defconfig
powerpc                     tqm8555_defconfig
openrisc                    or1ksim_defconfig
powerpc                         wii_defconfig
mips                       bmips_be_defconfig
sh                          landisk_defconfig
arm                        shmobile_defconfig
sparc64                          alldefconfig
ia64                          tiger_defconfig
mips                       capcella_defconfig
m68k                          amiga_defconfig
sh                 kfr2r09-romimage_defconfig
microblaze                      mmu_defconfig
parisc                           alldefconfig
xtensa                  nommu_kc705_defconfig
sh                          rsk7203_defconfig
arm                            zeus_defconfig
powerpc                     mpc83xx_defconfig
m68k                          hp300_defconfig
sh                            hp6xx_defconfig
powerpc                      pasemi_defconfig
mips                         cobalt_defconfig
mips                           gcw0_defconfig
powerpc                 canyonlands_defconfig
nios2                            alldefconfig
s390                       zfcpdump_defconfig
powerpc64                        alldefconfig
sh                        edosk7760_defconfig
sh                        apsh4ad0a_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                             allyesconfig
arc                    vdk_hs38_smp_defconfig
openrisc                            defconfig
arm                           h3600_defconfig
arm                  randconfig-c002-20220417
arm                  randconfig-c002-20220418
x86_64               randconfig-c001-20220418
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
csky                                defconfig
nios2                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20220418
x86_64               randconfig-a004-20220418
x86_64               randconfig-a006-20220418
x86_64               randconfig-a001-20220418
x86_64               randconfig-a002-20220418
x86_64               randconfig-a005-20220418
i386                 randconfig-a004-20220418
i386                 randconfig-a001-20220418
i386                 randconfig-a003-20220418
i386                 randconfig-a005-20220418
i386                 randconfig-a006-20220418
i386                 randconfig-a002-20220418
riscv                randconfig-r042-20220419
arc                  randconfig-r043-20220419
s390                 randconfig-r044-20220419
arc                  randconfig-r043-20220418
arc                  randconfig-r043-20220417
s390                 randconfig-r044-20220417
riscv                randconfig-r042-20220417
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220417
arm                  randconfig-c002-20220417
i386                          randconfig-c001
riscv                randconfig-c006-20220417
powerpc              randconfig-c003-20220418
arm                  randconfig-c002-20220418
riscv                randconfig-c006-20220418
x86_64               randconfig-c007-20220418
mips                 randconfig-c004-20220418
i386                 randconfig-c001-20220418
mips                        maltaup_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                  colibri_pxa270_defconfig
mips                     cu1000-neo_defconfig
mips                            e55_defconfig
arm                           spitz_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     kmeter1_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a016-20220418
x86_64               randconfig-a012-20220418
x86_64               randconfig-a013-20220418
x86_64               randconfig-a014-20220418
x86_64               randconfig-a015-20220418
x86_64               randconfig-a011-20220418
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                 randconfig-a011-20220418
i386                 randconfig-a015-20220418
i386                 randconfig-a016-20220418
i386                 randconfig-a012-20220418
i386                 randconfig-a013-20220418
i386                 randconfig-a014-20220418
riscv                randconfig-r042-20220418
hexagon              randconfig-r041-20220417
hexagon              randconfig-r041-20220418
hexagon              randconfig-r045-20220417
hexagon              randconfig-r045-20220418
s390                 randconfig-r044-20220418

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
