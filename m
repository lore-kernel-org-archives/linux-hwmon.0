Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE801DFEB
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Jun 2024 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717784369; cv=none; b=Ni/2earV7VTrVJeJHu1ecLxCSEfpDNUeaxjmKYiMUswF1pNmSHhsrJ0Nvk68nVeXdF/+hKBtRzK5CiX0YyzIUEGkxNBnQm/LXvhBQXsXnG9CSsRyYEcc7ZdvRHC8pVbYVjeav1B5mu0P9TSdr2mnwQokffOKsHMcUfk5iES5U6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717784369; c=relaxed/simple;
	bh=M7RFaJwUb5y9jRpZACSi9UjIxiGsqmknllgaBtE7tbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VdiVPdDyUlGx1FFSS3QlUlYd2SXwjA4qyNBrnARn59YOVy0HXjhH4EFfhY0GogejYhaEEP957lN/0vzeCMr36/wk2yYEHZocbHi7WZM9COQwzkdwCly/Xc5Ap8naCcaaPOjv3HY1zmaEusYriMXnqui1ASUORrZ2DMZc7xlIiNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kkbf+e7/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kkbf+e7/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717784368; x=1749320368;
  h=date:from:to:cc:subject:message-id;
  bh=M7RFaJwUb5y9jRpZACSi9UjIxiGsqmknllgaBtE7tbk=;
  b=Kkbf+e7/J3z84Peg2LEdp6h+H53hCW+hr7/YyCaVCisfVkwcE7/m4rdD
   F2uRsV0ZRAvOb6Gufhn/BxwHhzsRpRaI/vOFEvZD7pMyULoqUmFi8DWL/
   L42JRJfsqQBvlrXL4nYp9K96KMjzyxynLeGhPES8COnByGKqrXu/WIqG7
   d9221tuy9ZmrYDwGNUVlkQ4SyqU7So2xJlwKwigLbAMwCqMLM5D4vJ+am
   IUaKcsnCB77RixSQg6++9ugWUgnqy4L4rA1UfRSMmeDAHvTQjN085SuLp
   tCkOhmVvEYhmqymUv36uA0T3oaG4SWrkTI21IMiFPFQ0bc6wEkoWs/ybZ
   Q==;
X-CSE-ConnectionGUID: cXUDq9RiRA2jhAa5HUFIUw==
X-CSE-MsgGUID: mnZh3fmtTKaHEYFpuquabA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="11968135"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="11968135"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 11:19:27 -0700
X-CSE-ConnectionGUID: M2cFBwk2QreUZzxlrM5H2A==
X-CSE-MsgGUID: 9CR0I5IDS8Gh1oZ5ZZWW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="39069953"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2024 11:19:26 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFeBQ-0000Eg-15;
	Fri, 07 Jun 2024 18:19:24 +0000
Date: Sat, 08 Jun 2024 02:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 431761d744cc94f563033713b1ea9014887a3dd4
Message-ID: <202406080214.xABaPkX9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 431761d744cc94f563033713b1ea9014887a3dd4  hwmon: (w83795): Remove use of i2c_match_id()

elapsed time: 1456m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386         buildonly-randconfig-001-20240607   clang
i386         buildonly-randconfig-002-20240607   clang
i386         buildonly-randconfig-003-20240607   clang
i386         buildonly-randconfig-004-20240607   clang
i386         buildonly-randconfig-005-20240607   clang
i386         buildonly-randconfig-006-20240607   clang
i386                  randconfig-001-20240607   gcc  
i386                  randconfig-002-20240607   gcc  
i386                  randconfig-003-20240607   gcc  
i386                  randconfig-004-20240607   gcc  
i386                  randconfig-005-20240607   gcc  
i386                  randconfig-006-20240607   gcc  
i386                  randconfig-011-20240607   clang
i386                  randconfig-012-20240607   gcc  
i386                  randconfig-013-20240607   clang
i386                  randconfig-014-20240607   clang
i386                  randconfig-015-20240607   clang
i386                  randconfig-016-20240607   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
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
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
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
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
