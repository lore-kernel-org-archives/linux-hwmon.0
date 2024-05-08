Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F31A2C0B
	for <linux-hwmon@vger.kernel.org>; Wed,  8 May 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715180480; cv=none; b=lw+BUekR8auaW0+MFUmBDyvgNCzJTFztBnZVbor/CylhVICFKgBrUvNUiaMVIvNY7b9VNx987THFfKqe7zJZ3aPNamUjdpoT/SxaHg3u9Wo/mVCQcoOjqs/mD2w0HTItuX8Yi36ERk86KhRYOqxxFtYMZymhLLwSwHNvviwsJ+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715180480; c=relaxed/simple;
	bh=g9NoU8LHSg6SP7eoFwhLka+fwB/eev6VpSf1Jmjhras=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BRXBMttmk1uNC9V3Z7wdxGpVcSEPcpNbgP4wt9qH99X3y4ZHxC4SH4keUBoeXYXH0b/Z9lLxVkJLXUc7xesKGK4DQz8kuChNW9Q61F1RM8i/htijEYEackejlnVU3cZY5HN5xNAOJfKSznSFRdBhPJ+khEAH1N6uZdl7P9JZ/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHXwSZPn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHXwSZPn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715180478; x=1746716478;
  h=date:from:to:cc:subject:message-id;
  bh=g9NoU8LHSg6SP7eoFwhLka+fwB/eev6VpSf1Jmjhras=;
  b=gHXwSZPnrvBbCxk4LOwppKXRaFHNWDf8DqnDnWGqD5zFeeWwr1rKpmZE
   fVnS3/yR3XnqMonnvfbaXZii9Sw2kmmCxd8WO9HiE/sCEO67eC7KQHNlm
   RoS6gDHk45OUQzzMkuvOQt1l/bxslbVx0U0THjY7zy01g6FzDU0SXQEUD
   jpCTgcVAaeRu/9wQ80EckSsewIBGadWlXxm3XF1qKJGPas4irkAJ4Gd2x
   Qs8GeuPq4grJXbFBpugssQXoTtooztpRCwXKjvFbZPSJcWM9LK0Ff+4BK
   F7tx05S369in4ch2OCv5HlseQSdV0vEn69V5uQ+Ms6VSHYG9KiuCIufXS
   w==;
X-CSE-ConnectionGUID: NO/C15JARbi9QsAPDJnaBA==
X-CSE-MsgGUID: Z+btd/GYRwqbv1yM5ZjZTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11176474"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="11176474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 08:01:18 -0700
X-CSE-ConnectionGUID: W79diPmFQva2UEyv7GJJqA==
X-CSE-MsgGUID: CbA7i+gbTAmiEC2+DKyPaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; 
   d="scan'208";a="33714311"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 May 2024 08:01:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4inC-0003eI-2a;
	Wed, 08 May 2024 15:01:14 +0000
Date: Wed, 08 May 2024 23:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 6a8157812f5b486d1fdabeefa070d75ae49220ee
Message-ID: <202405082345.Q8CtV3cH-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6a8157812f5b486d1fdabeefa070d75ae49220ee  hwmon: (emc1403) Add support for conversion interval configuration

elapsed time: 1464m

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
arc                   randconfig-001-20240508   gcc  
arc                   randconfig-002-20240508   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240508   gcc  
arm                         s3c6400_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240508   gcc  
arm64                 randconfig-003-20240508   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240508   gcc  
csky                  randconfig-002-20240508   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240508   clang
i386         buildonly-randconfig-002-20240508   clang
i386         buildonly-randconfig-003-20240508   gcc  
i386         buildonly-randconfig-004-20240508   gcc  
i386         buildonly-randconfig-005-20240508   clang
i386         buildonly-randconfig-006-20240508   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240508   gcc  
i386                  randconfig-002-20240508   clang
i386                  randconfig-003-20240508   clang
i386                  randconfig-004-20240508   gcc  
i386                  randconfig-005-20240508   clang
i386                  randconfig-006-20240508   gcc  
i386                  randconfig-011-20240508   gcc  
i386                  randconfig-012-20240508   gcc  
i386                  randconfig-013-20240508   clang
i386                  randconfig-014-20240508   clang
i386                  randconfig-015-20240508   clang
i386                  randconfig-016-20240508   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240508   gcc  
loongarch             randconfig-002-20240508   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240508   gcc  
nios2                 randconfig-002-20240508   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240508   gcc  
parisc                randconfig-002-20240508   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc               randconfig-002-20240508   gcc  
powerpc64             randconfig-001-20240508   gcc  
powerpc64             randconfig-002-20240508   gcc  
powerpc64             randconfig-003-20240508   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240508   gcc  
riscv                 randconfig-002-20240508   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-002-20240508   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240508   gcc  
sh                    randconfig-002-20240508   gcc  
sh                           se7619_defconfig   gcc  
sparc                            alldefconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240508   gcc  
sparc64               randconfig-002-20240508   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240508   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240508   clang
x86_64       buildonly-randconfig-002-20240508   clang
x86_64       buildonly-randconfig-003-20240508   clang
x86_64       buildonly-randconfig-004-20240508   clang
x86_64       buildonly-randconfig-006-20240508   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-002-20240508   clang
x86_64                randconfig-003-20240508   clang
x86_64                randconfig-011-20240508   clang
x86_64                randconfig-012-20240508   clang
x86_64                randconfig-015-20240508   clang
x86_64                randconfig-073-20240508   clang
x86_64                randconfig-076-20240508   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240508   gcc  
xtensa                randconfig-002-20240508   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
