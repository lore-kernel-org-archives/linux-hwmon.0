Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ADD1FFC77
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jan 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736357641; cv=none; b=ISArZ+xd3kMXoxlFLyohycCQBPI+HWVyhI0ASaaqegkwUvo9cGrypCyAtNBbvzrRdU7GOt3HJyir6VJ5JPWn5MhlxLHJnnk0nDKupVF6PKJaOdMU+eVd9JXg6WBcC02m6j2/S3An/ZxbZP+8QglcOjp6sBiXnqFLlCSw+86uUYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736357641; c=relaxed/simple;
	bh=EY2dmME9k4SvE/CzJc4QZ4/KtzP9FXeP6lJY/ZZTQQg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GuR8Tn4Lb16TWw4+r9kU35EOnV0ybWjg/hrcRmzcjtQhyW/bjaHsSkYPTN1SRcyOksMfVKXjd7zIa0qYO26gNK3axvIh9UpqnjhBmccmprVE4Dcgqx9L1HHOqqjmgeNfVGhmg1cxW1yh0KeuwcYS+k3DC6dpOyzCSbhRult/gOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ks9X8kgR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ks9X8kgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736357640; x=1767893640;
  h=date:from:to:cc:subject:message-id;
  bh=EY2dmME9k4SvE/CzJc4QZ4/KtzP9FXeP6lJY/ZZTQQg=;
  b=ks9X8kgRAhb6r/U1nkRw9skdkz0f7uVq/RZmbkkGYsDpUjUrP/0Bo+DO
   wA7ayfg2G2dIIOkHBhFBGoERkb83kdcG2WHoxsVri8UudB7jplb+RNYe4
   FQMkCQMJT7J+d/9GFB+RqS5pCqcFWxa1PgEUSrLqx+Kdi1pwO2t0EA+uk
   eJl7aIi0DuBXSfqHPQFThSKtB98MCJIiDeUdcIWC8qIE6DF5+gF0dcqCQ
   zUWmnOhFTM8I5rBTmo7K7YG/DKyN3sg0I1uZl7cjZIDO98DbBzJn/46T6
   NL97oWWkBV+sEeWTpZmPYrInc03EfWW3JAhYl1hrMr44J2ZkqeXa6FJ/v
   Q==;
X-CSE-ConnectionGUID: seErU+88Tq+91KZN1kA3CQ==
X-CSE-MsgGUID: qv3+giovRqqTLZEG/d7cAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47264439"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47264439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 09:33:58 -0800
X-CSE-ConnectionGUID: kLA8RqczT8m25/N8pMcHlg==
X-CSE-MsgGUID: rmPZYcy0R+mMJhrkdgZowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103101415"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jan 2025 09:33:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVZwF-000GSJ-0F;
	Wed, 08 Jan 2025 17:33:51 +0000
Date: Thu, 09 Jan 2025 01:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 adc52dd4078067fabf1431036ba180eafd8a7eee
Message-ID: <202501090147.EE4o4d5a-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: adc52dd4078067fabf1431036ba180eafd8a7eee  hwmon: (pmbus/adm1275) add adm1273 support

elapsed time: 1416m

configs tested: 112
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-13.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250108    gcc-13.2.0
arc                   randconfig-002-20250108    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250108    gcc-14.2.0
arm                   randconfig-002-20250108    gcc-14.2.0
arm                   randconfig-003-20250108    clang-20
arm                   randconfig-004-20250108    clang-18
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250108    gcc-14.2.0
arm64                 randconfig-002-20250108    clang-20
arm64                 randconfig-003-20250108    gcc-14.2.0
arm64                 randconfig-004-20250108    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250108    gcc-14.2.0
csky                  randconfig-002-20250108    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20250108    clang-20
hexagon               randconfig-002-20250108    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250108    clang-19
i386        buildonly-randconfig-002-20250108    gcc-12
i386        buildonly-randconfig-003-20250108    gcc-12
i386        buildonly-randconfig-004-20250108    gcc-12
i386        buildonly-randconfig-005-20250108    gcc-12
i386        buildonly-randconfig-006-20250108    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250108    gcc-14.2.0
loongarch             randconfig-002-20250108    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250108    gcc-14.2.0
nios2                 randconfig-002-20250108    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250108    gcc-14.2.0
parisc                randconfig-002-20250108    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc               randconfig-001-20250108    clang-16
powerpc               randconfig-002-20250108    gcc-14.2.0
powerpc               randconfig-003-20250108    gcc-14.2.0
powerpc                     skiroot_defconfig    clang-20
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250108    clang-18
powerpc64             randconfig-002-20250108    clang-16
powerpc64             randconfig-003-20250108    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20250108    gcc-14.2.0
riscv                 randconfig-002-20250108    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250108    gcc-14.2.0
s390                  randconfig-002-20250108    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250108    gcc-14.2.0
sh                    randconfig-002-20250108    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250108    gcc-14.2.0
sparc                 randconfig-002-20250108    gcc-14.2.0
sparc64               randconfig-001-20250108    gcc-14.2.0
sparc64               randconfig-002-20250108    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250108    gcc-12
um                    randconfig-002-20250108    clang-16
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250108    clang-19
x86_64      buildonly-randconfig-002-20250108    gcc-11
x86_64      buildonly-randconfig-003-20250108    clang-19
x86_64      buildonly-randconfig-004-20250108    gcc-12
x86_64      buildonly-randconfig-005-20250108    gcc-12
x86_64      buildonly-randconfig-006-20250108    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250108    gcc-14.2.0
xtensa                randconfig-002-20250108    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
