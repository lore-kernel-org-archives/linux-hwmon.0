Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7B78289
	for <linux-hwmon@vger.kernel.org>; Sat, 30 Nov 2024 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003494; cv=none; b=YfuGQunanYnjAAjCfFLDrgUHF5fDnpM5PaGPRUcAu/5SRQHaVZVe2taUHRdnm0Uiafn2q2WU9NUWqIR7z2lcISlS/CF5JesG8vAPyQsczZ/DD7ISUeLOEi9Hl1EUxVWpAEIlVvf8js8pX+jHzyf6ioPzEV9+VHcDMBnhvCZ6moQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003494; c=relaxed/simple;
	bh=IwGx/SQX/aahJkBNpeMef8VzhJGVI73OyPVo+3CzYa0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kEQ0sUhILWjbQJCiczV7+vVpuvS4nGNQ5bDi2r2AlQj1J7wUDM9JPhJEecDyZJ3/zYcMPSHeAMm89nacP6BRNnFBwrWDNYTEgxLelUCGOmRHb47sFk2iTzYNklYHi0rjDCIP8RQlhJNGYNKbmvfBeWUWze4xC1wV3V7Te5+NYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fbyp0v+m; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fbyp0v+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733003493; x=1764539493;
  h=date:from:to:cc:subject:message-id;
  bh=IwGx/SQX/aahJkBNpeMef8VzhJGVI73OyPVo+3CzYa0=;
  b=Fbyp0v+mS0lVExYjvULvTTTOltiZ4I3jG9W0sLW6+5DsK+/Agi99vlO7
   M1dmtb7SDLLSOqHCtDM3BlQBUCBD9Rl4VH9T8lFRmsJlNytgqlWTOIxtw
   wqTJh/Fj81pLzQB7Zqp9DF28vat8+OnrDuETW/38JhElaEnBMN2LnxIZN
   o06j+z1ocEQZ1XrIwcc+fIJgBXaJg9Adx6IgT9X9KVkbO1ZSWSxwbNo+X
   GkznAwnHPHJHJA3uAFxNxN8Fugc8QdrLVvqj0MGP94zZ/HxuS7Eb8Grj+
   HVQkCdGfmBJqQgy6AAJiH8f3QWADLBMrFpDLfkNjUt5Jvqi7zMXRs6JBg
   w==;
X-CSE-ConnectionGUID: f78w4xC2TqSHwm+8um3mLA==
X-CSE-MsgGUID: ND9PTDEXTNqyIkZ5DwiVYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36975092"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="36975092"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 13:51:32 -0800
X-CSE-ConnectionGUID: 6IvZS24ERQ2vQEaJK758Yg==
X-CSE-MsgGUID: VPhgfXpRSgCmxgac4bsWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92371265"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 30 Nov 2024 13:51:30 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHVNA-0000zl-1r;
	Sat, 30 Nov 2024 21:51:28 +0000
Date: Sun, 01 Dec 2024 05:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 3a0203de7170c45ce3dce21cd859b303caaff8bc
Message-ID: <202412010523.tBQoVeFE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 3a0203de7170c45ce3dce21cd859b303caaff8bc  Merge branch 'fixes-v6.13' into testing

elapsed time: 1011m

configs tested: 157
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-14.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                   randconfig-001-20241130    gcc-13.2.0
arc                   randconfig-002-20241130    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         at91_dt_defconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                     davinci_all_defconfig    clang-20
arm                           imxrt_defconfig    gcc-14.2.0
arm                      integrator_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                        keystone_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-20
arm                        multi_v5_defconfig    gcc-14.2.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20241130    gcc-14.2.0
arm                   randconfig-002-20241130    gcc-14.2.0
arm                   randconfig-003-20241130    gcc-14.2.0
arm                   randconfig-004-20241130    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                           sama7_defconfig    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241130    gcc-14.2.0
arm64                 randconfig-002-20241130    clang-20
arm64                 randconfig-003-20241130    clang-17
arm64                 randconfig-004-20241130    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
hexagon                          alldefconfig    clang-15
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
i386        buildonly-randconfig-001-20241130    clang-19
i386        buildonly-randconfig-002-20241130    clang-19
i386        buildonly-randconfig-003-20241130    gcc-12
i386        buildonly-randconfig-004-20241130    gcc-12
i386        buildonly-randconfig-005-20241130    clang-19
i386        buildonly-randconfig-006-20241130    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                       bmips_be_defconfig    gcc-14.2.0
mips                           ci20_defconfig    clang-20
mips                           ci20_defconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
mips                           ip27_defconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                           ip32_defconfig    gcc-14.2.0
mips                     loongson1b_defconfig    gcc-14.2.0
mips                           mtx1_defconfig    gcc-14.2.0
mips                        qi_lb60_defconfig    gcc-14.2.0
mips                           xway_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-20
powerpc                      chrp32_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    clang-14
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                     taishan_defconfig    clang-20
powerpc                     taishan_defconfig    gcc-14.2.0
powerpc                     tqm8541_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
s390                             alldefconfig    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        apsh4ad0a_defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                           x86_64_defconfig    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241130    gcc-12
x86_64      buildonly-randconfig-002-20241130    clang-19
x86_64      buildonly-randconfig-002-20241130    gcc-12
x86_64      buildonly-randconfig-003-20241130    gcc-12
x86_64      buildonly-randconfig-004-20241130    clang-19
x86_64      buildonly-randconfig-004-20241130    gcc-12
x86_64      buildonly-randconfig-005-20241130    gcc-12
x86_64      buildonly-randconfig-006-20241130    gcc-12
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  audio_kc705_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
