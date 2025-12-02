Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A062328853E
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Dec 2025 13:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764681089; cv=none; b=DhV83FRshvX3FeSGhXaGlgmniJ82BddPOuMOX59yBYLx/uEQU9y5aaD2KHjhMMk116H5tfAQ2C4NDgkv9FU9Sf+tlmMyQqsVo7S9ftK/WwC8+pcH/eTrAtfxvzsWM2dE2x3haWcbLBV/BuLI7cgU33rLCZp42PPepY0oVMt15Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764681089; c=relaxed/simple;
	bh=ta9TehaNn5QlCyfuFgg3gE6h874RrEmku537oiyOaGs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mpc0E1zd9rY2vaqO27b2/786LlG1OzwDd+cxUKkT+/y1qAg7UrmG6TepyoNUk9mc0dzcAlZYQOBvdwPcf3ayKQLUpANuJyUjBORPxoviZS+SiYIOfQIhCNlDtY60ifJl4piMj0TWE8ZW+Ya7+tb6qhDetkjDamc6uLsXMwU26kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEn6z9Uq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEn6z9Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764681087; x=1796217087;
  h=date:from:to:cc:subject:message-id;
  bh=ta9TehaNn5QlCyfuFgg3gE6h874RrEmku537oiyOaGs=;
  b=UEn6z9UqQPdeON7anltkD0MeL92dE68x5vuApYhgAdqCSODTFy4GO4ZQ
   x5A5M1PZAUy74zXvfFIgRm4WFq14VL/3fb4LdxjMiAZNO53ZNe5YVWb/3
   9GK+OEqLgcEG2SgwJy4ZIIeWLILGlN5T0/zJn0A8wZUplHt6M+TbAfOGI
   FXd98zZenHcm3Sotlj2dIbjp5F5FTQJnwvBBLciPJa8KicAICrAElKCDI
   tJgE7uF3VFqdqfYF3ssAjaSJLsR2som5hHeRaTMz/wWKFzqTYetNgaMUz
   1nNt6sE1UoWru6DemtCIaqhhFbOqcS77JcMuqOI1Ctk5YeVWP8Iy4GAp0
   g==;
X-CSE-ConnectionGUID: cIhiaDLjTCCOaCN5u2kaHQ==
X-CSE-MsgGUID: A/b64j62Tmqt8yOU1oRW7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66536009"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66536009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 05:11:27 -0800
X-CSE-ConnectionGUID: QX2kzlvMSmyX/CwkEyzIog==
X-CSE-MsgGUID: caQzzR3lSsKFaBcGFmnGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="193665317"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Dec 2025 05:11:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQQA7-000000009q9-30CJ;
	Tue, 02 Dec 2025 13:11:23 +0000
Date: Tue, 02 Dec 2025 21:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 30ca0e049f507001c6377e28482a636689351f64
Message-ID: <202512022116.Qcr5KGuk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 30ca0e049f507001c6377e28482a636689351f64  hwmon: (dell-smm) Add Dell G5 5505 to fan control whitelist

elapsed time: 1050m

configs tested: 205
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251202    clang-22
arc                   randconfig-002-20251202    clang-22
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g4_defconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251202    clang-22
arm                   randconfig-002-20251202    clang-22
arm                   randconfig-003-20251202    clang-22
arm                   randconfig-004-20251202    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251202    clang-22
arm64                 randconfig-002-20251202    clang-22
arm64                 randconfig-003-20251202    clang-16
arm64                 randconfig-003-20251202    clang-22
arm64                 randconfig-004-20251202    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251202    clang-22
csky                  randconfig-001-20251202    gcc-13.4.0
csky                  randconfig-002-20251202    clang-22
csky                  randconfig-002-20251202    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251202    clang-22
hexagon               randconfig-001-20251202    gcc-15.1.0
hexagon               randconfig-002-20251202    clang-22
hexagon               randconfig-002-20251202    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251202    clang-20
i386        buildonly-randconfig-002-20251202    clang-20
i386        buildonly-randconfig-003-20251202    clang-20
i386        buildonly-randconfig-004-20251202    clang-20
i386        buildonly-randconfig-005-20251202    clang-20
i386        buildonly-randconfig-006-20251202    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251202    gcc-14
i386                  randconfig-002-20251202    gcc-14
i386                  randconfig-003-20251202    gcc-14
i386                  randconfig-004-20251202    gcc-14
i386                  randconfig-005-20251202    gcc-14
i386                  randconfig-006-20251202    gcc-14
i386                  randconfig-007-20251202    gcc-14
i386                  randconfig-011-20251202    clang-20
i386                  randconfig-012-20251202    clang-20
i386                  randconfig-013-20251202    clang-20
i386                  randconfig-014-20251202    clang-20
i386                  randconfig-015-20251202    clang-20
i386                  randconfig-016-20251202    clang-20
i386                  randconfig-017-20251202    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251202    gcc-15.1.0
loongarch             randconfig-002-20251202    clang-22
loongarch             randconfig-002-20251202    gcc-15.1.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251202    gcc-15.1.0
nios2                 randconfig-001-20251202    gcc-8.5.0
nios2                 randconfig-002-20251202    gcc-15.1.0
nios2                 randconfig-002-20251202    gcc-8.5.0
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20251202    clang-22
parisc                randconfig-001-20251202    gcc-9.5.0
parisc                randconfig-002-20251202    clang-22
parisc                randconfig-002-20251202    gcc-15.1.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      ppc44x_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251202    clang-22
powerpc               randconfig-002-20251202    clang-22
powerpc               randconfig-002-20251202    gcc-10.5.0
powerpc                 xes_mpc85xx_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251202    clang-22
powerpc64             randconfig-002-20251202    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20251202    gcc-9.5.0
riscv                 randconfig-002-20251202    gcc-9.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20251202    gcc-9.5.0
s390                  randconfig-002-20251202    gcc-9.5.0
s390                       zfcpdump_defconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                        edosk7705_defconfig    gcc-15.1.0
sh                    randconfig-001-20251202    gcc-9.5.0
sh                    randconfig-002-20251202    gcc-9.5.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251202    gcc-14
sparc                 randconfig-002-20251202    gcc-14
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251202    gcc-14
sparc64               randconfig-002-20251202    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251202    gcc-14
um                    randconfig-002-20251202    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251202    gcc-14
x86_64      buildonly-randconfig-002-20251202    gcc-14
x86_64      buildonly-randconfig-003-20251202    gcc-14
x86_64      buildonly-randconfig-004-20251202    gcc-14
x86_64      buildonly-randconfig-005-20251202    gcc-14
x86_64      buildonly-randconfig-006-20251202    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251202    gcc-14
x86_64                randconfig-002-20251202    gcc-14
x86_64                randconfig-003-20251202    gcc-14
x86_64                randconfig-004-20251202    gcc-14
x86_64                randconfig-005-20251202    gcc-14
x86_64                randconfig-006-20251202    gcc-14
x86_64                randconfig-011-20251202    clang-20
x86_64                randconfig-011-20251202    gcc-13
x86_64                randconfig-012-20251202    gcc-13
x86_64                randconfig-013-20251202    gcc-13
x86_64                randconfig-013-20251202    gcc-14
x86_64                randconfig-014-20251202    clang-20
x86_64                randconfig-014-20251202    gcc-13
x86_64                randconfig-015-20251202    clang-20
x86_64                randconfig-015-20251202    gcc-13
x86_64                randconfig-016-20251202    clang-20
x86_64                randconfig-016-20251202    gcc-13
x86_64                randconfig-071-20251202    clang-20
x86_64                randconfig-072-20251202    clang-20
x86_64                randconfig-073-20251202    clang-20
x86_64                randconfig-074-20251202    clang-20
x86_64                randconfig-075-20251202    clang-20
x86_64                randconfig-076-20251202    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251202    gcc-14
xtensa                randconfig-002-20251202    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
