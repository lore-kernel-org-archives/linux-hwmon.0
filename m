Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB213A88D
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Feb 2024 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708031080; cv=none; b=MfKUrcsJhury4d9Kv4HhVxlRi2BhjmY7uo3Q+pIZTCzdJCT1FhQrN84L/ZJU757EUPp5aj2GAt/4h7fOCqUAdmAu1FUZ76CZXdJPjyoCnJ52J6XEuOpF2JltYoysv8XNj63Cu7X7USOUfrXht97fk2nTVKJ7+GT8rme4erIXTWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708031080; c=relaxed/simple;
	bh=gBsf2kd+mJ6F89MZvdvN8IhZYkeeYysdw3WgdXYM6Gc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YR5LTWaVZ6iO04/adg+ZSYUgxFlLe5rQquK/Y+qKomoz6w+rTdQlPqL9Uf4VQLtZ95QcoKM1ttc4J5tQKwmK+q2o5l3Tqmmn17d/PPsE6FLflvoyzl6T7vbFZKYYrPHvwNV0PD99gZkkohOGrLbXNxMvabdzjJIsizTzu45xaF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOw47bre; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOw47bre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708031076; x=1739567076;
  h=date:from:to:cc:subject:message-id;
  bh=gBsf2kd+mJ6F89MZvdvN8IhZYkeeYysdw3WgdXYM6Gc=;
  b=MOw47breLPVb1eeyw4FIhPGabZtelV4qteOm8wqCqD/HtiZWs8a/zL/i
   ++mvO6NjA2Esdu67CLVpJ9ZRbfWEUz83ZwD58BRp8zYDJe7YunMB9EsAc
   h9Hp02I07Xa6Y6tqRwSOTyuZxSx71/Qw2u287PRbPObbK0t+HgvnPdOW5
   yD4qJIK9AXPxL1MQ2iWvuu9TKo2LQPe2gSTLrzAcpOvGUJTYwRKCmyS3D
   VK/wjBHThICMOVnpEguWxtWLToDJzJVz0Jr5YGcHtiXZtqxmAz/45qMiJ
   qO49AtppxEvrbR4XEaZ+WLZKzhrXDDJerp6pt6moJl8NJ4slI1RumjuJk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2286609"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2286609"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 13:04:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="34700597"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2024 13:04:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raiu5-0000lU-21;
	Thu, 15 Feb 2024 21:04:27 +0000
Date: Fri, 16 Feb 2024 05:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 74d0d066bfaf25d2b25dc0e09f7af009534108a9
Message-ID: <202402160556.0P9IodSh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 74d0d066bfaf25d2b25dc0e09f7af009534108a9  hwmon: (pmbus/ir38064) Use PMBUS_REGULATOR_ONE to declare regulator

elapsed time: 1517m

configs tested: 103
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240215   gcc  
arc                   randconfig-001-20240216   gcc  
arc                   randconfig-002-20240215   gcc  
arc                   randconfig-002-20240216   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240215   clang
arm                   randconfig-001-20240216   clang
arm                   randconfig-002-20240215   gcc  
arm                   randconfig-002-20240216   clang
arm                   randconfig-003-20240215   gcc  
arm                   randconfig-003-20240216   gcc  
arm                   randconfig-004-20240215   gcc  
arm                   randconfig-004-20240216   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240215   clang
arm64                 randconfig-001-20240216   clang
arm64                 randconfig-002-20240215   clang
arm64                 randconfig-002-20240216   gcc  
arm64                 randconfig-003-20240215   gcc  
arm64                 randconfig-004-20240215   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240215   gcc  
csky                  randconfig-002-20240215   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240215   clang
hexagon               randconfig-002-20240215   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240215   gcc  
loongarch             randconfig-002-20240215   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240215   gcc  
nios2                 randconfig-002-20240215   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240215   gcc  
parisc                randconfig-002-20240215   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240215   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
