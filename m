Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20543205E32
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Feb 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594724; cv=none; b=AXhqJugcp6h5DzTtacLNjQ2anYdpCs9A6p6fttUk8LIu4dzKRCX3Hu/AhjtiXPgBrxIRbrjtTnyqtd/ZipZH2Xdjn6FxcGNSzXrgkQuMsXHptKvwMwDgZsgaziGAfBhzz9nRf5vvM1Vr82tgM5Zi4JGG3BrhliOAgB7oF7Yi6TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594724; c=relaxed/simple;
	bh=6kYYnBINLeBa8WvKD9dlRFipEjKtgmqEJDYJwc7aJmg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UaHJooNjZmpuFIlxtrgXNZMIY561JBe0jhIdP9NeKkI0aFi/BdAJFVFdRE/58jr0p3LHFq+VeWgX8ufZ5Hvx6T/3et0P5R8B4Q5akzYIrX8wDYE9++GH0DpHdoERPPYsK0EwBjSP2ReEvaj8w/wgrohSyTYUoYFvMbNFoOYmoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOBPuD7x; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOBPuD7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738594722; x=1770130722;
  h=date:from:to:cc:subject:message-id;
  bh=6kYYnBINLeBa8WvKD9dlRFipEjKtgmqEJDYJwc7aJmg=;
  b=NOBPuD7xwRqgJ2SLbT4+H7awjU1DLmbKxKNTSW2BcU5UOQdRXIyEAJYf
   rBuHzXS6eMYqyftm55oCxY+JdrfqJJi61t+7d6T4xn5aV4e8Y27T3oXwu
   4duPiZ5N+Nttu+QJ9acncwGxsvY6bOHqzFH03opBG0bwLatfZXd4vVCa5
   HAU+PXhOvnsjh6lQdWfOWDkpfMFrzgXuRpi18G4mktOBGXwhH1HKvNBot
   IKZcYixEQmV1xLz/BS8YdeIa6a0wO8uSFJmHHgsD19NcGdKkagWWujAmc
   V9BZyELJpJU/hQg04sT5VnvlRa9IgtajYfvK8f0W5nNnwMZ0Im/3tqzlG
   A==;
X-CSE-ConnectionGUID: ejw90xzhT4GyyssS4gIbIA==
X-CSE-MsgGUID: E01UQegYQua/BaDF9YPM5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26690991"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="26690991"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 06:58:40 -0800
X-CSE-ConnectionGUID: BGluZ2rdQW20fHChK8i0+g==
X-CSE-MsgGUID: vYwKEu8yQriZcGs4t8gWTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147521256"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2025 06:58:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1texuG-000r4F-2z;
	Mon, 03 Feb 2025 14:58:36 +0000
Date: Mon, 03 Feb 2025 22:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 8d0efe18f567040a251aef1e00ea39bd3776f5e1
Message-ID: <202502032210.NaEOuOVB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 8d0efe18f567040a251aef1e00ea39bd3776f5e1  Merge branch 'fixes-v6.14' into testing

elapsed time: 795m

configs tested: 173
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsim_700_defconfig    gcc-14.1.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arc                           tb10x_defconfig    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.1.0
arm                          pxa910_defconfig    gcc-14.2.0
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-004-20250203    gcc-14.2.0
arm                           u8500_defconfig    gcc-13.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-002-20250203    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-006-20250203    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250203    clang-19
i386                  randconfig-012-20250203    clang-19
i386                  randconfig-013-20250203    clang-19
i386                  randconfig-014-20250203    clang-19
i386                  randconfig-015-20250203    clang-19
i386                  randconfig-016-20250203    clang-19
i386                  randconfig-017-20250203    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-13.2.0
mips                           jazz_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                       virt_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    clang-21
powerpc                        cell_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                      pmac32_defconfig    clang-21
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-13.2.0
powerpc                     stx_gp3_defconfig    gcc-13.2.0
powerpc                     taishan_defconfig    gcc-13.2.0
powerpc                      tqm8xx_defconfig    clang-21
powerpc                         wii_defconfig    gcc-13.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
powerpc64             randconfig-003-20250203    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-002-20250203    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                          rsk7201_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-002-20250203    clang-18
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-071-20250203    gcc-12
x86_64                randconfig-072-20250203    gcc-12
x86_64                randconfig-073-20250203    gcc-12
x86_64                randconfig-074-20250203    gcc-12
x86_64                randconfig-075-20250203    gcc-12
x86_64                randconfig-076-20250203    gcc-12
x86_64                randconfig-077-20250203    gcc-12
x86_64                randconfig-078-20250203    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
