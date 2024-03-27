Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1067380
	for <linux-hwmon@vger.kernel.org>; Wed, 27 Mar 2024 03:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711510395; cv=none; b=F44bOGEU5yAz+Ce0f2xMfb8V6pgNEeldtoyqIbSD8UikvEQJzdXZ+mmFgSKhCLkWz3dfIx/fJG4cawylEctZDTeGxwb0vqtZXJPtP3hR9YnJSa9AKAljJVemaLDtkfIRaUF074z4Qy6YUzPs7Y4+jzLnvhaKAkEzdyser3e0gBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711510395; c=relaxed/simple;
	bh=dnUEnwbBHc5/xkauUCdrGnU/m25waCzMvceTgjCidAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RRNbrNrF596I6eHx14y6NuPw+9Fbm9I8ChkzGvTrLgQpNyccX0NHxYPJTxLEwMhoJha0W8iGUeq49+nNac512/t5O4xajb1QBgThTPLTj+DUx1fP/dJ56sc0PKTPR8FI3olKCZjRfIvjV3WA9rpXh7/Jar3k7WT1Mg+TFIQf0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hif2kkY4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hif2kkY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711510394; x=1743046394;
  h=date:from:to:cc:subject:message-id;
  bh=dnUEnwbBHc5/xkauUCdrGnU/m25waCzMvceTgjCidAI=;
  b=hif2kkY4i0Q+TQBxGP8j3XpwMLoR/56625BLHXUJ0PHI3nfE21e5PU5y
   1NaRFOIhbciAxEFOZOS5uCU6cIb3oOZaZZR8lXYtuGJQAntRtRpYpXke7
   ORRixGYkUkFZyRSoMazaFRBGMP/nbIFjO8LBcMVrngoNCpD5+dWb0yBN2
   CMz4TOKqQ91lVgQ/M0O9u3i747vwduIA5G9hcaDmMbbu6WLRrYyQ06DgG
   zjLR+xjs7HNPF8eJqrvLhWnPs8E9zMrOdSTt0a2CKMJU35E2G2P3Pgidt
   MqoRv/PgBqt80QL+KPgayUNnPkMXowwwE/XtCitdVTnaG0u3PNDfDnbds
   g==;
X-CSE-ConnectionGUID: 8uK6z6OMSgGnaI4q80pflQ==
X-CSE-MsgGUID: Rf6HXX/ZSYa/9tUQS0S6TA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24035029"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="24035029"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 20:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20711078"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2024 20:33:12 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpK2H-0000ho-2b;
	Wed, 27 Mar 2024 03:33:09 +0000
Date: Wed, 27 Mar 2024 11:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 826eb58fbd777f986d69da15d0f60f774470aa00
Message-ID: <202403271159.78b5rUHe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 826eb58fbd777f986d69da15d0f60f774470aa00  hwmon: (pmbus/mp2975) Use i2c_get_match_data()

elapsed time: 750m

configs tested: 162
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
arc                   randconfig-001-20240327   gcc  
arc                   randconfig-002-20240327   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240327   clang
arm                   randconfig-002-20240327   clang
arm                   randconfig-003-20240327   clang
arm                   randconfig-004-20240327   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240327   clang
arm64                 randconfig-002-20240327   clang
arm64                 randconfig-003-20240327   gcc  
arm64                 randconfig-004-20240327   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240327   gcc  
csky                  randconfig-002-20240327   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240327   clang
hexagon               randconfig-002-20240327   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240327   gcc  
i386         buildonly-randconfig-002-20240327   gcc  
i386         buildonly-randconfig-003-20240327   clang
i386         buildonly-randconfig-004-20240327   clang
i386         buildonly-randconfig-005-20240327   clang
i386         buildonly-randconfig-006-20240327   clang
i386                                defconfig   clang
i386                  randconfig-001-20240327   gcc  
i386                  randconfig-002-20240327   gcc  
i386                  randconfig-003-20240327   clang
i386                  randconfig-004-20240327   gcc  
i386                  randconfig-005-20240327   clang
i386                  randconfig-006-20240327   gcc  
i386                  randconfig-011-20240327   gcc  
i386                  randconfig-012-20240327   clang
i386                  randconfig-013-20240327   gcc  
i386                  randconfig-014-20240327   clang
i386                  randconfig-015-20240327   gcc  
i386                  randconfig-016-20240327   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240327   gcc  
loongarch             randconfig-002-20240327   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240327   gcc  
nios2                 randconfig-002-20240327   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240327   gcc  
parisc                randconfig-002-20240327   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240327   clang
powerpc               randconfig-002-20240327   gcc  
powerpc               randconfig-003-20240327   clang
powerpc64             randconfig-001-20240327   clang
powerpc64             randconfig-002-20240327   gcc  
powerpc64             randconfig-003-20240327   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240327   clang
riscv                 randconfig-002-20240327   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240327   clang
s390                  randconfig-002-20240327   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240327   gcc  
sh                    randconfig-002-20240327   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240327   gcc  
sparc64               randconfig-002-20240327   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240327   clang
um                    randconfig-002-20240327   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240327   gcc  
x86_64       buildonly-randconfig-002-20240327   gcc  
x86_64       buildonly-randconfig-003-20240327   gcc  
x86_64       buildonly-randconfig-004-20240327   clang
x86_64       buildonly-randconfig-005-20240327   gcc  
x86_64       buildonly-randconfig-006-20240327   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240327   clang
x86_64                randconfig-002-20240327   gcc  
x86_64                randconfig-003-20240327   gcc  
x86_64                randconfig-004-20240327   gcc  
x86_64                randconfig-005-20240327   clang
x86_64                randconfig-006-20240327   clang
x86_64                randconfig-011-20240327   gcc  
x86_64                randconfig-012-20240327   clang
x86_64                randconfig-013-20240327   clang
x86_64                randconfig-014-20240327   clang
x86_64                randconfig-015-20240327   clang
x86_64                randconfig-016-20240327   clang
x86_64                randconfig-071-20240327   gcc  
x86_64                randconfig-072-20240327   clang
x86_64                randconfig-073-20240327   clang
x86_64                randconfig-074-20240327   clang
x86_64                randconfig-075-20240327   clang
x86_64                randconfig-076-20240327   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240327   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
