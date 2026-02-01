Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0829408
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 07:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769932129; cv=none; b=B6KTraJGNXVIlCUg5ipJQdDM1ibuYhFgeVhTl6Q5SVXhc2nVXotUr6hO09trPsk8XgAMxhF5nEl2LP5YpgjFCioV90uKaE7Nhle4J72wSe+LWUd73U35GrZwfJgjyABewRvcuRPHLu/w1wExMTP52iYVJk567S8EbhR1vqaL3vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769932129; c=relaxed/simple;
	bh=bu59k97L1Ftz7/jTHEb89HYjbnMDTflTvFYHmBCnKsg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kzrot7NiGtAfq4gSyOCaolKAULmzzub5cCELwmHcB2K1tHEjtF3FOfjh0dkGzIOgoajHpMqg05MAeRQ65zLGZSvpbHRQXpx8uU7pZhqlCVW0XTFFFo55F5npN/cs0hxUHN7adTSVzq+sN/S9jBaTXELBGjOQUT4GoaV3IHRNse0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XG2EFq+s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XG2EFq+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769932126; x=1801468126;
  h=date:from:to:cc:subject:message-id;
  bh=bu59k97L1Ftz7/jTHEb89HYjbnMDTflTvFYHmBCnKsg=;
  b=XG2EFq+sMS/QFeI5SZw0moHG3BwfwTyrjAo/Pt7RMNiPXwIAcMmD7SNb
   2J16dC1f1Yt6+OeWkgxOIVZiK/eZRKpxXvkSaHZbLYlKK+zVab7daEn2G
   C4Ge14f/upHegOoUHET/Nme6hIW2k3148rf+Tc1woabEZTzmgg3d/2e9F
   mD88p4Ba+CAgsJrEIbasDzJnvVXBIugUHbvDHVc3OvFosiiEAio7r2rhF
   LoivFDvYKJDeRQeMxnGHlvVJvCZtQsVeV+ph8BHpOvmYtn4+xP5i1QcAj
   PwcDVQ1sznBj8Ti8b5NmkGsL0tARWwFNqYXQ1u5K2A3YHydWyh99plxVc
   w==;
X-CSE-ConnectionGUID: wnKzoOeJT1GA7Mvz504mvQ==
X-CSE-MsgGUID: TU4sSxRWQcOvDly8G56O+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70325707"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="70325707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 23:48:46 -0800
X-CSE-ConnectionGUID: 3xwx8ltnSGS999rszC44CA==
X-CSE-MsgGUID: A1X0Vln2QKKLfG+M+ngzsg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2026 23:48:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmSCI-00000000eeG-0Uzd;
	Sun, 01 Feb 2026 07:48:42 +0000
Date: Sun, 01 Feb 2026 15:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 615901b57b7ef8eb655f71358f7e956e42bcd16b
Message-ID: <202602011501.2eA1BDmZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 615901b57b7ef8eb655f71358f7e956e42bcd16b  hwmon: (acpi_power_meter) Fix deadlocks related to acpi_power_meter_notify()

elapsed time: 967m

configs tested: 215
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    clang-22
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                         haps_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260201    gcc-10.5.0
arc                   randconfig-002-20260201    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         at91_dt_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                          gemini_defconfig    clang-22
arm                            hisi_defconfig    gcc-15.2.0
arm                       multi_v4t_defconfig    gcc-15.2.0
arm                        mvebu_v7_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                         orion5x_defconfig    clang-22
arm                   randconfig-001-20260201    gcc-10.5.0
arm                   randconfig-002-20260201    gcc-10.5.0
arm                   randconfig-003-20260201    gcc-10.5.0
arm                   randconfig-004-20260201    gcc-10.5.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260201    gcc-15.2.0
arm64                 randconfig-002-20260201    gcc-15.2.0
arm64                 randconfig-003-20260201    gcc-15.2.0
arm64                 randconfig-004-20260201    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260201    gcc-15.2.0
csky                  randconfig-002-20260201    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260201    gcc-15.2.0
hexagon               randconfig-002-20260201    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260201    clang-20
i386        buildonly-randconfig-002-20260201    clang-20
i386        buildonly-randconfig-003-20260201    clang-20
i386        buildonly-randconfig-004-20260201    clang-20
i386        buildonly-randconfig-005-20260201    clang-20
i386        buildonly-randconfig-006-20260201    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260201    clang-20
i386                  randconfig-002-20260201    clang-20
i386                  randconfig-003-20260201    clang-20
i386                  randconfig-004-20260201    clang-20
i386                  randconfig-005-20260201    clang-20
i386                  randconfig-006-20260201    clang-20
i386                  randconfig-007-20260201    clang-20
i386                  randconfig-011-20260201    gcc-14
i386                  randconfig-012-20260201    gcc-14
i386                  randconfig-013-20260201    gcc-14
i386                  randconfig-014-20260201    gcc-14
i386                  randconfig-015-20260201    gcc-14
i386                  randconfig-016-20260201    gcc-14
i386                  randconfig-017-20260201    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260201    gcc-15.2.0
loongarch             randconfig-002-20260201    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                     cu1830-neo_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    clang-22
mips                      fuloong2e_defconfig    gcc-15.2.0
mips                           ip22_defconfig    gcc-15.2.0
mips                           ip30_defconfig    clang-22
mips                    maltaup_xpa_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    gcc-15.2.0
mips                       rbtx49xx_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260201    gcc-15.2.0
nios2                 randconfig-002-20260201    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260201    gcc-14.3.0
parisc                randconfig-002-20260201    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260201    gcc-14.3.0
powerpc               randconfig-002-20260201    gcc-14.3.0
powerpc                    socrates_defconfig    clang-22
powerpc                     stx_gp3_defconfig    gcc-15.2.0
powerpc                     tqm8560_defconfig    clang-22
powerpc64             randconfig-001-20260201    gcc-14.3.0
powerpc64             randconfig-002-20260201    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260201    gcc-13.4.0
riscv                 randconfig-002-20260201    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260201    gcc-13.4.0
s390                  randconfig-002-20260201    gcc-13.4.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                ecovec24-romimage_defconfig    clang-22
sh                        edosk7760_defconfig    clang-22
sh                            hp6xx_defconfig    clang-22
sh                     magicpanelr2_defconfig    gcc-15.2.0
sh                    randconfig-001-20260201    gcc-13.4.0
sh                    randconfig-002-20260201    gcc-13.4.0
sh                           se7343_defconfig    clang-22
sh                           se7750_defconfig    clang-22
sh                          urquell_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260201    gcc-8.5.0
sparc                 randconfig-002-20260201    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260201    gcc-8.5.0
sparc64               randconfig-002-20260201    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260201    gcc-8.5.0
um                    randconfig-002-20260201    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260201    clang-20
x86_64      buildonly-randconfig-002-20260201    clang-20
x86_64      buildonly-randconfig-003-20260201    clang-20
x86_64      buildonly-randconfig-004-20260201    clang-20
x86_64      buildonly-randconfig-005-20260201    clang-20
x86_64      buildonly-randconfig-006-20260201    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260201    gcc-14
x86_64                randconfig-002-20260201    gcc-14
x86_64                randconfig-003-20260201    gcc-14
x86_64                randconfig-004-20260201    gcc-14
x86_64                randconfig-005-20260201    gcc-14
x86_64                randconfig-006-20260201    gcc-14
x86_64                randconfig-011-20260201    gcc-14
x86_64                randconfig-012-20260201    gcc-14
x86_64                randconfig-013-20260201    gcc-14
x86_64                randconfig-014-20260201    gcc-14
x86_64                randconfig-015-20260201    gcc-14
x86_64                randconfig-016-20260201    gcc-14
x86_64                randconfig-071-20260201    gcc-14
x86_64                randconfig-072-20260201    gcc-14
x86_64                randconfig-073-20260201    gcc-14
x86_64                randconfig-074-20260201    gcc-14
x86_64                randconfig-075-20260201    gcc-14
x86_64                randconfig-076-20260201    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260201    gcc-8.5.0
xtensa                randconfig-002-20260201    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
