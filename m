Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5B820127D
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Jul 2025 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753702315; cv=none; b=dyAqdZsXjnRPmgqjWe10K8ZeaDQXgS2x/uQSyavp82qNIDX2lW6e183si/mArosdisuOBZLr6I7jOMCYpw32u08fxABFk7dfghJeg9BmOf9I0efalZjcNp1zN07HS6APBcQ0cADqltit8FBhFQY7lcZgpNtg3VvAB7ThIrV80VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753702315; c=relaxed/simple;
	bh=Yj6J/W+Ornes++OSo3dhFL1nAtLFIBuc98KP3ZsAO7k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ikpVIOE2pHFXNjFc1DOjer79GK7NLIJNgfydj55mZbc0l/iP5j8/ygppnbKbISXu3XzFk4HrzA99tHt0bz5JZvAVmGhShmCFIeQGtf8aUFD8p64d5+66z6USPvKqx8+c47G6F8dZVMvYa8sFRZER7LxV0EWvkcW1trw0tWY5LFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb9aTobM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb9aTobM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753702313; x=1785238313;
  h=date:from:to:cc:subject:message-id;
  bh=Yj6J/W+Ornes++OSo3dhFL1nAtLFIBuc98KP3ZsAO7k=;
  b=hb9aTobMxnl83z6rgCheBtcKnOjN6ssQsV9VoeszKn8rTi1SmI6M0iLR
   CNvj71KlEBqzKPB3tl0j0OWKY3chgv2r1Tc9bTdmBZ00nnUlmiGLAn5qc
   hEt+odJuVnP6+Qjg18hRQHirYZqmGqtDdynFvGJPtMumeZNjkqdlq0P2u
   1FSI5orjkCDt/kMu5YtlklrRWSp1qoNJHjAJmUA8dkxcr6BWFk5FttPlC
   Fl2C/wMr72hrlzcuEO8IMfZ9kwGgmdPkebE3JOQiA6e2IIomUdG1vudQ5
   1pGQSEhoSnDafHUe7Pzby34Kf51Qtq2hky3LWA3aY+Hbug6OIoUUzmB73
   A==;
X-CSE-ConnectionGUID: XzQJ119IREqI2ptO2fkQeg==
X-CSE-MsgGUID: lZLf4G1uRK+8+N+kwcHOow==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55803448"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55803448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 04:31:53 -0700
X-CSE-ConnectionGUID: IlaNUqv4QM+hMm424TQRQQ==
X-CSE-MsgGUID: tYebIKfqTxOeXN5+04k6Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162752686"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jul 2025 04:31:51 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugM57-0000Qp-0z;
	Mon, 28 Jul 2025 11:31:49 +0000
Date: Mon, 28 Jul 2025 19:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 de1fffd88600c5ee1c095c84b86484cd0329a9e8
Message-ID: <202507281913.9HkRQXjL-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: de1fffd88600c5ee1c095c84b86484cd0329a9e8  dt-bindings: hwmon: Replace bouncing Alexandru Tachici emails

elapsed time: 725m

configs tested: 136
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250728    gcc-13.4.0
arc                   randconfig-002-20250728    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                      integrator_defconfig    clang-22
arm                        mvebu_v7_defconfig    clang-22
arm                         nhk8815_defconfig    clang-22
arm                   randconfig-001-20250728    clang-22
arm                   randconfig-002-20250728    clang-22
arm                   randconfig-003-20250728    clang-22
arm                   randconfig-004-20250728    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250728    clang-22
arm64                 randconfig-002-20250728    clang-20
arm64                 randconfig-003-20250728    gcc-11.5.0
arm64                 randconfig-004-20250728    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250728    gcc-10.5.0
csky                  randconfig-002-20250728    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250728    clang-22
hexagon               randconfig-002-20250728    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250728    gcc-12
i386        buildonly-randconfig-002-20250728    gcc-12
i386        buildonly-randconfig-003-20250728    gcc-12
i386        buildonly-randconfig-004-20250728    clang-20
i386        buildonly-randconfig-005-20250728    gcc-12
i386        buildonly-randconfig-006-20250728    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250728    clang-22
loongarch             randconfig-002-20250728    clang-20
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                          multi_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250728    gcc-11.5.0
nios2                 randconfig-002-20250728    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           alldefconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250728    gcc-9.5.0
parisc                randconfig-002-20250728    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250728    gcc-10.5.0
powerpc               randconfig-002-20250728    gcc-13.4.0
powerpc               randconfig-003-20250728    gcc-8.5.0
powerpc64             randconfig-001-20250728    clang-22
powerpc64             randconfig-002-20250728    clang-22
powerpc64             randconfig-003-20250728    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250728    clang-22
riscv                 randconfig-002-20250728    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250728    clang-22
s390                  randconfig-002-20250728    clang-17
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                        apsh4ad0a_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250728    gcc-14.3.0
sh                    randconfig-002-20250728    gcc-9.5.0
sh                             shx3_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250728    gcc-8.5.0
sparc                 randconfig-002-20250728    gcc-14.3.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250728    clang-20
sparc64               randconfig-002-20250728    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250728    clang-22
um                    randconfig-002-20250728    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250728    clang-20
x86_64      buildonly-randconfig-002-20250728    clang-20
x86_64      buildonly-randconfig-003-20250728    clang-20
x86_64      buildonly-randconfig-004-20250728    clang-20
x86_64      buildonly-randconfig-005-20250728    clang-20
x86_64      buildonly-randconfig-006-20250728    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250728    gcc-8.5.0
xtensa                randconfig-002-20250728    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
