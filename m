Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0990221F38
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Jul 2025 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667821; cv=none; b=mjMTTUCFJFAFYQunqlPk4vPYi9gl89CijXuhx0K1oJgA8/ItwJLZnBdz6boev0OCxgusb5+3YCdnf1qeOXM6ffj4C8VwDDohPOreqV21fwCouSrA8JU2aQBbntP1LIPNfKoS49AXJyGHHM0w4xRMr1oqQUxgwuqHzBrLA5Ico/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667821; c=relaxed/simple;
	bh=fl7Ak8I6YC+HKsvrg/gZVLskkwTgyCn+rBXu0sklPeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FpWU8TVE4ZTrKKBvb7K8pApTcyRlwv/QsOtQh1/+ATMY4ZQSw8bbvNVM1oBwkIpdYRX/59+ZLiCR0DnCpAwT2kQc2me3v73malPNZwTiZSjoYMUQU1L5SZbGRdthb9BGJVn6RXMu9IBmgWZWNtNa/IT29XwLC4rteRXC0FJVldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHMiaNJp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHMiaNJp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752667820; x=1784203820;
  h=date:from:to:cc:subject:message-id;
  bh=fl7Ak8I6YC+HKsvrg/gZVLskkwTgyCn+rBXu0sklPeA=;
  b=WHMiaNJpXf4ecDHlmN/q8XI7y/XiVjTcHyB+OlYKZvf/LhH4a5ALnNnH
   GKH5E9JFS+tqbqOnjQBUVYdNDp3H989faL5aY6kcIVWQRm8RA2ovoHYgQ
   5sSfiqU+J2p+yHWFWi5k+z/y4h64n2yoVOeHUSCfxz/76wOpM+slmKTfZ
   2wP66D9P2ybB0yw7QWVum9jjEhtostXEpfKFUN91nwfzu+96BEK4QNnx7
   zJTFuIRShvepAPhLx8fPyymR+NMlIIIQ7QRkDHQtShGByQ0dcpEO7xxxo
   /7RJxn21wFyLdtLhrwJiH0PUZlQZHBPBxYAg3z2F0Dgq2qsK1V9kUtD+L
   A==;
X-CSE-ConnectionGUID: +oZ1bTOwQ3CG9QcyZL3j5Q==
X-CSE-MsgGUID: +lnnlhHFSvybRAXpPzyGhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="42541448"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="42541448"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 05:10:16 -0700
X-CSE-ConnectionGUID: AHPND/xlTNmG8Vqu0DxSHQ==
X-CSE-MsgGUID: m8It1QyUQwmGb3H/697wtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="156879739"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Jul 2025 05:10:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc0xf-000CLD-2Y;
	Wed, 16 Jul 2025 12:10:11 +0000
Date: Wed, 16 Jul 2025 20:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 27b297ca04813623d8df2f79d141d51e0856810c
Message-ID: <202507162010.zdztursO-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 27b297ca04813623d8df2f79d141d51e0856810c  hwmon: ina238: Report energy in microjoules

elapsed time: 1104m

configs tested: 219
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                               allnoconfig    clang-21
arc                              allyesconfig    clang-19
arc                          axs103_defconfig    clang-21
arc                      axs103_smp_defconfig    clang-21
arc                                 defconfig    clang-19
arc                   randconfig-001-20250716    clang-21
arc                   randconfig-001-20250716    gcc-13.4.0
arc                   randconfig-002-20250716    clang-21
arc                   randconfig-002-20250716    gcc-8.5.0
arm                              allmodconfig    clang-19
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                                 defconfig    clang-19
arm                   randconfig-001-20250716    clang-20
arm                   randconfig-001-20250716    clang-21
arm                   randconfig-002-20250716    clang-21
arm                   randconfig-002-20250716    gcc-12.4.0
arm                   randconfig-003-20250716    clang-21
arm                   randconfig-003-20250716    gcc-8.5.0
arm                   randconfig-004-20250716    clang-21
arm                   randconfig-004-20250716    gcc-8.5.0
arm                         s3c6400_defconfig    clang-21
arm64                            alldefconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250716    clang-21
arm64                 randconfig-001-20250716    gcc-9.5.0
arm64                 randconfig-002-20250716    clang-21
arm64                 randconfig-002-20250716    gcc-8.5.0
arm64                 randconfig-003-20250716    clang-21
arm64                 randconfig-003-20250716    gcc-8.5.0
arm64                 randconfig-004-20250716    clang-21
csky                              allnoconfig    clang-21
csky                                defconfig    clang-19
csky                  randconfig-001-20250716    gcc-14.3.0
csky                  randconfig-001-20250716    gcc-15.1.0
csky                  randconfig-002-20250716    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250716    clang-21
hexagon               randconfig-001-20250716    gcc-15.1.0
hexagon               randconfig-002-20250716    clang-21
hexagon               randconfig-002-20250716    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250716    gcc-12
i386        buildonly-randconfig-002-20250716    clang-20
i386        buildonly-randconfig-002-20250716    gcc-12
i386        buildonly-randconfig-003-20250716    gcc-12
i386        buildonly-randconfig-004-20250716    gcc-11
i386        buildonly-randconfig-004-20250716    gcc-12
i386        buildonly-randconfig-005-20250716    gcc-12
i386        buildonly-randconfig-006-20250716    clang-20
i386        buildonly-randconfig-006-20250716    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250716    clang-20
i386                  randconfig-002-20250716    clang-20
i386                  randconfig-003-20250716    clang-20
i386                  randconfig-004-20250716    clang-20
i386                  randconfig-005-20250716    clang-20
i386                  randconfig-006-20250716    clang-20
i386                  randconfig-007-20250716    clang-20
i386                  randconfig-011-20250716    gcc-12
i386                  randconfig-012-20250716    gcc-12
i386                  randconfig-013-20250716    gcc-12
i386                  randconfig-014-20250716    gcc-12
i386                  randconfig-015-20250716    gcc-12
i386                  randconfig-016-20250716    gcc-12
i386                  randconfig-017-20250716    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250716    clang-18
loongarch             randconfig-001-20250716    gcc-15.1.0
loongarch             randconfig-002-20250716    clang-21
loongarch             randconfig-002-20250716    gcc-15.1.0
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
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250716    gcc-14.2.0
nios2                 randconfig-001-20250716    gcc-15.1.0
nios2                 randconfig-002-20250716    gcc-11.5.0
nios2                 randconfig-002-20250716    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250716    gcc-15.1.0
parisc                randconfig-001-20250716    gcc-8.5.0
parisc                randconfig-002-20250716    gcc-15.1.0
parisc                randconfig-002-20250716    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-21
powerpc               randconfig-001-20250716    gcc-15.1.0
powerpc               randconfig-001-20250716    gcc-8.5.0
powerpc               randconfig-002-20250716    clang-21
powerpc               randconfig-002-20250716    gcc-15.1.0
powerpc               randconfig-003-20250716    gcc-14.3.0
powerpc               randconfig-003-20250716    gcc-15.1.0
powerpc64             randconfig-001-20250716    gcc-10.5.0
powerpc64             randconfig-001-20250716    gcc-15.1.0
powerpc64             randconfig-003-20250716    gcc-13.4.0
powerpc64             randconfig-003-20250716    gcc-15.1.0
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250716    gcc-8.5.0
riscv                 randconfig-001-20250716    gcc-9.3.0
riscv                 randconfig-002-20250716    gcc-11.5.0
riscv                 randconfig-002-20250716    gcc-9.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250716    gcc-11.5.0
s390                  randconfig-001-20250716    gcc-9.3.0
s390                  randconfig-002-20250716    gcc-11.5.0
s390                  randconfig-002-20250716    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          kfr2r09_defconfig    clang-21
sh                    randconfig-001-20250716    gcc-15.1.0
sh                    randconfig-001-20250716    gcc-9.3.0
sh                    randconfig-002-20250716    gcc-14.3.0
sh                    randconfig-002-20250716    gcc-9.3.0
sh                  sh7785lcr_32bit_defconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250716    gcc-8.5.0
sparc                 randconfig-001-20250716    gcc-9.3.0
sparc                 randconfig-002-20250716    gcc-14.3.0
sparc                 randconfig-002-20250716    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250716    clang-20
sparc64               randconfig-001-20250716    gcc-9.3.0
sparc64               randconfig-002-20250716    clang-21
sparc64               randconfig-002-20250716    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250716    gcc-11
um                    randconfig-001-20250716    gcc-9.3.0
um                    randconfig-002-20250716    gcc-12
um                    randconfig-002-20250716    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250716    clang-20
x86_64      buildonly-randconfig-001-20250716    gcc-12
x86_64      buildonly-randconfig-002-20250716    clang-20
x86_64      buildonly-randconfig-003-20250716    clang-20
x86_64      buildonly-randconfig-004-20250716    clang-20
x86_64      buildonly-randconfig-005-20250716    clang-20
x86_64      buildonly-randconfig-006-20250716    clang-20
x86_64      buildonly-randconfig-006-20250716    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250716    clang-20
x86_64                randconfig-002-20250716    clang-20
x86_64                randconfig-003-20250716    clang-20
x86_64                randconfig-004-20250716    clang-20
x86_64                randconfig-005-20250716    clang-20
x86_64                randconfig-006-20250716    clang-20
x86_64                randconfig-007-20250716    clang-20
x86_64                randconfig-008-20250716    clang-20
x86_64                randconfig-071-20250716    gcc-12
x86_64                randconfig-072-20250716    gcc-12
x86_64                randconfig-073-20250716    gcc-12
x86_64                randconfig-074-20250716    gcc-12
x86_64                randconfig-075-20250716    gcc-12
x86_64                randconfig-076-20250716    gcc-12
x86_64                randconfig-077-20250716    gcc-12
x86_64                randconfig-078-20250716    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250716    gcc-9.3.0
xtensa                randconfig-002-20250716    gcc-13.4.0
xtensa                randconfig-002-20250716    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
