Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6198DC433ED
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 02:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30D3B613A9
	for <linux-hwmon@archiver.kernel.org>; Tue, 13 Apr 2021 02:55:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238431AbhDMCz6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Apr 2021 22:55:58 -0400
Received: from mga18.intel.com ([134.134.136.126]:17945 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237626AbhDMCz5 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 22:55:57 -0400
IronPort-SDR: OhVCZlmWZiAfJ8RbtSTfUQz3CTnEGPh0pOj2wHEl4U2XP+C5T8C3inu5em57fS/q8nxKGKnWnl
 7GKX4q/oMPQg==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="181844220"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="181844220"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 19:55:38 -0700
IronPort-SDR: qZN2m5WVQIYVKSlQd2Qhrm2ow71658jmNExiArbihBp201WkEMG8lctHCBBLH+wMlyHYVpNIw8
 v6wnoDg5HwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="383150463"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Apr 2021 19:55:37 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lW9DE-0000m7-Fs; Tue, 13 Apr 2021 02:55:36 +0000
Date:   Tue, 13 Apr 2021 10:55:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon-next] BUILD SUCCESS
 37c8f621125f74e606208368358c77000f39ba18
Message-ID: <60750808.86ojqRimm59ZMH0V%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 37c8f621125f74e606208368358c77000f39ba18  hwmon: (dell-smm) Add Dell Latitude E7440 to fan control whitelist

elapsed time: 726m

configs tested: 116
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
powerpc                        fsp2_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc836x_mds_defconfig
i386                                defconfig
m68k                                defconfig
openrisc                         alldefconfig
ia64                                defconfig
mips                          rm200_defconfig
powerpc                     skiroot_defconfig
um                                  defconfig
arm                            mps2_defconfig
arm                         s3c6400_defconfig
arm                            mmp2_defconfig
m68k                       m5275evb_defconfig
powerpc                     mpc512x_defconfig
arm                           sunxi_defconfig
arm                  colibri_pxa300_defconfig
powerpc                    ge_imp3a_defconfig
sh                             espt_defconfig
arm                        trizeps4_defconfig
sh                          urquell_defconfig
powerpc                 linkstation_defconfig
mips                      malta_kvm_defconfig
arm                             rpc_defconfig
powerpc                      ppc64e_defconfig
arm                        oxnas_v6_defconfig
h8300                     edosk2674_defconfig
arm                         bcm2835_defconfig
powerpc                     ep8248e_defconfig
openrisc                            defconfig
powerpc                      makalu_defconfig
powerpc                     powernv_defconfig
sh                          r7785rp_defconfig
powerpc                      arches_defconfig
powerpc                      obs600_defconfig
mips                      bmips_stb_defconfig
sh                           sh2007_defconfig
sh                           se7619_defconfig
arm                          pxa910_defconfig
powerpc                       maple_defconfig
um                                allnoconfig
m68k                         apollo_defconfig
arm                        multi_v5_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
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
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210412
i386                 randconfig-a001-20210412
i386                 randconfig-a006-20210412
i386                 randconfig-a005-20210412
i386                 randconfig-a004-20210412
i386                 randconfig-a002-20210412
x86_64               randconfig-a014-20210412
x86_64               randconfig-a015-20210412
x86_64               randconfig-a011-20210412
x86_64               randconfig-a013-20210412
x86_64               randconfig-a012-20210412
x86_64               randconfig-a016-20210412
i386                 randconfig-a015-20210412
i386                 randconfig-a014-20210412
i386                 randconfig-a013-20210412
i386                 randconfig-a012-20210412
i386                 randconfig-a016-20210412
i386                 randconfig-a011-20210412
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210412
x86_64               randconfig-a002-20210412
x86_64               randconfig-a001-20210412
x86_64               randconfig-a005-20210412
x86_64               randconfig-a006-20210412
x86_64               randconfig-a004-20210412

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
