Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB54C1624C0
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776006048; cv=none; b=pVPIdC4kyq/d7hhbBt/B0t/8M8vUYp1vOq0dX4GvG7GdKyGQAr/yEXO8yS5cbTPcoqgXPXQhFPPEIJGQ8dna3lsiM+xx9Chen8hZ1f8CY8sHBphJYIw+SN7NPrIVEEznrBl174v3102C5d+N/n1v+Pe+xH8qd0MxeN1NpKAlsxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776006048; c=relaxed/simple;
	bh=6Ep3ijsObYkp4kLK/uH8HX88GjSwux8eo9SpE6Qwz6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWZdpLdAdEi+SQrWzumx3dFqjeoQAd+APD7msGqt1vTAMconIjttwyhVvvS7yWbXRaexHbDRvCoXZPjhhbm+IrVlyMH7tkUHAhuqcPKalCZno7t80RqvplRlXQvJBBcma46FAtur3ggQBJbNChU9D2JizCTLWjjhswtcwcbzQVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1MV/Tpv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1MV/Tpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776006047; x=1807542047;
  h=date:from:to:cc:subject:message-id;
  bh=6Ep3ijsObYkp4kLK/uH8HX88GjSwux8eo9SpE6Qwz6U=;
  b=Q1MV/Tpvji5lNX9cJe3sGbC1WZxFIt2oIH8DzV5JOaUpmMRV9wDr9YBy
   /bqXekSaMvr6MuqhvT3jnUjJmgYoYjdymmPjtYkbhfM2OmKxxsxsjO1nQ
   8+9lsLDwtNPYUb5+u+5AGHifzNrmnLj+RDIO6gGGdZX5dsPNekQ4DttF0
   KPvzbnEkF8Qe4gWCAnS1mFPu+ci8IhrHL9k/bxogmf3en2lCgvqCIoGFN
   4LOdYyT2eOJqKvmgmpZXxg3Ve0y401ftGHCTs5El1kNfxsX/u+HaVLiSc
   xlfpsLAJPQl/brMoBEBTEPfBk/OLatA2jFC1hc2kchGHJW1FRLMC5avIT
   g==;
X-CSE-ConnectionGUID: r/Dze3M6QASJqX59m70d6A==
X-CSE-MsgGUID: EQevqHgDRz2rB5DDwIl6fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="75993274"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="75993274"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 08:00:46 -0700
X-CSE-ConnectionGUID: Brh2pN4WRPC5GExV6mvLcQ==
X-CSE-MsgGUID: 8h7URyqwSMmGEmNOo7BNOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="226850969"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Apr 2026 08:00:45 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBwIk-000000002HJ-3EqY;
	Sun, 12 Apr 2026 15:00:42 +0000
Date: Sun, 12 Apr 2026 22:59:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a0c370a6fd9634bd55ee10c83643940a88bdd159
Message-ID: <202604122247.WHYDiIWZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a0c370a6fd9634bd55ee10c83643940a88bdd159  hwmon:(pmbus/xdp720) Add support for efuse xdp720

elapsed time: 1299m

configs tested: 201
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
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260412    gcc-11.5.0
arc                   randconfig-002-20260412    gcc-11.5.0
arm                               allnoconfig    clang-23
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g5_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260412    gcc-11.5.0
arm                   randconfig-002-20260412    gcc-11.5.0
arm                   randconfig-003-20260412    gcc-11.5.0
arm                   randconfig-004-20260412    gcc-11.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260412    clang-19
arm64                 randconfig-002-20260412    clang-19
arm64                 randconfig-003-20260412    clang-19
arm64                 randconfig-004-20260412    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260412    clang-19
csky                  randconfig-002-20260412    clang-19
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260412    clang-23
hexagon               randconfig-002-20260412    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260412    gcc-14
i386        buildonly-randconfig-002-20260412    gcc-14
i386        buildonly-randconfig-003-20260412    gcc-14
i386        buildonly-randconfig-004-20260412    gcc-14
i386        buildonly-randconfig-005-20260412    gcc-14
i386        buildonly-randconfig-006-20260412    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260412    clang-20
i386                  randconfig-002-20260412    clang-20
i386                  randconfig-003-20260412    clang-20
i386                  randconfig-004-20260412    clang-20
i386                  randconfig-005-20260412    clang-20
i386                  randconfig-006-20260412    clang-20
i386                  randconfig-007-20260412    clang-20
i386                  randconfig-011-20260412    gcc-14
i386                  randconfig-012-20260412    gcc-14
i386                  randconfig-013-20260412    gcc-14
i386                  randconfig-014-20260412    gcc-14
i386                  randconfig-015-20260412    gcc-14
i386                  randconfig-016-20260412    gcc-14
i386                  randconfig-017-20260412    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260412    clang-23
loongarch             randconfig-002-20260412    clang-23
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
mips                         db1xxx_defconfig    clang-23
mips                      loongson3_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260412    clang-23
nios2                 randconfig-002-20260412    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260412    gcc-15.2.0
parisc                randconfig-002-20260412    gcc-15.2.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-15.2.0
powerpc                 canyonlands_defconfig    clang-23
powerpc                     powernv_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260412    gcc-15.2.0
powerpc               randconfig-002-20260412    gcc-15.2.0
powerpc64             randconfig-001-20260412    gcc-15.2.0
powerpc64             randconfig-002-20260412    gcc-15.2.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260412    clang-23
riscv                 randconfig-001-20260412    gcc-15.2.0
riscv                 randconfig-002-20260412    clang-23
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260412    clang-23
s390                  randconfig-001-20260412    gcc-15.2.0
s390                  randconfig-002-20260412    clang-23
s390                  randconfig-002-20260412    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                 kfr2r09-romimage_defconfig    gcc-15.2.0
sh                    randconfig-001-20260412    clang-23
sh                    randconfig-001-20260412    gcc-15.2.0
sh                    randconfig-002-20260412    clang-23
sh                    randconfig-002-20260412    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260412    clang-23
sparc                 randconfig-002-20260412    clang-23
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260412    clang-23
sparc64               randconfig-002-20260412    clang-23
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260412    clang-23
um                    randconfig-002-20260412    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260412    clang-20
x86_64      buildonly-randconfig-002-20260412    clang-20
x86_64      buildonly-randconfig-003-20260412    clang-20
x86_64      buildonly-randconfig-004-20260412    clang-20
x86_64      buildonly-randconfig-005-20260412    clang-20
x86_64      buildonly-randconfig-006-20260412    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260412    clang-20
x86_64                randconfig-002-20260412    clang-20
x86_64                randconfig-003-20260412    clang-20
x86_64                randconfig-004-20260412    clang-20
x86_64                randconfig-005-20260412    clang-20
x86_64                randconfig-006-20260412    clang-20
x86_64                randconfig-011-20260412    gcc-14
x86_64                randconfig-012-20260412    gcc-14
x86_64                randconfig-013-20260412    gcc-14
x86_64                randconfig-014-20260412    gcc-14
x86_64                randconfig-015-20260412    gcc-14
x86_64                randconfig-016-20260412    gcc-14
x86_64                randconfig-071-20260412    clang-20
x86_64                randconfig-072-20260412    clang-20
x86_64                randconfig-073-20260412    clang-20
x86_64                randconfig-074-20260412    clang-20
x86_64                randconfig-075-20260412    clang-20
x86_64                randconfig-076-20260412    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260412    clang-23
xtensa                randconfig-002-20260412    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
