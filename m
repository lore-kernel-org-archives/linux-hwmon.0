Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65231C433DB
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Feb 2021 04:02:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CD9A64E4E
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Feb 2021 04:02:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhBNEC0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Feb 2021 23:02:26 -0500
Received: from mga14.intel.com ([192.55.52.115]:54982 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229485AbhBNECZ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Feb 2021 23:02:25 -0500
IronPort-SDR: AUeg4tjp5rrj9CAp13nD1Sy8vm/27ux4XCpTMh0PJloeqtGVGClrlUe43T0KHDxVcWLWDq3WjB
 9+4e+OEOYycA==
X-IronPort-AV: E=McAfee;i="6000,8403,9894"; a="181780781"
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; 
   d="scan'208";a="181780781"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2021 20:01:38 -0800
IronPort-SDR: sbiMLt++FagnQ6+IhX0VLfzgNZiqC0z5TaIkve/Rw6YTeAfAG7w2kyUV1B9Dm3FT/ZG/IPCRVY
 iQg4szwsru8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,176,1610438400"; 
   d="scan'208";a="400287840"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 13 Feb 2021 20:01:36 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lB8bI-0006LR-6m; Sun, 14 Feb 2021 04:01:36 +0000
Date:   Sun, 14 Feb 2021 12:00:35 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 6ab3332cc692ad04dfa30c92d3391aea8b971ef2
Message-ID: <6028a063.3B+WWkkb8QZtOQmw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6ab3332cc692ad04dfa30c92d3391aea8b971ef2  MAINTAINERS: Add entry for Texas Instruments TPS23861 PoE PSE

elapsed time: 726m

configs tested: 95
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    socrates_defconfig
powerpc                        fsp2_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc836x_mds_defconfig
mips                malta_kvm_guest_defconfig
sparc                               defconfig
sparc                            alldefconfig
xtensa                          iss_defconfig
sh                           se7721_defconfig
m68k                       m5208evb_defconfig
powerpc                      makalu_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7206_defconfig
arm                             mxs_defconfig
powerpc                     rainier_defconfig
arm                          collie_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210214
x86_64               randconfig-a002-20210214
x86_64               randconfig-a001-20210214
x86_64               randconfig-a004-20210214
x86_64               randconfig-a005-20210214
x86_64               randconfig-a006-20210214
i386                 randconfig-a003-20210214
i386                 randconfig-a005-20210214
i386                 randconfig-a002-20210214
i386                 randconfig-a006-20210214
i386                 randconfig-a004-20210214
i386                 randconfig-a001-20210214
i386                 randconfig-a016-20210214
i386                 randconfig-a014-20210214
i386                 randconfig-a012-20210214
i386                 randconfig-a013-20210214
i386                 randconfig-a011-20210214
i386                 randconfig-a015-20210214
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20210214
x86_64               randconfig-a013-20210214
x86_64               randconfig-a012-20210214
x86_64               randconfig-a015-20210214
x86_64               randconfig-a014-20210214
x86_64               randconfig-a011-20210214

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
