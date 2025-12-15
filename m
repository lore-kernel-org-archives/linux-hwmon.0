Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4111F329393
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765787017; cv=none; b=YCacFV/F1s/wivbcWIN0rDHWpSSNv6HOdkNSjw44qm7AyvLBKWo193SeD6WWUmL2l5JeG2qN8QmiJPVM4pcH5AWsi2OM9KAvUaetQZHbXEq3rHvNiudahs7OcAg21KkjbJBN5NaVPk0ZxXUCHhUtOqTNw8vUUgXgQhh6o5UyR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765787017; c=relaxed/simple;
	bh=o8sDzPpTQZ2hJouBOvqqnof/GjG+YrxcBNWzgK1psgc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ar4b0yzOO9MSWMgqU9LQ9UigJYlU6zi+ALsUDP5FWQl42pU/MZBhlX37a3SJW0YVJvlMJ2ojIekZizELM0khzS+vhSgtM1O5/lmMgLxwUiz1mWFyFSieizJvPLN0EVRGzp39xQdJ1S58bzyr+4TxT0Um5yQDrIU9pBbG84hMPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHc6UZF3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHc6UZF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765787014; x=1797323014;
  h=date:from:to:cc:subject:message-id;
  bh=o8sDzPpTQZ2hJouBOvqqnof/GjG+YrxcBNWzgK1psgc=;
  b=gHc6UZF3syjPPaR35/tuTL7lsJh+HDH7Wx+MQb10u9wxKkS+TTu6sJsL
   J5B6Q7o/P9r7yVf7zmQSqPt2LLswFi/piUxNIdHsIDq7d9qIysXX0kHxF
   4up025iSwrT/L5D0B8AILs0iEKvF4s2tT71Qs/T/itxBllxpas6Dig5e0
   tV0DOjRLP5oNKR5by/9Jo3ir9Zdktf7k0Vl9Xlmj+sDu3hGeigNt/rjHp
   ZrwT6vZWV8eDX3w1cK0qEBII/gZKqT649bG4oRafrvryOab9zYMMNQgPj
   RCoxJQP02dfUT0mBIfbnWDYg6etvYBsYscmio2XRMkCk57zg4O4D2rkI5
   A==;
X-CSE-ConnectionGUID: UqNH5aTDR/yQVhUJUHkLvg==
X-CSE-MsgGUID: RnWc1EHyQuSlXYA+ppXxmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78388793"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="78388793"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 00:23:33 -0800
X-CSE-ConnectionGUID: Jff9IgzeR8+W4rTvJcgAPw==
X-CSE-MsgGUID: XZYTXQs7SU2EAL6U7MEoNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="198502673"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Dec 2025 00:23:32 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV3rd-0000000004f-2tOe;
	Mon, 15 Dec 2025 08:23:29 +0000
Date: Mon, 15 Dec 2025 16:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 82f2aab35a1ab2e1460de06ef04c726460aed51c
Message-ID: <202512151659.cRxRZbSY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 82f2aab35a1ab2e1460de06ef04c726460aed51c  hwmon: (tmp401) fix overflow caused by default conversion rate value

elapsed time: 828m

configs tested: 259
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20251215    clang-22
arc                   randconfig-002-20251215    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                           imxrt_defconfig    gcc-15.1.0
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251215    clang-22
arm                   randconfig-002-20251215    clang-22
arm                   randconfig-003-20251215    clang-22
arm                   randconfig-004-20251215    clang-22
arm                         s3c6400_defconfig    gcc-15.1.0
arm                        shmobile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251215    clang-22
arm64                 randconfig-002-20251215    clang-22
arm64                 randconfig-003-20251215    clang-22
arm64                 randconfig-004-20251215    clang-22
arm64                 randconfig-004-20251215    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251215    clang-22
csky                  randconfig-001-20251215    gcc-13.4.0
csky                  randconfig-002-20251215    clang-22
csky                  randconfig-002-20251215    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251215    clang-16
hexagon               randconfig-001-20251215    gcc-11.5.0
hexagon               randconfig-002-20251215    clang-22
hexagon               randconfig-002-20251215    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251215    clang-20
i386        buildonly-randconfig-002-20251215    clang-20
i386        buildonly-randconfig-003-20251215    clang-20
i386        buildonly-randconfig-003-20251215    gcc-14
i386        buildonly-randconfig-004-20251215    clang-20
i386        buildonly-randconfig-005-20251215    clang-20
i386        buildonly-randconfig-006-20251215    clang-20
i386        buildonly-randconfig-006-20251215    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251215    clang-20
i386                  randconfig-002-20251215    clang-20
i386                  randconfig-003-20251215    clang-20
i386                  randconfig-004-20251215    clang-20
i386                  randconfig-005-20251215    clang-20
i386                  randconfig-006-20251215    clang-20
i386                  randconfig-007-20251215    clang-20
i386                  randconfig-011-20251215    clang-20
i386                  randconfig-011-20251215    gcc-14
i386                  randconfig-012-20251215    gcc-12
i386                  randconfig-012-20251215    gcc-14
i386                  randconfig-013-20251215    clang-20
i386                  randconfig-013-20251215    gcc-14
i386                  randconfig-014-20251215    gcc-14
i386                  randconfig-015-20251215    clang-20
i386                  randconfig-015-20251215    gcc-14
i386                  randconfig-016-20251215    gcc-14
i386                  randconfig-017-20251215    clang-20
i386                  randconfig-017-20251215    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251215    gcc-11.5.0
loongarch             randconfig-001-20251215    gcc-14.3.0
loongarch             randconfig-002-20251215    clang-18
loongarch             randconfig-002-20251215    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251215    gcc-11.5.0
nios2                 randconfig-002-20251215    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251215    gcc-12.5.0
parisc                randconfig-001-20251215    gcc-9.5.0
parisc                randconfig-002-20251215    gcc-11.5.0
parisc                randconfig-002-20251215    gcc-9.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251215    gcc-9.5.0
powerpc               randconfig-002-20251215    clang-22
powerpc               randconfig-002-20251215    gcc-9.5.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251215    gcc-8.5.0
powerpc64             randconfig-001-20251215    gcc-9.5.0
powerpc64             randconfig-002-20251215    clang-22
powerpc64             randconfig-002-20251215    gcc-9.5.0
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251215    clang-22
riscv                 randconfig-002-20251215    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-002-20251215    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251215    gcc-13.4.0
sh                    randconfig-002-20251215    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251215    gcc-15.1.0
sparc                 randconfig-002-20251215    gcc-12.5.0
sparc                 randconfig-002-20251215    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251215    clang-20
sparc64               randconfig-001-20251215    gcc-15.1.0
sparc64               randconfig-002-20251215    gcc-13.4.0
sparc64               randconfig-002-20251215    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251215    clang-22
um                    randconfig-001-20251215    gcc-15.1.0
um                    randconfig-002-20251215    gcc-14
um                    randconfig-002-20251215    gcc-15.1.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251215    clang-20
x86_64      buildonly-randconfig-001-20251215    gcc-14
x86_64      buildonly-randconfig-002-20251215    clang-20
x86_64      buildonly-randconfig-003-20251215    clang-20
x86_64      buildonly-randconfig-004-20251215    clang-20
x86_64      buildonly-randconfig-005-20251215    clang-20
x86_64      buildonly-randconfig-006-20251215    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251215    gcc-14
x86_64                randconfig-002-20251215    gcc-14
x86_64                randconfig-003-20251215    gcc-14
x86_64                randconfig-004-20251215    clang-20
x86_64                randconfig-004-20251215    gcc-14
x86_64                randconfig-005-20251215    gcc-14
x86_64                randconfig-006-20251215    clang-20
x86_64                randconfig-006-20251215    gcc-14
x86_64                randconfig-011-20251215    clang-20
x86_64                randconfig-011-20251215    gcc-14
x86_64                randconfig-012-20251215    clang-20
x86_64                randconfig-012-20251215    gcc-14
x86_64                randconfig-013-20251215    clang-20
x86_64                randconfig-013-20251215    gcc-14
x86_64                randconfig-014-20251215    clang-20
x86_64                randconfig-014-20251215    gcc-14
x86_64                randconfig-015-20251215    gcc-13
x86_64                randconfig-015-20251215    gcc-14
x86_64                randconfig-016-20251215    gcc-14
x86_64                randconfig-071-20251215    clang-20
x86_64                randconfig-071-20251215    gcc-14
x86_64                randconfig-072-20251215    clang-20
x86_64                randconfig-072-20251215    gcc-14
x86_64                randconfig-073-20251215    gcc-14
x86_64                randconfig-074-20251215    gcc-13
x86_64                randconfig-074-20251215    gcc-14
x86_64                randconfig-075-20251215    clang-20
x86_64                randconfig-075-20251215    gcc-14
x86_64                randconfig-076-20251215    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251215    gcc-15.1.0
xtensa                randconfig-001-20251215    gcc-8.5.0
xtensa                randconfig-002-20251215    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
