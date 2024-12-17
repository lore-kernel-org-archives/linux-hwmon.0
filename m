Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52D13AA41
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Dec 2024 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734465689; cv=none; b=R17KmaudqE7Pc+mjFVjGm0KnQ2xrjYJKCe4TFWMEQZXJBC2LC+ImYFcIjrVduxbrMCLqNUt17PewZDNUBgjFjXa6nZYV88rZD9Sa8SuQmDi1ky1+wsyxLEqh2cNI8dHdECoIHs90xh/2CaUEQHK84AO2u6OgurnDLF/VbvU1gLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734465689; c=relaxed/simple;
	bh=SPdH0dt9rBMZk0cKGXrxoLhip9s5RiNxmF+kkZJoDgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HRsqPWrBEct+c1FnAsMD3eaQjwQREWlSL8OXjDGE7SSxCiez/bYZ+FnXf3s7G7bA5M9cGhDi4zOek5xAv1JIMlXry026IqzHrNlC+vKTQxbPwO+7+42vMCF8oxvhj2HdGHME73N/kqAYTIOCKE25llrXQI0Yja27Zm0cR6I3hjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gca4vTaH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gca4vTaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734465688; x=1766001688;
  h=date:from:to:cc:subject:message-id;
  bh=SPdH0dt9rBMZk0cKGXrxoLhip9s5RiNxmF+kkZJoDgE=;
  b=gca4vTaH82PDrBsDp3wVK8PUDkLC/ZZgzougHDBMA0fLrLnCuYmNTR/u
   9J3NLNyWzeunQBUVthjJRL9wjrNYNCWz5NsB5esyNrDcIi7B2ZNrbgckA
   VhSDHEpwlCtl1arCPIdP8dhKg6ivp3i67qjRibSD29JptCelxUjs6V9A/
   cZYRD1OV6mRiOUFwti0KO1wjKFNdgrrwjm7AEGvyUcmhNfhLUWTckX3Yb
   VhW68Dqm7je0/LVa0fvW3kJO0cb1bixWxvSxq5VCO1v7famNwG0B+9hOf
   ZZ9zryHDeEPbudGlnyfm5LdL6qNs5P2Tx4UUvy4S4moz04kKaAWDUEFrM
   Q==;
X-CSE-ConnectionGUID: Y0MIQjCCQYCJlrKO4DyW0g==
X-CSE-MsgGUID: BHWcOQ6TQ0yzZPQ72UJRyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35063362"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="35063362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 12:01:25 -0800
X-CSE-ConnectionGUID: OsVI3BdPQqKBYE6uy6OgCA==
X-CSE-MsgGUID: trbCRHoTTMaGtgkvuRp1Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120880315"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Dec 2024 12:01:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNdkw-000FlY-0G;
	Tue, 17 Dec 2024 20:01:22 +0000
Date: Wed, 18 Dec 2024 04:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 30062044a1a652ad1722a19604b816e363af7089
Message-ID: <202412180435.BIsNglBG-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 30062044a1a652ad1722a19604b816e363af7089  hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs

elapsed time: 1447m

configs tested: 108
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241217    gcc-13.2.0
arc                   randconfig-002-20241217    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241217    clang-16
arm                   randconfig-002-20241217    gcc-14.2.0
arm                   randconfig-003-20241217    gcc-14.2.0
arm                   randconfig-004-20241217    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241217    clang-20
arm64                 randconfig-002-20241217    clang-16
arm64                 randconfig-003-20241217    clang-18
arm64                 randconfig-004-20241217    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241217    gcc-14.2.0
csky                  randconfig-002-20241217    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241217    clang-20
hexagon               randconfig-002-20241217    clang-19
i386                             alldefconfig    gcc-12
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241217    clang-19
i386        buildonly-randconfig-002-20241217    gcc-12
i386        buildonly-randconfig-003-20241217    gcc-12
i386        buildonly-randconfig-004-20241217    clang-19
i386        buildonly-randconfig-005-20241217    clang-19
i386        buildonly-randconfig-006-20241217    gcc-11
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241217    gcc-14.2.0
loongarch             randconfig-002-20241217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241217    gcc-14.2.0
nios2                 randconfig-002-20241217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241217    gcc-14.2.0
parisc                randconfig-002-20241217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          g5_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241217    clang-20
powerpc               randconfig-002-20241217    gcc-14.2.0
powerpc               randconfig-003-20241217    clang-16
powerpc64             randconfig-001-20241217    gcc-14.2.0
powerpc64             randconfig-002-20241217    gcc-14.2.0
powerpc64             randconfig-003-20241217    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241217    gcc-14.2.0
riscv                 randconfig-002-20241217    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241217    gcc-14.2.0
s390                  randconfig-002-20241217    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ap325rxa_defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                    randconfig-001-20241217    gcc-14.2.0
sh                    randconfig-002-20241217    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241217    gcc-14.2.0
sparc                 randconfig-002-20241217    gcc-14.2.0
sparc64               randconfig-001-20241217    gcc-14.2.0
sparc64               randconfig-002-20241217    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241217    clang-20
um                    randconfig-002-20241217    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-002-20241217    gcc-12
x86_64      buildonly-randconfig-003-20241217    gcc-12
x86_64      buildonly-randconfig-005-20241217    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241217    gcc-14.2.0
xtensa                randconfig-002-20241217    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
