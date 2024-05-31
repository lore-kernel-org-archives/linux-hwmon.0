Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE613156242
	for <linux-hwmon@vger.kernel.org>; Fri, 31 May 2024 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717173560; cv=none; b=qhBbQCkXW6W2GcLgkwTgRVCradStOj+MglsE7zXksFsu9+sV3B2FzmX3k73UhQbC7E/bvkxTlI8BsnoXqUpVD6RUgAVr/EBD+c0XXjeT8SVZHx0X5rJKUK+8seNE4N8lkA9noAXJxVqhk/UBdyMmVeCRudiGzefZw8+AF1NKQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717173560; c=relaxed/simple;
	bh=fefWDP3wViAwQWASbwFul4whQ2e6hjGYBy59NM0jD1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o9p5rqpXJNOfvjgEoCKGn/QZzVPSeZTzMLNYDttMycugHS0SYMmpsytGAWnSD18G/9qkltZxFq/3TyqAbJx0t3xOK0R8Yv3iOF6BIROMOXLghkp+BPBQipC/6FYGX8xfOdmN8jpcOY87zR8uTCrL4QM0gVjZmI/4s5vVRr2x1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkPo+oii; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkPo+oii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717173559; x=1748709559;
  h=date:from:to:cc:subject:message-id;
  bh=fefWDP3wViAwQWASbwFul4whQ2e6hjGYBy59NM0jD1Y=;
  b=HkPo+oiipT2OvY2T+4PboYxR7AIhu03MXfKpJc/TkIKW5g4ht1NCs+xG
   ivDF4xi7I6ab6gg0O7NfNFgLVrZSwuhjVoDyqa4vWDQ9O4BGE+UGyOAeH
   OLAN7rBkj1LGVi4kRfk1lGkOL1ejyzcoQmjEYgopGhHUTd+28RSzxHRZL
   ugX9zISJ9BCkZPL7Hdi9efOuIWMTZndLT/33PdaHfZ0ihBojJmbZpcxSX
   vcUCRX0DhKVdOuNJ52M8voUGAS3HBHiQaR23rvSnr0jYv9jPQWPa16nT1
   X3Blwosx9bZRGlZ0nK1uNADappk0NtyJqilg6Q/cll+E2hNbhvuKaUfV8
   w==;
X-CSE-ConnectionGUID: /DNL0Mn6Q/ihV/TFyTjphg==
X-CSE-MsgGUID: UXyecg/YQuG5HKOtZh8I0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="17572562"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="17572562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 09:39:18 -0700
X-CSE-ConnectionGUID: 3a//i0d+QhKn5WU56geQ+g==
X-CSE-MsgGUID: 3drZmE3bQ8aXT5fdr8D4aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="73691361"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2024 09:39:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD5Dp-000HMF-0i;
	Fri, 31 May 2024 16:36:04 +0000
Date: Sat, 01 Jun 2024 00:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 52a2c70c3ec555e670a34dd1ab958986451d2dd2
Message-ID: <202406010025.aKT8v7xI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 52a2c70c3ec555e670a34dd1ab958986451d2dd2  hwmon: (shtc1) Fix property misspelling

elapsed time: 1459m

configs tested: 192
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240531   gcc  
arc                   randconfig-002-20240531   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                        multi_v5_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240531   clang
arm                   randconfig-002-20240531   clang
arm                   randconfig-003-20240531   clang
arm                   randconfig-004-20240531   clang
arm                        vexpress_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240531   clang
arm64                 randconfig-002-20240531   clang
arm64                 randconfig-003-20240531   gcc  
arm64                 randconfig-004-20240531   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240531   gcc  
csky                  randconfig-002-20240531   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240531   clang
hexagon               randconfig-002-20240531   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240531   clang
i386         buildonly-randconfig-002-20240531   gcc  
i386         buildonly-randconfig-003-20240531   gcc  
i386         buildonly-randconfig-004-20240531   clang
i386         buildonly-randconfig-005-20240531   gcc  
i386         buildonly-randconfig-006-20240531   clang
i386                                defconfig   clang
i386                  randconfig-001-20240531   gcc  
i386                  randconfig-002-20240531   clang
i386                  randconfig-003-20240531   clang
i386                  randconfig-004-20240531   gcc  
i386                  randconfig-005-20240531   clang
i386                  randconfig-006-20240531   clang
i386                  randconfig-011-20240531   clang
i386                  randconfig-012-20240531   gcc  
i386                  randconfig-013-20240531   gcc  
i386                  randconfig-014-20240531   clang
i386                  randconfig-015-20240531   gcc  
i386                  randconfig-016-20240531   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240531   gcc  
loongarch             randconfig-002-20240531   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                          malta_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240531   gcc  
nios2                 randconfig-002-20240531   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240531   gcc  
parisc                randconfig-002-20240531   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc               randconfig-001-20240531   clang
powerpc               randconfig-002-20240531   clang
powerpc               randconfig-003-20240531   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc64             randconfig-001-20240531   clang
powerpc64             randconfig-002-20240531   clang
powerpc64             randconfig-003-20240531   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240531   clang
riscv                 randconfig-002-20240531   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240531   gcc  
s390                  randconfig-002-20240531   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240531   gcc  
sh                    randconfig-002-20240531   gcc  
sh                           se7343_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240531   gcc  
sparc64               randconfig-002-20240531   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240531   gcc  
um                    randconfig-002-20240531   clang
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240531   clang
x86_64       buildonly-randconfig-002-20240531   gcc  
x86_64       buildonly-randconfig-003-20240531   clang
x86_64       buildonly-randconfig-004-20240531   clang
x86_64       buildonly-randconfig-005-20240531   gcc  
x86_64       buildonly-randconfig-006-20240531   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240531   gcc  
x86_64                randconfig-002-20240531   clang
x86_64                randconfig-003-20240531   gcc  
x86_64                randconfig-004-20240531   gcc  
x86_64                randconfig-005-20240531   gcc  
x86_64                randconfig-006-20240531   gcc  
x86_64                randconfig-011-20240531   clang
x86_64                randconfig-012-20240531   gcc  
x86_64                randconfig-013-20240531   gcc  
x86_64                randconfig-014-20240531   clang
x86_64                randconfig-015-20240531   gcc  
x86_64                randconfig-016-20240531   gcc  
x86_64                randconfig-071-20240531   clang
x86_64                randconfig-072-20240531   gcc  
x86_64                randconfig-073-20240531   gcc  
x86_64                randconfig-074-20240531   gcc  
x86_64                randconfig-075-20240531   clang
x86_64                randconfig-076-20240531   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240531   gcc  
xtensa                randconfig-002-20240531   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
