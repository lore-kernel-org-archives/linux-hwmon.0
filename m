Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D13C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 16 Jul 2022 06:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbiGPGb4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 16 Jul 2022 02:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiGPGbf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 16 Jul 2022 02:31:35 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34F4988CFF
        for <linux-hwmon@vger.kernel.org>; Fri, 15 Jul 2022 23:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657953067; x=1689489067;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=o5Y7FxzR5OY2dKXveOZhbEs9YR5IkQE3J0B3L5ecKJk=;
  b=hEra+dn7o77QCmJrdkJ/5XKKTcuIl2vNOfmWazsRQ0V4sagdqim5fHUJ
   uc+U/41HjcbPJHblPrqPvaDFCdJNAPMStrLJGs62AARBbU+eQ0+1R6jga
   ovFlstX3ebzA72/Wvh7U7DJWoc7z/LbC8Ok4b4YvTVkGY8kMyccuta5Yc
   1iakpN1V7eVpP7HKGlLi6UUAKmeiIRtAfjAdqBZdujZL3xRuvF+MiS+uz
   voDjOgZlBzb6iDzRSAj0UogMWpuF+LnIlvhy1GmsItH49KWNbQUmzu4D+
   HdXK6+1kYxo8mynHTYj2cZX+OSYIlU7iaE/JygfbPERqK/2QWlG+RTw+X
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10409"; a="286688731"
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="286688731"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2022 23:31:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,275,1650956400"; 
   d="scan'208";a="686205682"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2022 23:31:00 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oCbKO-0001E2-9G;
        Sat, 16 Jul 2022 06:31:00 +0000
Date:   Sat, 16 Jul 2022 14:30:20 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 03508eea538557b4f61bf1df2e842d252cb9a6e6
Message-ID: <62d25afc.UTglI+9sLSFOyRef%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 03508eea538557b4f61bf1df2e842d252cb9a6e6  hwmon: (mcp3021) improve driver support for newer hwmon interface

elapsed time: 721m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                      footbridge_defconfig
xtensa                              defconfig
openrisc                    or1ksim_defconfig
arm                        mvebu_v7_defconfig
powerpc                 mpc85xx_cds_defconfig
parisc                generic-32bit_defconfig
arm                           u8500_defconfig
sh                          urquell_defconfig
s390                       zfcpdump_defconfig
m68k                             alldefconfig
mips                           jazz_defconfig
arm                          simpad_defconfig
arm                       multi_v4t_defconfig
powerpc                     ep8248e_defconfig
sh                        sh7763rdp_defconfig
mips                    maltaup_xpa_defconfig
mips                      loongson3_defconfig
arm                        keystone_defconfig
powerpc                      tqm8xx_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     tqm8555_defconfig
sh                        sh7785lcr_defconfig
mips                            ar7_defconfig
sh                         ecovec24_defconfig
m68k                        m5307c3_defconfig
ia64                             alldefconfig
openrisc                 simple_smp_defconfig
sh                           se7721_defconfig
m68k                        mvme147_defconfig
sh                          polaris_defconfig
powerpc                  storcenter_defconfig
arc                            hsdk_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
i386                             allyesconfig
arm                    vt8500_v6_v7_defconfig
mips                      pic32mzda_defconfig
mips                           mtx1_defconfig
powerpc                      ppc64e_defconfig
arm                       aspeed_g4_defconfig
arm                          moxart_defconfig
powerpc                     ppa8548_defconfig
mips                      maltaaprp_defconfig
arm                        mvebu_v5_defconfig
arm                         bcm2835_defconfig
powerpc                    socrates_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                       netwinder_defconfig
mips                       lemote2f_defconfig
powerpc                    ge_imp3a_defconfig
arm                   milbeaut_m10v_defconfig
arm                          collie_defconfig
mips                     cu1830-neo_defconfig
powerpc                      obs600_defconfig
arm                            dove_defconfig
x86_64                        randconfig-k001
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
hexagon              randconfig-r045-20220715
s390                 randconfig-r044-20220715
hexagon              randconfig-r041-20220715
riscv                randconfig-r042-20220715
hexagon              randconfig-r045-20220716
hexagon              randconfig-r041-20220716

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
