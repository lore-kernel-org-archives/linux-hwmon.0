Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB81AD5D
	for <linux-hwmon@vger.kernel.org>; Tue,  7 May 2024 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715079925; cv=none; b=fX/G2Emji0PNV/cZMMO0q0fz9qLKWIh78NZGuOqML2HV3aWr0qQw/9EMlLamDFM/GUn6jXhEH0HXk8pCHvuQt0XX6lJgmq0FVgnfkNKnWFXqxAvMFcm0SsK903acuW0ltGKabBfOIiJwJI/jKv/dn2H+YAhS7V+AMs9y9TP7u3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715079925; c=relaxed/simple;
	bh=xEDWzuShhfdCmjj1vQ0XxF5InJA/LVbUDEHAbYjqG/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V/JsSaKauGngdLNgZR5aU/SS/f93V9RbWWfxFg7tzfRhsvXWlD0us1BL0s+tYIFV/5w5U8l9mXsWq8qw3iRE3pzYNuBqP1+SA0Z9YMjDw72JILqhxHKwvAQwIMFtXxWBtQBi0iOCiM3LZ5DIVmcZkk17ohnDXz4p8l9jgdf+bVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyjOoq8t; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyjOoq8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715079923; x=1746615923;
  h=date:from:to:cc:subject:message-id;
  bh=xEDWzuShhfdCmjj1vQ0XxF5InJA/LVbUDEHAbYjqG/U=;
  b=dyjOoq8tZIS/EVwFrZFvgdOCEPrceMBWx1UNAaxnMMLUcKPc+8t0OTyl
   Q84yAmSR91tOvCiEpYeSqDCfEnEAs+M8ZBdQEbmIZuE/CK3PQWuF57ibG
   BkVgwDJh9IDpFXy424TZmfnHZkJk3+vLJSZ+E3/IHt3lryujN0PlgzByy
   NlqNVp60//qYGdYD38qJLvbmoSt4Y2JthHpcvJmLS1opYrWT0t53Ng+bw
   fOq+/K3h3n1jKUS8/qbOU3ri0rYbSmUgGjF+CDalX/FVAaZ8dxJNMZDzw
   sIR1kGj7bfHlTXFQMeMts3g+EgoxJHCKCeDj+U31lo8p0xRXoeYtB6bmy
   Q==;
X-CSE-ConnectionGUID: e4zCtw8XTDmRNejlsOWObQ==
X-CSE-MsgGUID: lJVOhXjjQEixWsVa+05TWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14684972"
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; 
   d="scan'208";a="14684972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 04:05:22 -0700
X-CSE-ConnectionGUID: 9QPd3hwgRiGkeEpyMdsIjQ==
X-CSE-MsgGUID: GA2MlMMSSNGiwTx4EpZlwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,261,1708416000"; 
   d="scan'208";a="59656718"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 May 2024 04:05:21 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4IdL-0001pY-0u;
	Tue, 07 May 2024 11:05:19 +0000
Date: Tue, 07 May 2024 19:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 f705920779ca00e48c1e4368da3a5bc8822470ab
Message-ID: <202405071905.h2KLOrbl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: f705920779ca00e48c1e4368da3a5bc8822470ab  mm/slub, kunit: Use inverted data to corrupt kmem cache

elapsed time: 1192m

configs tested: 141
configs skipped: 4

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
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          moxart_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240507   clang
i386         buildonly-randconfig-002-20240507   clang
i386         buildonly-randconfig-003-20240507   clang
i386         buildonly-randconfig-004-20240507   gcc  
i386         buildonly-randconfig-005-20240507   gcc  
i386         buildonly-randconfig-006-20240507   clang
i386                                defconfig   clang
i386                  randconfig-001-20240507   clang
i386                  randconfig-002-20240507   gcc  
i386                  randconfig-003-20240507   clang
i386                  randconfig-004-20240507   clang
i386                  randconfig-005-20240507   clang
i386                  randconfig-006-20240507   clang
i386                  randconfig-011-20240507   gcc  
i386                  randconfig-012-20240507   clang
i386                  randconfig-013-20240507   clang
i386                  randconfig-014-20240507   gcc  
i386                  randconfig-015-20240507   gcc  
i386                  randconfig-016-20240507   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
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
sh                        edosk7705_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
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
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240507   clang
x86_64       buildonly-randconfig-002-20240507   clang
x86_64       buildonly-randconfig-003-20240507   clang
x86_64       buildonly-randconfig-004-20240507   clang
x86_64       buildonly-randconfig-005-20240507   clang
x86_64       buildonly-randconfig-006-20240507   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240507   gcc  
x86_64                randconfig-002-20240507   clang
x86_64                randconfig-003-20240507   clang
x86_64                randconfig-004-20240507   gcc  
x86_64                randconfig-005-20240507   gcc  
x86_64                randconfig-006-20240507   gcc  
x86_64                randconfig-011-20240507   gcc  
x86_64                randconfig-012-20240507   clang
x86_64                randconfig-013-20240507   clang
x86_64                randconfig-014-20240507   clang
x86_64                randconfig-015-20240507   clang
x86_64                randconfig-016-20240507   clang
x86_64                randconfig-071-20240507   gcc  
x86_64                randconfig-072-20240507   gcc  
x86_64                randconfig-073-20240507   clang
x86_64                randconfig-074-20240507   clang
x86_64                randconfig-075-20240507   clang
x86_64                randconfig-076-20240507   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
