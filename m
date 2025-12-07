Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D4A21FF48
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Dec 2025 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765122124; cv=none; b=qVSKoKWs1tuXELnVGZPHRE5Jtm3VYp91eJMreH9hTQiPPDjK6z6xtD5wE/rvyHdzEViscdQfFK9ybc3u5tZ9FZMTr52QK29Kpt0PabnWHMVbb3yV1iyGUGpRPBvJzmaoGpEJKLq0UFCUQ9MOWdLY/H0Ap3eqd16hE2ugXs+XxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765122124; c=relaxed/simple;
	bh=AAM5MM6veFM5mD9zkR//TVjcrXPwSIzc0zUSROTF0Rg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HHOhLZZy5/MwWdXFOOg8kR/wuZCUACGkw67u9/C2Kjh7/1N8SVawDk6Hzn715rezIMA39UFIXcCkZuCbe9rMzuPIfTCXe2W69aObpL6SXX1yrPQ2iYIV+LrnL7V1GKJrmzLhv7RCakHhjMvinOe4FzH8ijviF3xNmEDhy2O0JVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifwRgAc4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifwRgAc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765122121; x=1796658121;
  h=date:from:to:cc:subject:message-id;
  bh=AAM5MM6veFM5mD9zkR//TVjcrXPwSIzc0zUSROTF0Rg=;
  b=ifwRgAc4EU1uO6JHpdMrWddeuMlILn0+MLwvBd9I6bBXzSELqWEXPB5n
   xzIYuWrmVkelX0PUY9eDzuCCTLlXTVBsSyrlGq5Cou7kB3bG0N2tpcfiX
   aMixsBsWNekRfieawm25bhXhzWXihq+tAmQT9T5ttbZvE/X/y9wdVjf99
   fkw3YtUrZ2oyDY6cGLMQCkECzgiaFkz6lvPX3Kjnu8qA27uKF3/JK8eO7
   EPH+BAvA8LNE5by57JQEAlVqYYjW6MTAUDWbdLJ/16gh/2hquxsHi4cH4
   gyIhnOg3AQPhj2FQwmzP3FF3MlyDyfA0giHC6jVtqesq90vmltXY8kwo+
   A==;
X-CSE-ConnectionGUID: N6vkXeS4SJ6o+bmkcMVYlw==
X-CSE-MsgGUID: /AdRhlDPT4qHi7llg5Xo3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="77702410"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="77702410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 07:42:00 -0800
X-CSE-ConnectionGUID: 94Tm7J7VRP2Q9/PRlyFf0w==
X-CSE-MsgGUID: 8G5T6dyBSdar9HRYn640ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="226727614"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Dec 2025 07:41:59 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSGtY-00000000JIX-2Wub;
	Sun, 07 Dec 2025 15:41:56 +0000
Date: Sun, 07 Dec 2025 23:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 186e66ad4161ceb4f8683bb50368129558cbc97b
Message-ID: <202512072354.76dWnTNz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 186e66ad4161ceb4f8683bb50368129558cbc97b  docs: hwmon: fix link to g762 devicetree binding

elapsed time: 1462m

configs tested: 243
configs skipped: 0

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
arc                   randconfig-001-20251207    gcc-13.4.0
arc                   randconfig-001-20251207    gcc-8.5.0
arc                   randconfig-002-20251207    gcc-8.5.0
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                       imx_v6_v7_defconfig    clang-22
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20251207    gcc-15.1.0
arm                   randconfig-001-20251207    gcc-8.5.0
arm                   randconfig-002-20251207    clang-22
arm                   randconfig-002-20251207    gcc-8.5.0
arm                   randconfig-003-20251207    gcc-8.5.0
arm                   randconfig-004-20251207    gcc-12.5.0
arm                   randconfig-004-20251207    gcc-8.5.0
arm                         s5pv210_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251207    gcc-10.5.0
arm64                 randconfig-002-20251207    gcc-10.5.0
arm64                 randconfig-003-20251207    gcc-10.5.0
arm64                 randconfig-004-20251207    gcc-10.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251207    gcc-10.5.0
csky                  randconfig-002-20251207    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251207    clang-22
hexagon               randconfig-001-20251207    gcc-14.3.0
hexagon               randconfig-002-20251207    clang-22
hexagon               randconfig-002-20251207    gcc-14.3.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251207    clang-20
i386        buildonly-randconfig-002-20251207    clang-20
i386        buildonly-randconfig-002-20251207    gcc-14
i386        buildonly-randconfig-003-20251207    clang-20
i386        buildonly-randconfig-003-20251207    gcc-14
i386        buildonly-randconfig-004-20251207    clang-20
i386        buildonly-randconfig-004-20251207    gcc-12
i386        buildonly-randconfig-005-20251207    clang-20
i386        buildonly-randconfig-006-20251207    clang-20
i386        buildonly-randconfig-006-20251207    gcc-14
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251207    clang-20
i386                  randconfig-002-20251207    clang-20
i386                  randconfig-003-20251207    clang-20
i386                  randconfig-004-20251207    clang-20
i386                  randconfig-005-20251207    clang-20
i386                  randconfig-006-20251207    clang-20
i386                  randconfig-007-20251207    clang-20
i386                  randconfig-011-20251207    gcc-13
i386                  randconfig-011-20251207    gcc-14
i386                  randconfig-012-20251207    clang-20
i386                  randconfig-012-20251207    gcc-14
i386                  randconfig-013-20251207    clang-20
i386                  randconfig-013-20251207    gcc-14
i386                  randconfig-014-20251207    gcc-14
i386                  randconfig-015-20251207    clang-20
i386                  randconfig-015-20251207    gcc-14
i386                  randconfig-016-20251207    clang-20
i386                  randconfig-016-20251207    gcc-14
i386                  randconfig-017-20251207    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251207    gcc-14.3.0
loongarch             randconfig-002-20251207    clang-18
loongarch             randconfig-002-20251207    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                           ip32_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20251207    gcc-11.5.0
nios2                 randconfig-001-20251207    gcc-14.3.0
nios2                 randconfig-002-20251207    gcc-11.5.0
nios2                 randconfig-002-20251207    gcc-14.3.0
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
parisc                randconfig-001-20251207    gcc-10.5.0
parisc                randconfig-002-20251207    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    gcc-15.1.0
powerpc                      cm5200_defconfig    clang-22
powerpc               randconfig-001-20251207    gcc-10.5.0
powerpc               randconfig-002-20251207    gcc-10.5.0
powerpc                    sam440ep_defconfig    gcc-15.1.0
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251207    gcc-10.5.0
powerpc64             randconfig-002-20251207    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251207    gcc-13.4.0
riscv                 randconfig-002-20251207    gcc-12.5.0
riscv                 randconfig-002-20251207    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251207    clang-22
s390                  randconfig-001-20251207    gcc-13.4.0
s390                  randconfig-002-20251207    clang-22
s390                  randconfig-002-20251207    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                         ecovec24_defconfig    gcc-15.1.0
sh                        edosk7760_defconfig    clang-22
sh                            hp6xx_defconfig    clang-22
sh                    randconfig-001-20251207    gcc-13.4.0
sh                    randconfig-001-20251207    gcc-14.3.0
sh                    randconfig-002-20251207    gcc-13.4.0
sh                    randconfig-002-20251207    gcc-14.3.0
sh                             shx3_defconfig    gcc-15.1.0
sh                              ul2_defconfig    clang-22
sparc                            alldefconfig    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251207    gcc-13.4.0
sparc                 randconfig-001-20251207    gcc-14
sparc                 randconfig-002-20251207    gcc-14
sparc                 randconfig-002-20251207    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251207    gcc-10.5.0
sparc64               randconfig-001-20251207    gcc-14
sparc64               randconfig-002-20251207    clang-22
sparc64               randconfig-002-20251207    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251207    clang-22
um                    randconfig-001-20251207    gcc-14
um                    randconfig-002-20251207    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251207    gcc-14
x86_64      buildonly-randconfig-002-20251207    gcc-14
x86_64      buildonly-randconfig-003-20251207    gcc-14
x86_64      buildonly-randconfig-004-20251207    gcc-14
x86_64      buildonly-randconfig-005-20251207    gcc-14
x86_64      buildonly-randconfig-006-20251207    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251207    clang-20
x86_64                randconfig-001-20251207    gcc-14
x86_64                randconfig-002-20251207    gcc-14
x86_64                randconfig-003-20251207    gcc-14
x86_64                randconfig-004-20251207    gcc-14
x86_64                randconfig-005-20251207    clang-20
x86_64                randconfig-005-20251207    gcc-14
x86_64                randconfig-006-20251207    clang-20
x86_64                randconfig-006-20251207    gcc-14
x86_64                randconfig-011-20251207    gcc-14
x86_64                randconfig-012-20251207    gcc-14
x86_64                randconfig-013-20251207    gcc-14
x86_64                randconfig-014-20251207    gcc-14
x86_64                randconfig-015-20251207    gcc-14
x86_64                randconfig-016-20251207    gcc-14
x86_64                randconfig-071-20251207    clang-20
x86_64                randconfig-071-20251207    gcc-14
x86_64                randconfig-072-20251207    gcc-14
x86_64                randconfig-073-20251207    clang-20
x86_64                randconfig-073-20251207    gcc-14
x86_64                randconfig-074-20251207    gcc-14
x86_64                randconfig-075-20251207    gcc-14
x86_64                randconfig-076-20251207    clang-20
x86_64                randconfig-076-20251207    gcc-14
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
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251207    gcc-14
xtensa                randconfig-001-20251207    gcc-8.5.0
xtensa                randconfig-002-20251207    gcc-14
xtensa                randconfig-002-20251207    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
