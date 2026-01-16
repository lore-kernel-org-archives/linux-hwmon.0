Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2748225775
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 05:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768541202; cv=none; b=gkcd3WZ9/R0PihnqpnLEroLQT8xhvj7wn06nkQFLvHFfQok5kamPeImj/nihE3oQEIyqN2KI/41JCosScCqkbHy37BHcWvJ2FwW/invMmnjceJjJPOIQen4hcVm8bkezEJcGcxEh6WhMIyvU8+2cXu89lzQ2GaGF3zpD07rYN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768541202; c=relaxed/simple;
	bh=UePtfXxOcvHk72JhxsatUYOu+9H+USmpOzR5zXl0L6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dyYZYlgAkqRIo5IPj1iHbgMxGx4MVVgYt7d+hrSEIeIkUQmiBM8GGLUpLIwlahwPnLSrg2mTw35GguVb4R6+MJpsxSZ62AcqIQf29OfGnr5E8/jaLb2H5Inc/blkeChVUvkxussJx8LxddilZu/e2+M9AmKhchj4Y4eaL5puLwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cp+jrm93; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cp+jrm93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768541201; x=1800077201;
  h=date:from:to:cc:subject:message-id;
  bh=UePtfXxOcvHk72JhxsatUYOu+9H+USmpOzR5zXl0L6M=;
  b=cp+jrm93KxI+JN2ZjYpQwhP1/EuOKQL2YsBfGPxdUTGxjb6eYodPTiNh
   jFTSW/KQrPqV0lu2thBNCkk+hiXHPK291XteelD0+77UhFdYKCOPALXNU
   bbMTnN6YjgBMFquvW3pkP4bdwbZvX6qbMP/GomM7MTHeRaNUMUxYuauwQ
   /f5Z8e8x4DBmPp6QEVCa6GpsfeJQAxAuhRiWTta7zaqWMQUVAx9b24pDH
   VihoU9P6vNqH0IgdeqKqboUylJJMnIglmHinfshbWyRIHsh+AT7OJtzZE
   Ya5Y763xoo4AmFuymhMmSkbWZhvq5rjAH0TLrXHjoXr5ikmbC/lWxV+Xn
   g==;
X-CSE-ConnectionGUID: OEXKh4zOS7C0l9PBKdLvXA==
X-CSE-MsgGUID: yZxUhovMSZK9XZ34U1Y+EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69946715"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69946715"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 21:26:40 -0800
X-CSE-ConnectionGUID: 8pmEIKRFS8KiLbl9f2g3iA==
X-CSE-MsgGUID: DEWbXyYWT4OulQg+krU4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="205207868"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jan 2026 21:26:39 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgcM0-00000000KPk-26aY;
	Fri, 16 Jan 2026 05:26:36 +0000
Date: Fri, 16 Jan 2026 13:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 e59f0a584366b775e1dee39e183d8b37e6c0443d
Message-ID: <202601161353.SEYaoVmk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: e59f0a584366b775e1dee39e183d8b37e6c0443d  hwmon: (nct7363) Fix a resource leak in nct7363_present_pwm_fanin

elapsed time: 733m

configs tested: 198
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                        nsimosci_defconfig    gcc-15.2.0
arc                   randconfig-001-20260116    gcc-8.5.0
arc                   randconfig-002-20260116    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            dove_defconfig    gcc-15.2.0
arm                       imx_v4_v5_defconfig    clang-22
arm                             mxs_defconfig    gcc-15.2.0
arm                   randconfig-001-20260116    gcc-8.5.0
arm                   randconfig-002-20260116    gcc-8.5.0
arm                   randconfig-003-20260116    gcc-8.5.0
arm                   randconfig-004-20260116    gcc-8.5.0
arm                        shmobile_defconfig    gcc-15.2.0
arm                       spear13xx_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260116    clang-22
arm64                 randconfig-002-20260116    clang-22
arm64                 randconfig-003-20260116    clang-22
arm64                 randconfig-004-20260116    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260116    clang-22
csky                  randconfig-002-20260116    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260116    clang-20
hexagon               randconfig-002-20260116    clang-20
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260116    gcc-12
i386        buildonly-randconfig-002-20260116    gcc-12
i386        buildonly-randconfig-003-20260116    gcc-12
i386        buildonly-randconfig-004-20260116    gcc-12
i386        buildonly-randconfig-005-20260116    gcc-12
i386        buildonly-randconfig-006-20260116    gcc-12
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260116    clang-20
i386                  randconfig-002-20260116    clang-20
i386                  randconfig-003-20260116    clang-20
i386                  randconfig-004-20260116    clang-20
i386                  randconfig-005-20260116    clang-20
i386                  randconfig-006-20260116    clang-20
i386                  randconfig-007-20260116    clang-20
i386                  randconfig-011-20260116    clang-20
i386                  randconfig-012-20260116    clang-20
i386                  randconfig-013-20260116    clang-20
i386                  randconfig-014-20260116    clang-20
i386                  randconfig-015-20260116    clang-20
i386                  randconfig-016-20260116    clang-20
i386                  randconfig-017-20260116    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260116    clang-20
loongarch             randconfig-002-20260116    clang-20
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    clang-22
m68k                        mvme147_defconfig    gcc-15.2.0
m68k                        mvme16x_defconfig    clang-22
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    clang-22
mips                          rm200_defconfig    clang-22
mips                        vocore2_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260116    clang-20
nios2                 randconfig-002-20260116    clang-20
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260116    clang-22
parisc                randconfig-002-20260116    clang-22
parisc64                            defconfig    clang-19
powerpc                    adder875_defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                      cm5200_defconfig    clang-22
powerpc                      cm5200_defconfig    gcc-15.2.0
powerpc                   currituck_defconfig    clang-22
powerpc                  iss476-smp_defconfig    gcc-15.2.0
powerpc                 mpc837x_rdb_defconfig    clang-22
powerpc                  mpc866_ads_defconfig    gcc-15.2.0
powerpc                      ppc44x_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260116    clang-22
powerpc               randconfig-002-20260116    clang-22
powerpc                         wii_defconfig    clang-22
powerpc64             randconfig-001-20260116    clang-22
powerpc64             randconfig-002-20260116    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260116    gcc-15.2.0
riscv                 randconfig-002-20260116    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260116    gcc-15.2.0
s390                  randconfig-002-20260116    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                        apsh4ad0a_defconfig    clang-22
sh                                  defconfig    gcc-14
sh                 kfr2r09-romimage_defconfig    clang-22
sh                    randconfig-001-20260116    gcc-15.2.0
sh                    randconfig-002-20260116    gcc-15.2.0
sh                          rsk7201_defconfig    gcc-15.2.0
sh                          rsk7269_defconfig    clang-22
sh                          sdk7786_defconfig    clang-22
sh                           se7721_defconfig    gcc-15.2.0
sparc                            alldefconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260116    gcc-10.5.0
sparc                 randconfig-002-20260116    gcc-10.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260116    gcc-10.5.0
sparc64               randconfig-002-20260116    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260116    gcc-10.5.0
um                    randconfig-002-20260116    gcc-10.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260116    gcc-14
x86_64      buildonly-randconfig-002-20260116    gcc-14
x86_64      buildonly-randconfig-003-20260116    gcc-14
x86_64      buildonly-randconfig-004-20260116    gcc-14
x86_64      buildonly-randconfig-005-20260116    gcc-14
x86_64      buildonly-randconfig-006-20260116    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260116    clang-20
x86_64                randconfig-002-20260116    clang-20
x86_64                randconfig-003-20260116    clang-20
x86_64                randconfig-004-20260116    clang-20
x86_64                randconfig-005-20260116    clang-20
x86_64                randconfig-006-20260116    clang-20
x86_64                randconfig-011-20260116    clang-20
x86_64                randconfig-012-20260116    clang-20
x86_64                randconfig-013-20260116    clang-20
x86_64                randconfig-014-20260116    clang-20
x86_64                randconfig-015-20260116    clang-20
x86_64                randconfig-016-20260116    clang-20
x86_64                randconfig-071-20260116    clang-20
x86_64                randconfig-072-20260116    clang-20
x86_64                randconfig-073-20260116    clang-20
x86_64                randconfig-074-20260116    clang-20
x86_64                randconfig-075-20260116    clang-20
x86_64                randconfig-076-20260116    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    clang-22
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260116    gcc-10.5.0
xtensa                randconfig-002-20260116    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
