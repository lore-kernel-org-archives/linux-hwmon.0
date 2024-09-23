Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308062F44
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2024 03:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727061759; cv=none; b=dlz8lpX+Z4M0tRyeEv8FD0iLzyKwQRHDnBw9eacclbaGj/cqk6tkC3Zfst4m2XllfvcQ+VtVZFTgI3DPYEuDDJGyIx2YuQec7Df2aloOcJrPueEIeKZ+Uvx4298KR+5C1gFDFSSe/fIVhssGkDQcPMoCAVPHnr4/mG0V/xUI6Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727061759; c=relaxed/simple;
	bh=Kwy6BX8CyTtbU4+GMjkz5NIKff62GNxRDVaFKuAHJlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=odhal49aeesVPwcETF5LvWY3pbv1VmF1rOZHuEYusd/oGtjI9HsdBuGghxPFqcy2ecrlh9bR0ShLl0L8r4Wb9D6xlkkJz34/8iYTRAJQBhw3jiJNBcuHKgkdQX+Xh6QxCzkJGcBryOhGKA0LOEZYTl8+wsQWYKMPuindUyem8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ON5DuzO3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ON5DuzO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727061757; x=1758597757;
  h=date:from:to:cc:subject:message-id;
  bh=Kwy6BX8CyTtbU4+GMjkz5NIKff62GNxRDVaFKuAHJlA=;
  b=ON5DuzO3N6aPLRDZJUTN1/oww04jCoGrYrqZCJsgYeAbfPLM8WeEgJ1e
   9M8R+YEFlTo+GPIWDMf9XXGVn755mnLDB0UUNvhaHuJOT5kURPp+/8gtg
   wcd5XEmCu8TAfPk3UytoVm9QtjI33LLIGc+o7VtGB4KkbTyOtha/I0sIW
   KF6bwn8LYHnlQ4Cf1Tv8LhQm7lUoS0pdhmiyoZS+I7iIy1HXP80KO5xkn
   83mpnc1a1xXr/AJEEgyQ7nFo1AdHuqeV/Q/tPxTd6tF+MTw68pFbEaPq8
   8tRL+5pngIX0Iv2BxU4nMzoGe3YrHnAiCtpdx7DTSlTFa87aEnNOF78Dz
   A==;
X-CSE-ConnectionGUID: yYYFirVmRxS0PiQYz3UIuQ==
X-CSE-MsgGUID: XXstux0gQXKzi3nhsoc+pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26183755"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26183755"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 20:22:36 -0700
X-CSE-ConnectionGUID: B0W6Lg5VTDeGwPF5BwhdcA==
X-CSE-MsgGUID: dqeb2tr0TyaKnxK3AUNnGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71754046"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Sep 2024 20:22:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssZei-000Grc-2c;
	Mon, 23 Sep 2024 03:22:32 +0000
Date: Mon, 23 Sep 2024 11:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 b8798ff9aff373dbb7f7ee2a69150c6bd197c53f
Message-ID: <202409231113.MH3Kcega-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: b8798ff9aff373dbb7f7ee2a69150c6bd197c53f  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 725m

configs tested: 172
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              alldefconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arc                   randconfig-001-20240923    clang-20
arc                   randconfig-002-20240923    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                         at91_dt_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       omap2plus_defconfig    gcc-14.1.0
arm                   randconfig-001-20240923    clang-20
arm                   randconfig-002-20240923    clang-20
arm                   randconfig-003-20240923    clang-20
arm                   randconfig-004-20240923    clang-20
arm                        realview_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240923    clang-20
arm64                 randconfig-002-20240923    clang-20
arm64                 randconfig-003-20240923    clang-20
arm64                 randconfig-004-20240923    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240923    clang-20
csky                  randconfig-002-20240923    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240923    clang-20
hexagon               randconfig-002-20240923    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240923    gcc-11
i386        buildonly-randconfig-002-20240923    gcc-11
i386        buildonly-randconfig-003-20240923    gcc-11
i386        buildonly-randconfig-004-20240923    gcc-11
i386        buildonly-randconfig-005-20240923    gcc-11
i386        buildonly-randconfig-006-20240923    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20240923    gcc-11
i386                  randconfig-002-20240923    gcc-11
i386                  randconfig-003-20240923    gcc-11
i386                  randconfig-004-20240923    gcc-11
i386                  randconfig-005-20240923    gcc-11
i386                  randconfig-006-20240923    gcc-11
i386                  randconfig-011-20240923    gcc-11
i386                  randconfig-012-20240923    gcc-11
i386                  randconfig-013-20240923    gcc-11
i386                  randconfig-014-20240923    gcc-11
i386                  randconfig-015-20240923    gcc-11
i386                  randconfig-016-20240923    gcc-11
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240923    clang-20
loongarch             randconfig-002-20240923    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                       bvme6000_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    gcc-14.1.0
mips                      fuloong2e_defconfig    gcc-14.1.0
mips                           ip30_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                      maltaaprp_defconfig    gcc-14.1.0
mips                           mtx1_defconfig    gcc-14.1.0
nios2                         10m50_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240923    clang-20
nios2                 randconfig-002-20240923    clang-20
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20240923    clang-20
parisc                randconfig-002-20240923    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.1.0
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240923    clang-20
powerpc               randconfig-002-20240923    clang-20
powerpc               randconfig-003-20240923    clang-20
powerpc                    socrates_defconfig    gcc-14.1.0
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20240923    clang-20
powerpc64             randconfig-002-20240923    clang-20
powerpc64             randconfig-003-20240923    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240923    clang-20
riscv                 randconfig-002-20240923    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                          debug_defconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240923    clang-20
s390                  randconfig-002-20240923    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          lboxre2_defconfig    gcc-14.1.0
sh                    randconfig-001-20240923    clang-20
sh                    randconfig-002-20240923    clang-20
sh                           sh2007_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240923    clang-20
sparc64               randconfig-002-20240923    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240923    clang-20
um                    randconfig-002-20240923    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20240923    clang-20
xtensa                randconfig-002-20240923    clang-20
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
