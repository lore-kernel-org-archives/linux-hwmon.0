Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E8F188937
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Sep 2024 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362342; cv=none; b=KYS4OpYx0FLYrQ0uoStCXSi4Q3RQby1jAK6Ba0ujAOFZrmx+cYPjYftMyDwn84Dgx9Wtz98Vk3xyGNy+bd0YJo92TuxVGTDCTC+5Xycz7a5Z6NVZ37oEapGLxpDLsctpcJGlIZmLraQcesema1qSqhEKMkhKacNN4EHAe9cjB7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362342; c=relaxed/simple;
	bh=q3WUPkL2NxwAVZj5OMz8lWrlzyjJgIwL8wsFaLLYMv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K/PGfSWAa/19UGZ7PSpWNApR7EoKvRRTfj8NkDTlVa+BmYUTvPbyyTfInL/W45PQQ4+O6oEDGl78LiLErlCaiB+/jB802GjTkMHDpuvz/Vo7Ym3uRob2KYroBCsrCbCvJHD+YVY3hm1GUCmdwdhWP7TsYYXxMjj85A7onoiF2PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgi815c1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgi815c1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725362341; x=1756898341;
  h=date:from:to:cc:subject:message-id;
  bh=q3WUPkL2NxwAVZj5OMz8lWrlzyjJgIwL8wsFaLLYMv4=;
  b=fgi815c1XrLQMq88bBDQYcf+OKhRiu4w8yZ0YFPPncdUxGcgTESUjzm5
   50K28+yxCmNuXNMWn+RzfGxsHKRBKZUvm4wUG3bLTDX5UN+AsFfOYule2
   kPIZ8gQeX5pJy1xgNeaDOGa7AdqFyv25KqA0RcEYuB2kOPHUe9McM8cau
   hfE5UI1CsqVwbAZTHl5Ne/nFr1euI3Wjtrhc9W9xdFLjE3HWc3iXdaH+i
   WPciLOPI9djkWHrJl2z3QiPLYhDJaTRfpXzlkxxvBDqGrC0Zk01y1boOP
   G9JAWSEraJ/YOkspcF1ezeWv+wHwG0JYTO6oICsRMMJEofsJDy5f1WUuW
   A==;
X-CSE-ConnectionGUID: myj8PZ2GQMadd7xB3bkQwA==
X-CSE-MsgGUID: WoxvSWEHS82CwLlk1qmcvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34562284"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="34562284"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 04:19:00 -0700
X-CSE-ConnectionGUID: KwbIL3P8QnKhNTHPKXYYkQ==
X-CSE-MsgGUID: g0KRHnWrR/aARZJ8URYdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="95607965"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Sep 2024 04:18:59 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slRYm-0006YN-35;
	Tue, 03 Sep 2024 11:18:56 +0000
Date: Tue, 03 Sep 2024 19:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 178297ec52d6715fb665804bf6a3ff09eba2d9db
Message-ID: <202409031936.ANKURDNP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 178297ec52d6715fb665804bf6a3ff09eba2d9db  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1195m

configs tested: 110
configs skipped: 4

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
arc                        nsim_700_defconfig   clang-20
arc                        nsimosci_defconfig   clang-20
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      jornada720_defconfig   clang-20
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
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240903   gcc-12
i386         buildonly-randconfig-002-20240903   gcc-12
i386         buildonly-randconfig-003-20240903   gcc-12
i386         buildonly-randconfig-004-20240903   gcc-12
i386         buildonly-randconfig-005-20240903   gcc-12
i386         buildonly-randconfig-006-20240903   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240903   gcc-12
i386                  randconfig-002-20240903   gcc-12
i386                  randconfig-003-20240903   gcc-12
i386                  randconfig-004-20240903   gcc-12
i386                  randconfig-005-20240903   gcc-12
i386                  randconfig-006-20240903   gcc-12
i386                  randconfig-011-20240903   gcc-12
i386                  randconfig-012-20240903   gcc-12
i386                  randconfig-013-20240903   gcc-12
i386                  randconfig-014-20240903   gcc-12
i386                  randconfig-015-20240903   gcc-12
i386                  randconfig-016-20240903   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                         db1xxx_defconfig   clang-20
mips                     loongson1b_defconfig   clang-20
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
powerpc                        fsp2_defconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                      pcm030_defconfig   clang-20
powerpc64                        alldefconfig   clang-20
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                ecovec24-romimage_defconfig   clang-20
sh                        edosk7760_defconfig   clang-20
sh                          r7780mp_defconfig   clang-20
sh                           se7619_defconfig   clang-20
sh                           se7721_defconfig   clang-20
sh                   sh7724_generic_defconfig   clang-20
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
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
