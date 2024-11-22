Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96C070823
	for <linux-hwmon@vger.kernel.org>; Fri, 22 Nov 2024 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732302608; cv=none; b=G7WFNp1eWqAK6MwVcF2CXgpqPrN3tKP/61qtKoU8fO3rJsjS5yQcWiOc/5JiEPhVfx/p00t9WYmXk6cHVs8Tr9SgvYVSOZ4JHNcyYPcrt7JkPSPwvoXjhUwmiijd9cwaGabau6jsiqxP8PkZxJV1g6an6Ke9LYbXaEbsLWgBu+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732302608; c=relaxed/simple;
	bh=N/7mShJlPdC/Q1NbwlfaJmnm05qvYhEs03T110WQMk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HHPND165+9XWa/0U1xT7eB90RnmkIjnJi2duTxc6yJ3YnFJjQN8gdU6ZV0EmR/nvumwPyLqTP01t21nAZM6z0wm9Ax+zxchEUyTvFOz0vTlt97oBV+CC9ZWxJ4bmOhAkOYXN3EvCu2Whsg+cVfRE+XzSiyuHCsH7EDA7kFBHf+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeWcC+Qx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeWcC+Qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732302607; x=1763838607;
  h=date:from:to:cc:subject:message-id;
  bh=N/7mShJlPdC/Q1NbwlfaJmnm05qvYhEs03T110WQMk8=;
  b=OeWcC+QxIZ1kETG/sE8jQ3KGKyvAYhm3UnDNlO7+CCdTlIBoUHDqiHGB
   ePKVCdyUhwZ2ukcaZsYiWHeP0qpc4VFOVFSR8Ius+DGlXxPB4fi8SaCpo
   GdGtgoZKxI8RGFY2ujdqWTjkJoYsFMy1DoIt4Bkgl5ouGIQbeW4vzyieM
   NOTasgDfQb+dnC9S7tiavN4GhtiqQUicYZ4uoxb0G55jsznOyr1EEkAxH
   VNujP0L9nxv5Vhxz867AteocEFOvQvFToxyAXPvPDknTlrJaZXbPIgreL
   uRwZdvCIjDcaZJlsmznpXbCxtDw4XyYWPCLCFHgvPlK4FsNXirCRwsfK3
   g==;
X-CSE-ConnectionGUID: VecqoWc1QYaGDQEqPlibtw==
X-CSE-MsgGUID: ZzxRNQcNQguw2ejBO+l6Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31856233"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="31856233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 11:10:05 -0800
X-CSE-ConnectionGUID: +yr0T5npQXmz8VvY8PIczw==
X-CSE-MsgGUID: jOvvApm1QPSROn/B2bNLsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90579063"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 11:10:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEZ2X-00049L-17;
	Fri, 22 Nov 2024 19:10:01 +0000
Date: Sat, 23 Nov 2024 03:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 8c8865aa3d3c2dabf9a2161d2809eccfeae92645
Message-ID: <202411230342.RpWMe9GL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 8c8865aa3d3c2dabf9a2161d2809eccfeae92645  Merge branch 'fixes-v6.13' into testing

Unverified Warning (likely false positive, kindly check if interested):

    drivers/hwmon/hwmon.c:437 hwmon_attr_show() error: uninitialized symbol 'val'.
    drivers/hwmon/hwmon.c:440 hwmon_attr_show() error: uninitialized symbol 'val64'.

Warning ids grouped by kconfigs:

recent_errors
`-- x86_64-randconfig-161-20241121
    |-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val-.
    `-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val64-.

elapsed time: 1287m

configs tested: 190
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241122    gcc-14.2.0
arc                   randconfig-002-20241122    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                            mps2_defconfig    clang-20
arm                           omap1_defconfig    clang-20
arm                   randconfig-001-20241122    gcc-14.2.0
arm                   randconfig-002-20241122    gcc-14.2.0
arm                   randconfig-003-20241122    gcc-14.2.0
arm                   randconfig-004-20241122    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241122    gcc-14.2.0
arm64                 randconfig-002-20241122    gcc-14.2.0
arm64                 randconfig-003-20241122    gcc-14.2.0
arm64                 randconfig-004-20241122    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241122    gcc-14.2.0
csky                  randconfig-002-20241122    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241122    gcc-14.2.0
hexagon               randconfig-002-20241122    gcc-14.2.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241122    clang-19
i386        buildonly-randconfig-002-20241122    clang-19
i386        buildonly-randconfig-003-20241122    clang-19
i386        buildonly-randconfig-004-20241122    clang-19
i386        buildonly-randconfig-005-20241122    clang-19
i386        buildonly-randconfig-006-20241122    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241122    clang-19
i386                  randconfig-002-20241122    clang-19
i386                  randconfig-003-20241122    clang-19
i386                  randconfig-004-20241122    clang-19
i386                  randconfig-005-20241122    clang-19
i386                  randconfig-006-20241122    clang-19
i386                  randconfig-011-20241122    clang-19
i386                  randconfig-012-20241122    clang-19
i386                  randconfig-013-20241122    clang-19
i386                  randconfig-014-20241122    clang-19
i386                  randconfig-015-20241122    clang-19
i386                  randconfig-016-20241122    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241122    gcc-14.2.0
loongarch             randconfig-002-20241122    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip22_defconfig    clang-20
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241122    gcc-14.2.0
nios2                 randconfig-002-20241122    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                  or1klitex_defconfig    clang-20
openrisc                 simple_smp_defconfig    clang-20
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241122    gcc-14.2.0
parisc                randconfig-002-20241122    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                  iss476-smp_defconfig    clang-20
powerpc                     mpc512x_defconfig    clang-20
powerpc               randconfig-001-20241122    gcc-14.2.0
powerpc               randconfig-002-20241122    gcc-14.2.0
powerpc               randconfig-003-20241122    gcc-14.2.0
powerpc64             randconfig-001-20241122    gcc-14.2.0
powerpc64             randconfig-002-20241122    gcc-14.2.0
powerpc64             randconfig-003-20241122    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241122    gcc-14.2.0
riscv                 randconfig-002-20241122    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241122    gcc-14.2.0
s390                  randconfig-002-20241122    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20241122    gcc-14.2.0
sh                    randconfig-002-20241122    gcc-14.2.0
sh                           se7724_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241122    gcc-14.2.0
sparc64               randconfig-002-20241122    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241122    gcc-14.2.0
um                    randconfig-002-20241122    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241122    clang-19
x86_64      buildonly-randconfig-002-20241122    clang-19
x86_64      buildonly-randconfig-003-20241122    clang-19
x86_64      buildonly-randconfig-004-20241122    clang-19
x86_64      buildonly-randconfig-005-20241122    clang-19
x86_64      buildonly-randconfig-006-20241122    clang-19
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241122    clang-19
x86_64                randconfig-002-20241122    clang-19
x86_64                randconfig-003-20241122    clang-19
x86_64                randconfig-004-20241122    clang-19
x86_64                randconfig-005-20241122    clang-19
x86_64                randconfig-006-20241122    clang-19
x86_64                randconfig-011-20241122    clang-19
x86_64                randconfig-012-20241122    clang-19
x86_64                randconfig-013-20241122    clang-19
x86_64                randconfig-014-20241122    clang-19
x86_64                randconfig-015-20241122    clang-19
x86_64                randconfig-016-20241122    clang-19
x86_64                randconfig-071-20241122    clang-19
x86_64                randconfig-072-20241122    clang-19
x86_64                randconfig-073-20241122    clang-19
x86_64                randconfig-074-20241122    clang-19
x86_64                randconfig-075-20241122    clang-19
x86_64                randconfig-076-20241122    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241122    gcc-14.2.0
xtensa                randconfig-002-20241122    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
