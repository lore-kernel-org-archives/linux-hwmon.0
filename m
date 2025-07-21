Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C96D288C39
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Jul 2025 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101994; cv=none; b=q8j9a6xg/OxfX8GG7J7MtyjJAaJClObQMlm/6DUVnXkWUc6fkrA43VXA+hCwiU3QoxWW4mF3qTBT3WJex2iVhT0L1mfbkbTSkUawwrHJLsyZ6HbZCFuqHQgwto6IPZJbHznUyAZRcsW3skIIluKmQW11MbWX1BDd8wJfu+WJfLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101994; c=relaxed/simple;
	bh=6GpCxY9blH1C6mjjOiRo3xUNrKqu1OSwHclHDPURDmE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ccXnQy+J7+RLZsvjEcDkas94EOc0CmDa1I7hrogtQQWeBfCSeFbtzoPL/ySd1MVgD3jbjb1yXjQO+4V2dAAnJ3B4+KYwdVPEGUwb7U63r4UovLARcPrAOch2ii6YHtGt9xpjD5kFFbGh9B15vneB+GvYVf0rsdaeyn/5RFDFKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+2zEWVz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+2zEWVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753101993; x=1784637993;
  h=date:from:to:cc:subject:message-id;
  bh=6GpCxY9blH1C6mjjOiRo3xUNrKqu1OSwHclHDPURDmE=;
  b=O+2zEWVzwg53sMD+uvArcBgHdAhtyPLxzROsEY0RtyjDh3UNH4Pntobf
   jPxVuzJNAl+7aph32e41Ai2OBMfrrn5wLHi4riy+CWzXDbjBWo2s4AzIB
   8gwiOf6/aycxX26UVrsih5NFmmejdLaMZYhJ54b6V8McyiXzYMaOBuZd6
   hMLAzN3s3gKTWpy3mnPjTaYUhXJPN8LhTZJfrnKcHHHo1jdft0t2rusg7
   /T6INkZbuW/POMG79YuTbjLAoqzl6vLh1I/NImBbURUnmR2D8HXIwCw9q
   aDhvH3O4Z0JVJzLTOt/IYf5GUZ7UVNLizTdpnfUFbp96BTWslTCqxcxtp
   w==;
X-CSE-ConnectionGUID: O4bADfNgQ5ir5OluYzl0hQ==
X-CSE-MsgGUID: 1re80r9hSOKZfHEMIinm2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66753709"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="66753709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 05:46:26 -0700
X-CSE-ConnectionGUID: u87dBV+lSRyurdCvSPPHmA==
X-CSE-MsgGUID: XSmxNXHGT6KalmRzh34sMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="159257163"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Jul 2025 05:46:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udpuR-000Gnp-0h;
	Mon, 21 Jul 2025 12:46:23 +0000
Date: Mon, 21 Jul 2025 20:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a2609b707b58561b9e52f92f3f571d0510201f2f
Message-ID: <202507212050.7ek1jOxQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a2609b707b58561b9e52f92f3f571d0510201f2f  hwmon: ina238: Add support for INA228

elapsed time: 724m

configs tested: 141
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250721    gcc-11.5.0
arc                   randconfig-002-20250721    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         assabet_defconfig    clang-18
arm                   randconfig-001-20250721    clang-21
arm                   randconfig-002-20250721    gcc-13.4.0
arm                   randconfig-003-20250721    gcc-15.1.0
arm                   randconfig-004-20250721    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250721    clang-21
arm64                 randconfig-002-20250721    clang-20
arm64                 randconfig-003-20250721    gcc-13.4.0
arm64                 randconfig-004-20250721    clang-21
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250721    gcc-15.1.0
csky                  randconfig-002-20250721    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250721    clang-21
hexagon               randconfig-002-20250721    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250721    clang-20
i386        buildonly-randconfig-002-20250721    clang-20
i386        buildonly-randconfig-003-20250721    gcc-12
i386        buildonly-randconfig-004-20250721    gcc-12
i386        buildonly-randconfig-005-20250721    clang-20
i386        buildonly-randconfig-006-20250721    clang-20
i386                                defconfig    clang-20
i386                  randconfig-011-20250721    clang-20
i386                  randconfig-012-20250721    clang-20
i386                  randconfig-013-20250721    clang-20
i386                  randconfig-014-20250721    clang-20
i386                  randconfig-015-20250721    clang-20
i386                  randconfig-016-20250721    clang-20
i386                  randconfig-017-20250721    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250721    clang-18
loongarch             randconfig-002-20250721    gcc-12.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       alldefconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           ip28_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250721    gcc-8.5.0
nios2                 randconfig-002-20250721    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250721    gcc-15.1.0
parisc                randconfig-002-20250721    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                      cm5200_defconfig    clang-21
powerpc               randconfig-001-20250721    gcc-12.5.0
powerpc               randconfig-002-20250721    gcc-10.5.0
powerpc               randconfig-003-20250721    gcc-11.5.0
powerpc64             randconfig-001-20250721    clang-21
powerpc64             randconfig-002-20250721    clang-21
powerpc64             randconfig-003-20250721    clang-19
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250721    clang-21
riscv                 randconfig-002-20250721    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250721    clang-21
s390                  randconfig-002-20250721    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                ecovec24-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20250721    gcc-15.1.0
sh                    randconfig-002-20250721    gcc-14.3.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250721    gcc-15.1.0
sparc                 randconfig-002-20250721    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250721    clang-20
sparc64               randconfig-002-20250721    clang-21
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250721    gcc-12
um                    randconfig-002-20250721    clang-17
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250721    clang-20
x86_64      buildonly-randconfig-002-20250721    gcc-12
x86_64      buildonly-randconfig-003-20250721    gcc-12
x86_64      buildonly-randconfig-004-20250721    gcc-12
x86_64      buildonly-randconfig-005-20250721    clang-20
x86_64      buildonly-randconfig-006-20250721    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250721    gcc-11.5.0
xtensa                randconfig-002-20250721    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
