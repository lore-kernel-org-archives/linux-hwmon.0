Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE38B624
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Jun 2024 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610908; cv=none; b=oHbHEuVEcX4jonci2KSWA81NG+Hg5VQfAv/vXBlH95ClBIkH/aH57E7JGLLYzR/nc1ul07qQYECLxAkBNNdIl9p6US8qOR4AtNXAUu5mEiuvVGmE37bml9M5g8UBB6RFamMkfExX0XKO8ErJlvJO6kmwf+fUl2L2K4q8hHXSYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610908; c=relaxed/simple;
	bh=XmLPObDs65LIWYQhp4D7RSkmT8rxj3hmfZrOThGTP14=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eKRqsmwRwpxeCaGijKdMu4kmtyVmd8HSFcGtWJdQmaxAgu9gualTuMy97MaoWiqI/Nr4VxU16XfCys5wz1mmzclzyXzwUsdvuAsBdusKKJ3C7pvoc5xAubbOcFHPDRsTB8bu4Wuuh9mSTHzMI349EPIO7Bq9A4hhmUFuH92xBpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMAvFCW+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMAvFCW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717610906; x=1749146906;
  h=date:from:to:cc:subject:message-id;
  bh=XmLPObDs65LIWYQhp4D7RSkmT8rxj3hmfZrOThGTP14=;
  b=MMAvFCW+aXDJVErsLVv+xdmX7cOwJl5UFipJk6exoH6bqQUy321FFL8/
   mve5JN6FIrYNxALP5UzN8wWk8lK+zGklNogOc7rljCaJXpocq4/d2a+Ef
   hUpdVG1nF8wlAxtc5+zZbeB3m5AllNSgIhVuqbedhh156JgjQLByhBiur
   UqkkL7RAIH0eTTctYzfYaopfxMdAiF4puH4xHaR6ZjSlCAd8bZEPl8uz3
   bgPQ9nD2UQdZAZz1rWFLO90RFNQlEy+AT4iACHEII+6MafJ9BKtAOx0rl
   JJ/RqN+irxqTRtZwWwS6kUn/DAs9afC68L/ePD+vdDrGZCK3QKgQVqtzu
   g==;
X-CSE-ConnectionGUID: uM5QT7XOSoud+ZiO0Ds4Iw==
X-CSE-MsgGUID: paZv1LvTQFep0siS5oR5ZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="11926148"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="11926148"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 11:08:26 -0700
X-CSE-ConnectionGUID: +7BX2BjfSKO2Z3OqNB4KuQ==
X-CSE-MsgGUID: rK428NcmSUur+HhwCg32Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="37777475"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2024 11:08:25 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEv3f-00021w-1e;
	Wed, 05 Jun 2024 18:08:23 +0000
Date: Thu, 06 Jun 2024 02:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 6ce402327a6fb714a9f40a0bb59bcbfe383839a5
Message-ID: <202406060217.qnFUcvTI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6ce402327a6fb714a9f40a0bb59bcbfe383839a5  hwmon: g672: add support for g761

elapsed time: 1473m

configs tested: 155
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
arc                   randconfig-001-20240605   gcc  
arc                   randconfig-002-20240605   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240605   clang
arm                   randconfig-002-20240605   clang
arm                   randconfig-003-20240605   clang
arm                   randconfig-004-20240605   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240605   gcc  
arm64                 randconfig-002-20240605   clang
arm64                 randconfig-003-20240605   clang
arm64                 randconfig-004-20240605   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240605   gcc  
csky                  randconfig-002-20240605   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240605   clang
hexagon               randconfig-002-20240605   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240605   gcc  
i386         buildonly-randconfig-002-20240605   gcc  
i386         buildonly-randconfig-003-20240605   gcc  
i386         buildonly-randconfig-004-20240605   gcc  
i386         buildonly-randconfig-005-20240605   gcc  
i386         buildonly-randconfig-006-20240605   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240605   gcc  
i386                  randconfig-002-20240605   clang
i386                  randconfig-003-20240605   gcc  
i386                  randconfig-004-20240605   gcc  
i386                  randconfig-005-20240605   gcc  
i386                  randconfig-006-20240605   gcc  
i386                  randconfig-011-20240605   gcc  
i386                  randconfig-012-20240605   gcc  
i386                  randconfig-013-20240605   clang
i386                  randconfig-014-20240605   clang
i386                  randconfig-015-20240605   gcc  
i386                  randconfig-016-20240605   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240605   gcc  
loongarch             randconfig-002-20240605   gcc  
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
nios2                 randconfig-001-20240605   gcc  
nios2                 randconfig-002-20240605   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240605   gcc  
parisc                randconfig-002-20240605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240605   gcc  
powerpc               randconfig-002-20240605   gcc  
powerpc               randconfig-003-20240605   gcc  
powerpc64             randconfig-001-20240605   gcc  
powerpc64             randconfig-002-20240605   clang
powerpc64             randconfig-003-20240605   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240605   gcc  
riscv                 randconfig-002-20240605   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240605   gcc  
s390                  randconfig-002-20240605   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240605   gcc  
sh                    randconfig-002-20240605   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240605   gcc  
sparc64               randconfig-002-20240605   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240605   gcc  
um                    randconfig-002-20240605   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240605   gcc  
x86_64       buildonly-randconfig-002-20240605   gcc  
x86_64       buildonly-randconfig-003-20240605   gcc  
x86_64       buildonly-randconfig-004-20240605   clang
x86_64       buildonly-randconfig-005-20240605   clang
x86_64       buildonly-randconfig-006-20240605   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240605   clang
x86_64                randconfig-002-20240605   clang
x86_64                randconfig-003-20240605   gcc  
x86_64                randconfig-004-20240605   clang
x86_64                randconfig-005-20240605   clang
x86_64                randconfig-006-20240605   gcc  
x86_64                randconfig-011-20240605   clang
x86_64                randconfig-012-20240605   gcc  
x86_64                randconfig-013-20240605   clang
x86_64                randconfig-014-20240605   gcc  
x86_64                randconfig-015-20240605   clang
x86_64                randconfig-016-20240605   gcc  
x86_64                randconfig-071-20240605   gcc  
x86_64                randconfig-072-20240605   clang
x86_64                randconfig-073-20240605   gcc  
x86_64                randconfig-074-20240605   gcc  
x86_64                randconfig-075-20240605   gcc  
x86_64                randconfig-076-20240605   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240605   gcc  
xtensa                randconfig-002-20240605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
