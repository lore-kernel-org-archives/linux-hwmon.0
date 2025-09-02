Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F4D26562D
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Sep 2025 23:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756856769; cv=none; b=Sxi8r2AAsopt2oYfWgunt1f1HPO6De7tD7kml4T0OzkWg0Od0svioFSj1K1RWMkNxRyXk1gLcTQHwPfqY3ZVqnIZ7PSqcQw2MsaX/ZavuSy4GMXlaFcoU5YAW+bnjUbvdqwQ2GQvtzD2dPmShYBhpo6kQ9I7XwsaXFLZg1I8Uvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756856769; c=relaxed/simple;
	bh=TF8onH3iXZoOUSRldFyq0HtsX1eEKl9Nm0W9zq6bUQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TAR7jyj4fgpIuzTGZd8J5JHQdrwpgEDX8HQ554k+M/K0JrAp76nsgEPVZUdURmFhRRgKHbTSDrxBvyMjMqUpaFoVHpzbiMGxVwlHngvZzZfjc9eLilBzGJYJTdK02w1crPG86QgWwvMoPeWr83UN4hCMD7GFG67wZ8hdjH4Cnug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an/Mysky; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an/Mysky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756856765; x=1788392765;
  h=date:from:to:cc:subject:message-id;
  bh=TF8onH3iXZoOUSRldFyq0HtsX1eEKl9Nm0W9zq6bUQ8=;
  b=an/Myskyi6UqG7IZTVlk7Jrbu4WCEFva+gPCVmEDX6UVj1cjFMwPMAgJ
   1cbSLOMOIPfXl0GWiDWSbjPgr9GjP7sXSJT4lyI7uCThBwDbV2/MDTIjy
   oMVKUhsXSOrr4ycXLdM3NvpY3Z+nynz1c+CFibJGYLt6p+55UVgkYnkFu
   NvGdc9PiIYszRSGTZzH79EVB+APUqcsfrO6q+q8+cNoZY+AKUEojnlOm7
   yN9APzBR+sxv79w3Vk76D9OnT/0B8KmpTtLWzhi3PWkrLWmOyI9HvAfCf
   aMBF8hrGz6r9JZDJwZKTVV9EUfUF57MNtA8ZCFdVuiBExpCjODVRSmKvy
   w==;
X-CSE-ConnectionGUID: cuymY45dQ8mQzwQjEdI4RA==
X-CSE-MsgGUID: DgkzQo8jRNyUWCK2F7g/+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="46736269"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="46736269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 16:46:05 -0700
X-CSE-ConnectionGUID: 2SO/xBfqSnO1WAYAW1+yAg==
X-CSE-MsgGUID: 8Cz5EfJnSGOsY/xhi74jrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="170710044"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Sep 2025 16:46:04 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utahN-00038p-0V;
	Tue, 02 Sep 2025 23:46:01 +0000
Date: Wed, 03 Sep 2025 07:45:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 c2623573178bab32990695fb729e9b69710ed66d
Message-ID: <202509030722.wGPCYDDz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: c2623573178bab32990695fb729e9b69710ed66d  hwmon: (ina238) Correctly clamp power limits

elapsed time: 1464m

configs tested: 240
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20250902    gcc-11.5.0
arc                   randconfig-001-20250903    gcc-8.5.0
arc                   randconfig-002-20250902    gcc-9.5.0
arc                   randconfig-002-20250903    gcc-8.5.0
arc                    vdk_hs38_smp_defconfig    gcc-15.1.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                       imx_v6_v7_defconfig    gcc-15.1.0
arm                   randconfig-001-20250902    gcc-15.1.0
arm                   randconfig-001-20250903    gcc-8.5.0
arm                   randconfig-002-20250902    gcc-8.5.0
arm                   randconfig-002-20250903    gcc-8.5.0
arm                   randconfig-003-20250902    clang-22
arm                   randconfig-003-20250903    gcc-8.5.0
arm                   randconfig-004-20250902    clang-22
arm                   randconfig-004-20250903    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250902    gcc-8.5.0
arm64                 randconfig-001-20250903    gcc-8.5.0
arm64                 randconfig-002-20250902    clang-22
arm64                 randconfig-002-20250903    gcc-8.5.0
arm64                 randconfig-003-20250902    gcc-12.5.0
arm64                 randconfig-003-20250903    gcc-8.5.0
arm64                 randconfig-004-20250902    clang-22
arm64                 randconfig-004-20250903    gcc-8.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250902    gcc-14.3.0
csky                  randconfig-001-20250903    gcc-10.5.0
csky                  randconfig-002-20250902    gcc-12.5.0
csky                  randconfig-002-20250903    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250902    clang-18
hexagon               randconfig-001-20250903    gcc-10.5.0
hexagon               randconfig-002-20250902    clang-22
hexagon               randconfig-002-20250903    gcc-10.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250902    clang-20
i386        buildonly-randconfig-001-20250903    clang-20
i386        buildonly-randconfig-002-20250902    clang-20
i386        buildonly-randconfig-002-20250903    clang-20
i386        buildonly-randconfig-003-20250902    gcc-12
i386        buildonly-randconfig-003-20250903    clang-20
i386        buildonly-randconfig-004-20250902    clang-20
i386        buildonly-randconfig-004-20250903    clang-20
i386        buildonly-randconfig-005-20250902    gcc-12
i386        buildonly-randconfig-005-20250903    clang-20
i386        buildonly-randconfig-006-20250902    clang-20
i386        buildonly-randconfig-006-20250903    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250903    gcc-12
i386                  randconfig-002-20250903    gcc-12
i386                  randconfig-003-20250903    gcc-12
i386                  randconfig-004-20250903    gcc-12
i386                  randconfig-005-20250903    gcc-12
i386                  randconfig-006-20250903    gcc-12
i386                  randconfig-007-20250903    gcc-12
i386                  randconfig-011-20250903    gcc-12
i386                  randconfig-012-20250903    gcc-12
i386                  randconfig-013-20250903    gcc-12
i386                  randconfig-014-20250903    gcc-12
i386                  randconfig-015-20250903    gcc-12
i386                  randconfig-016-20250903    gcc-12
i386                  randconfig-017-20250903    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250902    clang-22
loongarch             randconfig-001-20250903    gcc-10.5.0
loongarch             randconfig-002-20250902    clang-22
loongarch             randconfig-002-20250903    gcc-10.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250902    gcc-9.5.0
nios2                 randconfig-001-20250903    gcc-10.5.0
nios2                 randconfig-002-20250902    gcc-11.5.0
nios2                 randconfig-002-20250903    gcc-10.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250902    gcc-8.5.0
parisc                randconfig-001-20250903    gcc-10.5.0
parisc                randconfig-002-20250902    gcc-11.5.0
parisc                randconfig-002-20250903    gcc-10.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250902    gcc-9.5.0
powerpc               randconfig-001-20250903    gcc-10.5.0
powerpc               randconfig-002-20250902    gcc-8.5.0
powerpc               randconfig-002-20250903    gcc-10.5.0
powerpc               randconfig-003-20250902    gcc-11.5.0
powerpc               randconfig-003-20250903    gcc-10.5.0
powerpc64             randconfig-001-20250902    gcc-12.5.0
powerpc64             randconfig-001-20250903    gcc-10.5.0
powerpc64             randconfig-002-20250902    clang-22
powerpc64             randconfig-002-20250903    gcc-10.5.0
powerpc64             randconfig-003-20250902    clang-22
powerpc64             randconfig-003-20250903    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250902    gcc-13.4.0
riscv                 randconfig-001-20250903    gcc-12.5.0
riscv                 randconfig-002-20250902    clang-22
riscv                 randconfig-002-20250903    gcc-12.5.0
s390                             alldefconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250902    clang-22
s390                  randconfig-001-20250903    gcc-12.5.0
s390                  randconfig-002-20250902    gcc-10.5.0
s390                  randconfig-002-20250903    gcc-12.5.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250902    gcc-12.5.0
sh                    randconfig-001-20250903    gcc-12.5.0
sh                    randconfig-002-20250902    gcc-12.5.0
sh                    randconfig-002-20250903    gcc-12.5.0
sh                           se7751_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250902    gcc-14.3.0
sparc                 randconfig-001-20250903    gcc-12.5.0
sparc                 randconfig-002-20250902    gcc-8.5.0
sparc                 randconfig-002-20250903    gcc-12.5.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250902    clang-20
sparc64               randconfig-001-20250903    gcc-12.5.0
sparc64               randconfig-002-20250902    gcc-9.5.0
sparc64               randconfig-002-20250903    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250902    gcc-12
um                    randconfig-001-20250903    gcc-12.5.0
um                    randconfig-002-20250902    gcc-12
um                    randconfig-002-20250903    gcc-12.5.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250902    clang-20
x86_64      buildonly-randconfig-001-20250903    clang-20
x86_64      buildonly-randconfig-002-20250902    clang-20
x86_64      buildonly-randconfig-002-20250903    clang-20
x86_64      buildonly-randconfig-003-20250902    clang-20
x86_64      buildonly-randconfig-003-20250903    clang-20
x86_64      buildonly-randconfig-004-20250902    gcc-12
x86_64      buildonly-randconfig-004-20250903    clang-20
x86_64      buildonly-randconfig-005-20250902    gcc-12
x86_64      buildonly-randconfig-005-20250903    clang-20
x86_64      buildonly-randconfig-006-20250902    gcc-12
x86_64      buildonly-randconfig-006-20250903    clang-20
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250903    clang-20
x86_64                randconfig-002-20250903    clang-20
x86_64                randconfig-003-20250903    clang-20
x86_64                randconfig-004-20250903    clang-20
x86_64                randconfig-005-20250903    clang-20
x86_64                randconfig-006-20250903    clang-20
x86_64                randconfig-007-20250903    clang-20
x86_64                randconfig-008-20250903    clang-20
x86_64                randconfig-071-20250903    clang-20
x86_64                randconfig-072-20250903    clang-20
x86_64                randconfig-073-20250903    clang-20
x86_64                randconfig-074-20250903    clang-20
x86_64                randconfig-075-20250903    clang-20
x86_64                randconfig-076-20250903    clang-20
x86_64                randconfig-077-20250903    clang-20
x86_64                randconfig-078-20250903    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250902    gcc-9.5.0
xtensa                randconfig-001-20250903    gcc-12.5.0
xtensa                randconfig-002-20250902    gcc-10.5.0
xtensa                randconfig-002-20250903    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
