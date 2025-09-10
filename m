Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5181E1DF0
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Sep 2025 16:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757521179; cv=none; b=f7HMSOf4S8swXsg528B0DJRidO0TDVZhH4Kalxgqb9gpu0qIozaJwb82sSB+QfgEvq6ziMmFYl0OjJ5UhgwrRX6txB3NMPGpnPpaxr5P+HhR2WDX4O3B0Lalm3M0Ju9ziYzDpfq0oVgot/1YaeqJbePIBrmcj/UnxN9D34mRt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757521179; c=relaxed/simple;
	bh=xK22LgXHZhAYr0cjDE/LhJKSnqlyVst17UD8D2zNB/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EberYZNc4rJ/4q3gZZ93CwtBBFD9VRzHkKiFcoAT3u7EI23GfNU+Xtjck9ZEr+C6Ko+SuofVkIbRpnoBMynCJpNfcmPLeQ1sMSCYpzdTxc4l8ijTEBy16gWNGGO4f0qX9UHyF58v94tZIQc27FNfZzYMcyILv8rW159iUZs1rs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsVq9l6P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsVq9l6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757521177; x=1789057177;
  h=date:from:to:cc:subject:message-id;
  bh=xK22LgXHZhAYr0cjDE/LhJKSnqlyVst17UD8D2zNB/0=;
  b=VsVq9l6P7G7NDft+9TJ8LP80/Tyl8ev33tv3bpOTr0I4OHqaWd7F4Oxk
   Mqr7kpuiY+1e6uVxo3eAH3It7RRAu4W+xmVHqQvGTtpJ8bFXw1/MRhq9y
   jPm4Zb2ApWDpQl00HWv1awYeJEGnBgiabCocp66CSLOlOqZ69r7pa/q5G
   eDlPXmrVfpgM71YnpKSBLsyV0KsZfMVQg9xTZjJ/ecJxb+0iHShwAHJSK
   +0OXZkunD67l75wuYzU8lo4MKQc7pqoOHJKpOs3oqYY3qqsT/dy7rAnRz
   A8KwdUo4NgFC9JaeI26NOIPsHFHLdrfoFTSHpxFIsCBmrv60FQ9WeOEib
   A==;
X-CSE-ConnectionGUID: UKqD9yrlRniZVCne/5wUfQ==
X-CSE-MsgGUID: hYBw0vTaRveFtnG4QR2DDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="47411735"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="47411735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 09:19:37 -0700
X-CSE-ConnectionGUID: XVd7vx1dRiisaIm+MMzswg==
X-CSE-MsgGUID: vpn55qpnRo+CcQxT2gfYNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="178637230"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2025 09:19:35 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwNXh-000675-1u;
	Wed, 10 Sep 2025 16:19:33 +0000
Date: Thu, 11 Sep 2025 00:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 3e6874f16157d9778000957c8bec7279d34be303
Message-ID: <202509110048.555WPHVB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 3e6874f16157d9778000957c8bec7279d34be303  Merge branch 'hwmon-lock' into hwmon-staging

elapsed time: 1462m

configs tested: 233
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20250910    gcc-13.4.0
arc                   randconfig-002-20250910    gcc-13.4.0
arc                   randconfig-002-20250910    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20250910    gcc-13.4.0
arm                   randconfig-001-20250910    gcc-8.5.0
arm                   randconfig-002-20250910    gcc-13.4.0
arm                   randconfig-002-20250910    gcc-8.5.0
arm                   randconfig-003-20250910    clang-16
arm                   randconfig-003-20250910    gcc-13.4.0
arm                   randconfig-004-20250910    gcc-13.4.0
arm                   randconfig-004-20250910    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250910    clang-22
arm64                 randconfig-001-20250910    gcc-13.4.0
arm64                 randconfig-002-20250910    clang-22
arm64                 randconfig-002-20250910    gcc-13.4.0
arm64                 randconfig-003-20250910    gcc-13.4.0
arm64                 randconfig-003-20250910    gcc-9.5.0
arm64                 randconfig-004-20250910    gcc-13.4.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250910    clang-22
csky                  randconfig-001-20250910    gcc-12.5.0
csky                  randconfig-002-20250910    clang-22
csky                  randconfig-002-20250910    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250910    clang-22
hexagon               randconfig-002-20250910    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250910    clang-20
i386        buildonly-randconfig-001-20250910    gcc-14
i386        buildonly-randconfig-002-20250910    clang-20
i386        buildonly-randconfig-002-20250910    gcc-13
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-005-20250910    clang-20
i386        buildonly-randconfig-005-20250910    gcc-14
i386        buildonly-randconfig-006-20250910    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250910    clang-20
i386                  randconfig-002-20250910    clang-20
i386                  randconfig-003-20250910    clang-20
i386                  randconfig-004-20250910    clang-20
i386                  randconfig-005-20250910    clang-20
i386                  randconfig-006-20250910    clang-20
i386                  randconfig-007-20250910    clang-20
i386                  randconfig-011-20250910    clang-20
i386                  randconfig-012-20250910    clang-20
i386                  randconfig-013-20250910    clang-20
i386                  randconfig-014-20250910    clang-20
i386                  randconfig-015-20250910    clang-20
i386                  randconfig-016-20250910    clang-20
i386                  randconfig-017-20250910    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250910    clang-18
loongarch             randconfig-001-20250910    clang-22
loongarch             randconfig-002-20250910    clang-18
loongarch             randconfig-002-20250910    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    clang-22
mips                              allnoconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250910    clang-22
nios2                 randconfig-001-20250910    gcc-11.5.0
nios2                 randconfig-002-20250910    clang-22
nios2                 randconfig-002-20250910    gcc-9.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250910    clang-22
parisc                randconfig-001-20250910    gcc-10.5.0
parisc                randconfig-002-20250910    clang-22
parisc                randconfig-002-20250910    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20250910    clang-22
powerpc               randconfig-001-20250910    gcc-8.5.0
powerpc               randconfig-002-20250910    clang-22
powerpc               randconfig-002-20250910    gcc-8.5.0
powerpc               randconfig-003-20250910    clang-22
powerpc                    socrates_defconfig    clang-22
powerpc64             randconfig-002-20250910    clang-22
powerpc64             randconfig-002-20250910    gcc-11.5.0
powerpc64             randconfig-003-20250910    clang-22
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250910    clang-22
riscv                 randconfig-001-20250910    gcc-12.5.0
riscv                 randconfig-002-20250910    clang-22
riscv                 randconfig-002-20250910    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250910    clang-22
s390                  randconfig-001-20250910    gcc-12.5.0
s390                  randconfig-002-20250910    clang-22
s390                  randconfig-002-20250910    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250910    gcc-12.5.0
sh                    randconfig-001-20250910    gcc-15.1.0
sh                    randconfig-002-20250910    gcc-12.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250910    gcc-12.5.0
sparc                 randconfig-001-20250910    gcc-8.5.0
sparc                 randconfig-002-20250910    gcc-12.5.0
sparc                 randconfig-002-20250910    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250910    gcc-12.5.0
sparc64               randconfig-001-20250910    gcc-8.5.0
sparc64               randconfig-002-20250910    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250910    clang-22
um                    randconfig-001-20250910    gcc-12.5.0
um                    randconfig-002-20250910    clang-22
um                    randconfig-002-20250910    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250910    gcc-14
x86_64      buildonly-randconfig-002-20250910    clang-20
x86_64      buildonly-randconfig-003-20250910    gcc-14
x86_64      buildonly-randconfig-004-20250910    clang-20
x86_64      buildonly-randconfig-005-20250910    gcc-14
x86_64      buildonly-randconfig-006-20250910    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250910    clang-20
x86_64                randconfig-002-20250910    clang-20
x86_64                randconfig-003-20250910    clang-20
x86_64                randconfig-004-20250910    clang-20
x86_64                randconfig-005-20250910    clang-20
x86_64                randconfig-006-20250910    clang-20
x86_64                randconfig-007-20250910    clang-20
x86_64                randconfig-008-20250910    clang-20
x86_64                randconfig-071-20250910    gcc-14
x86_64                randconfig-072-20250910    gcc-14
x86_64                randconfig-073-20250910    gcc-14
x86_64                randconfig-074-20250910    gcc-14
x86_64                randconfig-075-20250910    gcc-14
x86_64                randconfig-076-20250910    gcc-14
x86_64                randconfig-077-20250910    gcc-14
x86_64                randconfig-078-20250910    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250910    gcc-12.5.0
xtensa                randconfig-001-20250910    gcc-8.5.0
xtensa                randconfig-002-20250910    gcc-10.5.0
xtensa                randconfig-002-20250910    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
