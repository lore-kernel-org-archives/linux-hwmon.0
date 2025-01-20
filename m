Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5421D1E32DB
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jan 2025 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737399708; cv=none; b=DUJoaLwCni/blI5bmrAo6rYegvtbZZAyPc5nW+sJFAogREP14W7PboEjHqHM1pkvZG5t7N8MCAQcDb0CVL0OyMzECmy0DPgl3LS8qGzZx/FdHx7W9ybi08kWY4YKDw0bCxCL2GHQzsA0Iifa2uEveFo5fvHBgFySb1U84OWj6S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737399708; c=relaxed/simple;
	bh=Kwgg5RqC39flF5UExn+sBVhVceuuJ1hH27JkTozL3NI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L6ZC/kjOT/gIf3/yCyzA7sdZo3OweUSYHu1lrZhbWZWNc0WS0giS8zN7VGvoccc4V00RSwaW4hjaVaG01MtNd7g6iQ5kh4P7mySMCk9kbZ0BG8JApI+StJu628iTL5bzm49kI91r0DRVZToYjMB0DLE8nzbWPaY1mRanY8/FZCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=el5Ezu5y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="el5Ezu5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737399707; x=1768935707;
  h=date:from:to:cc:subject:message-id;
  bh=Kwgg5RqC39flF5UExn+sBVhVceuuJ1hH27JkTozL3NI=;
  b=el5Ezu5yCFkchMO+AYZJvGzIKBOJqZaSV2ioF5f9cZGooh/Xe93rU7td
   BdQPqoEvTsGERII+bjh6AbkfmgjKts0iBRbrOkx9qz9jVZaezGktvs57q
   5RLjWHMZeipW9M+MzJT3VfoFJc7QwW7P6FZ/wi2e53X0nDCN0zHlmXvQq
   UZ647Ctd/SW0ZnNHTK7pf+eyF1cQvc5hysiZfuAhY6NMP4pNZ5lpw2dVZ
   zmMXdxF1W8IMcWa/zC9WkNyDIqLXBf4kQZZCd3sgLHiGtO7skHuMPkJ0t
   duWOPFkZS7PM7NEtRmqKT8sL9tmBk3Z7IsTsPK+07oafP63xV4rlJmtzU
   g==;
X-CSE-ConnectionGUID: eFVs8kK1QjqjF/HIQntnLg==
X-CSE-MsgGUID: g0bjtgwbTyyka4Q6IKZn7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37679958"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="37679958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 11:01:46 -0800
X-CSE-ConnectionGUID: QEpf9zrXRa68dXqBxRL6dg==
X-CSE-MsgGUID: yH29oonaTgaZWy9eH6MJzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="107134832"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jan 2025 11:01:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZx1q-000Wt8-2B;
	Mon, 20 Jan 2025 19:01:42 +0000
Date: Tue, 21 Jan 2025 03:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 6ef7ed375191f1ffa60503439699b78ac0d764ac
Message-ID: <202501210350.aB0q1Y2N-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 6ef7ed375191f1ffa60503439699b78ac0d764ac  Merge branch 'fixes-v6.13' into testing

elapsed time: 939m

configs tested: 129
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250120    gcc-13.2.0
arc                   randconfig-002-20250120    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    clang-17
arm                            mmp2_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-15
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20250120    clang-20
arm                   randconfig-002-20250120    clang-20
arm                   randconfig-003-20250120    clang-20
arm                   randconfig-004-20250120    clang-19
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250120    gcc-14.2.0
arm64                 randconfig-002-20250120    clang-20
arm64                 randconfig-003-20250120    clang-19
arm64                 randconfig-004-20250120    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250120    gcc-14.2.0
csky                  randconfig-002-20250120    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250120    clang-20
hexagon               randconfig-002-20250120    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250120    gcc-11
i386        buildonly-randconfig-002-20250120    clang-19
i386        buildonly-randconfig-003-20250120    gcc-12
i386        buildonly-randconfig-004-20250120    gcc-12
i386        buildonly-randconfig-005-20250120    clang-19
i386        buildonly-randconfig-006-20250120    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250120    gcc-14.2.0
loongarch             randconfig-002-20250120    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                           gcw0_defconfig    clang-15
mips                           ip27_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250120    gcc-14.2.0
nios2                 randconfig-002-20250120    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250120    gcc-14.2.0
parisc                randconfig-002-20250120    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc8313_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-18
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250120    clang-20
powerpc               randconfig-002-20250120    clang-20
powerpc               randconfig-003-20250120    clang-20
powerpc64             randconfig-001-20250120    clang-19
powerpc64             randconfig-002-20250120    clang-17
powerpc64             randconfig-003-20250120    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250120    clang-20
riscv                 randconfig-002-20250120    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250120    gcc-14.2.0
s390                  randconfig-002-20250120    clang-18
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250120    gcc-14.2.0
sh                    randconfig-002-20250120    gcc-14.2.0
sh                           se7724_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250120    gcc-14.2.0
sparc                 randconfig-002-20250120    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250120    gcc-14.2.0
sparc64               randconfig-002-20250120    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250120    clang-15
um                    randconfig-002-20250120    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250120    clang-19
x86_64      buildonly-randconfig-002-20250120    clang-19
x86_64      buildonly-randconfig-003-20250120    gcc-12
x86_64      buildonly-randconfig-004-20250120    clang-19
x86_64      buildonly-randconfig-005-20250120    clang-19
x86_64      buildonly-randconfig-006-20250120    gcc-11
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250120    gcc-14.2.0
xtensa                randconfig-002-20250120    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
