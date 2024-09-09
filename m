Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABED1BAEC1
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Sep 2024 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892986; cv=none; b=TEq93T2zRws6v7eJcW5BRyscuR7DqG1eWqVHrVH1ds30JnM+immItHouN+FofN4S1L/t25Alb5i7isQ49CUeDKr9bGRn5wRoU+D2U2dW1LHYQ2nWClKx6je50MmGwp9O3cW7aixufctQh9WvIyW3WOxVOaS9qVbBy7aiF6aHbYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892986; c=relaxed/simple;
	bh=pmVno2Xle88T+W27x3g404CGwT//c6W/xR8CM45JKPk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sX8aiINSHq+4iTyFGLxTp0vvEEDbpMPLv8cTAXBhLLs/duVQ5/PDVg4ywpXT/mHoZNH2uyBXE/dJXzr/O8PSQv9sZm+5ah+gGgmsjhoGpPwkQOxkFkYamZXkrUt0yaXTas7olLHDLJ1/V+VQsALQ3/RPAV8eGNYFlzfs960eCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWPXqn3Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWPXqn3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725892985; x=1757428985;
  h=date:from:to:cc:subject:message-id;
  bh=pmVno2Xle88T+W27x3g404CGwT//c6W/xR8CM45JKPk=;
  b=PWPXqn3QCp1DD0ZI0MmP8Lf+SGfQl1BSWu8XzWgjm1YbhmoDBmszEKNJ
   j4l4ZIjAp6SzIjbJ/zMSiy3gXT6/7YSgr9YNXuCyrRQyX2OQyZzJijnM6
   yhHhLwUhOb+cAkY59cmQwOb1zmg62NVOx8kuAjOsUbAaNE0wr9X7vnUsR
   iXtMJgbydyaG4G1VsL51d95pPj9OgLUZ0bTcTnW8UCsaVCEF5CCL5wqYY
   zghaL7597RondC98fYmB34RSCTH60gKIQ1n1y/fPKBhwdVOH4ddesef9C
   7NnO+ew7hsA4haAipxdmH04LZdR1W9/TjMwwCLU+5UHWacIrKLrcMgvQ/
   g==;
X-CSE-ConnectionGUID: 0IaHGjUjQDuk3XBKrL23uw==
X-CSE-MsgGUID: p/Bxrba6T8etFs4SpGnXEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28476913"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="28476913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 07:42:26 -0700
X-CSE-ConnectionGUID: ahx/3GhhRz6d+MUzKzds7Q==
X-CSE-MsgGUID: SyeY3JpQS3OZnOlJ0LBV3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="67215523"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2024 07:42:25 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snfaw-000Eqg-2r;
	Mon, 09 Sep 2024 14:42:22 +0000
Date: Mon, 09 Sep 2024 22:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 4a13a8a310eec777677e1644f3a555cb08c5c057
Message-ID: <202409092244.8CivsAGT-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 4a13a8a310eec777677e1644f3a555cb08c5c057  Merge branch 'fixes-v6.11' into testing

elapsed time: 1097m

configs tested: 145
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              alldefconfig   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         bcm2835_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      jornada720_defconfig   clang-20
arm                       multi_v4t_defconfig   clang-20
arm                        mvebu_v7_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240909   clang-18
i386         buildonly-randconfig-002-20240909   clang-18
i386         buildonly-randconfig-002-20240909   gcc-12
i386         buildonly-randconfig-003-20240909   clang-18
i386         buildonly-randconfig-003-20240909   gcc-12
i386         buildonly-randconfig-004-20240909   clang-18
i386         buildonly-randconfig-004-20240909   gcc-12
i386         buildonly-randconfig-005-20240909   clang-18
i386         buildonly-randconfig-006-20240909   clang-18
i386         buildonly-randconfig-006-20240909   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240909   clang-18
i386                  randconfig-002-20240909   clang-18
i386                  randconfig-002-20240909   gcc-12
i386                  randconfig-003-20240909   clang-18
i386                  randconfig-004-20240909   clang-18
i386                  randconfig-004-20240909   gcc-12
i386                  randconfig-005-20240909   clang-18
i386                  randconfig-006-20240909   clang-18
i386                  randconfig-011-20240909   clang-18
i386                  randconfig-012-20240909   clang-18
i386                  randconfig-013-20240909   clang-18
i386                  randconfig-013-20240909   gcc-12
i386                  randconfig-014-20240909   clang-18
i386                  randconfig-015-20240909   clang-18
i386                  randconfig-016-20240909   clang-18
i386                  randconfig-016-20240909   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         amcore_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
m68k                        m5272c3_defconfig   clang-20
m68k                       m5475evb_defconfig   clang-20
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           gcw0_defconfig   clang-20
mips                      maltasmvp_defconfig   clang-20
mips                       rbtx49xx_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     kmeter1_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                    socrates_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                          debug_defconfig   clang-20
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                           se7780_defconfig   clang-20
sh                              ul2_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240909   gcc-12
x86_64       buildonly-randconfig-002-20240909   gcc-12
x86_64       buildonly-randconfig-003-20240909   gcc-12
x86_64       buildonly-randconfig-004-20240909   gcc-12
x86_64       buildonly-randconfig-005-20240909   gcc-12
x86_64       buildonly-randconfig-006-20240909   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240909   gcc-12
x86_64                randconfig-002-20240909   gcc-12
x86_64                randconfig-003-20240909   gcc-12
x86_64                randconfig-004-20240909   gcc-12
x86_64                randconfig-005-20240909   gcc-12
x86_64                randconfig-006-20240909   gcc-12
x86_64                randconfig-011-20240909   gcc-12
x86_64                randconfig-012-20240909   gcc-12
x86_64                randconfig-013-20240909   gcc-12
x86_64                randconfig-014-20240909   gcc-12
x86_64                randconfig-015-20240909   gcc-12
x86_64                randconfig-016-20240909   gcc-12
x86_64                randconfig-071-20240909   gcc-12
x86_64                randconfig-072-20240909   gcc-12
x86_64                randconfig-073-20240909   gcc-12
x86_64                randconfig-074-20240909   gcc-12
x86_64                randconfig-075-20240909   gcc-12
x86_64                randconfig-076-20240909   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
