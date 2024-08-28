Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3049641
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Aug 2024 05:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724823524; cv=none; b=UrBBHLBD7jXrkAkCwmBn7MmuvfyV5pzLE9M5R/tXV0jPKbHHr3OdvZD7iTJKwwpuc43ArlMeMoQvPztwvAzZvXJVUqJJyqWD7leDPtsvp7sVkBIBwfmY45Jwe1awLeqr5K4B8dVcHNNTiE6biM8ZgoJPZORRsLUf+R4EoJaB9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724823524; c=relaxed/simple;
	bh=AxOBEJ4qVXHL+zo5z+kMx/3krGYlv3gyTQiq3HgQRC4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P2wpx2VWHdL38iY1oqUj8SRiemT/igi3IIHMXOJJzUCsQZleJ7H4mgbhTttabm6Kr658wf02sbv/3KkzWiV+9A6WrNS0UYfx/MHHLVU5lJJofpfcxFy5Nvod9L4QLUtLQ+FOsgeXRH6xqiRVvXZiYgqZIfdJuBYD8xnckPwhNB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WA9pXC6O; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WA9pXC6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724823522; x=1756359522;
  h=date:from:to:cc:subject:message-id;
  bh=AxOBEJ4qVXHL+zo5z+kMx/3krGYlv3gyTQiq3HgQRC4=;
  b=WA9pXC6OaYOu3bnsDt33Z2tCKNrTD6JY7kkexhM+y3jwjiesEO3HCu+9
   18jKDVaqxJL4zC2ZbOQb3Lw0/w4IBWnunTNA9t/IvP1mCvvGAINdULe/p
   iMtacgzFj03oA21ZnEbIMvJ04mP04108/fLimOFkzPB0lHQIq62x17tiE
   QRtLcdOoKd/14aQt6CgqTJINKTyPQfNcZ1OztJRDOQzGhZyXvigCXaCDT
   kU3ODHKHa77xUinMdDiI+ngwq6qD0PAvFaoa3McaE/3d/ruOyHBCQ7yq8
   oLslNYklr4rFQvwnTP2vQamR5FTPbDtscjcEl+t96VGgLsEARaf0lq150
   g==;
X-CSE-ConnectionGUID: PfhMnUGsSqaCK4oLlgbR5A==
X-CSE-MsgGUID: UX9L6eyhS6a55oDPDN0flw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48719222"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="48719222"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 22:38:41 -0700
X-CSE-ConnectionGUID: 9Wz3hETmQe6vW4OMYdEiTg==
X-CSE-MsgGUID: om/SlFDQRuK5IRtOpJKUKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63810022"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2024 22:38:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjBO9-000KWU-2W;
	Wed, 28 Aug 2024 05:38:37 +0000
Date: Wed, 28 Aug 2024 13:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 7bbc079531fc38d401e1c4088d4981435a8828e3
Message-ID: <202408281337.fLVT4vky-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 7bbc079531fc38d401e1c4088d4981435a8828e3  hwmon: (pt5161l) Fix invalid temperature reading

elapsed time: 1468m

configs tested: 251
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240828   gcc-13.2.0
arc                   randconfig-002-20240828   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                            mmp2_defconfig   gcc-13.2.0
arm                   randconfig-001-20240828   gcc-13.2.0
arm                   randconfig-001-20240828   gcc-14.1.0
arm                   randconfig-002-20240828   clang-20
arm                   randconfig-002-20240828   gcc-13.2.0
arm                   randconfig-003-20240828   gcc-13.2.0
arm                   randconfig-003-20240828   gcc-14.1.0
arm                   randconfig-004-20240828   clang-20
arm                   randconfig-004-20240828   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240828   clang-17
arm64                 randconfig-001-20240828   gcc-13.2.0
arm64                 randconfig-002-20240828   clang-20
arm64                 randconfig-002-20240828   gcc-13.2.0
arm64                 randconfig-003-20240828   clang-15
arm64                 randconfig-003-20240828   gcc-13.2.0
arm64                 randconfig-004-20240828   clang-15
arm64                 randconfig-004-20240828   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240828   gcc-13.2.0
csky                  randconfig-001-20240828   gcc-14.1.0
csky                  randconfig-002-20240828   gcc-13.2.0
csky                  randconfig-002-20240828   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240828   clang-20
hexagon               randconfig-002-20240828   clang-16
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240827   gcc-12
i386         buildonly-randconfig-001-20240828   gcc-12
i386         buildonly-randconfig-002-20240827   clang-18
i386         buildonly-randconfig-002-20240828   gcc-12
i386         buildonly-randconfig-003-20240827   gcc-12
i386         buildonly-randconfig-003-20240828   gcc-12
i386         buildonly-randconfig-004-20240827   clang-18
i386         buildonly-randconfig-004-20240828   gcc-12
i386         buildonly-randconfig-005-20240827   clang-18
i386         buildonly-randconfig-005-20240828   gcc-12
i386         buildonly-randconfig-006-20240827   gcc-12
i386         buildonly-randconfig-006-20240828   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240827   gcc-12
i386                  randconfig-001-20240828   gcc-12
i386                  randconfig-002-20240827   gcc-12
i386                  randconfig-002-20240828   gcc-12
i386                  randconfig-003-20240827   gcc-12
i386                  randconfig-003-20240828   gcc-12
i386                  randconfig-004-20240827   gcc-12
i386                  randconfig-004-20240828   gcc-12
i386                  randconfig-005-20240827   gcc-12
i386                  randconfig-005-20240828   gcc-12
i386                  randconfig-006-20240827   clang-18
i386                  randconfig-006-20240828   gcc-12
i386                  randconfig-011-20240827   clang-18
i386                  randconfig-011-20240828   gcc-12
i386                  randconfig-012-20240827   clang-18
i386                  randconfig-012-20240828   gcc-12
i386                  randconfig-013-20240827   clang-18
i386                  randconfig-013-20240828   gcc-12
i386                  randconfig-014-20240827   gcc-12
i386                  randconfig-014-20240828   gcc-12
i386                  randconfig-015-20240827   gcc-12
i386                  randconfig-015-20240828   gcc-12
i386                  randconfig-016-20240827   clang-18
i386                  randconfig-016-20240828   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240828   gcc-13.2.0
loongarch             randconfig-001-20240828   gcc-14.1.0
loongarch             randconfig-002-20240828   gcc-13.2.0
loongarch             randconfig-002-20240828   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                     cu1000-neo_defconfig   gcc-13.2.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240828   gcc-13.2.0
nios2                 randconfig-001-20240828   gcc-14.1.0
nios2                 randconfig-002-20240828   gcc-13.2.0
nios2                 randconfig-002-20240828   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240828   gcc-13.2.0
parisc                randconfig-001-20240828   gcc-14.1.0
parisc                randconfig-002-20240828   gcc-13.2.0
parisc                randconfig-002-20240828   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc               randconfig-003-20240828   gcc-13.2.0
powerpc               randconfig-003-20240828   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240828   gcc-13.2.0
powerpc64             randconfig-001-20240828   gcc-14.1.0
powerpc64             randconfig-002-20240828   gcc-13.2.0
powerpc64             randconfig-002-20240828   gcc-14.1.0
powerpc64             randconfig-003-20240828   clang-20
powerpc64             randconfig-003-20240828   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240828   gcc-13.2.0
riscv                 randconfig-001-20240828   gcc-14.1.0
riscv                 randconfig-002-20240828   gcc-13.2.0
riscv                 randconfig-002-20240828   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240828   gcc-13.2.0
s390                  randconfig-001-20240828   gcc-14.1.0
s390                  randconfig-002-20240828   gcc-13.2.0
s390                  randconfig-002-20240828   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                            migor_defconfig   gcc-13.2.0
sh                    randconfig-001-20240828   gcc-13.2.0
sh                    randconfig-001-20240828   gcc-14.1.0
sh                    randconfig-002-20240828   gcc-13.2.0
sh                    randconfig-002-20240828   gcc-14.1.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                           se7712_defconfig   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sh                             shx3_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240828   gcc-13.2.0
sparc64               randconfig-001-20240828   gcc-14.1.0
sparc64               randconfig-002-20240828   gcc-13.2.0
sparc64               randconfig-002-20240828   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240828   clang-15
um                    randconfig-001-20240828   gcc-13.2.0
um                    randconfig-002-20240828   clang-20
um                    randconfig-002-20240828   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240828   clang-18
x86_64       buildonly-randconfig-002-20240828   clang-18
x86_64       buildonly-randconfig-003-20240828   clang-18
x86_64       buildonly-randconfig-003-20240828   gcc-12
x86_64       buildonly-randconfig-004-20240828   clang-18
x86_64       buildonly-randconfig-005-20240828   clang-18
x86_64       buildonly-randconfig-005-20240828   gcc-11
x86_64       buildonly-randconfig-006-20240828   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240828   clang-18
x86_64                randconfig-001-20240828   gcc-12
x86_64                randconfig-002-20240828   clang-18
x86_64                randconfig-003-20240828   clang-18
x86_64                randconfig-003-20240828   gcc-12
x86_64                randconfig-004-20240828   clang-18
x86_64                randconfig-005-20240828   clang-18
x86_64                randconfig-006-20240828   clang-18
x86_64                randconfig-006-20240828   gcc-12
x86_64                randconfig-011-20240828   clang-18
x86_64                randconfig-012-20240828   clang-18
x86_64                randconfig-013-20240828   clang-18
x86_64                randconfig-014-20240828   clang-18
x86_64                randconfig-015-20240828   clang-18
x86_64                randconfig-015-20240828   gcc-12
x86_64                randconfig-016-20240828   clang-18
x86_64                randconfig-016-20240828   gcc-12
x86_64                randconfig-071-20240828   clang-18
x86_64                randconfig-071-20240828   gcc-12
x86_64                randconfig-072-20240828   clang-18
x86_64                randconfig-072-20240828   gcc-12
x86_64                randconfig-073-20240828   clang-18
x86_64                randconfig-073-20240828   gcc-12
x86_64                randconfig-074-20240828   clang-18
x86_64                randconfig-074-20240828   gcc-12
x86_64                randconfig-075-20240828   clang-18
x86_64                randconfig-075-20240828   gcc-12
x86_64                randconfig-076-20240828   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240828   gcc-13.2.0
xtensa                randconfig-001-20240828   gcc-14.1.0
xtensa                randconfig-002-20240828   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
