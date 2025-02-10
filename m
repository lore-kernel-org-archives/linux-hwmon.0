Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9782580D6
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205360; cv=none; b=QQCY8WcrmtRkU6Gttx7//TMwy5zxcfmMXNxCpU6I4qLE/jYbdfzevBz7Gv6FC4r8Kz921cPmW81WeHZHbFpqIYOMV6SiqMr9SF/qaMvRPdtbo95iNu0L9Md22CBu71CBF68VjCYFe/POs2qq/GQijjXNrAdu/ROg56mA/EqjDSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205360; c=relaxed/simple;
	bh=Bo23AUiG1maoNPrvNM3T2XafqEl0CQlr+xG2HHeitNA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jgIOMDUt75v2rN7cPgOVQHrDV/JlCdGhKghU0XrdJ8sDZaS3TtvIccTwpffwQMjn54F2+Hf8J0Pk5STipoCSNokAWDR2j23w6eIcLN+r2FUznJiapmgpYNYQaJZISyKi8tkZAKYx23iClzFujrPzK/sscUGB1AMGsOzOkdtUq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJn9eX6p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJn9eX6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739205358; x=1770741358;
  h=date:from:to:cc:subject:message-id;
  bh=Bo23AUiG1maoNPrvNM3T2XafqEl0CQlr+xG2HHeitNA=;
  b=NJn9eX6pWXJVbFiJk5F8FPpeF/GX5IX6XL3gQDHhXu0aBH9YiSl8uGVd
   9IUQfJ4/XlNTdvG+16dhEa2Yk0W4LRlYkPmQ/cpcVYRYR49lHdkWKAjDp
   5NyEyqH1BVr5bi2zyvhh5x+T0ZFxAOKDsgNoiLRqrTCX9Ihge9FVrsHoU
   WfMRdTyk7VhnwXm02Hc2jH0MwhD8D8TkTtDkjDzaJ+MH8djKlETcLJpyp
   lYDAj48pdgu2fzgAF8APt87qPOSOG2jvFnaD0HFaYWCaoFCuVzJOAIVl4
   Ff+w6+YddkRwWYDpz9epi2zlqkY1OlGWjO5RAd9scK5KBtS62RHb5gVa/
   g==;
X-CSE-ConnectionGUID: Q8CYYWnfSLyqhJugi5Ujcg==
X-CSE-MsgGUID: xjrCnufeTiWLfNJOQHgtVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39482381"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39482381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 08:35:45 -0800
X-CSE-ConnectionGUID: Y2/PmQnHTtezT/lVw0WjPg==
X-CSE-MsgGUID: l9kwhK//RYy380fRtMln9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="143112278"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Feb 2025 08:35:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thWl3-00132t-1A;
	Mon, 10 Feb 2025 16:35:41 +0000
Date: Tue, 11 Feb 2025 00:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 30e231f7fae74524d22699787bcbaf159b881e71
Message-ID: <202502110004.a7Rbe6Yq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 30e231f7fae74524d22699787bcbaf159b881e71  Merge branch 'hwmon-fixes' into hwmon-staging

elapsed time: 1153m

configs tested: 237
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250210    clang-21
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    clang-21
arc                   randconfig-002-20250210    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                                 defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-001-20250210    clang-21
arm                   randconfig-002-20250210    clang-21
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-003-20250210    clang-21
arm                   randconfig-004-20250210    clang-21
arm                   randconfig-004-20250210    gcc-14.2.0
arm                             rpc_defconfig    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    clang-21
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250210    clang-21
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    clang-21
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
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
i386                  randconfig-001-20250210    gcc-11
i386                  randconfig-002-20250210    gcc-11
i386                  randconfig-003-20250210    gcc-11
i386                  randconfig-004-20250210    gcc-11
i386                  randconfig-005-20250210    gcc-11
i386                  randconfig-006-20250210    gcc-11
i386                  randconfig-007-20250210    gcc-11
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
m68k                       m5249evb_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq5_defconfig    gcc-14.2.0
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
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                       holly_defconfig    clang-21
powerpc                     mpc512x_defconfig    clang-21
powerpc                  mpc885_ads_defconfig    clang-18
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
riscv                 randconfig-001-20250210    clang-16
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-002-20250210    clang-16
riscv                 randconfig-002-20250210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    clang-21
s390                                defconfig    gcc-12
s390                  randconfig-001-20250210    clang-16
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-002-20250210    clang-16
s390                  randconfig-002-20250210    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    clang-16
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    clang-16
sh                    randconfig-002-20250210    gcc-14.2.0
sh                   rts7751r2dplus_defconfig    gcc-14.2.0
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
xtensa                  cadence_csp_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    clang-16
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-002-20250210    clang-16
xtensa                randconfig-002-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
