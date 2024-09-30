Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC2223D2
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Sep 2024 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727706662; cv=none; b=MPAxUa3zedGxUTwjdP3+AKdm/hSC0D/ik0QMa/GaaaZ6ua2KX39nx9uW5ElLiLSOAlcfTjUfCJuWiql2oW7SxKoLThFfaXj4Hsj4XxLCulbpnaOhHA6iXf78aINfJM2P3lyePgP34B50C1s7sv9Tuuvpb3iZC3TPhbE+N0yDMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727706662; c=relaxed/simple;
	bh=jO5mH30H7HMUIHWMq/E1XUanqJJJz4mGm3z/LcDmX44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJxW2eHRKliTvN2wjZzqoJ7E2Yu6sMNZ7kiXh+B4d5o4h9EQIW+0ofH7i12mzdTuSK+txpDOsOffHoXYYMojd64XFNVu6tFKkMKJnDOtErsc07fjRhqEBBxKw0qMCJ/rhIaYK9WH62jbSlwx4IJZIJIKID/nfoKsEGYYSnkoj+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdeQluQY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdeQluQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727706661; x=1759242661;
  h=date:from:to:cc:subject:message-id;
  bh=jO5mH30H7HMUIHWMq/E1XUanqJJJz4mGm3z/LcDmX44=;
  b=gdeQluQYZZ638dDk8cnx8J8Gf7HRm+4yI0nP1mqPnBdyfrBgesqerYjv
   x0KbwWN2HqZ7GUQg/8a3RHzcT13IrD2LgiaHl+7MKkN2MsSAsZ+a1M4Sw
   ewW+hFw9NMKok8ROZVk4yv88uqH98m/pLrOCiV4b1fG5q8OSOT6ueKw8u
   tJhEQnrQINsT9Nsn5gceZoK1RkKTsk0JWUuISjhcN2vV0ugB3GTlg5OLD
   vKu1caeBaW8B8VkjtM2+Uw4Du9YffiewfY3ErZ+6KEW66NIIEem9orFsn
   mGdjkNjXusSoc5BWAKlexXmDMiMsPxXT/WX/z+ZpCi7LpH/lJoITEAH63
   A==;
X-CSE-ConnectionGUID: eV3kRamKSvaTrr/yTzvxTg==
X-CSE-MsgGUID: IOFceaE4Qv6i6StK/3EKeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26923635"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="26923635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 07:30:17 -0700
X-CSE-ConnectionGUID: EECxN7EdS9aP0oYoyrZdsQ==
X-CSE-MsgGUID: e0yL7eb4QNymyNL6Lmw8zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="72904516"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 07:30:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svHPh-000PXc-27;
	Mon, 30 Sep 2024 14:30:13 +0000
Date: Mon, 30 Sep 2024 22:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 de61d0898fa148b50f3dae41481096f4e60a0a66
Message-ID: <202409302258.1wGJk24b-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: de61d0898fa148b50f3dae41481096f4e60a0a66  hwmon: (amc6821) add support for tsd,mule

elapsed time: 844m

configs tested: 165
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    clang-20
arc                           tb10x_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                        realview_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240930    clang-18
i386        buildonly-randconfig-001-20240930    gcc-12
i386        buildonly-randconfig-002-20240930    clang-18
i386        buildonly-randconfig-003-20240930    clang-18
i386        buildonly-randconfig-004-20240930    clang-18
i386        buildonly-randconfig-004-20240930    gcc-12
i386        buildonly-randconfig-005-20240930    clang-18
i386        buildonly-randconfig-006-20240930    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240930    clang-18
i386                  randconfig-002-20240930    clang-18
i386                  randconfig-003-20240930    clang-18
i386                  randconfig-003-20240930    gcc-12
i386                  randconfig-004-20240930    clang-18
i386                  randconfig-005-20240930    clang-18
i386                  randconfig-006-20240930    clang-18
i386                  randconfig-011-20240930    clang-18
i386                  randconfig-012-20240930    clang-18
i386                  randconfig-013-20240930    clang-18
i386                  randconfig-013-20240930    gcc-12
i386                  randconfig-014-20240930    clang-18
i386                  randconfig-014-20240930    gcc-12
i386                  randconfig-015-20240930    clang-18
i386                  randconfig-016-20240930    clang-18
i386                  randconfig-016-20240930    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                            q40_defconfig    clang-15
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    clang-20
mips                     decstation_defconfig    clang-15
mips                        omega2p_defconfig    clang-15
mips                        vocore2_defconfig    clang-15
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                   bluestone_defconfig    clang-20
powerpc                 canyonlands_defconfig    clang-15
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-15
powerpc                  iss476-smp_defconfig    clang-15
powerpc                      katmai_defconfig    clang-15
powerpc                   lite5200b_defconfig    clang-15
powerpc                      tqm8xx_defconfig    clang-15
powerpc                        warp_defconfig    clang-15
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                            hp6xx_defconfig    clang-20
sh                          r7780mp_defconfig    clang-15
sh                          rsk7201_defconfig    clang-15
sh                           se7619_defconfig    clang-20
sh                           se7724_defconfig    clang-15
sparc                            allmodconfig    gcc-14.1.0
sparc64                          alldefconfig    clang-15
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240930    gcc-12
x86_64      buildonly-randconfig-002-20240930    clang-18
x86_64      buildonly-randconfig-003-20240930    gcc-12
x86_64      buildonly-randconfig-004-20240930    gcc-12
x86_64      buildonly-randconfig-005-20240930    clang-18
x86_64      buildonly-randconfig-006-20240930    gcc-12
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                randconfig-001-20240930    gcc-12
x86_64                randconfig-002-20240930    clang-18
x86_64                randconfig-003-20240930    clang-18
x86_64                randconfig-004-20240930    clang-18
x86_64                randconfig-005-20240930    gcc-12
x86_64                randconfig-006-20240930    clang-18
x86_64                randconfig-011-20240930    clang-18
x86_64                randconfig-012-20240930    gcc-11
x86_64                randconfig-013-20240930    gcc-11
x86_64                randconfig-014-20240930    gcc-12
x86_64                randconfig-015-20240930    clang-18
x86_64                randconfig-016-20240930    clang-18
x86_64                randconfig-072-20240930    gcc-12
x86_64                randconfig-073-20240930    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    clang-15

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
