Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6838F84
	for <linux-hwmon@vger.kernel.org>; Mon, 11 Mar 2024 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710153832; cv=none; b=IkSxhCt1OEugZ+1+zSVjYDn2tKt42L4N6jEd76u4fH3MeJGnFG95ABSX1Q8ONL7FwcDjEwElV6oMDQp1E2z7c7nzgR5D/umv6hIyLaziJBox9KqeJEMtaD7vEWbeXqzKSLPcGjW7+3FBH4z8+HIXcSEVQHN52Yl+GQ0NNnR/fxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710153832; c=relaxed/simple;
	bh=/oGPNd78MGPQhX79AZ9E/JJ0F0nKa9ThhrcF6IWkR4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sy7t2B32FaBTxDrrmHHhEWW9y9pFqrQYR4YgWJY7ulnEJU1i/6DngnJFjvN30w0WonSAVMVgJ6nWxZW12WwwStZYOAokrnzfvUT0aWWuHqzQfggalvBJEjqtLr1Gz/7DAhLpb/HjJe3yY9Xr1rk/0KY1isGs+Flmtv6QucES8E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrSaRcaW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrSaRcaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710153831; x=1741689831;
  h=date:from:to:cc:subject:message-id;
  bh=/oGPNd78MGPQhX79AZ9E/JJ0F0nKa9ThhrcF6IWkR4k=;
  b=ZrSaRcaWioyMiFucsUFdDyMbtG7DOhcV6ZtVBf6600pAv0y/b1gG4IAX
   mplB6s5mrUVlw/sAjZOSemXW4dDbDPk9qOZvglum/amGpoqRQjio2zZ4A
   vBiQERx2zcOnaGVeXQWsAvlDyVlBTvLgXlMRBj+dxgkbMpXH+Uc1RjAAn
   S/oBjUu3g67p+vF/+gpw85QtBz7guODwgoH9PkpNGOvkqnZwlM/y4PF4d
   NYYi2rMIoJU8G1/20+dC8PEPcQ9TQCRE4bAyaF7oP5O+2mwvF8pjtbhUa
   bcrTIRGI5O4eVSaUXfE2IB/+XWIYwiGvAvM67b5xvmtC456Q6J9y3a95C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22329694"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="22329694"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 03:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15688611"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2024 03:43:42 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjd87-000951-1Y;
	Mon, 11 Mar 2024 10:43:39 +0000
Date: Mon, 11 Mar 2024 18:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 2dd1ce85e685cdd70d33db902a52ebe4095b1ebd
Message-ID: <202403111807.OUTR0AoQ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 2dd1ce85e685cdd70d33db902a52ebe4095b1ebd  Merge branch 'kunit' into testing

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- nios2-randconfig-002-20240311
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- s390-randconfig-002-20240311
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- sparc64-randconfig-002-20240311
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
`-- xtensa-randconfig-001-20240311
    `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
clang_recent_errors
|-- i386-buildonly-randconfig-003-20240311
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
|-- powerpc64-randconfig-001-20240311
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
`-- x86_64-buildonly-randconfig-003-20240311
    `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner

elapsed time: 727m

configs tested: 175
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240311   gcc  
arc                   randconfig-002-20240311   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                   randconfig-001-20240311   clang
arm                   randconfig-002-20240311   gcc  
arm                   randconfig-003-20240311   clang
arm                   randconfig-004-20240311   clang
arm                       spear13xx_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240311   clang
arm64                 randconfig-002-20240311   clang
arm64                 randconfig-003-20240311   clang
arm64                 randconfig-004-20240311   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240311   gcc  
csky                  randconfig-002-20240311   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240311   clang
hexagon               randconfig-002-20240311   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240311   clang
i386         buildonly-randconfig-002-20240311   clang
i386         buildonly-randconfig-003-20240311   clang
i386         buildonly-randconfig-004-20240311   gcc  
i386         buildonly-randconfig-005-20240311   clang
i386         buildonly-randconfig-006-20240311   clang
i386                                defconfig   clang
i386                  randconfig-001-20240311   gcc  
i386                  randconfig-002-20240311   gcc  
i386                  randconfig-003-20240311   clang
i386                  randconfig-004-20240311   clang
i386                  randconfig-005-20240311   gcc  
i386                  randconfig-006-20240311   clang
i386                  randconfig-011-20240311   gcc  
i386                  randconfig-012-20240311   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240311   gcc  
loongarch             randconfig-002-20240311   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                          multi_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240311   gcc  
nios2                 randconfig-002-20240311   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240311   gcc  
parisc                randconfig-002-20240311   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 linkstation_defconfig   clang
powerpc               randconfig-001-20240311   gcc  
powerpc               randconfig-002-20240311   clang
powerpc               randconfig-003-20240311   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-001-20240311   clang
powerpc64             randconfig-002-20240311   clang
powerpc64             randconfig-003-20240311   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240311   clang
riscv                 randconfig-002-20240311   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240311   clang
s390                  randconfig-002-20240311   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240311   gcc  
sh                    randconfig-002-20240311   gcc  
sh                          rsk7203_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240311   gcc  
sparc64               randconfig-002-20240311   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240311   gcc  
um                    randconfig-002-20240311   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240311   clang
x86_64       buildonly-randconfig-002-20240311   clang
x86_64       buildonly-randconfig-003-20240311   clang
x86_64       buildonly-randconfig-004-20240311   gcc  
x86_64       buildonly-randconfig-005-20240311   clang
x86_64       buildonly-randconfig-006-20240311   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240311   clang
x86_64                randconfig-002-20240311   clang
x86_64                randconfig-003-20240311   gcc  
x86_64                randconfig-004-20240311   gcc  
x86_64                randconfig-005-20240311   gcc  
x86_64                randconfig-006-20240311   clang
x86_64                randconfig-011-20240311   clang
x86_64                randconfig-012-20240311   clang
x86_64                randconfig-013-20240311   clang
x86_64                randconfig-014-20240311   gcc  
x86_64                randconfig-015-20240311   clang
x86_64                randconfig-016-20240311   gcc  
x86_64                randconfig-071-20240311   gcc  
x86_64                randconfig-072-20240311   clang
x86_64                randconfig-073-20240311   clang
x86_64                randconfig-074-20240311   gcc  
x86_64                randconfig-075-20240311   clang
x86_64                randconfig-076-20240311   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240311   gcc  
xtensa                randconfig-002-20240311   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
