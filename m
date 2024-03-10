Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FEC12B89
	for <linux-hwmon@vger.kernel.org>; Sun, 10 Mar 2024 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710078973; cv=none; b=j8FfN8ScvD4oCnusMrTreb071sCaV7wmS/Uyqh29pUs7GzCgMEVgnYGflFOnrcppAxDSgxsJ0XjugpX9nmgq0SgIBGuTAiqLiClqnD92xrsOEI8X8aZQRE2rguwf5AOEjCi9AeoUOT0xj3WEdR/ts4bUYO+kHTJdHBWqX7/FbJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710078973; c=relaxed/simple;
	bh=gJZBRUzr5lcesIdimvJI4r78IHobStf7gY+xogjuMA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HgGOogyyLlTu3ireI+GW98wI9zcWFYETHeMRGJ+4PizOIBeV3qEJk2z+6k6IR6tCLkKl+ruTVnpr1cm8QLflXeqKo+Vl6VEHMu6CQteJJ9Z0sYExoNkU9wDyuCNLB+H0LGN8vv10KuK3QbfGtTTvrB8r4zqVMDYW8yWPda0nmfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEw+vdB2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEw+vdB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710078971; x=1741614971;
  h=date:from:to:cc:subject:message-id;
  bh=gJZBRUzr5lcesIdimvJI4r78IHobStf7gY+xogjuMA8=;
  b=UEw+vdB2XkJNUlLNTKFNz8Hdbd+ZmV+cd4povRCbrWHZeGkM40Yj1WpB
   jpDbV+DqjIxiI8+fYZeUSVwEpFtmYvj5R1rG10OI5m6uzsCL2H7hJiqSl
   28sDDpsQycAZcVFMKYmbOr32qKPg3bTukGZ+SL9u1PGAs2ydXD2RbO6lT
   7J2jcsZTCt/wdkMqLzwXoBgu1Qyy/IUVQCTjiKc0J7ftylz1pPQdgKIfY
   IvF7pwJQukzdCwbhS6HMFtRRtwaoTj7h+hn55YyockSZRd3DzGqbWHZL4
   dHN0l0veQpPCgJmfPWA6JIIOGPK8i4pWO0awc8F9SFQUeiQmB+n6zwd5b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="16153931"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="16153931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 06:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15570824"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Mar 2024 06:56:09 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjJeo-0008Hv-30;
	Sun, 10 Mar 2024 13:56:06 +0000
Date: Sun, 10 Mar 2024 21:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 8c479238c1e6d59df10a9b464e15213d19a420d3
Message-ID: <202403102158.Dsaw93Ra-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 8c479238c1e6d59df10a9b464e15213d19a420d3  Merge branch 'kunit' into testing

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-randconfig-001-20240310
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- csky-randconfig-002-20240310
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- loongarch-randconfig-002-20240310
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- powerpc-randconfig-001-20240310
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- sh-randconfig-002-20240310
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
`-- um-randconfig-001-20240310
    `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
clang_recent_errors
|-- arm64-randconfig-004-20240310
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
`-- s390-randconfig-002-20240310
    `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner

elapsed time: 725m

configs tested: 180
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240310   gcc  
arc                   randconfig-002-20240310   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                   randconfig-001-20240310   gcc  
arm                   randconfig-002-20240310   gcc  
arm                   randconfig-003-20240310   gcc  
arm                   randconfig-004-20240310   gcc  
arm                           sama7_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240310   clang
arm64                 randconfig-002-20240310   gcc  
arm64                 randconfig-003-20240310   clang
arm64                 randconfig-004-20240310   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240310   gcc  
csky                  randconfig-002-20240310   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240310   clang
hexagon               randconfig-002-20240310   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240310   clang
i386         buildonly-randconfig-002-20240310   clang
i386         buildonly-randconfig-003-20240310   clang
i386         buildonly-randconfig-004-20240310   clang
i386         buildonly-randconfig-005-20240310   gcc  
i386         buildonly-randconfig-006-20240310   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240310   gcc  
i386                  randconfig-002-20240310   gcc  
i386                  randconfig-003-20240310   clang
i386                  randconfig-004-20240310   gcc  
i386                  randconfig-005-20240310   gcc  
i386                  randconfig-006-20240310   gcc  
i386                  randconfig-011-20240310   clang
i386                  randconfig-012-20240310   clang
i386                  randconfig-013-20240310   clang
i386                  randconfig-014-20240310   clang
i386                  randconfig-015-20240310   clang
i386                  randconfig-016-20240310   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240310   gcc  
loongarch             randconfig-002-20240310   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240310   gcc  
nios2                 randconfig-002-20240310   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240310   gcc  
parisc                randconfig-002-20240310   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 canyonlands_defconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                       ppc64_defconfig   clang
powerpc               randconfig-001-20240310   gcc  
powerpc               randconfig-002-20240310   clang
powerpc               randconfig-003-20240310   clang
powerpc64             randconfig-001-20240310   gcc  
powerpc64             randconfig-002-20240310   gcc  
powerpc64             randconfig-003-20240310   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240310   gcc  
riscv                 randconfig-002-20240310   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240310   clang
s390                  randconfig-002-20240310   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240310   gcc  
sh                    randconfig-002-20240310   gcc  
sh                           se7705_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240310   gcc  
sparc64               randconfig-002-20240310   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240310   gcc  
um                    randconfig-002-20240310   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240310   clang
x86_64       buildonly-randconfig-002-20240310   gcc  
x86_64       buildonly-randconfig-003-20240310   clang
x86_64       buildonly-randconfig-004-20240310   gcc  
x86_64       buildonly-randconfig-005-20240310   clang
x86_64       buildonly-randconfig-006-20240310   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240310   clang
x86_64                randconfig-002-20240310   gcc  
x86_64                randconfig-003-20240310   gcc  
x86_64                randconfig-004-20240310   gcc  
x86_64                randconfig-005-20240310   clang
x86_64                randconfig-006-20240310   gcc  
x86_64                randconfig-011-20240310   gcc  
x86_64                randconfig-012-20240310   clang
x86_64                randconfig-013-20240310   clang
x86_64                randconfig-014-20240310   gcc  
x86_64                randconfig-015-20240310   clang
x86_64                randconfig-016-20240310   gcc  
x86_64                randconfig-071-20240310   gcc  
x86_64                randconfig-072-20240310   gcc  
x86_64                randconfig-073-20240310   gcc  
x86_64                randconfig-074-20240310   gcc  
x86_64                randconfig-075-20240310   clang
x86_64                randconfig-076-20240310   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240310   gcc  
xtensa                randconfig-002-20240310   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
