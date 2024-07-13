Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8155131E2D
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720876884; cv=none; b=i/Ldk55eLFm0JrIB1MBhBRqezrTGEQflOZMWmEKOZZj/clTJP0mfRi6xo0Sx/s1WdduL7ibwGjftI7GNSmuhyvpUd4p4hhFt/qmQVl9qNCk5Jf5wvm5qnhVpjSWOKNGXMCIajxB0SBjxH01DQ2UoEsnv57xSQ55zgamQPUI//hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720876884; c=relaxed/simple;
	bh=U3V8fmfn4WZDrz1CtGya/2HeisRs32HsuanaujtXyhE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJr60ROIn4o28C7xK/UrXbQ5Q0qoZp7K3on/bkXFYRFHJynnbksk881SIlb0q5xrvmD7NIT0GaB34qZexLRRVUkyma7KyC1OvDePkM6gKZYT54XEErtShBIuF8/e1ntbT/GMT22cwEJUs19fB1ok3oFAgxhH2+ywDin9AZjsF14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SUlYFGhc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SUlYFGhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720876882; x=1752412882;
  h=date:from:to:cc:subject:message-id;
  bh=U3V8fmfn4WZDrz1CtGya/2HeisRs32HsuanaujtXyhE=;
  b=SUlYFGhcxLNP2DSMy5sJpPTIFqq3T+B8lFSzIV0+s0X10upEw8aS1Kzw
   RfGbr3gyBdxmXN/J3IKRqjifjPsWR+gxnVFztr+REzL00tXWkTEUb7p7S
   Ly+eopALfvNXbejVFt+egOKQSZnsDsQzTcKESfrzF6wpqUEInbaEJPZ9T
   2I4mm88Svo7rZFY2uXR2r+YL/E95b57StF/JnLKJTeGD+Ku1gUWfunUmb
   /Vp22ntkeFQpTG+3kDBKSxX0y0MVe1dI3jNxXnkm5R33gTXaIu4C8N2Ky
   R/jh/uiVOQJi7iAeX/MmTfBSK5onPiVta2VIJYSoylHPBtviEGvv9jDNT
   A==;
X-CSE-ConnectionGUID: lTFC0rmvSwuglP9wbgpu8g==
X-CSE-MsgGUID: OfFLU83PRdKiP/nPEBOx8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29718905"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="29718905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 06:21:21 -0700
X-CSE-ConnectionGUID: IcmIPmZORlGgNLyrYBoYHg==
X-CSE-MsgGUID: fq+U6WmXSimqldF0WEHIyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="49056313"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jul 2024 06:21:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sScgf-000c5m-1U;
	Sat, 13 Jul 2024 13:21:17 +0000
Date: Sat, 13 Jul 2024 21:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 04e3bb0b00a872e5bed0457c3e2c48a7828eaf28
Message-ID: <202407132130.3NY83u1R-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 04e3bb0b00a872e5bed0457c3e2c48a7828eaf28  hwmon: (pmbus/ltc4286) Drop unused i2c device ids

elapsed time: 1272m

configs tested: 210
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240713   gcc-13.2.0
arc                   randconfig-002-20240713   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-19
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                   randconfig-001-20240713   gcc-13.2.0
arm                   randconfig-002-20240713   gcc-13.2.0
arm                   randconfig-003-20240713   gcc-13.2.0
arm                   randconfig-004-20240713   gcc-13.2.0
arm                        realview_defconfig   clang-19
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240713   gcc-13.2.0
arm64                 randconfig-002-20240713   gcc-13.2.0
arm64                 randconfig-003-20240713   gcc-13.2.0
arm64                 randconfig-004-20240713   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240713   gcc-13.2.0
csky                  randconfig-002-20240713   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   clang-18
i386         buildonly-randconfig-003-20240713   gcc-8
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   clang-18
i386         buildonly-randconfig-005-20240713   gcc-13
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   clang-18
i386                  randconfig-001-20240713   gcc-10
i386                  randconfig-002-20240713   clang-18
i386                  randconfig-002-20240713   gcc-13
i386                  randconfig-003-20240713   clang-18
i386                  randconfig-003-20240713   gcc-13
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   clang-18
i386                  randconfig-005-20240713   gcc-10
i386                  randconfig-006-20240713   clang-18
i386                  randconfig-006-20240713   gcc-12
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   clang-18
i386                  randconfig-012-20240713   gcc-7
i386                  randconfig-013-20240713   clang-18
i386                  randconfig-013-20240713   gcc-13
i386                  randconfig-014-20240713   clang-18
i386                  randconfig-014-20240713   gcc-13
i386                  randconfig-015-20240713   clang-18
i386                  randconfig-015-20240713   gcc-11
i386                  randconfig-016-20240713   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240713   gcc-13.2.0
loongarch             randconfig-002-20240713   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   clang-19
mips                      malta_kvm_defconfig   gcc-14.1.0
mips                malta_qemu_32r6_defconfig   clang-19
mips                      maltasmvp_defconfig   gcc-14.1.0
mips                        maltaup_defconfig   clang-19
mips                           mtx1_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
mips                           rs90_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240713   gcc-13.2.0
nios2                 randconfig-002-20240713   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240713   gcc-13.2.0
parisc                randconfig-002-20240713   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-19
powerpc                 canyonlands_defconfig   clang-19
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   clang-19
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-19
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                      ppc44x_defconfig   clang-19
powerpc               randconfig-001-20240713   gcc-13.2.0
powerpc               randconfig-002-20240713   gcc-13.2.0
powerpc               randconfig-003-20240713   gcc-13.2.0
powerpc                     tqm8555_defconfig   clang-19
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240713   gcc-13.2.0
powerpc64             randconfig-002-20240713   gcc-13.2.0
powerpc64             randconfig-003-20240713   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240713   gcc-13.2.0
riscv                 randconfig-002-20240713   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240713   gcc-13.2.0
s390                  randconfig-002-20240713   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240713   gcc-13.2.0
sh                    randconfig-002-20240713   gcc-13.2.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240713   gcc-13.2.0
sparc64               randconfig-002-20240713   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240713   gcc-13.2.0
um                    randconfig-002-20240713   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   clang-18
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   clang-18
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   clang-18
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   clang-18
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   clang-18
x86_64                randconfig-016-20240713   clang-18
x86_64                randconfig-071-20240713   clang-18
x86_64                randconfig-072-20240713   clang-18
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   clang-18
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240713   gcc-13.2.0
xtensa                randconfig-002-20240713   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
