Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4722611
	for <linux-hwmon@vger.kernel.org>; Sun, 24 Nov 2024 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732431721; cv=none; b=YOkF0bEPr4gCcAVJ5eXG1ArmMUM5MwyuLv/TPX4e7QjYjzKzYkuKSUeW0cwbWSQassvcLXmzehGB+hdWLYL0Rc84+2RWx8J+6GzDSfUmJbG3d/6bK4CXJJVxpv+4i/8SMF0CARdt+gHq+MSOu9p7eUch85uZAKEK4U2zm9NhP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732431721; c=relaxed/simple;
	bh=rFgMCPWAm6rC4SfQQRzelU8yuWB/2xI7liunpFevxLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FbPCkEonWifBiGcWgkTwmfo+MPZUYy3kR702kedEXezai8HhRcUjoDcNDpJRIqgaVD0QOWfvI03zIza2L5ZKdQb1VNzKN4qa12WaMwPJ8Hsou1vP4W8kvor4oduEYGgiOKcn2MF2F72cj3TShRZqETAeHmy5mK3klaA8gFUtR8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXRdXCw8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXRdXCw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732431719; x=1763967719;
  h=date:from:to:cc:subject:message-id;
  bh=rFgMCPWAm6rC4SfQQRzelU8yuWB/2xI7liunpFevxLo=;
  b=OXRdXCw8yY/23LRKgLJsILpyAxgwjz19PahqKk1yPri9qaEUFO442x5T
   JEl40E66YAkXpWjEarnmQmvZx/w7KjR24AOA9qzPkAwFhSpnN7p9Gp6X6
   LTplddNb4p+PBubcwJ+jSI1qeDcfWGTrPsvalfV6rc1ReoEp6yj8Y0jKT
   A6rCUC8nsfsisYnkGzSijo5X7dPD7uxPStw4/VKFLuECnX6XacG524/cM
   bV/YiOlrua8b+HT+fsBGNEQEPyC2WUWGNNqfGwqLJvaeyFnkn1dHtmVdu
   48QqL6l5zYHTft1tT0p29NnFCGEhSc76Fa8w+8ON1WaTDg4goPlPV/iYL
   Q==;
X-CSE-ConnectionGUID: J93GWguPQXyGz85/zSCk9A==
X-CSE-MsgGUID: GRFvzR/ETYe4ZfpjCv0O4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="57942566"
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="57942566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 23:01:58 -0800
X-CSE-ConnectionGUID: StRjW+VSSZ6tCcXNXwn1Ag==
X-CSE-MsgGUID: aASrWnahT3G1j6PbU8HM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="90865242"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Nov 2024 23:01:57 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tF6d0-0004uN-35;
	Sun, 24 Nov 2024 07:01:54 +0000
Date: Sun, 24 Nov 2024 15:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 de2bf507fabba9c0c678cf5ed54beb546f5ca29a
Message-ID: <202411241504.FaU34A7k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: de2bf507fabba9c0c678cf5ed54beb546f5ca29a  hwmon: (tps23861) Fix reporting of negative temperatures

elapsed time: 722m

configs tested: 243
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241124    clang-14
arc                   randconfig-001-20241124    gcc-13.2.0
arc                   randconfig-002-20241124    clang-14
arc                   randconfig-002-20241124    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-20
arm                          ep93xx_defconfig    gcc-14.2.0
arm                      footbridge_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                            qcom_defconfig    gcc-14.2.0
arm                   randconfig-001-20241124    clang-14
arm                   randconfig-001-20241124    gcc-14.2.0
arm                   randconfig-002-20241124    clang-14
arm                   randconfig-002-20241124    clang-20
arm                   randconfig-003-20241124    clang-14
arm                   randconfig-003-20241124    gcc-14.2.0
arm                   randconfig-004-20241124    clang-14
arm                   randconfig-004-20241124    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241124    clang-14
arm64                 randconfig-001-20241124    gcc-14.2.0
arm64                 randconfig-002-20241124    clang-14
arm64                 randconfig-002-20241124    gcc-14.2.0
arm64                 randconfig-003-20241124    clang-14
arm64                 randconfig-004-20241124    clang-14
arm64                 randconfig-004-20241124    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241124    clang-14
csky                  randconfig-001-20241124    gcc-14.2.0
csky                  randconfig-002-20241124    clang-14
csky                  randconfig-002-20241124    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241124    clang-14
hexagon               randconfig-001-20241124    clang-20
hexagon               randconfig-002-20241124    clang-14
hexagon               randconfig-002-20241124    clang-20
i386        buildonly-randconfig-001-20241124    clang-19
i386        buildonly-randconfig-001-20241124    gcc-11
i386        buildonly-randconfig-002-20241124    clang-19
i386        buildonly-randconfig-002-20241124    gcc-12
i386        buildonly-randconfig-003-20241124    clang-19
i386        buildonly-randconfig-003-20241124    gcc-12
i386        buildonly-randconfig-004-20241124    clang-19
i386        buildonly-randconfig-004-20241124    gcc-12
i386        buildonly-randconfig-005-20241124    clang-19
i386        buildonly-randconfig-005-20241124    gcc-12
i386        buildonly-randconfig-006-20241124    clang-19
i386        buildonly-randconfig-006-20241124    gcc-11
i386                  randconfig-001-20241124    clang-19
i386                  randconfig-001-20241124    gcc-12
i386                  randconfig-002-20241124    clang-19
i386                  randconfig-003-20241124    clang-19
i386                  randconfig-004-20241124    clang-19
i386                  randconfig-005-20241124    clang-19
i386                  randconfig-005-20241124    gcc-12
i386                  randconfig-006-20241124    clang-19
i386                  randconfig-011-20241124    clang-19
i386                  randconfig-011-20241124    gcc-12
i386                  randconfig-012-20241124    clang-19
i386                  randconfig-013-20241124    clang-19
i386                  randconfig-013-20241124    gcc-12
i386                  randconfig-014-20241124    clang-19
i386                  randconfig-015-20241124    clang-19
i386                  randconfig-016-20241124    clang-19
i386                  randconfig-016-20241124    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241124    clang-14
loongarch             randconfig-001-20241124    gcc-14.2.0
loongarch             randconfig-002-20241124    clang-14
loongarch             randconfig-002-20241124    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-20
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    gcc-14.2.0
mips                           xway_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241124    clang-14
nios2                 randconfig-001-20241124    gcc-14.2.0
nios2                 randconfig-002-20241124    clang-14
nios2                 randconfig-002-20241124    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    clang-20
parisc                randconfig-001-20241124    clang-14
parisc                randconfig-001-20241124    gcc-14.2.0
parisc                randconfig-002-20241124    clang-14
parisc                randconfig-002-20241124    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        icon_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241124    clang-14
powerpc               randconfig-001-20241124    gcc-14.2.0
powerpc               randconfig-002-20241124    clang-14
powerpc               randconfig-002-20241124    gcc-14.2.0
powerpc               randconfig-003-20241124    clang-14
powerpc               randconfig-003-20241124    clang-20
powerpc                     sequoia_defconfig    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    clang-20
powerpc64             randconfig-001-20241124    clang-14
powerpc64             randconfig-001-20241124    clang-20
powerpc64             randconfig-002-20241124    clang-14
powerpc64             randconfig-002-20241124    gcc-14.2.0
powerpc64             randconfig-003-20241124    clang-14
powerpc64             randconfig-003-20241124    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                    nommu_virt_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241124    clang-14
riscv                 randconfig-001-20241124    gcc-14.2.0
riscv                 randconfig-002-20241124    clang-14
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241124    clang-14
s390                  randconfig-001-20241124    gcc-14.2.0
s390                  randconfig-002-20241124    clang-14
s390                  randconfig-002-20241124    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    clang-20
sh                    randconfig-001-20241124    clang-14
sh                    randconfig-001-20241124    gcc-14.2.0
sh                    randconfig-002-20241124    clang-14
sh                    randconfig-002-20241124    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-20
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64               randconfig-001-20241124    clang-14
sparc64               randconfig-001-20241124    gcc-14.2.0
sparc64               randconfig-002-20241124    clang-14
sparc64               randconfig-002-20241124    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                    randconfig-001-20241124    clang-14
um                    randconfig-001-20241124    gcc-12
um                    randconfig-002-20241124    clang-14
um                    randconfig-002-20241124    gcc-12
x86_64      buildonly-randconfig-001-20241124    gcc-12
x86_64      buildonly-randconfig-002-20241124    gcc-12
x86_64      buildonly-randconfig-003-20241124    gcc-12
x86_64      buildonly-randconfig-004-20241124    gcc-12
x86_64      buildonly-randconfig-005-20241124    clang-19
x86_64      buildonly-randconfig-005-20241124    gcc-12
x86_64      buildonly-randconfig-006-20241124    clang-19
x86_64      buildonly-randconfig-006-20241124    gcc-12
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241124    clang-19
x86_64                randconfig-001-20241124    gcc-12
x86_64                randconfig-002-20241124    clang-19
x86_64                randconfig-002-20241124    gcc-12
x86_64                randconfig-003-20241124    clang-19
x86_64                randconfig-003-20241124    gcc-12
x86_64                randconfig-004-20241124    gcc-12
x86_64                randconfig-005-20241124    gcc-12
x86_64                randconfig-006-20241124    clang-19
x86_64                randconfig-006-20241124    gcc-12
x86_64                randconfig-011-20241124    gcc-12
x86_64                randconfig-012-20241124    clang-19
x86_64                randconfig-012-20241124    gcc-12
x86_64                randconfig-013-20241124    gcc-11
x86_64                randconfig-013-20241124    gcc-12
x86_64                randconfig-014-20241124    gcc-12
x86_64                randconfig-015-20241124    gcc-12
x86_64                randconfig-016-20241124    gcc-12
x86_64                randconfig-071-20241124    clang-19
x86_64                randconfig-071-20241124    gcc-12
x86_64                randconfig-072-20241124    gcc-12
x86_64                randconfig-073-20241124    gcc-12
x86_64                randconfig-074-20241124    gcc-12
x86_64                randconfig-075-20241124    gcc-11
x86_64                randconfig-075-20241124    gcc-12
x86_64                randconfig-076-20241124    gcc-11
x86_64                randconfig-076-20241124    gcc-12
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241124    clang-14
xtensa                randconfig-001-20241124    gcc-14.2.0
xtensa                randconfig-002-20241124    clang-14
xtensa                randconfig-002-20241124    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
