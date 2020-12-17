Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A83FC2BB9A
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Dec 2020 14:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDFA42360D
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Dec 2020 14:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgLQOCX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Dec 2020 09:02:23 -0500
Received: from mga07.intel.com ([134.134.136.100]:4150 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgLQOCX (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Dec 2020 09:02:23 -0500
IronPort-SDR: qvvUtNs6Lzl2e9yg4Jwqe9PSFRIIMkN7M/kW8Mh/sNIUjDBnZTmxGcXqcankO4D78O5i1hCpxO
 +iRM4V9TkPDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9837"; a="239343464"
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="239343464"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2020 06:01:42 -0800
IronPort-SDR: IBuVybKLEOnlMfDzH90zlEYDaaO8GpfbD3MCns+Cqhf6Nnpcegc2rLTDyWX3k+Xrd6ozFciktk
 VIAr8Y0dyTWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,428,1599548400"; 
   d="scan'208";a="339512658"
Received: from lkp-server02.sh.intel.com (HELO 070e1a605002) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2020 06:01:41 -0800
Received: from kbuild by 070e1a605002 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kptqe-0001ED-Cm; Thu, 17 Dec 2020 14:01:40 +0000
Date:   Thu, 17 Dec 2020 22:01:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [hwmon:hwmon] BUILD SUCCESS
 5a531c7907ab854b3b524e57cc5d1463bed38b45
Message-ID: <5fdb64b3.7bI8IaVifB3BAyc7%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git  hwmon
branch HEAD: 5a531c7907ab854b3b524e57cc5d1463bed38b45  hwmon: (k10temp) Remove support for displaying voltage and current on Zen CPUs

elapsed time: 805m

configs tested: 104
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                             allmodconfig
c6x                                 defconfig
mips                        jmr3927_defconfig
arm                       versatile_defconfig
arm                        magician_defconfig
xtensa                  nommu_kc705_defconfig
arm                         hackkit_defconfig
arm                         socfpga_defconfig
arm                        mvebu_v5_defconfig
m68k                          sun3x_defconfig
mips                       capcella_defconfig
mips                         rt305x_defconfig
powerpc                     pq2fads_defconfig
sh                         apsh4a3a_defconfig
arm                        keystone_defconfig
arm                         mv78xx0_defconfig
arm                       multi_v4t_defconfig
arm                            zeus_defconfig
arc                        vdk_hs38_defconfig
sh                          rsk7264_defconfig
powerpc                      katmai_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   bluestone_defconfig
mips                           mtx1_defconfig
ia64                          tiger_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
xtensa                       common_defconfig
arm                          pxa168_defconfig
mips                        nlm_xlp_defconfig
powerpc                       maple_defconfig
arm                         s3c6400_defconfig
sh                          sdk7786_defconfig
powerpc                     ppa8548_defconfig
powerpc                      ppc44x_defconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201217
x86_64               randconfig-a006-20201217
x86_64               randconfig-a002-20201217
x86_64               randconfig-a005-20201217
x86_64               randconfig-a004-20201217
x86_64               randconfig-a001-20201217
i386                 randconfig-a001-20201217
i386                 randconfig-a004-20201217
i386                 randconfig-a003-20201217
i386                 randconfig-a002-20201217
i386                 randconfig-a006-20201217
i386                 randconfig-a005-20201217
i386                 randconfig-a014-20201217
i386                 randconfig-a013-20201217
i386                 randconfig-a012-20201217
i386                 randconfig-a011-20201217
i386                 randconfig-a015-20201217
i386                 randconfig-a016-20201217
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                      rhel-8.3-kbuiltin
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
