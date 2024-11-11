Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462CD196D80
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2024 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731324564; cv=none; b=YhtprLipYoPmnara+OQU68HinUsPVW71CujhXBMacvJWMj4+EiTFsasmU7MvWzFWZGC/j38eMps1tbSy9WyoNi3oynyxyBnHiU223MIdkOjPlAw+Qk5W2NecRMnsiSudU7oiepgUItnNUBu8whZXBcZZNL2c7w4TWUT5SsQ26TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731324564; c=relaxed/simple;
	bh=FPpQahNqZs9RbbfROtpdkq1mndpoE5Ly9KMcqONtEmA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cv9lE29mIjzgN8K86Eua8kYC5fXraxMoSnw7vULBN/FKfYD9alBppQYVhdASMMdWbNeZC/6johTzKdDiAbxLxkhMWNLR7v3Z4YO5uQX64UarQlobakBQWe5t7jjs32sW0cP5F530iYz8QeN5cdusIDBsHbsCM4QQQYQGnwNQGNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGtpytjl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGtpytjl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731324562; x=1762860562;
  h=date:from:to:cc:subject:message-id;
  bh=FPpQahNqZs9RbbfROtpdkq1mndpoE5Ly9KMcqONtEmA=;
  b=DGtpytjlyGMq5tTp5ZFqtu9m5HhJh5mxY+bDS9TPS7YeBBCcFKqXoVxz
   XTWWbzfx8c3wDHL1o3kR6VmVURkNges+gFysMSWqw8siZ8PTYixKUVZfu
   d0XTNuz33yUabQCBa9QcbXF8kYPZV3LIgOuTp6A3oJloABW2drKI22CSt
   y5IT5ro13LgiVzDDHxFooucWlRIbJP8fsUGrtNxH494Pjj1tXoq+xDobZ
   UdWuRcCqUesWBEE6rntuRVd4zH1sUmFXMwRnr/XpJ+Qb11AR6c9AH92Mi
   5Kx3LS+uA6+NVX0ajiDAMZ1q2lzHIIHTBT3GzoxJ54Ifur2rdKo9tjF5y
   Q==;
X-CSE-ConnectionGUID: WymYJq+UQ4uduuQVnw2Bqg==
X-CSE-MsgGUID: 2VIuI2nbRjSOyc4EaciPOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34814585"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34814585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 03:29:17 -0800
X-CSE-ConnectionGUID: fzkg+2EVR+eNx6vYV3dFpw==
X-CSE-MsgGUID: 2CUEBPQrSoeN0klsIcVJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="86992619"
Received: from lkp-server01.sh.intel.com (HELO dc8184e5aea1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2024 03:29:16 -0800
Received: from kbuild by dc8184e5aea1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tASbZ-0000Et-2Q;
	Mon, 11 Nov 2024 11:29:13 +0000
Date: Mon, 11 Nov 2024 19:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 6c873366a511e2ff2789490c3f59c637f5cbfd6c
Message-ID: <202411111946.PJo8p43k-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 6c873366a511e2ff2789490c3f59c637f5cbfd6c  Merge branch 'hwmon-staging' into testing

elapsed time: 724m

configs tested: 249
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                          axs103_defconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241111    gcc-13.2.0
arc                   randconfig-002-20241111    gcc-13.2.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         assabet_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241111    clang-17
arm                   randconfig-002-20241111    clang-20
arm                   randconfig-003-20241111    clang-20
arm                   randconfig-004-20241111    clang-20
arm                           sama7_defconfig    clang-20
arm                         socfpga_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    clang-20
arm                         vf610m4_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241111    clang-20
arm64                 randconfig-002-20241111    gcc-14.2.0
arm64                 randconfig-003-20241111    clang-20
arm64                 randconfig-004-20241111    clang-20
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241111    gcc-14.2.0
csky                  randconfig-002-20241111    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241111    clang-20
hexagon               randconfig-002-20241111    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-11
i386        buildonly-randconfig-002-20241111    gcc-12
i386        buildonly-randconfig-003-20241111    clang-19
i386        buildonly-randconfig-003-20241111    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-11
i386        buildonly-randconfig-004-20241111    gcc-12
i386        buildonly-randconfig-005-20241111    clang-19
i386        buildonly-randconfig-005-20241111    gcc-11
i386        buildonly-randconfig-006-20241111    clang-19
i386        buildonly-randconfig-006-20241111    gcc-11
i386                                defconfig    clang-19
i386                  randconfig-001-20241111    clang-19
i386                  randconfig-001-20241111    gcc-11
i386                  randconfig-002-20241111    gcc-11
i386                  randconfig-002-20241111    gcc-12
i386                  randconfig-003-20241111    clang-19
i386                  randconfig-003-20241111    gcc-11
i386                  randconfig-004-20241111    gcc-11
i386                  randconfig-004-20241111    gcc-12
i386                  randconfig-005-20241111    gcc-11
i386                  randconfig-005-20241111    gcc-12
i386                  randconfig-006-20241111    gcc-11
i386                  randconfig-006-20241111    gcc-12
i386                  randconfig-011-20241111    clang-19
i386                  randconfig-011-20241111    gcc-11
i386                  randconfig-012-20241111    gcc-11
i386                  randconfig-012-20241111    gcc-12
i386                  randconfig-013-20241111    clang-19
i386                  randconfig-013-20241111    gcc-11
i386                  randconfig-014-20241111    clang-19
i386                  randconfig-014-20241111    gcc-11
i386                  randconfig-015-20241111    gcc-11
i386                  randconfig-015-20241111    gcc-12
i386                  randconfig-016-20241111    clang-19
i386                  randconfig-016-20241111    gcc-11
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241111    gcc-14.2.0
loongarch             randconfig-002-20241111    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                           sun3_defconfig    gcc-14.2.0
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                            gpr_defconfig    clang-20
mips                      maltaaprp_defconfig    gcc-14.2.0
nios2                         3c120_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241111    gcc-14.2.0
nios2                 randconfig-002-20241111    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241111    gcc-14.2.0
parisc                randconfig-002-20241111    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    gcc-14.2.0
powerpc                      bamboo_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                 mpc834x_itx_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-14
powerpc                      ppc6xx_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241111    gcc-14.2.0
powerpc               randconfig-002-20241111    gcc-14.2.0
powerpc               randconfig-003-20241111    clang-20
powerpc                     skiroot_defconfig    clang-20
powerpc                     taishan_defconfig    clang-20
powerpc                     tqm5200_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    clang-20
powerpc                     tqm8555_defconfig    gcc-14.2.0
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20241111    clang-20
powerpc64             randconfig-002-20241111    clang-20
powerpc64             randconfig-003-20241111    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241111    clang-20
riscv                 randconfig-002-20241111    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-20
s390                                defconfig    gcc-12
s390                  randconfig-001-20241111    gcc-14.2.0
s390                  randconfig-002-20241111    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          landisk_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241111    gcc-14.2.0
sh                    randconfig-002-20241111    gcc-14.2.0
sh                          sdk7780_defconfig    gcc-14.2.0
sh                           se7705_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    clang-20
sh                        sh7757lcr_defconfig    clang-20
sh                        sh7763rdp_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241111    gcc-14.2.0
sparc64               randconfig-002-20241111    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241111    clang-20
um                    randconfig-002-20241111    clang-20
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241111    gcc-12
x86_64      buildonly-randconfig-002-20241111    gcc-12
x86_64      buildonly-randconfig-003-20241111    gcc-12
x86_64      buildonly-randconfig-004-20241111    gcc-12
x86_64      buildonly-randconfig-005-20241111    gcc-12
x86_64      buildonly-randconfig-006-20241111    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241111    clang-19
x86_64                randconfig-002-20241111    clang-19
x86_64                randconfig-003-20241111    clang-19
x86_64                randconfig-004-20241111    gcc-12
x86_64                randconfig-005-20241111    gcc-12
x86_64                randconfig-006-20241111    clang-19
x86_64                randconfig-011-20241111    clang-19
x86_64                randconfig-012-20241111    gcc-12
x86_64                randconfig-013-20241111    clang-19
x86_64                randconfig-014-20241111    clang-19
x86_64                randconfig-015-20241111    clang-19
x86_64                randconfig-016-20241111    gcc-12
x86_64                randconfig-071-20241111    gcc-12
x86_64                randconfig-072-20241111    gcc-12
x86_64                randconfig-073-20241111    clang-19
x86_64                randconfig-074-20241111    clang-19
x86_64                randconfig-075-20241111    clang-19
x86_64                randconfig-076-20241111    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                randconfig-001-20241111    gcc-14.2.0
xtensa                randconfig-002-20241111    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
