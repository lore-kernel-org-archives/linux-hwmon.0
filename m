Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444E0C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 21 Dec 2021 11:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236858AbhLULAH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 06:00:07 -0500
Received: from mga01.intel.com ([192.55.52.88]:32402 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236854AbhLULAG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 06:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640084406; x=1671620406;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=h7YV3c7pzwFbg1nPWrFJ0QIp3MgGmmZ2xfInsujrkV4=;
  b=jiE2ckcPmui+QT/VHtuY195G3ofS+JWPEPwXYL3JhfMawZJk8Ckfwgeg
   l74h7rWSxIc6APs2eGrjSH860nMEWpUazLEuES0AAKaUBw8LkXOBAwqyB
   nc2uj0jTM3A6eVfyNW5VZjX2bNImki0n3FweSkZAtOcpP341CvpnMnTzP
   /4THawEfzk409gK/7R7IlUb+HWGUqae9PQTFPcUsWLsjb64zAZk/5aJdn
   H+St3zjSH9iekQ+iveXhhhCmijBxHxMwwvmrzOhfTPOyPL/vhPXNXPlwk
   I+Yv/82zWgxoMrWPtLZdv0a5lz/Ir2J5thGlFmQ3QY8EbxlXxcY7FBvom
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264562862"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="264562862"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 02:59:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="508034049"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2021 02:59:54 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mzcs5-00090X-BU; Tue, 21 Dec 2021 10:59:53 +0000
Date:   Tue, 21 Dec 2021 18:59:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 dbefb9ac3a3ae06f4e74be3257537865279788a0
Message-ID: <61c1b376./QGbmu8bvlg9Uflu%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: dbefb9ac3a3ae06f4e74be3257537865279788a0  hwmon: (nct6775) Additional check for ChipID before ASUS WMI usage

elapsed time: 824m

configs tested: 98
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
arm64                            allyesconfig
arc                     haps_hs_smp_defconfig
sh                ecovec24-romimage_defconfig
ia64                        generic_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                      rts7751r2d1_defconfig
mips                           ip27_defconfig
csky                             alldefconfig
powerpc                       eiger_defconfig
arm                           tegra_defconfig
arm                        mvebu_v5_defconfig
arm                     am200epdkit_defconfig
mips                          rb532_defconfig
openrisc                 simple_smp_defconfig
m68k                          amiga_defconfig
arm                  randconfig-c002-20211220
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
nds32                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
sparc                            allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a001-20211220
x86_64               randconfig-a003-20211220
x86_64               randconfig-a002-20211220
x86_64               randconfig-a004-20211220
x86_64               randconfig-a005-20211220
x86_64               randconfig-a006-20211220
i386                 randconfig-a002-20211220
i386                 randconfig-a003-20211220
i386                 randconfig-a001-20211220
i386                 randconfig-a004-20211220
i386                 randconfig-a005-20211220
i386                 randconfig-a006-20211220
arc                  randconfig-r043-20211220
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests

clang tested configs:
x86_64               randconfig-a013-20211220
x86_64               randconfig-a015-20211220
x86_64               randconfig-a014-20211220
x86_64               randconfig-a012-20211220
x86_64               randconfig-a011-20211220
x86_64               randconfig-a016-20211220
i386                 randconfig-a012-20211220
i386                 randconfig-a011-20211220
i386                 randconfig-a013-20211220
i386                 randconfig-a014-20211220
i386                 randconfig-a016-20211220
i386                 randconfig-a015-20211220
hexagon              randconfig-r045-20211220
riscv                randconfig-r042-20211220
s390                 randconfig-r044-20211220
hexagon              randconfig-r041-20211220

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
