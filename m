Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD8B2D5926
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 05:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773035759; cv=none; b=nq1ceR/QikITl+x+3m+oMgofelkzPjpHYJlaXUvEjZ1XSl4BBMZgFjyhSiSMlhpaSwJIsEh5E+lYHJH5svy5OObaz4ZCZ5ZwIxkk+HSt11id5aR+jFR1SpW5kHayb511PIjBHwPjiE5XAfxn4qSLlXKhBCsNuvjqDiYhqhHjs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773035759; c=relaxed/simple;
	bh=BYYlU0NhaqqRzcBcvjpjDzInQTI2ugxsWJsOCwSaS0s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JRcy7vQ+Ij9GJJNa5widxaVygJlqbuFomEeRxNbBGoyIJiAOpU8AkCePpBB47aV0uQTMnMxTkk96S+qfVrCK6uS1GNbaMyc/UiZcRgyKH2DkSaO5uKia72zVVVhShmEeArCnHXPE/KLqzLnteKRCIy1KTr42A69p5GsCyw5jas8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVTiDjrv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVTiDjrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773035758; x=1804571758;
  h=date:from:to:cc:subject:message-id;
  bh=BYYlU0NhaqqRzcBcvjpjDzInQTI2ugxsWJsOCwSaS0s=;
  b=OVTiDjrvczWfOaq49rWjYvFqoMH73rfMZPbvzXSnddQ7CU6wiBzxzHYM
   CmEl8V+EWJQNhM3k6QguRVs60nHOxkeraLsKNla4BofYH0NEOt6CCp8U/
   1hLoZreNR671b1qpfDSYhFjgGdNUYtmKczv+NlJmSvjqHOMSKr6QjTC3m
   TgQNlB1/4FhMhtn8HhPUY+W8GHvqkAYFheJ+XZCzQVWU+SvE5RyusMn8T
   fP+d98NZNrVegDx+EpohtXKV0tgXiw3uxv57R0M+57I1i4ZZIuvsl06CV
   Hh/gFQh+VdyuDuT0xSwCI/Iuw85imPwmjLSNr0DFVDmnw1MlYla8zf2Aj
   w==;
X-CSE-ConnectionGUID: V4SQMmkOSmW1eNSRWhtLLg==
X-CSE-MsgGUID: A6Z5b8UmR0qgnuDdQIGEMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76652913"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="76652913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 22:55:57 -0700
X-CSE-ConnectionGUID: oiQhXdH6Sqyv4vDDQIzxIw==
X-CSE-MsgGUID: yDCR+bBjSQuNQ1BFQkVV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="217271503"
Received: from lkp-server01.sh.intel.com (HELO 17db2bb44c9a) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2026 22:55:56 -0700
Received: from kbuild by 17db2bb44c9a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzTar-000000000Dl-45nQ;
	Mon, 09 Mar 2026 05:55:53 +0000
Date: Mon, 09 Mar 2026 13:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 33f9280f8a3a1b8e1df9ab1ff4f9d2654f434f3c
Message-ID: <202603091340.H9wSH85j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 33f9280f8a3a1b8e1df9ab1ff4f9d2654f434f3c  hwmon: (ads7871) Propagate SPI errors in voltage_show

elapsed time: 869m

configs tested: 159
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260308    gcc-11.5.0
arc                   randconfig-002-20260308    gcc-10.5.0
arm                               allnoconfig    clang-23
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    clang-23
arm                   randconfig-001-20260308    clang-17
arm                   randconfig-002-20260308    gcc-8.5.0
arm                   randconfig-003-20260308    clang-18
arm                   randconfig-004-20260308    clang-23
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260308    gcc-15.2.0
arm64                 randconfig-002-20260308    clang-23
arm64                 randconfig-003-20260308    gcc-8.5.0
arm64                 randconfig-004-20260308    clang-23
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260308    gcc-15.2.0
csky                  randconfig-002-20260308    gcc-14.3.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-23
hexagon                             defconfig    clang-23
hexagon               randconfig-001-20260309    clang-19
hexagon               randconfig-002-20260309    clang-23
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260308    clang-20
i386        buildonly-randconfig-002-20260308    clang-20
i386        buildonly-randconfig-003-20260308    clang-20
i386        buildonly-randconfig-004-20260308    clang-20
i386        buildonly-randconfig-005-20260308    clang-20
i386        buildonly-randconfig-006-20260308    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20260309    gcc-14
i386                  randconfig-002-20260309    clang-20
i386                  randconfig-003-20260309    gcc-14
i386                  randconfig-004-20260309    gcc-14
i386                  randconfig-005-20260309    gcc-14
i386                  randconfig-006-20260309    gcc-14
i386                  randconfig-007-20260309    gcc-12
i386                  randconfig-011-20260309    gcc-14
i386                  randconfig-013-20260309    gcc-14
i386                  randconfig-014-20260309    gcc-14
i386                  randconfig-015-20260309    gcc-14
i386                  randconfig-016-20260309    clang-20
i386                  randconfig-017-20260309    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-23
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260309    gcc-13.4.0
loongarch             randconfig-002-20260309    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20260309    gcc-10.5.0
nios2                 randconfig-002-20260309    gcc-11.5.0
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260309    gcc-8.5.0
parisc                randconfig-002-20260309    gcc-14.3.0
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    gcc-15.2.0
powerpc               randconfig-001-20260309    gcc-14.3.0
powerpc               randconfig-002-20260309    clang-23
powerpc64             randconfig-001-20260309    gcc-11.5.0
powerpc64             randconfig-002-20260309    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-23
riscv                 randconfig-001-20260308    gcc-14.3.0
riscv                 randconfig-002-20260308    clang-23
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    clang-23
s390                  randconfig-001-20260308    gcc-12.5.0
s390                  randconfig-002-20260308    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-15.2.0
sh                    randconfig-001-20260308    gcc-15.2.0
sh                    randconfig-002-20260308    gcc-15.2.0
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260308    gcc-8.5.0
sparc                 randconfig-002-20260308    gcc-11.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20260308    clang-20
sparc64               randconfig-002-20260308    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                                  defconfig    clang-23
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260308    gcc-14
um                    randconfig-002-20260308    gcc-14
um                           x86_64_defconfig    clang-23
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260309    gcc-14
x86_64      buildonly-randconfig-002-20260309    gcc-14
x86_64      buildonly-randconfig-003-20260309    clang-20
x86_64      buildonly-randconfig-004-20260309    gcc-14
x86_64      buildonly-randconfig-005-20260309    gcc-14
x86_64      buildonly-randconfig-006-20260309    clang-20
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20260309    clang-20
x86_64                randconfig-002-20260309    gcc-13
x86_64                randconfig-003-20260309    gcc-14
x86_64                randconfig-004-20260309    clang-20
x86_64                randconfig-005-20260309    gcc-14
x86_64                randconfig-006-20260309    gcc-14
x86_64                randconfig-011-20260309    clang-20
x86_64                randconfig-012-20260309    clang-20
x86_64                randconfig-013-20260309    gcc-14
x86_64                randconfig-014-20260309    gcc-14
x86_64                randconfig-015-20260309    gcc-14
x86_64                randconfig-016-20260309    gcc-12
x86_64                randconfig-071-20260309    gcc-14
x86_64                randconfig-072-20260309    gcc-14
x86_64                randconfig-073-20260309    gcc-14
x86_64                randconfig-074-20260309    clang-20
x86_64                randconfig-075-20260309    gcc-14
x86_64                randconfig-076-20260309    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.2.0
xtensa                randconfig-001-20260308    gcc-11.5.0
xtensa                randconfig-002-20260308    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
