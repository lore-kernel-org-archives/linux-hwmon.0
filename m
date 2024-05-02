Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929DF1553B4
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714662769; cv=none; b=osQUxwUAVSPZ6TeEYNEq/wq0Ei470jsf/DwpJ0cDUIN5HaE9wLrtWQa4PrsR5BrLGneyTNSJWb5zsCfKa4jZsA31P24CA/pXWibkNvL78Y66RWdX5rpGD2M0EFYcZZmvQkhMJcfD8Q/Np1jV+sPbSG+oynIsdzKa1fnTVCABX+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714662769; c=relaxed/simple;
	bh=qLmw2KW2qrTqg0dM90CnUM6UcB3B4YdtH8J+WRIbUY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hwjO2qUWTlGqe6yqMEdFZWs+0Xg2slmgf46++1W9to3KMiQug4J6l894Jc4evmAik7AfwfWkBqGSsk8irWp5HQHNHVWl4CdkqA/3fZ0JqUvURprXurTGAEarNMTZLdMxSQ60+Y5Uwg7ht2dGIHn22P7iYCrTY0rjoVs0SRTODmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJZPm9bN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJZPm9bN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714662768; x=1746198768;
  h=date:from:to:cc:subject:message-id;
  bh=qLmw2KW2qrTqg0dM90CnUM6UcB3B4YdtH8J+WRIbUY8=;
  b=BJZPm9bN4rzN8q2vXaQdVmk0jHToAFXQbqjMBXI6+nEJsDUIDrWkEpV7
   WLXGSuRu/MHYkbQRVDwZEaTaLpHf62x67jwMb2u2xPY0wnZzIyqoeQpn4
   XjlTY01zgC9o+NWYGSttdVAUDT4oPcm0LPzPztu1XI2Pw7LLZe5n4r33Q
   eHx/Uc/+WLMYuL8ra7CAXcILWGwgtofcy8wbejNCsjXCNzxNA3PWNvg3+
   W5mww6stH1ig6sbrSzRvlFqtL6FAdvVJtZGZmaAaz0oXFXb+hp9naV0zD
   bBtr8wzt670+q2FJAGAVTXB3eixBPzfROtJsJ+aEKttaJojSnwNVnoWF0
   Q==;
X-CSE-ConnectionGUID: PnaiaWLmT8+ZOUWDvmLW/Q==
X-CSE-MsgGUID: uZ4HmD0BTeStQQE3Vk7Vfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="21848650"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21848650"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 08:12:47 -0700
X-CSE-ConnectionGUID: DczeiBRXQRiGYikfR8V/Vg==
X-CSE-MsgGUID: vu6C645KTwmGCu2fcODybg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="58345273"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 May 2024 08:12:45 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Y6z-000AkW-1S;
	Thu, 02 May 2024 15:12:41 +0000
Date: Thu, 02 May 2024 23:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 1d4d6733594d407e54153b8e031ba6356ceba81e
Message-ID: <202405022331.OujMzAD7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 1d4d6733594d407e54153b8e031ba6356ceba81e  hwmon: (npcm750-pwm-fan) Remove another unused field in struct npcm7xx_cooling_device

elapsed time: 1459m

configs tested: 168
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
arc                   randconfig-001-20240502   gcc  
arc                   randconfig-002-20240502   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                   randconfig-001-20240502   gcc  
arm                   randconfig-002-20240502   gcc  
arm                   randconfig-003-20240502   gcc  
arm                   randconfig-004-20240502   gcc  
arm                        spear6xx_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240502   gcc  
arm64                 randconfig-002-20240502   clang
arm64                 randconfig-003-20240502   clang
arm64                 randconfig-004-20240502   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240502   gcc  
csky                  randconfig-002-20240502   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240502   clang
hexagon               randconfig-002-20240502   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240502   gcc  
i386         buildonly-randconfig-002-20240502   gcc  
i386         buildonly-randconfig-003-20240502   clang
i386         buildonly-randconfig-004-20240502   gcc  
i386         buildonly-randconfig-005-20240502   clang
i386         buildonly-randconfig-006-20240502   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240502   gcc  
i386                  randconfig-002-20240502   clang
i386                  randconfig-003-20240502   clang
i386                  randconfig-004-20240502   gcc  
i386                  randconfig-005-20240502   gcc  
i386                  randconfig-006-20240502   clang
i386                  randconfig-011-20240502   gcc  
i386                  randconfig-012-20240502   clang
i386                  randconfig-013-20240502   clang
i386                  randconfig-014-20240502   gcc  
i386                  randconfig-015-20240502   clang
i386                  randconfig-016-20240502   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240502   gcc  
loongarch             randconfig-002-20240502   gcc  
m68k                             alldefconfig   gcc  
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
mips                       bmips_be_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240502   gcc  
nios2                 randconfig-002-20240502   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240502   gcc  
parisc                randconfig-002-20240502   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      bamboo_defconfig   clang
powerpc               randconfig-001-20240502   clang
powerpc               randconfig-002-20240502   clang
powerpc               randconfig-003-20240502   clang
powerpc                    socrates_defconfig   gcc  
powerpc64             randconfig-001-20240502   gcc  
powerpc64             randconfig-002-20240502   clang
powerpc64             randconfig-003-20240502   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240502   clang
riscv                 randconfig-002-20240502   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240502   gcc  
s390                  randconfig-002-20240502   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240502   gcc  
sh                    randconfig-002-20240502   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240502   gcc  
sparc64               randconfig-002-20240502   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240502   clang
um                    randconfig-002-20240502   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240502   gcc  
x86_64       buildonly-randconfig-002-20240502   gcc  
x86_64       buildonly-randconfig-003-20240502   clang
x86_64       buildonly-randconfig-004-20240502   gcc  
x86_64       buildonly-randconfig-005-20240502   gcc  
x86_64       buildonly-randconfig-006-20240502   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240502   gcc  
x86_64                randconfig-002-20240502   clang
x86_64                randconfig-003-20240502   clang
x86_64                randconfig-004-20240502   gcc  
x86_64                randconfig-005-20240502   clang
x86_64                randconfig-006-20240502   clang
x86_64                randconfig-011-20240502   clang
x86_64                randconfig-012-20240502   clang
x86_64                randconfig-013-20240502   gcc  
x86_64                randconfig-014-20240502   gcc  
x86_64                randconfig-015-20240502   gcc  
x86_64                randconfig-016-20240502   clang
x86_64                randconfig-071-20240502   gcc  
x86_64                randconfig-072-20240502   gcc  
x86_64                randconfig-073-20240502   gcc  
x86_64                randconfig-074-20240502   clang
x86_64                randconfig-075-20240502   clang
x86_64                randconfig-076-20240502   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240502   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
