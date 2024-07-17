Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7817FABD
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224897; cv=none; b=Hcqi1wLCsCsF//qsw8/zyp6qqT9xESJpNDkAkuLLhLRl+KDmZH7yw/aq97JnbzIUgiHUieUgBcBrdE5z+6X6GKM5ECdcwKtQA/YMS0X+Jd7WHUp46TG2cKDQG4rIl0S021a1hCCM8c1v22MrMu+BMNe6cTPMUI4HTbMrKcfaGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224897; c=relaxed/simple;
	bh=l8ba4Cmmx5UKoPVWQaRo9GK5RU3G1zfG88/+Alfh0sY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nSD3ps64wF8vRg5lk08zc01XH3YMxKj2C0JqDr3aDm0Y4RWaaWqUKuAi1fr3oPfQlaiANuEHlnkhi6eIgGcJ4iuaEpZmLtjuB7ZMqShdzUJV0duKKCWNJYqF+r42Kgdnk72Khkz+eTDjXZCroxrBnjc85TUWDupJkpnlWaNkGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EsTVni2w; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EsTVni2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721224895; x=1752760895;
  h=date:from:to:cc:subject:message-id;
  bh=l8ba4Cmmx5UKoPVWQaRo9GK5RU3G1zfG88/+Alfh0sY=;
  b=EsTVni2wU+d0zYuv5SHk1GvD1pSTjZdmOZQy0B1JHXW0fVvf9QfwnFfK
   hL2Rmv/qMHQvvh939Fxkw5/hYAqQjfy6UeS4vqMjwloEvQ+piSK8ex8XP
   guEZtoerGDxNQb8/cBjNH+wTQeMVJc0vRsF/nW4YDjP0MsBce8cqc7lVg
   Hm2VBHlxMSXu46k9vfDcMDsZLyE4h1vWjgJep7NzudEOxrR7h/iNsCpv6
   G8Lfxk2N0pP8k4RBBVZ9d48M6jWsctVkw+GteHUuXf7FM8NpuI9z32ntc
   oei+k0Z8OQLUOb6eyCZklubLeIhBVIvKBTxoUzI3DVS6W86Jjma9NTsJx
   Q==;
X-CSE-ConnectionGUID: v3A168NgQvKc3qgUBVRmrQ==
X-CSE-MsgGUID: pojKzYkLRY6lb2JA3HgqjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18595010"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18595010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 07:01:15 -0700
X-CSE-ConnectionGUID: K+rZDX2GQ5mD+AZCfrGbjA==
X-CSE-MsgGUID: mpYFJ1geTcuT12XLzXQCEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50141960"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2024 07:01:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU5DT-000gMc-14;
	Wed, 17 Jul 2024 14:01:11 +0000
Date: Wed, 17 Jul 2024 22:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 b0ec72a402521754aa56307cd63561e4bba6cf35
Message-ID: <202407172204.VkQnPR8J-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: b0ec72a402521754aa56307cd63561e4bba6cf35  Merge branch 'kunit-improvements' into testing

elapsed time: 913m

configs tested: 141
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240717   gcc-13.2.0
arc                   randconfig-002-20240717   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240717   gcc-14.1.0
arm                   randconfig-002-20240717   gcc-14.1.0
arm                   randconfig-003-20240717   gcc-14.1.0
arm                   randconfig-004-20240717   clang-19
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240717   gcc-14.1.0
arm64                 randconfig-002-20240717   clang-19
arm64                 randconfig-003-20240717   clang-16
arm64                 randconfig-004-20240717   clang-19
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240717   gcc-14.1.0
csky                  randconfig-002-20240717   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240717   clang-19
hexagon               randconfig-002-20240717   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240717   clang-18
i386         buildonly-randconfig-002-20240717   gcc-13
i386         buildonly-randconfig-003-20240717   gcc-13
i386         buildonly-randconfig-004-20240717   gcc-13
i386         buildonly-randconfig-005-20240717   gcc-10
i386         buildonly-randconfig-006-20240717   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240717   gcc-8
i386                  randconfig-002-20240717   clang-18
i386                  randconfig-003-20240717   clang-18
i386                  randconfig-004-20240717   gcc-8
i386                  randconfig-005-20240717   gcc-10
i386                  randconfig-006-20240717   gcc-13
i386                  randconfig-011-20240717   gcc-9
i386                  randconfig-012-20240717   gcc-13
i386                  randconfig-013-20240717   clang-18
i386                  randconfig-014-20240717   clang-18
i386                  randconfig-015-20240717   clang-18
i386                  randconfig-016-20240717   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240717   gcc-14.1.0
loongarch             randconfig-002-20240717   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240717   gcc-14.1.0
nios2                 randconfig-002-20240717   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240717   gcc-14.1.0
parisc                randconfig-002-20240717   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240717   clang-19
powerpc               randconfig-002-20240717   gcc-14.1.0
powerpc               randconfig-003-20240717   clang-19
powerpc64             randconfig-001-20240717   gcc-14.1.0
powerpc64             randconfig-002-20240717   gcc-14.1.0
powerpc64             randconfig-003-20240717   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240717   clang-19
riscv                 randconfig-002-20240717   clang-17
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240717   gcc-14.1.0
s390                  randconfig-002-20240717   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240717   gcc-14.1.0
sh                    randconfig-002-20240717   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240717   gcc-14.1.0
sparc64               randconfig-002-20240717   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240717   gcc-8
um                    randconfig-002-20240717   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240717   gcc-13
x86_64       buildonly-randconfig-002-20240717   gcc-13
x86_64       buildonly-randconfig-003-20240717   gcc-13
x86_64       buildonly-randconfig-004-20240717   clang-18
x86_64       buildonly-randconfig-005-20240717   clang-18
x86_64       buildonly-randconfig-006-20240717   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240717   gcc-7
x86_64                randconfig-002-20240717   gcc-9
x86_64                randconfig-003-20240717   clang-18
x86_64                randconfig-004-20240717   gcc-9
x86_64                randconfig-005-20240717   clang-18
x86_64                randconfig-006-20240717   gcc-11
x86_64                randconfig-011-20240717   gcc-8
x86_64                randconfig-012-20240717   clang-18
x86_64                randconfig-013-20240717   gcc-12
x86_64                randconfig-014-20240717   gcc-10
x86_64                randconfig-015-20240717   clang-18
x86_64                randconfig-016-20240717   clang-18
x86_64                randconfig-071-20240717   gcc-12
x86_64                randconfig-072-20240717   clang-18
x86_64                randconfig-073-20240717   gcc-10
x86_64                randconfig-074-20240717   gcc-13
x86_64                randconfig-075-20240717   gcc-13
x86_64                randconfig-076-20240717   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-002-20240717   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
