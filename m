Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742D81F17E8
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Jun 2025 17:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749488551; cv=none; b=YCbmU6a6a7O68HHcWZcQM3Ulcc6TO6tD4MsNk8/Co9OdPRxub3i4RHKxH0oumhyVklRe9ENuEv/G4bF7oay1BYWcOPFrEuWqkDL+BffBli5eUD43kyvNF7L+KPuLKZ3SRS1p7uliXTyk5+9n7a9PndHe4uOD90PbwR9gjJBXVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749488551; c=relaxed/simple;
	bh=rebz8eDILrL6KshSnunHtA14+pnYCD+jZJrKRJaDPoY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XHpkSEqDeHhSclAZsqjr/iuFyRFIf4m/gnFDYs1m521SjMmixzwI43FJPAOT310wHJCPGrh6td4s3ez/H7AEW9paTetKtHVcHELB/HqzQVwoiMDDwL3toh0DOR/sPgC2H5C6zOJH51dWelttJjmhvdrgErsUCTjQ1V1bkPCgZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQRQHxCs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQRQHxCs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749488549; x=1781024549;
  h=date:from:to:cc:subject:message-id;
  bh=rebz8eDILrL6KshSnunHtA14+pnYCD+jZJrKRJaDPoY=;
  b=RQRQHxCswaNF2wNX94VObk6pInUEE4rUDoPPLkDRkvgyLaebHT8ryCQ/
   Nesv5cj9GYWs+vpfAaH1TUKmCsQ6nin4vESDXs+Yc77Tx3o+Cqq5f05Ni
   S2Bpi7SomNLyr9yNijxioDkPTrn5maCSIBFr9DvBTEQjKo+JvbwoFAFen
   z2ipWv1Z8QkviPjJl3wS57xadptTkx+991ILsPYY1XNl3Lmx+pKN3Oy3v
   hGTEcnvgF/6b+eflOLidCA1Ufqhci5cezTJuqW4ZFey586/qmSIw8+YMj
   OiCG6ltzZPFuh6B/RBdPb5Djh0x0qIj2oxDmVBdZUuqSpHhykw+EE5dZZ
   Q==;
X-CSE-ConnectionGUID: JdEpRh98RCagtfat5COuZA==
X-CSE-MsgGUID: IxzdDEGDSB+64XIxqQ+jNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51667112"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51667112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 10:02:29 -0700
X-CSE-ConnectionGUID: zgD9Lo0WTqytenJUKOyZxQ==
X-CSE-MsgGUID: /w+wVaxWRaefmNtHzOGlYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146563075"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2025 10:02:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOftA-0007FR-3B;
	Mon, 09 Jun 2025 17:02:24 +0000
Date: Tue, 10 Jun 2025 01:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 51e8af3c06fc1c195e2c06ba917629b7083889d1
Message-ID: <202506100128.ZJFTBOgu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 51e8af3c06fc1c195e2c06ba917629b7083889d1  hwmon: (ftsteutates) Fix TOCTOU race in fts_read()

elapsed time: 900m

configs tested: 219
configs skipped: 15

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
arc                   randconfig-001-20250609    gcc-12.4.0
arc                   randconfig-002-20250609    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                   randconfig-001-20250609    clang-21
arm                   randconfig-002-20250609    clang-17
arm                   randconfig-003-20250609    clang-21
arm                   randconfig-004-20250609    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250609    clang-21
arm64                 randconfig-002-20250609    clang-21
arm64                 randconfig-003-20250609    gcc-14.3.0
arm64                 randconfig-004-20250609    gcc-9.5.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250609    gcc-15.1.0
csky                  randconfig-001-20250609    gcc-8.5.0
csky                  randconfig-002-20250609    gcc-12.4.0
csky                  randconfig-002-20250609    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250609    clang-20
hexagon               randconfig-001-20250609    gcc-8.5.0
hexagon               randconfig-002-20250609    clang-21
hexagon               randconfig-002-20250609    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250609    clang-20
i386        buildonly-randconfig-002-20250609    clang-20
i386        buildonly-randconfig-003-20250609    clang-20
i386        buildonly-randconfig-004-20250609    clang-20
i386        buildonly-randconfig-005-20250609    clang-20
i386        buildonly-randconfig-006-20250609    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20250609    clang-20
i386                  randconfig-002-20250609    clang-20
i386                  randconfig-003-20250609    clang-20
i386                  randconfig-004-20250609    clang-20
i386                  randconfig-005-20250609    clang-20
i386                  randconfig-006-20250609    clang-20
i386                  randconfig-007-20250609    clang-20
i386                  randconfig-011-20250609    clang-20
i386                  randconfig-012-20250609    clang-20
i386                  randconfig-013-20250609    clang-20
i386                  randconfig-014-20250609    clang-20
i386                  randconfig-015-20250609    clang-20
i386                  randconfig-016-20250609    clang-20
i386                  randconfig-017-20250609    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250609    gcc-15.1.0
loongarch             randconfig-001-20250609    gcc-8.5.0
loongarch             randconfig-002-20250609    gcc-12.4.0
loongarch             randconfig-002-20250609    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           gcw0_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250609    gcc-8.5.0
nios2                 randconfig-002-20250609    gcc-8.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250609    gcc-8.5.0
parisc                randconfig-002-20250609    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                     akebono_defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                      pcm030_defconfig    clang-21
powerpc               randconfig-001-20250609    clang-21
powerpc               randconfig-001-20250609    gcc-8.5.0
powerpc               randconfig-002-20250609    clang-21
powerpc               randconfig-002-20250609    gcc-8.5.0
powerpc               randconfig-003-20250609    gcc-8.5.0
powerpc               randconfig-003-20250609    gcc-9.3.0
powerpc                     tqm8541_defconfig    clang-21
powerpc64                        alldefconfig    gcc-15.1.0
powerpc64             randconfig-001-20250609    clang-21
powerpc64             randconfig-001-20250609    gcc-8.5.0
powerpc64             randconfig-002-20250609    clang-21
powerpc64             randconfig-002-20250609    gcc-8.5.0
powerpc64             randconfig-003-20250609    clang-21
powerpc64             randconfig-003-20250609    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250609    gcc-12
riscv                 randconfig-001-20250609    gcc-12.4.0
riscv                 randconfig-002-20250609    clang-21
riscv                 randconfig-002-20250609    gcc-12
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250609    clang-21
s390                  randconfig-001-20250609    gcc-12
s390                  randconfig-002-20250609    clang-21
s390                  randconfig-002-20250609    gcc-12
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-15.1.0
sh                          polaris_defconfig    gcc-15.1.0
sh                    randconfig-001-20250609    gcc-11.5.0
sh                    randconfig-001-20250609    gcc-12
sh                    randconfig-002-20250609    gcc-12
sh                    randconfig-002-20250609    gcc-13.3.0
sh                           se7712_defconfig    gcc-15.1.0
sh                              ul2_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250609    gcc-12
sparc                 randconfig-001-20250609    gcc-15.1.0
sparc                 randconfig-002-20250609    gcc-12
sparc                 randconfig-002-20250609    gcc-15.1.0
sparc64                          alldefconfig    gcc-15.1.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250609    gcc-12
sparc64               randconfig-001-20250609    gcc-12.4.0
sparc64               randconfig-002-20250609    gcc-12
sparc64               randconfig-002-20250609    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250609    clang-21
um                    randconfig-001-20250609    gcc-12
um                    randconfig-002-20250609    gcc-12
um                           x86_64_defconfig    clang-21
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250609    clang-20
x86_64      buildonly-randconfig-002-20250609    gcc-12
x86_64      buildonly-randconfig-003-20250609    clang-20
x86_64      buildonly-randconfig-004-20250609    clang-20
x86_64      buildonly-randconfig-005-20250609    clang-20
x86_64      buildonly-randconfig-006-20250609    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250609    gcc-12
x86_64                randconfig-002-20250609    gcc-12
x86_64                randconfig-003-20250609    gcc-12
x86_64                randconfig-004-20250609    gcc-12
x86_64                randconfig-005-20250609    gcc-12
x86_64                randconfig-006-20250609    gcc-12
x86_64                randconfig-007-20250609    gcc-12
x86_64                randconfig-008-20250609    gcc-12
x86_64                randconfig-071-20250609    clang-20
x86_64                randconfig-072-20250609    clang-20
x86_64                randconfig-073-20250609    clang-20
x86_64                randconfig-074-20250609    clang-20
x86_64                randconfig-075-20250609    clang-20
x86_64                randconfig-076-20250609    clang-20
x86_64                randconfig-077-20250609    clang-20
x86_64                randconfig-078-20250609    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-18
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250609    gcc-11.5.0
xtensa                randconfig-001-20250609    gcc-12
xtensa                randconfig-002-20250609    gcc-12
xtensa                randconfig-002-20250609    gcc-8.5.0
xtensa                    smp_lx200_defconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
