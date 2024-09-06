Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D115278E
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Sep 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725612128; cv=none; b=Sh/9l0UMjc68eef2rKBVcFjZzt2kvqvtiS3MXPtavXcneSQyTOykqhnOwlOIxQs0iWcfUZjJlIDQUsSCX7EA6WIPxl3sBxLwh+ywTOUOPm3ZDAATWpsHc4pgg1ptu1MS2ITDRbjWksbQi9CNS4cyQyXQpA6A/lzbzBxMUSOjHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725612128; c=relaxed/simple;
	bh=BJtXVLCahdR6+yM3Yf0bHPHWM/GrReoFsuNVT3lTSCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HfI656HO1vNgcT0+FclGLN7e5dnFRsr5kJY6WTFeMOPZTKR558pX8HWlCuT8IqQPszB1Xn35n7y9dVouNvd7H42Eih3AkFYpUdAipO1YsocAeVEf9fDdWU0Is3ewDVamEN3A6a9qokO5EszlKPcE9pEzh4LXnC9bc2VsE96j9ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDBdgiO/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDBdgiO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725612127; x=1757148127;
  h=date:from:to:cc:subject:message-id;
  bh=BJtXVLCahdR6+yM3Yf0bHPHWM/GrReoFsuNVT3lTSCY=;
  b=fDBdgiO/b/nP8Jy42w4rHfx938vFEhweORzM3L00PPFfhpUXN++2TK7z
   0b+RFokyH8YBM4iYvoTUjrvRRsg2ENEIw26xCVUJp7Xf45NX0GknIrozg
   6VBCJfg32XZCKybGU6bK4AkiY7ogFVHehlqm9f/H77cU3tHOrH8p/N6sw
   Z24PyNVTniQpxuNnZ27+uYoZzA8BLPxGxEO4jQ42U38No0tUerP1zKhuT
   jbvMDg7+1d5hc5mC8z7KD2AITQuWcxR5IKi/AoMIAAGGtzEZDzbGp4Xp4
   e1h4lu/RAfKiokM/rU18uCiVDtl/fcbCkscidyB6eFYVxmuh4dmg/Mybb
   w==;
X-CSE-ConnectionGUID: dxSXdE0FSjWbjsfplrrNtA==
X-CSE-MsgGUID: I7cv7QWIRcaSmQREh3mapg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35749756"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="35749756"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 01:41:55 -0700
X-CSE-ConnectionGUID: k8RvjuNIQLKaTFEs2t+wsA==
X-CSE-MsgGUID: UhWmc8yuSz6nOEVIUcjQyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65709981"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Sep 2024 01:41:53 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smUXO-000AsZ-2f;
	Fri, 06 Sep 2024 08:41:50 +0000
Date: Fri, 06 Sep 2024 16:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 f1f8f0dccc6f3ff9792545fce064a33efad21f4f
Message-ID: <202409061645.Z63Ahg6Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: f1f8f0dccc6f3ff9792545fce064a33efad21f4f  damon: Reduce likelyhood of overflow problems

elapsed time: 1857m

configs tested: 121
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240906   gcc-13.2.0
arc                   randconfig-002-20240906   gcc-13.2.0
arm                               allnoconfig   clang-20
arm                            hisi_defconfig   gcc-14.1.0
arm                            mmp2_defconfig   gcc-14.1.0
arm                   randconfig-001-20240906   clang-20
arm                   randconfig-002-20240906   gcc-14.1.0
arm                   randconfig-003-20240906   gcc-14.1.0
arm                   randconfig-004-20240906   gcc-14.1.0
arm                       spear13xx_defconfig   gcc-14.1.0
arm                         wpcm450_defconfig   gcc-14.1.0
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240906   clang-20
arm64                 randconfig-002-20240906   clang-17
arm64                 randconfig-003-20240906   gcc-14.1.0
arm64                 randconfig-004-20240906   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240906   gcc-14.1.0
csky                  randconfig-002-20240906   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240906   clang-20
hexagon               randconfig-002-20240906   clang-14
i386                             allmodconfig   gcc-12
i386                              allnoconfig   gcc-12
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240906   clang-18
i386         buildonly-randconfig-002-20240906   gcc-12
i386         buildonly-randconfig-003-20240906   clang-18
i386         buildonly-randconfig-004-20240906   gcc-12
i386         buildonly-randconfig-005-20240906   clang-18
i386         buildonly-randconfig-006-20240906   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240906   gcc-12
i386                  randconfig-002-20240906   clang-18
i386                  randconfig-003-20240906   gcc-12
i386                  randconfig-004-20240906   clang-18
i386                  randconfig-005-20240906   clang-18
i386                  randconfig-006-20240906   gcc-12
i386                  randconfig-011-20240906   gcc-12
i386                  randconfig-012-20240906   clang-18
i386                  randconfig-013-20240906   gcc-12
i386                  randconfig-014-20240906   gcc-12
i386                  randconfig-015-20240906   gcc-12
i386                  randconfig-016-20240906   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240906   gcc-14.1.0
loongarch             randconfig-002-20240906   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          multi_defconfig   gcc-14.1.0
m68k                           virt_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240906   gcc-14.1.0
nios2                 randconfig-002-20240906   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-14.1.0
parisc                randconfig-001-20240906   gcc-14.1.0
parisc                randconfig-002-20240906   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                 canyonlands_defconfig   clang-20
powerpc                      mgcoge_defconfig   clang-20
powerpc               randconfig-001-20240906   clang-17
powerpc               randconfig-002-20240906   gcc-14.1.0
powerpc               randconfig-003-20240906   clang-15
powerpc64             randconfig-001-20240906   clang-20
powerpc64             randconfig-002-20240906   clang-15
powerpc64             randconfig-003-20240906   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240906   gcc-14.1.0
riscv                 randconfig-002-20240906   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240906   clang-20
s390                  randconfig-002-20240906   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                     magicpanelr2_defconfig   gcc-14.1.0
sh                    randconfig-001-20240906   gcc-14.1.0
sh                    randconfig-002-20240906   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240906   gcc-14.1.0
sparc64               randconfig-002-20240906   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240906   clang-20
um                    randconfig-002-20240906   clang-20
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                generic_kc705_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240906   gcc-14.1.0
xtensa                randconfig-002-20240906   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
