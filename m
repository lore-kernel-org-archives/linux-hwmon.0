Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126520E030
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Sep 2025 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757521360; cv=none; b=hXi7rgWPwRY/Qj/ME8sA5d14vGcvpfqcZieIasRUiqndmPNVMUfd8mG0CvvlvkE3lzHTZvZtcN5RkNZBV0DcvRXjprehz5gr18EpgEXwLRbFXxMZcCyod3UCfnlFSrVQHHte7bf6+Jg11ohGxAr6TzJaUb4qUM8P+WVuB6IOySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757521360; c=relaxed/simple;
	bh=yMdazBSWnPJEStbB2mz82IAgpxJCpzO/n1iDqt1/4QI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pZprvjI9ag1DUGFCnBsjTYFCSAEbPAGSBn9JN0FQZqsaq7RtU0f4sPjKUPvFgbh97Tx9jXRUORBKeKFt/723Hoji/TG2+jbzKZoBE9L3m0MAbTKHEe0xcRyZjFfhKP9D3QvwUNm/JpcIYsuHVSEWPVrCffaDBU/Emogc12ygrQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpXJKDvw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpXJKDvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757521358; x=1789057358;
  h=date:from:to:cc:subject:message-id;
  bh=yMdazBSWnPJEStbB2mz82IAgpxJCpzO/n1iDqt1/4QI=;
  b=FpXJKDvwP2GFhwk4g2DZ/ZhrfPV3/Y9GZ8qis8uVieGxCf7/YWMMLmTw
   hiwbfiFZJLYy858+dwvhTvChp6HwQrICsu7wCveRAAM99Hi7jIHOdhf80
   Z8wF7cr5a34T5WfPT8MggB3mnaTH0xQ6FrWswWcgR4mQlT7neJsHEN2Gf
   vTY5GKOqqKvZiHVXHWKQL1JArc++BpgVbPXPXLnI8t+ji9+0vty0NgQOV
   mx63r3dzjTbuogS/lvGNLSKqRQP7QwBP/bH45TEpMLeo/r7QtoJ5EvhU7
   DQg4JMnGLJ1DwP2FRpJVPYnn+YDHmK/VTYWF342Vsv6/W2BoFklU6liDR
   g==;
X-CSE-ConnectionGUID: znaJeQKBQyG2K3+IFFt+lQ==
X-CSE-MsgGUID: AUAL2Hq8RqyukJd0K0erng==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70937907"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="70937907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 09:22:38 -0700
X-CSE-ConnectionGUID: O8dN6eCcTmWYzugC4wI52A==
X-CSE-MsgGUID: jNgXTFvOS+mrWu/J/5DY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="172718239"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Sep 2025 09:22:36 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwNab-00067P-33;
	Wed, 10 Sep 2025 16:22:33 +0000
Date: Thu, 11 Sep 2025 00:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 c073f611592a260a7e962987a7f140fb23d90936
Message-ID: <202509110049.pxhuIIZy-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: c073f611592a260a7e962987a7f140fb23d90936  Merge branch 'fixes-v6.17' into testing

elapsed time: 1465m

configs tested: 230
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                          axs101_defconfig    clang-22
arc                                 defconfig    clang-19
arc                 nsimosci_hs_smp_defconfig    clang-22
arc                   randconfig-001-20250910    gcc-13.4.0
arc                   randconfig-002-20250910    gcc-13.4.0
arc                   randconfig-002-20250910    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                            mps2_defconfig    clang-22
arm                   randconfig-001-20250910    gcc-13.4.0
arm                   randconfig-001-20250910    gcc-8.5.0
arm                   randconfig-002-20250910    gcc-13.4.0
arm                   randconfig-002-20250910    gcc-8.5.0
arm                   randconfig-003-20250910    clang-16
arm                   randconfig-003-20250910    gcc-13.4.0
arm                   randconfig-004-20250910    gcc-13.4.0
arm                   randconfig-004-20250910    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250910    clang-22
arm64                 randconfig-001-20250910    gcc-13.4.0
arm64                 randconfig-002-20250910    clang-22
arm64                 randconfig-002-20250910    gcc-13.4.0
arm64                 randconfig-003-20250910    gcc-13.4.0
arm64                 randconfig-003-20250910    gcc-9.5.0
arm64                 randconfig-004-20250910    gcc-13.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20250910    clang-22
csky                  randconfig-001-20250910    gcc-12.5.0
csky                  randconfig-002-20250910    clang-22
csky                  randconfig-002-20250910    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250910    clang-22
hexagon               randconfig-002-20250910    clang-22
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250910    clang-20
i386        buildonly-randconfig-001-20250910    gcc-14
i386        buildonly-randconfig-002-20250910    clang-20
i386        buildonly-randconfig-002-20250910    gcc-13
i386        buildonly-randconfig-003-20250910    clang-20
i386        buildonly-randconfig-004-20250910    clang-20
i386        buildonly-randconfig-005-20250910    clang-20
i386        buildonly-randconfig-005-20250910    gcc-14
i386        buildonly-randconfig-006-20250910    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250910    clang-20
i386                  randconfig-002-20250910    clang-20
i386                  randconfig-003-20250910    clang-20
i386                  randconfig-004-20250910    clang-20
i386                  randconfig-005-20250910    clang-20
i386                  randconfig-006-20250910    clang-20
i386                  randconfig-007-20250910    clang-20
i386                  randconfig-011-20250910    clang-20
i386                  randconfig-012-20250910    clang-20
i386                  randconfig-013-20250910    clang-20
i386                  randconfig-014-20250910    clang-20
i386                  randconfig-015-20250910    clang-20
i386                  randconfig-016-20250910    clang-20
i386                  randconfig-017-20250910    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250910    clang-18
loongarch             randconfig-001-20250910    clang-22
loongarch             randconfig-002-20250910    clang-18
loongarch             randconfig-002-20250910    clang-22
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    clang-22
mips                              allnoconfig    gcc-15.1.0
mips                        maltaup_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250910    clang-22
nios2                 randconfig-001-20250910    gcc-11.5.0
nios2                 randconfig-002-20250910    clang-22
nios2                 randconfig-002-20250910    gcc-9.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250910    clang-22
parisc                randconfig-001-20250910    gcc-10.5.0
parisc                randconfig-002-20250910    clang-22
parisc                randconfig-002-20250910    gcc-9.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-22
powerpc                  mpc885_ads_defconfig    clang-22
powerpc               randconfig-001-20250910    clang-22
powerpc               randconfig-001-20250910    gcc-8.5.0
powerpc               randconfig-002-20250910    clang-22
powerpc               randconfig-002-20250910    gcc-8.5.0
powerpc               randconfig-003-20250910    clang-22
powerpc                    socrates_defconfig    clang-22
powerpc64             randconfig-002-20250910    clang-22
powerpc64             randconfig-002-20250910    gcc-11.5.0
powerpc64             randconfig-003-20250910    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20250910    clang-22
riscv                 randconfig-001-20250910    gcc-12.5.0
riscv                 randconfig-002-20250910    clang-22
riscv                 randconfig-002-20250910    gcc-12.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-14
s390                  randconfig-001-20250910    clang-22
s390                  randconfig-001-20250910    gcc-12.5.0
s390                  randconfig-002-20250910    clang-22
s390                  randconfig-002-20250910    gcc-12.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20250910    gcc-12.5.0
sh                    randconfig-001-20250910    gcc-15.1.0
sh                    randconfig-002-20250910    gcc-12.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250910    gcc-12.5.0
sparc                 randconfig-001-20250910    gcc-8.5.0
sparc                 randconfig-002-20250910    gcc-12.5.0
sparc                 randconfig-002-20250910    gcc-8.5.0
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20250910    gcc-12.5.0
sparc64               randconfig-001-20250910    gcc-8.5.0
sparc64               randconfig-002-20250910    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250910    clang-22
um                    randconfig-001-20250910    gcc-12.5.0
um                    randconfig-002-20250910    clang-22
um                    randconfig-002-20250910    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250910    gcc-14
x86_64      buildonly-randconfig-002-20250910    clang-20
x86_64      buildonly-randconfig-002-20250910    gcc-14
x86_64      buildonly-randconfig-003-20250910    gcc-14
x86_64      buildonly-randconfig-004-20250910    clang-20
x86_64      buildonly-randconfig-004-20250910    gcc-14
x86_64      buildonly-randconfig-005-20250910    gcc-14
x86_64      buildonly-randconfig-006-20250910    clang-20
x86_64      buildonly-randconfig-006-20250910    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250910    clang-20
x86_64                randconfig-002-20250910    clang-20
x86_64                randconfig-003-20250910    clang-20
x86_64                randconfig-004-20250910    clang-20
x86_64                randconfig-005-20250910    clang-20
x86_64                randconfig-006-20250910    clang-20
x86_64                randconfig-007-20250910    clang-20
x86_64                randconfig-008-20250910    clang-20
x86_64                randconfig-071-20250910    gcc-14
x86_64                randconfig-072-20250910    gcc-14
x86_64                randconfig-073-20250910    gcc-14
x86_64                randconfig-074-20250910    gcc-14
x86_64                randconfig-075-20250910    gcc-14
x86_64                randconfig-076-20250910    gcc-14
x86_64                randconfig-077-20250910    gcc-14
x86_64                randconfig-078-20250910    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250910    gcc-12.5.0
xtensa                randconfig-001-20250910    gcc-8.5.0
xtensa                randconfig-002-20250910    gcc-10.5.0
xtensa                randconfig-002-20250910    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
