Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230A226871
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190738; cv=none; b=p2apcmg6Bi/ylbXyRwRMZopL1h8Qrj995DszREuKtXxuKOzX1+7+3e00u3X+Y9eZi+3aBsZNzH8PRQXEF+EPRoLB5icdJiy3K7IyeWdA3BQrZzdHo1gEd9bxOqc+JlGKxR+df2Ao5eKPLd0kiBnnmmohbjYr+xSBZsNAnszApPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190738; c=relaxed/simple;
	bh=dvrk8+xxgwJq3eYcVKcukJci2J7oeqRbTUJnmPoTHw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qi+RsO8RSzKtbSUIdCRgK2fSUnVZsCLNm0MpvlxbMVarHR65S7A+NRe4iFVTvdJKMWnmI+jMHS2iWkBqA43BKFfpWrrjcIEKXfDwVdQxWUAQoCMOtoPBMa7Gt4DrwnoRdIlenwlAfcOkdgf80NYN1nhYvWN9u7LfW7Zd6QWzVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3PHKh3e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3PHKh3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739190737; x=1770726737;
  h=date:from:to:cc:subject:message-id;
  bh=dvrk8+xxgwJq3eYcVKcukJci2J7oeqRbTUJnmPoTHw4=;
  b=k3PHKh3e1Xt2qqdpetxE5t3DcE95ClahbNUZ2Fe7xh8yoKzbwkzxJsyO
   aSaQu1ddFBvwper42Kaw1sLER1r43WLK6NG0CKG1E9Z4ztTMkcN8H+ebE
   ASDHuKXV1KG+7qpv+H5JiiWvBybm3pcVgcP+BvZoTajZDHeffBYKrUHRf
   SLfpAQg2DLPVkB/YI+vZgLOoqn3peZ/H4z0G02EwLJdx11AjEX+rZ++R6
   CnNKNUkG4Fq7FNs5DQzgscCjJkmyAUMwtm8iGYgHNa0C7JmxkonoE4t/b
   kJcFGTtxudVNc0ud1/rUWNGw4uw4aIWWdx/INSlY0/6xkxP9GwTjmNfkQ
   g==;
X-CSE-ConnectionGUID: DIqmg7jKR8eryBpxIAGKFA==
X-CSE-MsgGUID: revGnqqgQISk0sWJhGdxTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="38969391"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="38969391"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 04:32:15 -0800
X-CSE-ConnectionGUID: u+yRY90pSsS8tvAj+URS/w==
X-CSE-MsgGUID: /LkAEo3WRTmYBE+kFccBXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="117244513"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Feb 2025 04:32:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thSxP-0012kD-2F;
	Mon, 10 Feb 2025 12:32:11 +0000
Date: Mon, 10 Feb 2025 20:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 f9e5312b626992ae51cf9780130652c12c28db69
Message-ID: <202502102044.iXbWCBcx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: f9e5312b626992ae51cf9780130652c12c28db69  hwmon: (peci/dimmtemp) Do not provide fake thresholds data

elapsed time: 910m

configs tested: 222
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-004-20250210    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    clang-19
arm                           spitz_defconfig    gcc-14.2.0
arm                    vt8500_v6_v7_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                             alldefconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250210    clang-21
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    clang-21
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250210    gcc-12
i386                  randconfig-012-20250210    gcc-12
i386                  randconfig-013-20250210    gcc-12
i386                  randconfig-014-20250210    gcc-12
i386                  randconfig-015-20250210    gcc-12
i386                  randconfig-016-20250210    gcc-12
i386                  randconfig-017-20250210    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    clang-21
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    clang-21
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    clang-21
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    clang-21
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    clang-21
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    clang-21
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    clang-21
parisc                randconfig-002-20250210    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-17
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                      katmai_defconfig    clang-18
powerpc                      mgcoge_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc64             randconfig-001-20250210    clang-21
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    clang-21
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    clang-21
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20250210    clang-16
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-002-20250210    clang-16
riscv                 randconfig-002-20250210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250210    clang-16
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-002-20250210    clang-16
s390                  randconfig-002-20250210    clang-19
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    clang-16
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    clang-16
sh                    randconfig-002-20250210    gcc-14.2.0
sh                           se7751_defconfig    gcc-14.2.0
sh                           sh2007_defconfig    clang-21
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    clang-16
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-002-20250210    clang-16
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250210    clang-16
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-002-20250210    clang-16
sparc64               randconfig-002-20250210    gcc-14.2.0
um                               alldefconfig    clang-21
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250210    clang-16
um                    randconfig-001-20250210    clang-18
um                    randconfig-002-20250210    clang-16
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250210    clang-19
x86_64                randconfig-002-20250210    clang-19
x86_64                randconfig-003-20250210    clang-19
x86_64                randconfig-004-20250210    clang-19
x86_64                randconfig-005-20250210    clang-19
x86_64                randconfig-006-20250210    clang-19
x86_64                randconfig-007-20250210    clang-19
x86_64                randconfig-008-20250210    clang-19
x86_64                randconfig-071-20250210    gcc-12
x86_64                randconfig-072-20250210    gcc-12
x86_64                randconfig-073-20250210    gcc-12
x86_64                randconfig-074-20250210    gcc-12
x86_64                randconfig-075-20250210    gcc-12
x86_64                randconfig-076-20250210    gcc-12
x86_64                randconfig-077-20250210    gcc-12
x86_64                randconfig-078-20250210    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    clang-16
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-002-20250210    clang-16
xtensa                randconfig-002-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
