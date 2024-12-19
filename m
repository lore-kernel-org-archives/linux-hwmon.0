Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF0A8F6D
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Dec 2024 21:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645001; cv=none; b=Hw1tT+QTDFQ3Qkub2ZnJGgotwCaWFFURP1fjoIqsemTTnh7zfSr+1PCE0Cq/Gfphr+XVYgWvoJBVNhL5dhgqxSEdIRuHgR3qc3JBQQ6+A2yX9PHtRITR/Jmx7wNjXb7FlbzIKOeWbu6TCOtaqVg+rQhmkwnu4Xk+5aJOcl0B1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645001; c=relaxed/simple;
	bh=OTVRN9XTamfMPt09/HxCCFw0pMIqmeg9cJucEC02hBE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k2h2EJGaTPS2whLn7gsHmQsBwXTGcyIyD3UhLuajYsACO/XfNe9gCKJIZXcnTTqA8Fn7bsN1bjIkLrxLpqBtkstH53s7FXkvI7JpSZs/keG398MiI5xd0mIMwLa8iN8gIudHgBK7IkxlkYToJZD1+jWcyebengB+UyJri7m24D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtjoYxy0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtjoYxy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734644999; x=1766180999;
  h=date:from:to:cc:subject:message-id;
  bh=OTVRN9XTamfMPt09/HxCCFw0pMIqmeg9cJucEC02hBE=;
  b=MtjoYxy0UNxc555bOZehy3Ob6QVo2n4yMJvkSYLD3XG+UfKAVBwqJszL
   96Bt5UnzdDF2xB6CC5m7XzagD4RspKMsue2UhWiaps6b3vYimzn3/hoxJ
   EVhPIPMyS8R75ShgCiFsVe3KVj2kpcPA3EE6Xlk2mAh9k/MLsHygI2z5g
   O3Y98G8G8XQ6qdxaAZdoI/Vn7cESbpcPno9SnD55yyrL4ZqOZ/5BzB9NV
   gsXAvVuF0KlWIo1+2Y1Hxx018B631QTvo4jNPTS7ThrjmxlRJwCjKDdIY
   N0K0QwdcYFC6p87EWZQgf0abcy69B4yrSJ34nZYWAo7BcWq04jnR9bFWe
   A==;
X-CSE-ConnectionGUID: CFrTglRtRSiqBpYgW/1AGQ==
X-CSE-MsgGUID: dFed4XLjQzCxDV7+THsvbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="38026418"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="38026418"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:49:59 -0800
X-CSE-ConnectionGUID: viYZZRpmTEqILxPBUFlRQA==
X-CSE-MsgGUID: l37inhjwQsORD60/GxRpmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="103303046"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Dec 2024 13:49:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOOP4-0000Z5-3A;
	Thu, 19 Dec 2024 21:49:54 +0000
Date: Fri, 20 Dec 2024 05:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 cf3e3087ddbed3569bc9cfba28d32eba0b0f50d8
Message-ID: <202412200519.kkARlG21-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: cf3e3087ddbed3569bc9cfba28d32eba0b0f50d8  Merge branch 'fixes-v6.13' into testing

Warning ids grouped by kconfigs:

recent_errors
`-- i386-randconfig-141-20241220
    |-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val-.
    `-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val64-.

elapsed time: 1448m

configs tested: 108
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241219    gcc-13.2.0
arc                   randconfig-002-20241219    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                   randconfig-001-20241219    clang-18
arm                   randconfig-002-20241219    gcc-14.2.0
arm                   randconfig-003-20241219    clang-18
arm                   randconfig-004-20241219    gcc-14.2.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241219    clang-16
arm64                 randconfig-002-20241219    clang-18
arm64                 randconfig-003-20241219    gcc-14.2.0
arm64                 randconfig-004-20241219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241219    gcc-14.2.0
csky                  randconfig-002-20241219    gcc-14.2.0
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20241219    clang-19
hexagon               randconfig-002-20241219    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20241219    gcc-12
i386        buildonly-randconfig-002-20241219    gcc-12
i386        buildonly-randconfig-003-20241219    clang-19
i386        buildonly-randconfig-004-20241219    clang-19
i386        buildonly-randconfig-005-20241219    gcc-12
i386        buildonly-randconfig-006-20241219    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241219    gcc-14.2.0
loongarch             randconfig-002-20241219    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241219    gcc-14.2.0
nios2                 randconfig-002-20241219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20241219    gcc-14.2.0
parisc                randconfig-002-20241219    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241219    clang-18
powerpc               randconfig-002-20241219    clang-16
powerpc               randconfig-003-20241219    clang-20
powerpc                     tqm8541_defconfig    clang-15
powerpc                        warp_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241219    gcc-14.2.0
powerpc64             randconfig-002-20241219    clang-18
powerpc64             randconfig-003-20241219    clang-16
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20241219    clang-16
riscv                 randconfig-002-20241219    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241219    gcc-14.2.0
s390                  randconfig-002-20241219    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                    randconfig-001-20241219    gcc-14.2.0
sh                    randconfig-002-20241219    gcc-14.2.0
sh                           se7206_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241219    gcc-14.2.0
sparc                 randconfig-002-20241219    gcc-14.2.0
sparc64               randconfig-001-20241219    gcc-14.2.0
sparc64               randconfig-002-20241219    gcc-14.2.0
um                                allnoconfig    clang-18
um                    randconfig-001-20241219    gcc-12
um                    randconfig-002-20241219    clang-20
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241219    gcc-12
x86_64      buildonly-randconfig-002-20241219    gcc-12
x86_64      buildonly-randconfig-003-20241219    clang-19
x86_64      buildonly-randconfig-004-20241219    gcc-12
x86_64      buildonly-randconfig-005-20241219    gcc-12
x86_64      buildonly-randconfig-006-20241219    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241219    gcc-14.2.0
xtensa                randconfig-002-20241219    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
