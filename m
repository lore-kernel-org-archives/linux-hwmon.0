Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CE3C43334
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 08:17:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbiFGIRW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237997AbiFGIRV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 04:17:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FC46578
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 01:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654589839; x=1686125839;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ev1ivl8BOv8RjH3A+Bp8Ui8w16PVgmiDorsaLzzI3O8=;
  b=TDkD6ZTT3mmRcN5PdIKlClsjoy0wEwAiIhtoNALbM9IkD91XwgkvqWtm
   rqbIVpRoGb83N5nI9UHRaW9xgZ88BMORMW6KJPBPppDbfMObKZvRD0SQT
   CcuzkPQKie5squmr6sTI7EmiAVEpVzH/DRZMPrBGZBBeSFJydj+QwnmsL
   Y/NHiC3ShNCe1IqD+JfihQqPQXUl8iL1T3GMXXN5ExdlB1gkx7sEK61DZ
   /W0TD+q2RjECWkzz1CZqhRRlpo9BwnG6ePWy4Zjgii/ARPjK44HptJrKi
   yRgEbwazq1Tz5MZXscrdUYxRY3KRAlCE4eG0M/4LDiPhcgrFSCBpXgQZg
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="340362751"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="340362751"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 01:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="723229435"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jun 2022 01:16:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nyUON-000DVK-8l;
        Tue, 07 Jun 2022 08:16:47 +0000
Date:   Tue, 07 Jun 2022 16:16:32 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 158e7077b4e059b095b54d19dffed9023d2a6254
Message-ID: <629f0960.01pzBUvM02beDg3+%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 158e7077b4e059b095b54d19dffed9023d2a6254  watchdog: gxp: Add missing MODULE_LICENSE

elapsed time: 1801m

configs tested: 150
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
i386                          randconfig-c001
m68k                         amcore_defconfig
arm                          pxa3xx_defconfig
sh                   rts7751r2dplus_defconfig
sh                         ap325rxa_defconfig
arc                     haps_hs_smp_defconfig
xtensa                generic_kc705_defconfig
arc                      axs103_smp_defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
arm                       aspeed_g5_defconfig
arm                         at91_dt_defconfig
mips                           ip32_defconfig
um                             i386_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                       ppc64_defconfig
arm                           sunxi_defconfig
powerpc                     redwood_defconfig
sh                            migor_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     taishan_defconfig
sh                            shmin_defconfig
sh                           se7750_defconfig
sh                          sdk7786_defconfig
arm                        mvebu_v7_defconfig
ia64                        generic_defconfig
powerpc                    sam440ep_defconfig
powerpc                      chrp32_defconfig
nios2                         10m50_defconfig
arc                          axs103_defconfig
powerpc                     rainier_defconfig
arc                            hsdk_defconfig
arm                            qcom_defconfig
openrisc                    or1ksim_defconfig
m68k                        m5407c3_defconfig
s390                             allmodconfig
sh                            hp6xx_defconfig
sh                          rsk7203_defconfig
sh                          rsk7269_defconfig
m68k                          sun3x_defconfig
powerpc                     ep8248e_defconfig
sh                           se7724_defconfig
powerpc                      tqm8xx_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220605
riscv                             allnoconfig
h8300                            allyesconfig
m68k                             allyesconfig
xtensa                           allyesconfig
m68k                             allmodconfig
csky                                defconfig
arc                                 defconfig
mips                             allyesconfig
nios2                            allyesconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
alpha                            allyesconfig
mips                             allmodconfig
sh                               allmodconfig
parisc                              defconfig
riscv                    nommu_k210_defconfig
riscv                            allmodconfig
riscv                            allyesconfig
parisc                           allyesconfig
parisc64                            defconfig
riscv                               defconfig
s390                                defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             allyesconfig
sparc                               defconfig
powerpc                          allyesconfig
i386                             allyesconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
sparc                            allyesconfig
powerpc                          allmodconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
ia64                             allmodconfig
arm64                               defconfig
ia64                             allyesconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
ia64                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a008
i386                          randconfig-a009
i386                          randconfig-a010
i386                          randconfig-a007
x86_64                        randconfig-a006
i386                          randconfig-a012
i386                 randconfig-a011-20220606
i386                 randconfig-a010-20220606
x86_64               randconfig-a011-20220606
x86_64               randconfig-a012-20220606
i386                 randconfig-a012-20220606
x86_64               randconfig-a010-20220606
x86_64                    rhel-8.3-kselftests
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220606
riscv                randconfig-c006-20220606
s390                 randconfig-c005-20220606
i386                 randconfig-c001-20220606
mips                 randconfig-c004-20220606
x86_64               randconfig-c007-20220606
arm                  randconfig-c002-20220606
powerpc                      walnut_defconfig
mips                        omega2p_defconfig
powerpc                   microwatt_defconfig
powerpc                 mpc8272_ads_defconfig
arm                                 defconfig
mips                           rs90_defconfig
arm                         s3c2410_defconfig
mips                     loongson1c_defconfig
powerpc                     akebono_defconfig
arm                  colibri_pxa300_defconfig
arm64                            allyesconfig
mips                           ip27_defconfig
mips                        maltaup_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                         orion5x_defconfig
powerpc                          g5_defconfig
mips                          malta_defconfig
i386                          randconfig-a002
x86_64                        randconfig-a009
x86_64                        randconfig-a007
i386                          randconfig-a006
x86_64                        randconfig-a010
i386                          randconfig-a011
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a008
i386                          randconfig-a004
x86_64                        randconfig-a012

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
