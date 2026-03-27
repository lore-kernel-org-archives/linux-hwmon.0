Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5723732B9A9
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 20:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774644383; cv=none; b=AtWaMtIR9VW8jJKBmcJ9TXqIroBqm1W+SlEvVUukENTEJ4MmmnMh1BaMED6nlfSwoFjm6WeTBXCYb3yNuAq2leu19gtemG9/ECTmmdG2VwMzVuFr0EeRuRxyUt4LAls0yECXJnCT9IX1j1MDCtvwi4PgbDIbzZXaK+kG+Yx2YXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774644383; c=relaxed/simple;
	bh=epuiczOWXJRN6K0k5ToS+tU/NX+I7XosMAiYi0ePdXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T3oDvN78jm6fYye3kKIqr8Ph8oGMAk4ms8mEtNwFAA2dVi/RgyOHJsyCwUmERrXc0xan3YXlnwkKyw0R9g3KfSmtbxhUqYz9CRXgUotb3WrWw8UvUPe0ZhYPu67eOEOAQbTi4cQs6AhRyqLnzzi5mnF6+wJQPBvZsPQcDaKrsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtCkUdTX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtCkUdTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774644381; x=1806180381;
  h=date:from:to:cc:subject:message-id;
  bh=epuiczOWXJRN6K0k5ToS+tU/NX+I7XosMAiYi0ePdXU=;
  b=EtCkUdTX9hF4fN91OmFj51ANRK1WnFcPbwy75mGAKPJPfjFLn0lmYIDf
   vNs44AezfPLIfDSe5SUu6k0yIine0M1Xs6TI2MQswmEHelwIOhJH5gKmH
   uGTkXXQJAiEQG0na6CbyiBYNMGJp5cX1ftPnRzvpj8zH5H0uwSd++f0Bk
   Xu2mHQ/Qb5ixNzykYFpXCErxlOossqqREDr/sBgrSaaMQvd6M4+jxykyF
   urX9J3Qte0YB4gn1HKndCjlnbBV/rCdcagCbZA4ti9WEo9TKg23W+yTPN
   Bm1Jw4gwNPL+7KLELmyS568R6zS5npnDwmRjIIxDj+GC9yBkItKPdGJyR
   w==;
X-CSE-ConnectionGUID: XAy1qS2nQoul55WwehHupg==
X-CSE-MsgGUID: Ty37jIoVRaeWxUlQE95kQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="93110925"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="93110925"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 13:46:21 -0700
X-CSE-ConnectionGUID: zcY/9sHxT22HY/PmY4LvAg==
X-CSE-MsgGUID: Q1YravhtQlGWOfeKL4Fa1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="227021797"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2026 13:46:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6E4O-00000000AjB-44u8;
	Fri, 27 Mar 2026 20:46:16 +0000
Date: Sat, 28 Mar 2026 04:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 809bcbf15d6e386115563c30239aa037e36a8f31
Message-ID: <202603280431.0vtgKk1g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 809bcbf15d6e386115563c30239aa037e36a8f31  hwmon: (ina2xx) drop unused platform data

elapsed time: 1242m

configs tested: 239
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260327    gcc-8.5.0
arc                   randconfig-001-20260328    gcc-15.2.0
arc                   randconfig-002-20260327    gcc-8.5.0
arc                   randconfig-002-20260328    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260327    gcc-8.5.0
arm                   randconfig-001-20260328    gcc-15.2.0
arm                   randconfig-002-20260327    gcc-8.5.0
arm                   randconfig-002-20260328    gcc-15.2.0
arm                   randconfig-003-20260327    gcc-8.5.0
arm                   randconfig-003-20260328    gcc-15.2.0
arm                   randconfig-004-20260327    gcc-8.5.0
arm                   randconfig-004-20260328    gcc-15.2.0
arm                           tegra_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260327    clang-23
arm64                 randconfig-001-20260328    gcc-14.3.0
arm64                 randconfig-002-20260327    clang-23
arm64                 randconfig-002-20260328    gcc-14.3.0
arm64                 randconfig-003-20260327    clang-23
arm64                 randconfig-003-20260328    gcc-14.3.0
arm64                 randconfig-004-20260327    clang-23
arm64                 randconfig-004-20260328    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260327    clang-23
csky                  randconfig-001-20260328    gcc-14.3.0
csky                  randconfig-002-20260327    clang-23
csky                  randconfig-002-20260328    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260327    gcc-8.5.0
hexagon               randconfig-001-20260328    gcc-11.5.0
hexagon               randconfig-002-20260327    gcc-8.5.0
hexagon               randconfig-002-20260328    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260327    clang-20
i386        buildonly-randconfig-001-20260328    clang-20
i386        buildonly-randconfig-002-20260327    clang-20
i386        buildonly-randconfig-002-20260328    clang-20
i386        buildonly-randconfig-003-20260327    clang-20
i386        buildonly-randconfig-003-20260328    clang-20
i386        buildonly-randconfig-004-20260327    clang-20
i386        buildonly-randconfig-004-20260328    clang-20
i386        buildonly-randconfig-005-20260327    clang-20
i386        buildonly-randconfig-005-20260328    clang-20
i386        buildonly-randconfig-006-20260327    clang-20
i386        buildonly-randconfig-006-20260328    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260327    clang-20
i386                  randconfig-002-20260327    clang-20
i386                  randconfig-003-20260327    clang-20
i386                  randconfig-004-20260327    clang-20
i386                  randconfig-005-20260327    clang-20
i386                  randconfig-006-20260327    clang-20
i386                  randconfig-007-20260327    clang-20
i386                  randconfig-011-20260327    gcc-14
i386                  randconfig-012-20260327    gcc-14
i386                  randconfig-013-20260327    gcc-14
i386                  randconfig-014-20260327    gcc-14
i386                  randconfig-015-20260327    gcc-14
i386                  randconfig-016-20260327    gcc-14
i386                  randconfig-017-20260327    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260327    gcc-8.5.0
loongarch             randconfig-001-20260328    gcc-11.5.0
loongarch             randconfig-002-20260327    gcc-8.5.0
loongarch             randconfig-002-20260328    gcc-11.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ci20_defconfig    clang-23
mips                     cu1000-neo_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260327    gcc-8.5.0
nios2                 randconfig-001-20260328    gcc-11.5.0
nios2                 randconfig-002-20260327    gcc-8.5.0
nios2                 randconfig-002-20260328    gcc-11.5.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260327    clang-18
parisc                randconfig-001-20260328    gcc-10.5.0
parisc                randconfig-002-20260327    clang-18
parisc                randconfig-002-20260328    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                 mpc837x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260327    clang-18
powerpc               randconfig-001-20260328    gcc-10.5.0
powerpc               randconfig-002-20260327    clang-18
powerpc               randconfig-002-20260328    gcc-10.5.0
powerpc64             randconfig-001-20260327    clang-18
powerpc64             randconfig-001-20260328    gcc-10.5.0
powerpc64             randconfig-002-20260327    clang-18
powerpc64             randconfig-002-20260328    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260327    gcc-12.5.0
riscv                 randconfig-001-20260328    clang-23
riscv                 randconfig-002-20260327    gcc-12.5.0
riscv                 randconfig-002-20260328    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260327    gcc-12.5.0
s390                  randconfig-001-20260328    clang-23
s390                  randconfig-002-20260327    gcc-12.5.0
s390                  randconfig-002-20260328    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260327    gcc-12.5.0
sh                    randconfig-001-20260328    clang-23
sh                    randconfig-002-20260327    gcc-12.5.0
sh                    randconfig-002-20260328    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260327    gcc-14
sparc                 randconfig-001-20260328    gcc-14
sparc                 randconfig-002-20260327    gcc-14
sparc                 randconfig-002-20260328    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260327    gcc-14
sparc64               randconfig-001-20260328    gcc-14
sparc64               randconfig-002-20260327    gcc-14
sparc64               randconfig-002-20260328    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260327    gcc-14
um                    randconfig-001-20260328    gcc-14
um                    randconfig-002-20260327    gcc-14
um                    randconfig-002-20260328    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260327    clang-20
x86_64      buildonly-randconfig-001-20260328    clang-20
x86_64      buildonly-randconfig-002-20260327    clang-20
x86_64      buildonly-randconfig-002-20260328    clang-20
x86_64      buildonly-randconfig-003-20260327    clang-20
x86_64      buildonly-randconfig-003-20260328    clang-20
x86_64      buildonly-randconfig-004-20260327    clang-20
x86_64      buildonly-randconfig-004-20260328    clang-20
x86_64      buildonly-randconfig-005-20260327    clang-20
x86_64      buildonly-randconfig-005-20260328    clang-20
x86_64      buildonly-randconfig-006-20260327    clang-20
x86_64      buildonly-randconfig-006-20260328    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260327    gcc-14
x86_64                randconfig-002-20260327    gcc-14
x86_64                randconfig-003-20260327    gcc-14
x86_64                randconfig-004-20260327    gcc-14
x86_64                randconfig-005-20260327    gcc-14
x86_64                randconfig-006-20260327    gcc-14
x86_64                randconfig-011-20260327    gcc-14
x86_64                randconfig-012-20260327    gcc-14
x86_64                randconfig-013-20260327    gcc-14
x86_64                randconfig-014-20260327    gcc-14
x86_64                randconfig-015-20260327    gcc-14
x86_64                randconfig-016-20260327    gcc-14
x86_64                randconfig-071-20260327    gcc-13
x86_64                randconfig-071-20260328    gcc-12
x86_64                randconfig-072-20260327    gcc-13
x86_64                randconfig-072-20260328    gcc-12
x86_64                randconfig-073-20260327    gcc-13
x86_64                randconfig-073-20260328    gcc-12
x86_64                randconfig-074-20260327    gcc-13
x86_64                randconfig-074-20260328    gcc-12
x86_64                randconfig-075-20260327    gcc-13
x86_64                randconfig-075-20260328    gcc-12
x86_64                randconfig-076-20260327    gcc-13
x86_64                randconfig-076-20260328    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260327    gcc-14
xtensa                randconfig-001-20260328    gcc-14
xtensa                randconfig-002-20260327    gcc-14
xtensa                randconfig-002-20260328    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
