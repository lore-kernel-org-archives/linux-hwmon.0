Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E7B64A8F
	for <linux-hwmon@vger.kernel.org>; Fri, 22 Nov 2024 19:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732303148; cv=none; b=qMYafYaDSreC81Chp0RNLPhUzQWGxzmPfsLG5+jZZVOEIFe/4fPAt9ejvqkvLHEd91X4hdqPZ+kc9FQra64IQ79MUdkcJd0sog2EPJ3NAcQ+dTwsuPqPj1XoVy2Z+UnDnb6DgnG4Ox7ufc3Zv4tWqSW1wfGGI7HYybhcMxLiFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732303148; c=relaxed/simple;
	bh=VypWxHkl1FyCj3xqQo3LzP1GChS4EdLv0yOmPykctnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TypjWwlz158O+NwAEr21K9QCErVlKGJyn/zV7VQE6LX4VqKX6/Tu1+fFEpJNZrJBImc3N+sorOcBs1SvfpfNPqaUuMW7XP0PzMeYGxJ1Y2dfnEMUX4ZR5RiK0z79+sP7FyvRzKxGT4OWGvpw5cvqmfD6O153tkv9o4jceL1LS64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EnOWsASj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EnOWsASj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732303145; x=1763839145;
  h=date:from:to:cc:subject:message-id;
  bh=VypWxHkl1FyCj3xqQo3LzP1GChS4EdLv0yOmPykctnc=;
  b=EnOWsASjKSMT1zqt9CbLt1LBMlUZNXZZhIQyY8Q5mvK4At3APV8Dty35
   N9p25flTGaF6aIWtYDvN3Qjq4GH7vCHtLp505no9g/7Xg60DJyrH8hdAU
   Zqs43ufKDY4rW+UWhJ8stDSLbPuEaqHsQ/Fw+msS8Yx3pvWWBRwwIo7Cc
   BMKtKgJlbZ9F8KimuLkgUi1grjtCI81VQyRQ9GEv55vpfZcjKV6IW47fo
   d9E21wTAC8x44L929gPpe5VFovRaCAF8W1zrPzAb/VbA8TVQfu9IOGcaF
   eMoKCdvK5WgElaDf9WGsQMU0axDSZ2pb9uw7U5GKLDQ5T3dQaKkXv+8tF
   g==;
X-CSE-ConnectionGUID: gWRfOo7JQNCBhp/3bTvFKw==
X-CSE-MsgGUID: ijccnQ1RQAuilXbHL+A/Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32630364"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32630364"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 11:19:05 -0800
X-CSE-ConnectionGUID: ikRhog3hQYKIcsVabnzFlA==
X-CSE-MsgGUID: phaOSg7oR16aqNdV1SBqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90836138"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 11:19:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEZBG-00049n-0N;
	Fri, 22 Nov 2024 19:19:02 +0000
Date: Sat, 23 Nov 2024 03:18:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 3020c52199357c60574850544f779683ac9a917a
Message-ID: <202411230312.5fGtVoFJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 3020c52199357c60574850544f779683ac9a917a  hwmon: (tps23861) Fix reporting of negative temperatures

elapsed time: 1296m

configs tested: 206
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241122    gcc-14.2.0
arc                   randconfig-002-20241122    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                           omap1_defconfig    clang-20
arm                           omap1_defconfig    gcc-14.2.0
arm                   randconfig-001-20241122    gcc-14.2.0
arm                   randconfig-002-20241122    gcc-14.2.0
arm                   randconfig-003-20241122    gcc-14.2.0
arm                   randconfig-004-20241122    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm                           sunxi_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241122    gcc-14.2.0
arm64                 randconfig-002-20241122    gcc-14.2.0
arm64                 randconfig-003-20241122    gcc-14.2.0
arm64                 randconfig-004-20241122    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241122    gcc-14.2.0
csky                  randconfig-002-20241122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241122    gcc-14.2.0
hexagon               randconfig-002-20241122    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241122    clang-19
i386        buildonly-randconfig-002-20241122    clang-19
i386        buildonly-randconfig-003-20241122    clang-19
i386        buildonly-randconfig-004-20241122    clang-19
i386        buildonly-randconfig-005-20241122    clang-19
i386        buildonly-randconfig-006-20241122    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241122    clang-19
i386                  randconfig-002-20241122    clang-19
i386                  randconfig-003-20241122    clang-19
i386                  randconfig-004-20241122    clang-19
i386                  randconfig-005-20241122    clang-19
i386                  randconfig-006-20241122    clang-19
i386                  randconfig-011-20241122    clang-19
i386                  randconfig-012-20241122    clang-19
i386                  randconfig-013-20241122    clang-19
i386                  randconfig-014-20241122    clang-19
i386                  randconfig-015-20241122    clang-19
i386                  randconfig-016-20241122    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241122    gcc-14.2.0
loongarch             randconfig-002-20241122    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                            gpr_defconfig    gcc-14.2.0
mips                           ip22_defconfig    clang-20
mips                     loongson1b_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241122    gcc-14.2.0
nios2                 randconfig-002-20241122    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                 simple_smp_defconfig    clang-20
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241122    gcc-14.2.0
parisc                randconfig-002-20241122    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-20
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20241122    gcc-14.2.0
powerpc               randconfig-002-20241122    gcc-14.2.0
powerpc               randconfig-003-20241122    gcc-14.2.0
powerpc64             randconfig-001-20241122    gcc-14.2.0
powerpc64             randconfig-002-20241122    gcc-14.2.0
powerpc64             randconfig-003-20241122    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241122    gcc-14.2.0
riscv                 randconfig-002-20241122    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                          debug_defconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241122    gcc-14.2.0
s390                  randconfig-002-20241122    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                          r7785rp_defconfig    gcc-14.2.0
sh                    randconfig-001-20241122    gcc-14.2.0
sh                    randconfig-002-20241122    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                           se7724_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241122    gcc-14.2.0
sparc64               randconfig-002-20241122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241122    gcc-14.2.0
um                    randconfig-002-20241122    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241122    clang-19
x86_64      buildonly-randconfig-002-20241122    clang-19
x86_64      buildonly-randconfig-003-20241122    clang-19
x86_64      buildonly-randconfig-004-20241122    clang-19
x86_64      buildonly-randconfig-005-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241122    clang-19
x86_64                randconfig-002-20241122    clang-19
x86_64                randconfig-003-20241122    clang-19
x86_64                randconfig-004-20241122    clang-19
x86_64                randconfig-005-20241122    clang-19
x86_64                randconfig-006-20241122    clang-19
x86_64                randconfig-011-20241122    clang-19
x86_64                randconfig-012-20241122    clang-19
x86_64                randconfig-013-20241122    clang-19
x86_64                randconfig-014-20241122    clang-19
x86_64                randconfig-015-20241122    clang-19
x86_64                randconfig-016-20241122    clang-19
x86_64                randconfig-071-20241122    clang-19
x86_64                randconfig-072-20241122    clang-19
x86_64                randconfig-073-20241122    clang-19
x86_64                randconfig-074-20241122    clang-19
x86_64                randconfig-075-20241122    clang-19
x86_64                randconfig-076-20241122    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241122    gcc-14.2.0
xtensa                randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
