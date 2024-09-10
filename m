Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AF912D214
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725984294; cv=none; b=sfwZ4hIP/zb2IYg9sr+KjjKshvkAqgsEmXi5oQ18gS+x/IdTiGhzIK3io7mfr85tT8IshNtEQsQO4QTWW0DIVag2Br5/6bd2L2HuFXV+HYHTXgHP9gEZF2kS+ILv7MJyVu82A7cTHWlPfYhtaCqKivlBviD5gilhyg/KXt5CSq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725984294; c=relaxed/simple;
	bh=yF7pVBewlH0uCL9I2kDHe7DrvrrcroPFWjKE7aiVXiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kgERF/nl2n7lLURADpp4kVQGeWHR7elBBTCUKIPMF7zgrHXfj8WYs/ZyNZaYqsiogeAWDEP5c0p2Dm2zD4Z02nvxmGoBdzLdb3qwrC0FQXOmBTPgryPsEI39UUtyL8GV0jt6Hk4E9E8IBNSOFadH8XvK5Cx0/m/vP7iZSJxNcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUzyipg5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUzyipg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725984292; x=1757520292;
  h=date:from:to:cc:subject:message-id;
  bh=yF7pVBewlH0uCL9I2kDHe7DrvrrcroPFWjKE7aiVXiE=;
  b=SUzyipg5ahLrkSzaxYCkWpU78wNKKgFh2BtgvDhznZbMfGOXBwF73c7/
   c6tl5MqaAopRZGrjBjMHMoihkijhioOwRBW6wjiP1Hz0MJS5VhV4YmIgs
   6IyQHDMjViH3MudJ4cAgnmSFSBAIOsi0qWjoGPv3WnJgKaebJZBKFGoWT
   YIviCpfw6JFUWg5cJiigBSAVfIlpaB3qaPR8C/xO7dEijIhedc6CJdkDm
   SYa2o/HpHunvWz/ylvQFh9YRTa6OEemCGm5lX4qxNPUpdSEqz7iF/RM76
   bzi2r8D0ZSpmpqqIeqT8EbSnrFgIrFCoq/Z1C5L59xSX0DcToKyoNwLwW
   A==;
X-CSE-ConnectionGUID: qzBJEPBxTsyoxEa5lRzhRA==
X-CSE-MsgGUID: 3BEUj6ALQ2eihd+q5m9TPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24242134"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24242134"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:04:52 -0700
X-CSE-ConnectionGUID: ul1PCjspTHqF7Fn8K1WUcw==
X-CSE-MsgGUID: VPsvxjpuRkGMoyfl0wxrYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67129362"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Sep 2024 09:04:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so3MG-0002K9-0W;
	Tue, 10 Sep 2024 16:04:48 +0000
Date: Wed, 11 Sep 2024 00:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 20471071f198c8626dbe3951ac9834055b387844
Message-ID: <202409110025.cehT2B5d-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 20471071f198c8626dbe3951ac9834055b387844  hwmon: (pmbus) Conditionally clear individual status bits for pmbus rev >= 1.2

elapsed time: 1278m

configs tested: 168
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240910   gcc-13.2.0
arc                   randconfig-002-20240910   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      integrator_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                   randconfig-001-20240910   gcc-13.2.0
arm                   randconfig-002-20240910   gcc-13.2.0
arm                   randconfig-003-20240910   gcc-13.2.0
arm                   randconfig-004-20240910   gcc-13.2.0
arm                           sama7_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240910   gcc-13.2.0
arm64                 randconfig-002-20240910   gcc-13.2.0
arm64                 randconfig-003-20240910   gcc-13.2.0
arm64                 randconfig-004-20240910   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240910   gcc-13.2.0
csky                  randconfig-002-20240910   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240910   gcc-13.2.0
hexagon               randconfig-002-20240910   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240910   clang-18
i386         buildonly-randconfig-002-20240910   clang-18
i386         buildonly-randconfig-003-20240910   clang-18
i386         buildonly-randconfig-004-20240910   clang-18
i386         buildonly-randconfig-005-20240910   clang-18
i386         buildonly-randconfig-006-20240910   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240910   clang-18
i386                  randconfig-002-20240910   clang-18
i386                  randconfig-003-20240910   clang-18
i386                  randconfig-004-20240910   clang-18
i386                  randconfig-005-20240910   clang-18
i386                  randconfig-006-20240910   clang-18
i386                  randconfig-011-20240910   clang-18
i386                  randconfig-012-20240910   clang-18
i386                  randconfig-013-20240910   clang-18
i386                  randconfig-014-20240910   clang-18
i386                  randconfig-015-20240910   clang-18
i386                  randconfig-016-20240910   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240910   gcc-13.2.0
loongarch             randconfig-002-20240910   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson2k_defconfig   clang-20
mips                      pic32mzda_defconfig   clang-20
mips                       rbtx49xx_defconfig   clang-20
mips                           xway_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240910   gcc-13.2.0
nios2                 randconfig-002-20240910   gcc-13.2.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc                randconfig-001-20240910   gcc-13.2.0
parisc                randconfig-002-20240910   gcc-13.2.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                       eiger_defconfig   clang-20
powerpc                  iss476-smp_defconfig   clang-20
powerpc               randconfig-001-20240910   gcc-13.2.0
powerpc               randconfig-002-20240910   gcc-13.2.0
powerpc               randconfig-003-20240910   gcc-13.2.0
powerpc64             randconfig-001-20240910   gcc-13.2.0
powerpc64             randconfig-002-20240910   gcc-13.2.0
powerpc64             randconfig-003-20240910   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv                 randconfig-001-20240910   gcc-13.2.0
riscv                 randconfig-002-20240910   gcc-13.2.0
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                  randconfig-001-20240910   gcc-13.2.0
s390                  randconfig-002-20240910   gcc-13.2.0
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                    randconfig-001-20240910   gcc-13.2.0
sh                    randconfig-002-20240910   gcc-13.2.0
sh                        sh7785lcr_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
sparc64               randconfig-001-20240910   gcc-13.2.0
sparc64               randconfig-002-20240910   gcc-13.2.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240910   gcc-13.2.0
um                    randconfig-002-20240910   gcc-13.2.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240910   gcc-12
x86_64       buildonly-randconfig-002-20240910   gcc-12
x86_64       buildonly-randconfig-003-20240910   gcc-12
x86_64       buildonly-randconfig-004-20240910   gcc-12
x86_64       buildonly-randconfig-005-20240910   gcc-12
x86_64       buildonly-randconfig-006-20240910   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240910   gcc-12
x86_64                randconfig-002-20240910   gcc-12
x86_64                randconfig-003-20240910   gcc-12
x86_64                randconfig-004-20240910   gcc-12
x86_64                randconfig-005-20240910   gcc-12
x86_64                randconfig-006-20240910   gcc-12
x86_64                randconfig-011-20240910   gcc-12
x86_64                randconfig-012-20240910   gcc-12
x86_64                randconfig-013-20240910   gcc-12
x86_64                randconfig-014-20240910   gcc-12
x86_64                randconfig-015-20240910   gcc-12
x86_64                randconfig-016-20240910   gcc-12
x86_64                randconfig-071-20240910   gcc-12
x86_64                randconfig-072-20240910   gcc-12
x86_64                randconfig-073-20240910   gcc-12
x86_64                randconfig-074-20240910   gcc-12
x86_64                randconfig-075-20240910   gcc-12
x86_64                randconfig-076-20240910   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240910   gcc-13.2.0
xtensa                randconfig-002-20240910   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
