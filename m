Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917D17721
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Jun 2024 16:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718125199; cv=none; b=qm/YEf2PrA7v5AdzY4fNT+z1Vz37nnMDnqw6lKtyXvMoW95dZCOHWiWlh014MflC2eeJyjmV17Aly12IHDWTvsx8KomFe/WfHES45at+8GFY8l/lDxZCOjF1Y+FNJUmLsbykZyywklLzmHDhqnFmOz9X0yATF4FiEhXI9/ks/Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718125199; c=relaxed/simple;
	bh=6woUHitATisDcEVJ8mbCvhIbbUiWDisvLbJs0noK/Fo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l5eRvEocx1u3JdnpNljYEMbMI0akecP1Fo/Xr9jrJ35e8BKA3Y4qSXZJU7W4p77ort+vL+AdQSjPr5YdrS+3vFcbRZMjTJRQCk+p+RqC66HOYCQuu1CO4DqzdVtq3mXkxIioJiN6c4dJD7GMM2a1XT5LEIyWG/Mdh8E+cfg8XP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDGFSF+A; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDGFSF+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718125197; x=1749661197;
  h=date:from:to:cc:subject:message-id;
  bh=6woUHitATisDcEVJ8mbCvhIbbUiWDisvLbJs0noK/Fo=;
  b=oDGFSF+AEEN3bPW3dAVgKeI1StIT1ozK97vltUE3B2sR3s7LCtAADPsg
   FAtZjqjh9otF/e0m5keVBGefYfcFpI/q2Gfgk+LnJcYVMpaE0V8YlyeP6
   zVHIITCeFlqk9NBGmJ1EaErV3gsnhxZUd3gicCDZgEeOTolrcg5CoIikC
   Fd1OAJOOk7XIZEYp2wFEtza5r9H85LFBuzPnXQNCrDt6sxnLanBawgskY
   nB0XqtqqaHwObfuaAJ7oG5e/1eBhm4+JfZgqpvJtHMLrj2u7hPd6RiFs/
   icspOZVLdGk7UeKxnyu+ukwk0ZDYodG/ksRy4VkM2gsnK7GP9wH72fEY4
   w==;
X-CSE-ConnectionGUID: 96Ufxq0fTbWG6Y0fGgOvyQ==
X-CSE-MsgGUID: 9khnOb6xSxOLBMimD5vUPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="25525871"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="25525871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:59:49 -0700
X-CSE-ConnectionGUID: /2XhnERKQmG3B1AUzkSoxQ==
X-CSE-MsgGUID: ZVsARPYzReKEwcVwHUMruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="76961392"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2024 09:59:49 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH4qY-0000gc-0s;
	Tue, 11 Jun 2024 16:59:46 +0000
Date: Wed, 12 Jun 2024 00:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 582749a7b636330393918ab9c2de53aa4242200a
Message-ID: <202406120015.AMDfWlor-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: 582749a7b636330393918ab9c2de53aa4242200a  sysfs: Unbreak the build around sysfs_bin_attr_simple_read()

elapsed time: 1458m

configs tested: 147
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240611   gcc-13.2.0
arc                   randconfig-002-20240611   gcc-13.2.0
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240611   gcc-13.2.0
arm                   randconfig-002-20240611   clang-19
arm                   randconfig-003-20240611   clang-15
arm                   randconfig-004-20240611   clang-19
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240611   clang-19
arm64                 randconfig-002-20240611   clang-17
arm64                 randconfig-003-20240611   clang-19
arm64                 randconfig-004-20240611   gcc-13.2.0
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240611   gcc-13.2.0
csky                  randconfig-002-20240611   gcc-13.2.0
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240611   clang-19
hexagon               randconfig-002-20240611   clang-14
i386         buildonly-randconfig-001-20240611   gcc  
i386         buildonly-randconfig-002-20240611   gcc  
i386         buildonly-randconfig-003-20240611   clang
i386         buildonly-randconfig-004-20240611   gcc  
i386         buildonly-randconfig-005-20240611   gcc  
i386         buildonly-randconfig-006-20240611   gcc  
i386                  randconfig-001-20240611   clang
i386                  randconfig-002-20240611   gcc  
i386                  randconfig-003-20240611   gcc  
i386                  randconfig-004-20240611   clang
i386                  randconfig-005-20240611   gcc  
i386                  randconfig-006-20240611   clang
i386                  randconfig-011-20240611   clang
i386                  randconfig-012-20240611   gcc  
i386                  randconfig-013-20240611   clang
i386                  randconfig-014-20240611   gcc  
i386                  randconfig-015-20240611   clang
i386                  randconfig-016-20240611   clang
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240611   gcc-13.2.0
loongarch             randconfig-002-20240611   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240611   gcc-13.2.0
nios2                 randconfig-002-20240611   gcc-13.2.0
openrisc                          allnoconfig   gcc  
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc  
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc  
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc  
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240611   gcc-13.2.0
parisc                randconfig-002-20240611   gcc-13.2.0
parisc64                            defconfig   gcc  
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc  
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240611   gcc-13.2.0
powerpc               randconfig-002-20240611   clang-19
powerpc               randconfig-003-20240611   clang-19
powerpc64             randconfig-001-20240611   gcc-13.2.0
powerpc64             randconfig-002-20240611   clang-19
powerpc64             randconfig-003-20240611   clang-19
riscv                             allnoconfig   gcc  
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang
riscv                 randconfig-001-20240611   gcc-13.2.0
riscv                 randconfig-002-20240611   clang-19
s390                              allnoconfig   clang
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang
s390                  randconfig-001-20240611   gcc-13.2.0
s390                  randconfig-002-20240611   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc  
sh                    randconfig-001-20240611   gcc-13.2.0
sh                    randconfig-002-20240611   gcc-13.2.0
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240611   gcc-13.2.0
sparc64               randconfig-002-20240611   gcc-13.2.0
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240611   gcc-11
um                    randconfig-002-20240611   gcc-13
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang-18
x86_64       buildonly-randconfig-001-20240611   gcc-13
x86_64       buildonly-randconfig-002-20240611   gcc-9
x86_64       buildonly-randconfig-003-20240611   gcc-13
x86_64       buildonly-randconfig-004-20240611   clang-18
x86_64       buildonly-randconfig-005-20240611   gcc-9
x86_64       buildonly-randconfig-006-20240611   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240611   clang-18
x86_64                randconfig-002-20240611   gcc-12
x86_64                randconfig-003-20240611   gcc-8
x86_64                randconfig-004-20240611   clang-18
x86_64                randconfig-005-20240611   gcc-10
x86_64                randconfig-006-20240611   clang-18
x86_64                randconfig-011-20240611   clang-18
x86_64                randconfig-012-20240611   gcc-13
x86_64                randconfig-013-20240611   clang-18
x86_64                randconfig-014-20240611   clang-18
x86_64                randconfig-015-20240611   clang-18
x86_64                randconfig-016-20240611   gcc-11
x86_64                randconfig-071-20240611   clang-18
x86_64                randconfig-072-20240611   gcc-9
x86_64                randconfig-073-20240611   clang-18
x86_64                randconfig-074-20240611   gcc-11
x86_64                randconfig-075-20240611   gcc-13
x86_64                randconfig-076-20240611   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240611   gcc-13.2.0
xtensa                randconfig-002-20240611   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
