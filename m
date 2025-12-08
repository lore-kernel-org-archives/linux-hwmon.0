Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794C21E0AF
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Dec 2025 22:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231694; cv=none; b=EWzx2Ik2AGQzj1QHoQ1ZG+04FZQ3msMM/x/YbeEKhogAnavZUCycF2Xz+dorXuKT7OfgfCrLs7BhvYgP8WS5PoVp3WmA9iO4ZtWKoiDHGtiMfB/zBUiQH71nlNN2zwb+8WvpirIujtlfNCPbpLRtPXNdm2zbVbkJYNUDnxteI2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231694; c=relaxed/simple;
	bh=g/QzaqVZbGeb2/OGuLCMOITJgF2Vvt7P37SLGWy7YOI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jz4+Dhxq7mvdDXU1OCdCEA4hI82Xfn7WkGaW7v5Nl4fg/rhFfD2/xlk4FqZTPtpVcRxvTo/Qg99NgntQ2AQO7oo2bRpvzks2+SLzYRtYwMCsqBzVWiQcZHSOGA88I164NVSboB0IgTMLAUfcATAx0I3iTWozBiwDDtfUuNlFE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiRZ8sPx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiRZ8sPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765231692; x=1796767692;
  h=date:from:to:cc:subject:message-id;
  bh=g/QzaqVZbGeb2/OGuLCMOITJgF2Vvt7P37SLGWy7YOI=;
  b=eiRZ8sPx1wuk6B3UeHpQFnVsFkVZcoIeX0rLGVS80CzasSZTwgxXlog1
   k+ljHN2ZhQed5Wkui3n9iQA+m3abykbMu9ieytJBnmuHNbzpp3TtjQHV7
   LvpT++BfTei80kpYQ+ItTQJb5NGKg7vAAN1tfaeC2LaFlihmo9LKhR1Ot
   rlWXo96fhR4ZyMr3nSSoQ1CoGPNijI4rAZU0P1k6lK+qq0ZENc5P++aTb
   g1uQr0agyk3BfJTD9hJNXDtjQfsNxECFYBC0b17MOt+qruI23nq9TqZds
   1anuT2B0keAWNTQRe8WnrjIyRbWaCTFTftkvDxdloHYxu3CcUxp5yQshy
   A==;
X-CSE-ConnectionGUID: lluC412WS0qlhI/J7BL9Ew==
X-CSE-MsgGUID: Z+03IwmVTwi+EdvzQEXSUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="77868255"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="77868255"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 14:08:11 -0800
X-CSE-ConnectionGUID: odJUq8yeTounHT/6Hnm+fA==
X-CSE-MsgGUID: c7TqiZeSTvWGd4vUkh1I9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195656678"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Dec 2025 14:08:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSjOq-000000000u4-2rTY;
	Mon, 08 Dec 2025 22:08:08 +0000
Date: Tue, 09 Dec 2025 06:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 08bfcf4ff9d39228150a757803fc02dffce84ab0
Message-ID: <202512090650.O9NM47Fa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 08bfcf4ff9d39228150a757803fc02dffce84ab0  docs: hwmon: fix link to g762 devicetree binding

elapsed time: 1431m

configs tested: 274
configs skipped: 3

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
arc                     haps_hs_smp_defconfig    gcc-15.1.0
arc                   randconfig-001-20251208    clang-19
arc                   randconfig-001-20251208    gcc-8.5.0
arc                   randconfig-002-20251208    clang-19
arc                   randconfig-002-20251208    gcc-11.5.0
arm                              alldefconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                          pxa910_defconfig    gcc-15.1.0
arm                   randconfig-001-20251208    clang-19
arm                   randconfig-001-20251208    clang-22
arm                   randconfig-002-20251208    clang-19
arm                   randconfig-002-20251208    gcc-13.4.0
arm                   randconfig-003-20251208    clang-19
arm                   randconfig-004-20251208    clang-19
arm                   randconfig-004-20251208    clang-22
arm                        shmobile_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251208    clang-18
arm64                 randconfig-001-20251208    clang-22
arm64                 randconfig-002-20251208    clang-18
arm64                 randconfig-003-20251208    clang-18
arm64                 randconfig-003-20251208    gcc-13.4.0
arm64                 randconfig-004-20251208    clang-18
arm64                 randconfig-004-20251208    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251208    clang-18
csky                  randconfig-001-20251208    gcc-14.3.0
csky                  randconfig-002-20251208    clang-18
csky                  randconfig-002-20251208    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251208    clang-22
hexagon               randconfig-002-20251208    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20251208    clang-20
i386        buildonly-randconfig-001-20251208    gcc-14
i386        buildonly-randconfig-002-20251208    gcc-13
i386        buildonly-randconfig-002-20251208    gcc-14
i386        buildonly-randconfig-003-20251208    gcc-14
i386        buildonly-randconfig-004-20251208    clang-20
i386        buildonly-randconfig-004-20251208    gcc-14
i386        buildonly-randconfig-005-20251208    gcc-14
i386        buildonly-randconfig-006-20251208    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251208    clang-20
i386                  randconfig-002-20251208    clang-20
i386                  randconfig-002-20251208    gcc-14
i386                  randconfig-003-20251208    clang-20
i386                  randconfig-004-20251208    clang-20
i386                  randconfig-005-20251208    clang-20
i386                  randconfig-006-20251208    clang-20
i386                  randconfig-007-20251208    clang-20
i386                  randconfig-007-20251208    gcc-14
i386                  randconfig-011-20251208    gcc-14
i386                  randconfig-012-20251208    clang-20
i386                  randconfig-012-20251208    gcc-14
i386                  randconfig-013-20251208    gcc-14
i386                  randconfig-014-20251208    gcc-14
i386                  randconfig-015-20251208    clang-20
i386                  randconfig-015-20251208    gcc-14
i386                  randconfig-016-20251208    gcc-12
i386                  randconfig-016-20251208    gcc-14
i386                  randconfig-017-20251208    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251208    clang-22
loongarch             randconfig-002-20251208    clang-18
loongarch             randconfig-002-20251208    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    clang-18
m68k                          multi_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    clang-22
mips                            gpr_defconfig    clang-18
mips                         rt305x_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251208    clang-22
nios2                 randconfig-001-20251208    gcc-8.5.0
nios2                 randconfig-002-20251208    clang-22
nios2                 randconfig-002-20251208    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251208    clang-22
parisc                randconfig-001-20251208    gcc-8.5.0
parisc                randconfig-002-20251208    clang-22
parisc                randconfig-002-20251208    gcc-8.5.0
parisc64                         alldefconfig    gcc-15.1.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                        fsp2_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    clang-18
powerpc               randconfig-001-20251208    clang-22
powerpc               randconfig-002-20251208    clang-22
powerpc               randconfig-002-20251208    gcc-14.3.0
powerpc                  storcenter_defconfig    clang-18
powerpc                     stx_gp3_defconfig    clang-18
powerpc                        warp_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251208    clang-22
powerpc64             randconfig-001-20251208    gcc-14.3.0
powerpc64             randconfig-002-20251208    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                    nommu_virt_defconfig    clang-18
riscv                 randconfig-001-20251208    clang-19
riscv                 randconfig-002-20251208    clang-19
riscv                 randconfig-002-20251208    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251208    clang-19
s390                  randconfig-001-20251208    gcc-8.5.0
s390                  randconfig-002-20251208    clang-19
s390                  randconfig-002-20251208    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20251208    clang-19
sh                    randconfig-001-20251208    gcc-15.1.0
sh                    randconfig-002-20251208    clang-19
sh                    randconfig-002-20251208    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251208    gcc-12.5.0
sparc                 randconfig-001-20251208    gcc-9.5.0
sparc                 randconfig-002-20251208    gcc-15.1.0
sparc                 randconfig-002-20251208    gcc-9.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251208    clang-20
sparc64               randconfig-001-20251208    gcc-9.5.0
sparc64               randconfig-002-20251208    gcc-11.5.0
sparc64               randconfig-002-20251208    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251208    gcc-14
um                    randconfig-001-20251208    gcc-9.5.0
um                    randconfig-002-20251208    clang-22
um                    randconfig-002-20251208    gcc-9.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251208    clang-20
x86_64      buildonly-randconfig-001-20251208    gcc-14
x86_64      buildonly-randconfig-002-20251208    clang-20
x86_64      buildonly-randconfig-003-20251208    clang-20
x86_64      buildonly-randconfig-003-20251208    gcc-14
x86_64      buildonly-randconfig-004-20251208    clang-20
x86_64      buildonly-randconfig-004-20251208    gcc-14
x86_64      buildonly-randconfig-005-20251208    clang-20
x86_64      buildonly-randconfig-005-20251208    gcc-13
x86_64      buildonly-randconfig-006-20251208    clang-20
x86_64      buildonly-randconfig-006-20251208    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251208    clang-20
x86_64                randconfig-001-20251208    gcc-14
x86_64                randconfig-002-20251208    clang-20
x86_64                randconfig-002-20251208    gcc-12
x86_64                randconfig-003-20251208    clang-20
x86_64                randconfig-003-20251208    gcc-14
x86_64                randconfig-004-20251208    clang-20
x86_64                randconfig-005-20251208    clang-20
x86_64                randconfig-005-20251208    gcc-14
x86_64                randconfig-006-20251208    clang-20
x86_64                randconfig-011-20251208    clang-20
x86_64                randconfig-012-20251208    clang-20
x86_64                randconfig-013-20251208    clang-20
x86_64                randconfig-014-20251208    clang-20
x86_64                randconfig-015-20251208    clang-20
x86_64                randconfig-016-20251208    clang-20
x86_64                randconfig-071-20251208    clang-20
x86_64                randconfig-072-20251208    clang-20
x86_64                randconfig-073-20251208    clang-20
x86_64                randconfig-074-20251208    clang-20
x86_64                randconfig-075-20251208    clang-20
x86_64                randconfig-076-20251208    clang-20
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
xtensa                  audio_kc705_defconfig    clang-18
xtensa                  cadence_csp_defconfig    clang-18
xtensa                randconfig-001-20251208    gcc-13.4.0
xtensa                randconfig-001-20251208    gcc-9.5.0
xtensa                randconfig-002-20251208    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
