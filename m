Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C821CC74
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Jun 2025 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750149309; cv=none; b=NMY9CPxkqoLBMmF2zq+GBWOGr/B4exS8KN9dxGTclDXYu9bMvnQn7apd12wTVQKwpdpSBsuspFLH/OjYwx0HzMJsw66W8/LYWWjvldUEjZHYiIUSMHhgARhUj6O/c0O3BPwTZMFsqWtEuewPxuxMMkdOXIAmyp9rrqkX2hztJE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750149309; c=relaxed/simple;
	bh=rvyOmQoV9kpbQD/RjpnMipUOAbfQs8CKI+Ovm7IG6pc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=npdclxwDg31AUm1lsm+0cUkS54S7O89/QGheS27V6UKbbdvlkYzs4Xg9C5oMTfhNhV4M1exuwq0URbccwTiMXiIR2SyT+J2c4T4nYjBgRVTupX8bf/5/st6AYNVewm3wwDsqUNf4cmJPqP+LFS6PmNK3N/qfWEIl7HNNwgFGKao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgIgu8G7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgIgu8G7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750149307; x=1781685307;
  h=date:from:to:cc:subject:message-id;
  bh=rvyOmQoV9kpbQD/RjpnMipUOAbfQs8CKI+Ovm7IG6pc=;
  b=GgIgu8G7eaquFmE5cW0dFwWQaju4j6vT1Tu/DT9s1YeswjMmlTmWldFI
   7F+Nir9hmY6cqwvAmNoTFfkrIcWMft0vGT4/saEcQ+0OzLi1w5qo983UU
   OMT2yMH91e2reqEQ6MzI3EpwuLmP/kIvZs2Hf2owiVkaA1Lj6tIbzgYnT
   wHP53QnO9BGPbPWQ9Oy45bFlbo8qGNgn8SAS4ZtoCUD6XYl3o9KBUPjDX
   A0qOaYdMFApBrzSQdE9wYNOQeWMvu/ydx8C9U5inLyZOMgGQ8JD2iz4tb
   OPTKpl1RN4ZflspwMqIdnlPaoLEKAR0zZDKZb9tBZjCONNYKgU7XEu6v6
   w==;
X-CSE-ConnectionGUID: c1i3PrTUTdCgnh9rxyYDaQ==
X-CSE-MsgGUID: Fr3U5CygQ9ahC5KoujoJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63668048"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63668048"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 01:35:06 -0700
X-CSE-ConnectionGUID: mUH7KCmXTnOVcXIYzFOE8A==
X-CSE-MsgGUID: LBf3W4ugQAq1LEG00quyqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="179714915"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2025 01:35:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRRmZ-000FmA-21;
	Tue, 17 Jun 2025 08:35:03 +0000
Date: Tue, 17 Jun 2025 16:35:00 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 c25892b7a1744355e16281cd24a9b59ec15ec974
Message-ID: <202506171650.AwluWSuI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: c25892b7a1744355e16281cd24a9b59ec15ec974  hwmon: (ltc4282) avoid repeated register write

elapsed time: 1071m

configs tested: 130
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-17
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20250617    gcc-8.5.0
arm                   randconfig-002-20250617    clang-21
arm                   randconfig-003-20250617    clang-21
arm                   randconfig-004-20250617    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-002-20250617    clang-21
arm64                 randconfig-003-20250617    gcc-8.5.0
arm64                 randconfig-004-20250617    gcc-12.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250617    gcc-13.3.0
csky                  randconfig-002-20250617    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-002-20250617    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250616    gcc-12
i386        buildonly-randconfig-002-20250616    gcc-11
i386        buildonly-randconfig-003-20250616    clang-20
i386        buildonly-randconfig-004-20250616    gcc-12
i386        buildonly-randconfig-005-20250616    gcc-12
i386        buildonly-randconfig-006-20250616    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250617    gcc-15.1.0
loongarch             randconfig-002-20250617    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5275evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
mips                        omega2p_defconfig    clang-21
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250617    gcc-10.5.0
nios2                 randconfig-002-20250617    gcc-14.2.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250617    gcc-8.5.0
parisc                randconfig-002-20250617    gcc-8.5.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                 linkstation_defconfig    clang-20
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250617    gcc-8.5.0
powerpc               randconfig-002-20250617    clang-16
powerpc               randconfig-003-20250617    gcc-12.4.0
powerpc64             randconfig-001-20250617    gcc-14.3.0
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-003-20250617    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250617    clang-21
riscv                 randconfig-002-20250617    gcc-10.5.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250617    clang-21
s390                  randconfig-002-20250617    clang-20
sh                               alldefconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                     magicpanelr2_defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-14.3.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-13.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250617    gcc-15.1.0
sparc64               randconfig-002-20250617    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250617    gcc-12
um                    randconfig-002-20250617    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250617    clang-20
x86_64      buildonly-randconfig-002-20250617    clang-20
x86_64      buildonly-randconfig-003-20250617    gcc-11
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250617    gcc-10.5.0
xtensa                randconfig-002-20250617    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
