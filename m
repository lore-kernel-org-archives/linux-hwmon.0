Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D232475F7
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Apr 2026 21:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117401; cv=none; b=cyeUi9zUT9IC86o6H3lti/LfIEe1j+aB8cAzh1unQo0oONpvZ7fzN4cSSDeA8mhDGbVg+Ox2JnPzPWWR4p5ElrrgUtIk8opS24nwu1mV1kSkRuTVLtMpE2bXeMACS5JjTmQLST/tRdu7KqBCMmWb+yMV2bg4eQBu7P6FE32263M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117401; c=relaxed/simple;
	bh=VX1umGS9oS80z8MyaNhkJQqVccESScHvLMCCUbcVMQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LIFRcLTai9REofHRTud+rsOgaUM5cz7MwEJ1H3GldIoxeBwviEWlX2K3Y3mCBWtGQeGRK9oEDwoMR8NGdAj1GJZY64dJODWtnqy3kNL3zUHCupfG94thE3XJA2KFDDTnT5j/r+kyTAGt41HLhlh9ey6nNlxvrxsDyXx6bVyYnRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmxG1/5i; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmxG1/5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776117400; x=1807653400;
  h=date:from:to:cc:subject:message-id;
  bh=VX1umGS9oS80z8MyaNhkJQqVccESScHvLMCCUbcVMQ8=;
  b=UmxG1/5iqaS8161lbjH6f3bGALzYErrkiPHa4OflbROIuV9zThqHiMF5
   98z/Q+hMq8yR2ic0lp5BzNAKVk8isiKElbPruHVrsYSRPMS5eofD+3vbj
   gDToZxdHdv2KJHSVwkBRDsxGEeb07Tcs8+PrJiIdEDW/r+OLg0xTVKYg9
   OWOI4mGWOoITemgd0y5eCDrrabNAJiDSZkhnmS6asIfJzbVjnExqyB2/E
   1jGcoAFCb43Ny3u4W7RnD+tUtTIfZClR/IkmEVz0vNjiNg/kkbXKGtxIM
   AlBMEuyoFFoUIuXPdigsMJ7XEbC3K7PUjZpX54njQpXQITrOfbQUjM35L
   A==;
X-CSE-ConnectionGUID: qI8vtqFqRaGHcR9Y84pk+A==
X-CSE-MsgGUID: 6W32DwEeQiWCYm8RGESX+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76773219"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="76773219"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 14:56:40 -0700
X-CSE-ConnectionGUID: m9Tv6CddTQOwi6p1T/hKDA==
X-CSE-MsgGUID: btTpyENmRrGkdnhjnpN3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="253288393"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Apr 2026 14:56:37 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCPGl-000000000tJ-1vhk;
	Mon, 13 Apr 2026 21:56:35 +0000
Date: Tue, 14 Apr 2026 05:56:29 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 fb447217c59a13b2fff22d94de2498c185cd9032
Message-ID: <202604140521.b9tQEOl9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: fb447217c59a13b2fff22d94de2498c185cd9032  hwmon: (ina233) Don't check for specific errors when parsing properties

elapsed time: 804m

configs tested: 240
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260413    gcc-11.5.0
arc                   randconfig-002-20260413    gcc-11.5.0
arc                   randconfig-002-20260413    gcc-15.2.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260413    clang-23
arm                   randconfig-001-20260413    gcc-11.5.0
arm                   randconfig-002-20260413    clang-23
arm                   randconfig-002-20260413    gcc-11.5.0
arm                   randconfig-003-20260413    clang-17
arm                   randconfig-003-20260413    gcc-11.5.0
arm                   randconfig-004-20260413    clang-23
arm                   randconfig-004-20260413    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260413    clang-23
arm64                 randconfig-001-20260414    gcc-12.5.0
arm64                 randconfig-002-20260413    clang-17
arm64                 randconfig-002-20260414    gcc-12.5.0
arm64                 randconfig-003-20260413    clang-23
arm64                 randconfig-003-20260414    gcc-12.5.0
arm64                 randconfig-004-20260413    gcc-8.5.0
arm64                 randconfig-004-20260414    gcc-12.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260413    gcc-15.2.0
csky                  randconfig-001-20260414    gcc-12.5.0
csky                  randconfig-002-20260413    gcc-15.2.0
csky                  randconfig-002-20260414    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260413    clang-18
hexagon               randconfig-001-20260413    clang-23
hexagon               randconfig-002-20260413    clang-18
hexagon               randconfig-002-20260413    clang-20
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260414    gcc-14
i386        buildonly-randconfig-002-20260414    gcc-14
i386        buildonly-randconfig-003-20260414    gcc-14
i386        buildonly-randconfig-004-20260414    gcc-14
i386        buildonly-randconfig-005-20260414    gcc-14
i386        buildonly-randconfig-006-20260414    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260413    gcc-14
i386                  randconfig-002-20260413    gcc-14
i386                  randconfig-003-20260413    clang-20
i386                  randconfig-003-20260413    gcc-14
i386                  randconfig-004-20260413    gcc-14
i386                  randconfig-005-20260413    gcc-14
i386                  randconfig-006-20260413    gcc-14
i386                  randconfig-007-20260413    clang-20
i386                  randconfig-007-20260413    gcc-14
i386                  randconfig-011-20260413    clang-20
i386                  randconfig-012-20260413    clang-20
i386                  randconfig-012-20260413    gcc-14
i386                  randconfig-013-20260413    clang-20
i386                  randconfig-013-20260413    gcc-14
i386                  randconfig-014-20260413    clang-20
i386                  randconfig-014-20260413    gcc-14
i386                  randconfig-015-20260413    clang-20
i386                  randconfig-015-20260413    gcc-14
i386                  randconfig-016-20260413    clang-20
i386                  randconfig-016-20260413    gcc-12
i386                  randconfig-017-20260413    clang-20
i386                  randconfig-017-20260413    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260413    clang-18
loongarch             randconfig-002-20260413    clang-18
loongarch             randconfig-002-20260413    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        bcm47xx_defconfig    clang-18
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260413    clang-18
nios2                 randconfig-001-20260413    gcc-11.5.0
nios2                 randconfig-002-20260413    clang-18
nios2                 randconfig-002-20260413    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260413    gcc-8.5.0
parisc                randconfig-001-20260413    gcc-9.5.0
parisc                randconfig-002-20260413    gcc-9.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-23
powerpc               randconfig-001-20260413    clang-23
powerpc               randconfig-001-20260413    gcc-9.5.0
powerpc               randconfig-002-20260413    gcc-13.4.0
powerpc               randconfig-002-20260413    gcc-9.5.0
powerpc64             randconfig-001-20260413    clang-23
powerpc64             randconfig-001-20260413    gcc-9.5.0
powerpc64             randconfig-002-20260413    clang-18
powerpc64             randconfig-002-20260413    gcc-9.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260413    gcc-8.5.0
riscv                 randconfig-002-20260413    gcc-8.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260413    gcc-11.5.0
s390                  randconfig-001-20260413    gcc-8.5.0
s390                  randconfig-002-20260413    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260413    gcc-15.2.0
sh                    randconfig-001-20260413    gcc-8.5.0
sh                    randconfig-002-20260413    gcc-14.3.0
sh                    randconfig-002-20260413    gcc-8.5.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260413    gcc-15.2.0
sparc                 randconfig-001-20260414    gcc-12
sparc                 randconfig-002-20260413    gcc-8.5.0
sparc                 randconfig-002-20260414    gcc-12
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260413    gcc-12.5.0
sparc64               randconfig-001-20260414    gcc-12
sparc64               randconfig-002-20260413    gcc-8.5.0
sparc64               randconfig-002-20260414    gcc-12
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260413    gcc-14
um                    randconfig-001-20260414    gcc-12
um                    randconfig-002-20260413    clang-18
um                    randconfig-002-20260414    gcc-12
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260414    gcc-14
x86_64      buildonly-randconfig-002-20260414    gcc-14
x86_64      buildonly-randconfig-003-20260414    gcc-14
x86_64      buildonly-randconfig-004-20260414    gcc-14
x86_64      buildonly-randconfig-005-20260414    gcc-14
x86_64      buildonly-randconfig-006-20260414    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260413    clang-20
x86_64                randconfig-002-20260413    clang-20
x86_64                randconfig-003-20260413    clang-20
x86_64                randconfig-003-20260413    gcc-14
x86_64                randconfig-004-20260413    clang-20
x86_64                randconfig-005-20260413    clang-20
x86_64                randconfig-005-20260413    gcc-14
x86_64                randconfig-006-20260413    clang-20
x86_64                randconfig-011-20260413    gcc-14
x86_64                randconfig-012-20260413    gcc-13
x86_64                randconfig-013-20260413    gcc-14
x86_64                randconfig-014-20260413    gcc-14
x86_64                randconfig-015-20260413    clang-20
x86_64                randconfig-016-20260413    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260413    gcc-10.5.0
xtensa                randconfig-001-20260414    gcc-12
xtensa                randconfig-002-20260413    gcc-13.4.0
xtensa                randconfig-002-20260414    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
