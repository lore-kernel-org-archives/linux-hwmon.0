Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74B1114
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 20:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833270; cv=none; b=PjNHaVEaaskIhFl0hEyzYfx6xwlJ6wsrLhoVuoG7gFETq8k2DNOjBcFroMZHBjyW8B8PNrfQWFlIpkOXSSybmIfhygj7CzZm6HRJ0hZjvCn2vhlpS/6rb1Wx6m1HdiuQOXtJKoS3MJaQD7G+8rScI+biDPOGrEdIl1h+527qzsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833270; c=relaxed/simple;
	bh=AiRgFK5XslYtpGVeRLZ0J3jQqDC5apB0Md6M3lCi4nI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J9dnFbjt399pa7IEW5jAVyRDZSh4aof70Rb/sp7WCfekBAlED8E8oHPXiXlDh6oUs+skCiq1yTWmytIXPsGuiSAIgvQBKB7QbUFOob0ypYxf23hAZAzxH6JV+Abxh/i9/+NZbFnwrOcxLbSQDxAE4FRnYjWJhZpcuSC9H/nhkp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwQfku0T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwQfku0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758833269; x=1790369269;
  h=date:from:to:cc:subject:message-id;
  bh=AiRgFK5XslYtpGVeRLZ0J3jQqDC5apB0Md6M3lCi4nI=;
  b=lwQfku0TZvwOGV9DTnKqMQS7PA8k+6HfJMVZrG9P8gfcVnw6xoVHIszw
   6bmuO8vMJOR95BLU40nxsVjRPNyOQqsrkw6btpwTFgj3gtl1d/cMBEs4A
   L9CL1qsx3tTdS04dkdAYlj9WWdNnK2s713UTtl3WhZCUS0//9Nke/i61+
   l89wg/C761P061Jei0O+2HcvpYSItzbgP67MH7xKj0sYl7lbhh6XRHCjG
   RZVW7/eyO6vJvL28GW0NI2AM3gl1wn+xyMHJe+wfQ474j/k4JtViqtq8v
   uf3jM6T8EXZNL8IG9gdEFs0u683LoD+AZY7eg7hp+9h/eaKMhjXNyaPYP
   w==;
X-CSE-ConnectionGUID: cJI4Qc2aTGKMg2GPjkAfqg==
X-CSE-MsgGUID: 5Gzd0J5vTnOSzJ9NpHxONQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72267259"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="72267259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 13:47:47 -0700
X-CSE-ConnectionGUID: cUXnjZsuTMm2rl/kGrvP2w==
X-CSE-MsgGUID: WQeHtVQZReaILoQMZmT3PA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2025 13:47:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ssR-0005bl-1D;
	Thu, 25 Sep 2025 20:47:43 +0000
Date: Fri, 26 Sep 2025 04:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 61284c4cdf8234783a24784272bebf0464892b06
Message-ID: <202509260448.GjIUXxFA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 61284c4cdf8234783a24784272bebf0464892b06  Merge branch 'fixes-v6.17' into testing

elapsed time: 1457m

configs tested: 231
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                                 defconfig    clang-19
arc                   randconfig-001-20250925    gcc-13.4.0
arc                   randconfig-002-20250925    gcc-13.4.0
arc                   randconfig-002-20250925    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250925    gcc-11.5.0
arm                   randconfig-001-20250925    gcc-13.4.0
arm                   randconfig-002-20250925    gcc-10.5.0
arm                   randconfig-002-20250925    gcc-13.4.0
arm                   randconfig-003-20250925    gcc-13.4.0
arm                   randconfig-003-20250925    gcc-8.5.0
arm                   randconfig-004-20250925    gcc-13.4.0
arm                   randconfig-004-20250925    gcc-14.3.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250925    gcc-11.5.0
arm64                 randconfig-001-20250925    gcc-13.4.0
arm64                 randconfig-002-20250925    gcc-13.4.0
arm64                 randconfig-002-20250925    gcc-15.1.0
arm64                 randconfig-003-20250925    clang-19
arm64                 randconfig-003-20250925    gcc-13.4.0
arm64                 randconfig-004-20250925    gcc-13.4.0
arm64                 randconfig-004-20250925    gcc-8.5.0
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250925    clang-22
csky                  randconfig-001-20250925    gcc-14.3.0
csky                  randconfig-002-20250925    clang-22
csky                  randconfig-002-20250925    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250925    clang-22
hexagon               randconfig-002-20250925    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250925    clang-20
i386        buildonly-randconfig-001-20250925    gcc-14
i386        buildonly-randconfig-002-20250925    clang-20
i386        buildonly-randconfig-002-20250925    gcc-14
i386        buildonly-randconfig-003-20250925    gcc-14
i386        buildonly-randconfig-004-20250925    gcc-14
i386        buildonly-randconfig-005-20250925    clang-20
i386        buildonly-randconfig-005-20250925    gcc-14
i386        buildonly-randconfig-006-20250925    clang-20
i386        buildonly-randconfig-006-20250925    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20250925    gcc-14
i386                  randconfig-002-20250925    gcc-14
i386                  randconfig-003-20250925    gcc-14
i386                  randconfig-004-20250925    gcc-14
i386                  randconfig-005-20250925    gcc-14
i386                  randconfig-006-20250925    gcc-14
i386                  randconfig-007-20250925    gcc-14
i386                  randconfig-011-20250925    clang-20
i386                  randconfig-012-20250925    clang-20
i386                  randconfig-013-20250925    clang-20
i386                  randconfig-014-20250925    clang-20
i386                  randconfig-015-20250925    clang-20
i386                  randconfig-016-20250925    clang-20
i386                  randconfig-017-20250925    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250925    clang-18
loongarch             randconfig-001-20250925    clang-22
loongarch             randconfig-002-20250925    clang-22
loongarch             randconfig-002-20250925    gcc-12.5.0
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
mips                              allnoconfig    gcc-15.1.0
mips                           ip30_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250925    clang-22
nios2                 randconfig-001-20250925    gcc-8.5.0
nios2                 randconfig-002-20250925    clang-22
nios2                 randconfig-002-20250925    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250925    clang-22
parisc                randconfig-001-20250925    gcc-8.5.0
parisc                randconfig-002-20250925    clang-22
parisc                randconfig-002-20250925    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    clang-22
powerpc                      pmac32_defconfig    clang-22
powerpc               randconfig-001-20250925    clang-22
powerpc               randconfig-002-20250925    clang-22
powerpc               randconfig-002-20250925    gcc-8.5.0
powerpc               randconfig-003-20250925    clang-22
powerpc               randconfig-003-20250925    gcc-8.5.0
powerpc64             randconfig-001-20250925    clang-22
powerpc64             randconfig-002-20250925    clang-22
powerpc64             randconfig-002-20250925    gcc-14.3.0
powerpc64             randconfig-003-20250925    clang-22
powerpc64             randconfig-003-20250925    gcc-8.5.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250925    clang-22
riscv                 randconfig-001-20250925    gcc-12.5.0
riscv                 randconfig-002-20250925    clang-22
riscv                 randconfig-002-20250925    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250925    gcc-12.5.0
s390                  randconfig-001-20250925    gcc-15.1.0
s390                  randconfig-002-20250925    gcc-12.5.0
s390                  randconfig-002-20250925    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    gcc-15.1.0
sh                    randconfig-001-20250925    gcc-12.5.0
sh                    randconfig-001-20250925    gcc-15.1.0
sh                    randconfig-002-20250925    gcc-12.5.0
sh                    randconfig-002-20250925    gcc-13.4.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7206_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250925    gcc-12.5.0
sparc                 randconfig-001-20250925    gcc-15.1.0
sparc                 randconfig-002-20250925    gcc-12.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250925    gcc-10.5.0
sparc64               randconfig-001-20250925    gcc-12.5.0
sparc64               randconfig-002-20250925    gcc-10.5.0
sparc64               randconfig-002-20250925    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250925    gcc-12.5.0
um                    randconfig-001-20250925    gcc-14
um                    randconfig-002-20250925    clang-22
um                    randconfig-002-20250925    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250925    clang-20
x86_64      buildonly-randconfig-002-20250925    clang-20
x86_64      buildonly-randconfig-002-20250925    gcc-14
x86_64      buildonly-randconfig-003-20250925    clang-20
x86_64      buildonly-randconfig-003-20250925    gcc-14
x86_64      buildonly-randconfig-004-20250925    clang-20
x86_64      buildonly-randconfig-005-20250925    clang-20
x86_64      buildonly-randconfig-006-20250925    clang-20
x86_64      buildonly-randconfig-006-20250925    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250925    gcc-14
x86_64                randconfig-002-20250925    gcc-14
x86_64                randconfig-003-20250925    gcc-14
x86_64                randconfig-004-20250925    gcc-14
x86_64                randconfig-005-20250925    gcc-14
x86_64                randconfig-006-20250925    gcc-14
x86_64                randconfig-007-20250925    gcc-14
x86_64                randconfig-008-20250925    gcc-14
x86_64                randconfig-071-20250925    gcc-14
x86_64                randconfig-072-20250925    gcc-14
x86_64                randconfig-073-20250925    gcc-14
x86_64                randconfig-074-20250925    gcc-14
x86_64                randconfig-075-20250925    gcc-14
x86_64                randconfig-076-20250925    gcc-14
x86_64                randconfig-077-20250925    gcc-14
x86_64                randconfig-078-20250925    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250925    gcc-12.5.0
xtensa                randconfig-002-20250925    gcc-11.5.0
xtensa                randconfig-002-20250925    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
