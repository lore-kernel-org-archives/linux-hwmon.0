Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5EBC32771
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 08:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbiIZIvo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 04:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233764AbiIZIvo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 04:51:44 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FC127B2B
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 01:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664182302; x=1695718302;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XhL4Fr3bEcLW9SG6BvpMXwZk6a+zFE3nB4XBI8VKshs=;
  b=d3vYdrRGk06FGJrqSpGa1Bj1foiPVKvPEjmZGlxyYejmbcFZlAcr1nuV
   VKcnMfSQnYNgT+bfM2IPTN0YpESwL4Do1fHICeHzB2roAPmW5skfMZbYH
   65dsYinWWrmc6lCw84WbbaW5eORNAnyUurPcAkD6Nnz7lglI4DMpENEpq
   pp3lLy5mXlyzzNFPr3ePUQ9gXCAMc/hLSfIk7LmV4MhoLP1DuXg6GqicG
   rWxWndIjqFbu4s5Q/c4ZkB3eFfv3rISCx5VsKTbV5lT3zq/azgb/bctFK
   gQ9S2IJJZJplB87wQk9hkL8qCmG2rcBZytwCjwjf82hRpqo9zpt+BGFzQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="301877229"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="301877229"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 01:51:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10481"; a="949772439"
X-IronPort-AV: E=Sophos;i="5.93,345,1654585200"; 
   d="scan'208";a="949772439"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Sep 2022 01:51:40 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1ocjpz-0008qy-11;
        Mon, 26 Sep 2022 08:51:39 +0000
Date:   Mon, 26 Sep 2022 16:51:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:watchdog-next] BUILD SUCCESS
 56ea4d9659aa97ec37ce4788de99a4e831d36707
Message-ID: <63316807.MB2IUEf7X7GR2Xf6%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
branch HEAD: 56ea4d9659aa97ec37ce4788de99a4e831d36707  watchdog: sp5100_tco: Add "action" module parameter

elapsed time: 722m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
alpha                               defconfig
i386                                defconfig
i386                          randconfig-a014
i386                          randconfig-a012
um                           x86_64_defconfig
i386                          randconfig-a016
x86_64               randconfig-a002-20220926
x86_64                              defconfig
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a006-20220926
x86_64               randconfig-a005-20220926
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                 randconfig-a001-20220926
arm                                 defconfig
x86_64                               rhel-8.3
s390                                defconfig
i386                             allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20220926
s390                             allmodconfig
i386                 randconfig-a003-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
i386                 randconfig-a006-20220926
x86_64                           allyesconfig
i386                          randconfig-c001
ia64                             allmodconfig
powerpc                      ppc40x_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      chrp32_defconfig
sh                          rsk7203_defconfig
arm                        oxnas_v6_defconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
arc                  randconfig-r043-20220925
powerpc                          allmodconfig
alpha                            allyesconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
arc                              allyesconfig
riscv                randconfig-r042-20220925
m68k                             allyesconfig
m68k                             allmodconfig
arc                  randconfig-r043-20220926
s390                 randconfig-r044-20220925
powerpc                      makalu_defconfig
m68k                          sun3x_defconfig
riscv                    nommu_k210_defconfig
mips                     loongson1b_defconfig
arm                           sama5_defconfig
m68k                       bvme6000_defconfig
arm                          badge4_defconfig
arm64                            allyesconfig
arm                              allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220925
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
sparc                       sparc64_defconfig
openrisc                         alldefconfig
m68k                         amcore_defconfig
sparc64                             defconfig
microblaze                      mmu_defconfig
sh                           se7705_defconfig
arm                     eseries_pxa_defconfig
ia64                        generic_defconfig
arm                           h3600_defconfig
xtensa                          iss_defconfig
nios2                            alldefconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
sparc                               defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
arm64                               defconfig
ia64                             allyesconfig
arm                              allmodconfig
m68k                                defconfig
ia64                                defconfig
mips                             allmodconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64               randconfig-a012-20220926
x86_64               randconfig-a013-20220926
x86_64               randconfig-a011-20220926
x86_64               randconfig-a016-20220926
hexagon              randconfig-r045-20220925
x86_64               randconfig-a014-20220926
x86_64                        randconfig-k001
x86_64               randconfig-a015-20220926
hexagon              randconfig-r041-20220926
hexagon              randconfig-r045-20220926
hexagon              randconfig-r041-20220925
riscv                randconfig-r042-20220926
arm                       netwinder_defconfig
mips                     cu1000-neo_defconfig
s390                 randconfig-r044-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
