Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF7111AA
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Aug 2024 02:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723516562; cv=none; b=TSC70Sb0G/3D3u605Y/MRsO1sboUorYEiNUzFNWCo9ICRLckMBgwWd5mvR9eD9Tc16fHzwhARXtWBUpHki6hVCRZiWMtlUiugVHwnNnMRe5FAXRy1u6Ux0wp3hjB255aWsqO1SD5t/AvRlwJNmikbYPRSOUjJlZ3pZ9cdjkxrBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723516562; c=relaxed/simple;
	bh=932MaIZiTRp2Oe5VDSasaIh1wdcOkLs77Gq7gFTGYrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s0/yJBGzZFW90KUwXPYURUjeIiQ5dvOaUcVM8lFiBZFk1vrvzliSS3XuCBKv/BwXQ4XuglvmgsdkhPGwJlIjIj4Op8Eu+PZRFS4r5Tka5OGHn2loWMTBnasbdci1Q36EDIHx53nOMBtZIZGCuv61PWKqZOPC90iMSinAptZs6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4qqeeU6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4qqeeU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723516561; x=1755052561;
  h=date:from:to:cc:subject:message-id;
  bh=932MaIZiTRp2Oe5VDSasaIh1wdcOkLs77Gq7gFTGYrc=;
  b=C4qqeeU6YdxH0njrO+dtxCdHeUtwUm+UL3sgHJL6YpZnhyAxwzP2nuBK
   ERmZCduABi+rAeSb9ILrbiUO9Ym82Ekhz+Dn/RI5GOcgL5X7ro2X1EY7G
   5GzdQU5oWKcuIq/QCe2wzlYSPt6zFnYK2/JxCT3I2GE1i1iH4tiWHz03F
   6OlvC4A0PWAjdHuXpgWNQwkpcMLhtWz1a73Ge8YD3IExwXirYE3JPFqe7
   9OiVbNqDY5Vo+zkM3zgDK6XvCs0S1+Wqhn23l1S13tCR3AR42w6y5nquW
   WkQ74aPOa6ejXUNdzFGhL/7/MMzDEXYE3bNYmCEXOPDEqqDr58UFL05hS
   g==;
X-CSE-ConnectionGUID: XTYtnSQsS4iEx2FT4jNI4Q==
X-CSE-MsgGUID: CciahaudQ86b/9gB00WNWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32336005"
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="32336005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 19:36:00 -0700
X-CSE-ConnectionGUID: vzeuS1bgSDqYYtecGfqHVg==
X-CSE-MsgGUID: vqiF5tE5S9aGsCwE3H6LTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,284,1716274800"; 
   d="scan'208";a="89173708"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Aug 2024 19:35:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdhO8-00002U-1M;
	Tue, 13 Aug 2024 02:35:56 +0000
Date: Tue, 13 Aug 2024 10:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a997ebc18b6fa56d47bbbfc3fd6904b7306e8645
Message-ID: <202408131050.JEpdaIP2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a997ebc18b6fa56d47bbbfc3fd6904b7306e8645  hwmon: (lm92) Update documentation

elapsed time: 742m

configs tested: 218
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240813   gcc-13.2.0
arc                   randconfig-002-20240813   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                   randconfig-001-20240813   gcc-14.1.0
arm                   randconfig-002-20240813   gcc-14.1.0
arm                   randconfig-003-20240813   gcc-14.1.0
arm                   randconfig-004-20240813   gcc-14.1.0
arm                           sama5_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240813   gcc-14.1.0
arm64                 randconfig-002-20240813   gcc-14.1.0
arm64                 randconfig-003-20240813   clang-20
arm64                 randconfig-004-20240813   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240813   gcc-14.1.0
csky                  randconfig-002-20240813   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240813   clang-20
hexagon               randconfig-002-20240813   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240813   gcc-12
i386         buildonly-randconfig-002-20240813   gcc-12
i386         buildonly-randconfig-003-20240813   gcc-12
i386         buildonly-randconfig-004-20240813   gcc-11
i386         buildonly-randconfig-004-20240813   gcc-12
i386         buildonly-randconfig-005-20240813   clang-18
i386         buildonly-randconfig-005-20240813   gcc-12
i386         buildonly-randconfig-006-20240813   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240813   gcc-12
i386                  randconfig-002-20240813   clang-18
i386                  randconfig-002-20240813   gcc-12
i386                  randconfig-003-20240813   gcc-12
i386                  randconfig-004-20240813   gcc-12
i386                  randconfig-005-20240813   clang-18
i386                  randconfig-005-20240813   gcc-12
i386                  randconfig-006-20240813   clang-18
i386                  randconfig-006-20240813   gcc-12
i386                  randconfig-011-20240813   gcc-12
i386                  randconfig-012-20240813   gcc-12
i386                  randconfig-013-20240813   clang-18
i386                  randconfig-013-20240813   gcc-12
i386                  randconfig-014-20240813   clang-18
i386                  randconfig-014-20240813   gcc-12
i386                  randconfig-015-20240813   clang-18
i386                  randconfig-015-20240813   gcc-12
i386                  randconfig-016-20240813   clang-18
i386                  randconfig-016-20240813   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240813   gcc-14.1.0
loongarch             randconfig-002-20240813   gcc-14.1.0
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
microblaze                      mmu_defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                         db1xxx_defconfig   gcc-14.1.0
mips                           gcw0_defconfig   gcc-14.1.0
mips                         rt305x_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240813   gcc-14.1.0
nios2                 randconfig-002-20240813   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240813   gcc-14.1.0
parisc                randconfig-002-20240813   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     ksi8560_defconfig   gcc-14.1.0
powerpc                      ppc6xx_defconfig   gcc-14.1.0
powerpc               randconfig-002-20240813   gcc-14.1.0
powerpc               randconfig-003-20240813   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240813   gcc-14.1.0
powerpc64             randconfig-002-20240813   gcc-14.1.0
powerpc64             randconfig-003-20240813   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240813   gcc-14.1.0
riscv                 randconfig-002-20240813   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240813   clang-20
s390                  randconfig-002-20240813   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240813   gcc-14.1.0
sh                    randconfig-002-20240813   gcc-14.1.0
sh                          rsk7203_defconfig   gcc-14.1.0
sh                           se7724_defconfig   gcc-14.1.0
sh                   secureedge5410_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240813   gcc-14.1.0
sparc64               randconfig-002-20240813   gcc-14.1.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240813   gcc-12
um                    randconfig-002-20240813   clang-14
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240813   clang-18
x86_64       buildonly-randconfig-002-20240813   clang-18
x86_64       buildonly-randconfig-002-20240813   gcc-11
x86_64       buildonly-randconfig-003-20240813   clang-18
x86_64       buildonly-randconfig-004-20240813   clang-18
x86_64       buildonly-randconfig-004-20240813   gcc-12
x86_64       buildonly-randconfig-005-20240813   clang-18
x86_64       buildonly-randconfig-005-20240813   gcc-12
x86_64       buildonly-randconfig-006-20240813   clang-18
x86_64       buildonly-randconfig-006-20240813   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240813   clang-18
x86_64                randconfig-001-20240813   gcc-12
x86_64                randconfig-002-20240813   clang-18
x86_64                randconfig-003-20240813   clang-18
x86_64                randconfig-003-20240813   gcc-12
x86_64                randconfig-004-20240813   clang-18
x86_64                randconfig-004-20240813   gcc-12
x86_64                randconfig-005-20240813   clang-18
x86_64                randconfig-005-20240813   gcc-12
x86_64                randconfig-006-20240813   clang-18
x86_64                randconfig-011-20240813   clang-18
x86_64                randconfig-011-20240813   gcc-12
x86_64                randconfig-012-20240813   clang-18
x86_64                randconfig-012-20240813   gcc-12
x86_64                randconfig-013-20240813   clang-18
x86_64                randconfig-013-20240813   gcc-12
x86_64                randconfig-014-20240813   clang-18
x86_64                randconfig-014-20240813   gcc-11
x86_64                randconfig-015-20240813   clang-18
x86_64                randconfig-015-20240813   gcc-11
x86_64                randconfig-016-20240813   clang-18
x86_64                randconfig-016-20240813   gcc-12
x86_64                randconfig-071-20240813   clang-18
x86_64                randconfig-072-20240813   clang-18
x86_64                randconfig-073-20240813   clang-18
x86_64                randconfig-073-20240813   gcc-11
x86_64                randconfig-074-20240813   clang-18
x86_64                randconfig-074-20240813   gcc-12
x86_64                randconfig-075-20240813   clang-18
x86_64                randconfig-075-20240813   gcc-12
x86_64                randconfig-076-20240813   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                           alldefconfig   gcc-14.1.0
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240813   gcc-14.1.0
xtensa                randconfig-002-20240813   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
