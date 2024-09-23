Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF519DF81
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2024 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727101112; cv=none; b=JgbaaRBYMVytnPix5VvpBGXrfofWn5dqO+15kyCrnq74lZlUlkMlboSCEl5TrgTDiPahZ9wNO8o2mIEXX0L2xXV5PBBq1p6jNL0Qx59C+yHlxtLOhRklTumgGvfnFKGU2be7UJbP2zBfeQBhbKz0JnmMBM2hbepE+Rk/Ac5eVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727101112; c=relaxed/simple;
	bh=AVzBsjY3fcaf3XtQcR0+dC7xVKhCFr5vNJWHp0egC3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q5x/0XoYnwyz4NdTUx9y9iWkVO+q6MTe921DaRCeY9CKKX6MFgciDspakZRD8QVlru8I8+RDnaNhs0/CdtqFtGh6hKqI6jMZszNtXXAw8XAwYFUGcsOSlvnQBQCOtX0LulrWNptBmHZX6fPMi4J51frCbDI9MtdWXW8nF2il9vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FD8V6hzV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FD8V6hzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727101110; x=1758637110;
  h=date:from:to:cc:subject:message-id;
  bh=AVzBsjY3fcaf3XtQcR0+dC7xVKhCFr5vNJWHp0egC3Y=;
  b=FD8V6hzVeFzD42GPJ8A0WTJYSfa07SEjmP3x6o17jWVp5coKgr9N7Jxt
   n7k5fnxJ5pv+c/8M5pwS8qd01Z7dODjZD6JjUCGiuK90JHT6wJDI7Ak7Z
   L5uloS45aHtU2z1VyOUwoviOSy0ABzsAWVGmaJaQz1yNB6OHuNqiaWYuY
   mEHEBiIVrg9SkTmw01p8/WofruR6uHEmNbzg7vqq+YOPm/VAJxjckZA/B
   DsV/LbVC1sEOU6+VOzOrlESy8u4Pm3fIfC9Wdry45al94Z0bxgBO5a5S0
   Spb9vie6prcntw69Uf9Jjy1o3ktURulXmkkeBatbO5ManoqYAM5nKvAWB
   w==;
X-CSE-ConnectionGUID: /HWavPE9QZ2cO2b6GZLv2Q==
X-CSE-MsgGUID: ac8QOjSPS2qy3aMbbHYUhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26169595"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26169595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 07:18:28 -0700
X-CSE-ConnectionGUID: NjYoyPTFR3qjed71pM5fRQ==
X-CSE-MsgGUID: rA02zlvtS7CHaxNLY21v1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="76010537"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 07:18:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssjtR-000HH6-1U;
	Mon, 23 Sep 2024 14:18:25 +0000
Date: Mon, 23 Sep 2024 22:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 b08bf178cb69af2c2c982faa186fe56a677d1b8e
Message-ID: <202409232239.J136Rp3T-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: b08bf178cb69af2c2c982faa186fe56a677d1b8e  resource, kunit: add dependency on SPARSEMEM

elapsed time: 869m

configs tested: 240
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20240923    clang-20
arc                   randconfig-002-20240923    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                         at91_dt_defconfig    clang-20
arm                         at91_dt_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            dove_defconfig    gcc-14.1.0
arm                          exynos_defconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                        mvebu_v7_defconfig    gcc-14.1.0
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20240923    clang-20
arm                   randconfig-002-20240923    clang-20
arm                   randconfig-003-20240923    clang-20
arm                   randconfig-004-20240923    clang-20
arm                        spear3xx_defconfig    gcc-14.1.0
arm                         vf610m4_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240923    clang-20
arm64                 randconfig-002-20240923    clang-20
arm64                 randconfig-003-20240923    clang-20
arm64                 randconfig-004-20240923    clang-20
csky                             alldefconfig    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240923    clang-20
csky                  randconfig-002-20240923    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
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
i386        buildonly-randconfig-001-20240923    clang-18
i386        buildonly-randconfig-001-20240923    gcc-11
i386        buildonly-randconfig-002-20240923    clang-18
i386        buildonly-randconfig-002-20240923    gcc-11
i386        buildonly-randconfig-003-20240923    gcc-11
i386        buildonly-randconfig-003-20240923    gcc-12
i386        buildonly-randconfig-004-20240923    clang-18
i386        buildonly-randconfig-004-20240923    gcc-11
i386        buildonly-randconfig-005-20240923    gcc-11
i386        buildonly-randconfig-005-20240923    gcc-12
i386        buildonly-randconfig-006-20240923    clang-18
i386        buildonly-randconfig-006-20240923    gcc-11
i386                                defconfig    clang-18
i386                  randconfig-001-20240923    clang-18
i386                  randconfig-001-20240923    gcc-11
i386                  randconfig-002-20240923    clang-18
i386                  randconfig-002-20240923    gcc-11
i386                  randconfig-003-20240923    clang-18
i386                  randconfig-003-20240923    gcc-11
i386                  randconfig-004-20240923    gcc-11
i386                  randconfig-004-20240923    gcc-12
i386                  randconfig-005-20240923    gcc-11
i386                  randconfig-006-20240923    clang-18
i386                  randconfig-006-20240923    gcc-11
i386                  randconfig-011-20240923    clang-18
i386                  randconfig-011-20240923    gcc-11
i386                  randconfig-012-20240923    gcc-11
i386                  randconfig-012-20240923    gcc-12
i386                  randconfig-013-20240923    gcc-11
i386                  randconfig-013-20240923    gcc-12
i386                  randconfig-014-20240923    gcc-11
i386                  randconfig-014-20240923    gcc-12
i386                  randconfig-015-20240923    gcc-11
i386                  randconfig-015-20240923    gcc-12
i386                  randconfig-016-20240923    gcc-11
i386                  randconfig-016-20240923    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240923    clang-20
loongarch             randconfig-002-20240923    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    gcc-14.1.0
mips                           ip30_defconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                      maltaaprp_defconfig    gcc-14.1.0
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
parisc                randconfig-001-20240923    clang-20
parisc                randconfig-002-20240923    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                        cell_defconfig    gcc-14.1.0
powerpc                   currituck_defconfig    gcc-14.1.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                   microwatt_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    gcc-14.1.0
powerpc               randconfig-001-20240923    clang-20
powerpc               randconfig-002-20240923    clang-20
powerpc               randconfig-003-20240923    clang-20
powerpc                     skiroot_defconfig    gcc-14.1.0
powerpc                  storcenter_defconfig    clang-20
powerpc                     stx_gp3_defconfig    clang-20
powerpc                     taishan_defconfig    gcc-14.1.0
powerpc                     tqm8560_defconfig    clang-20
powerpc                         wii_defconfig    clang-20
powerpc64                        alldefconfig    gcc-14.1.0
powerpc64             randconfig-001-20240923    clang-20
powerpc64             randconfig-002-20240923    clang-20
powerpc64             randconfig-003-20240923    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
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
sh                        edosk7705_defconfig    gcc-14.1.0
sh                        edosk7760_defconfig    clang-20
sh                          lboxre2_defconfig    gcc-14.1.0
sh                    randconfig-001-20240923    clang-20
sh                    randconfig-002-20240923    clang-20
sh                           se7721_defconfig    clang-20
sh                        sh7763rdp_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    clang-20
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                            shmin_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240923    clang-20
sparc64               randconfig-002-20240923    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                             i386_defconfig    gcc-14.1.0
um                    randconfig-001-20240923    clang-20
um                    randconfig-002-20240923    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                           alldefconfig    gcc-14.1.0
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240923    clang-18
x86_64      buildonly-randconfig-002-20240923    clang-18
x86_64      buildonly-randconfig-003-20240923    clang-18
x86_64      buildonly-randconfig-004-20240923    clang-18
x86_64      buildonly-randconfig-005-20240923    clang-18
x86_64      buildonly-randconfig-006-20240923    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240923    clang-18
x86_64                randconfig-002-20240923    clang-18
x86_64                randconfig-003-20240923    clang-18
x86_64                randconfig-004-20240923    clang-18
x86_64                randconfig-005-20240923    clang-18
x86_64                randconfig-006-20240923    clang-18
x86_64                randconfig-011-20240923    clang-18
x86_64                randconfig-012-20240923    clang-18
x86_64                randconfig-013-20240923    clang-18
x86_64                randconfig-014-20240923    clang-18
x86_64                randconfig-015-20240923    clang-18
x86_64                randconfig-016-20240923    clang-18
x86_64                randconfig-071-20240923    clang-18
x86_64                randconfig-072-20240923    clang-18
x86_64                randconfig-073-20240923    clang-18
x86_64                randconfig-074-20240923    clang-18
x86_64                randconfig-075-20240923    clang-18
x86_64                randconfig-076-20240923    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  cadence_csp_defconfig    clang-20
xtensa                randconfig-001-20240923    clang-20
xtensa                randconfig-002-20240923    clang-20
xtensa                    smp_lx200_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
