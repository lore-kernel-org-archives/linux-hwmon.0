Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525022F34
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Oct 2024 21:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728855549; cv=none; b=M2kQLLHIRVmp3XBz4wZEq8uoB7Sej9L4Ox0m714f3TTwB7CwG92IbM9Fa7fLA/8Q1htPcI63Y3uve5f91PpRus1qDJRkKJP0crgQZqISWYjNs/xNzaKJQaYgYVI3xW1QjP/nw4aoGNgqRlob8sVJTmEeqyzNW6E1mSQCYZ5dXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728855549; c=relaxed/simple;
	bh=jXBfk43BhNOiPlS17tf5nVrmWFCQYs1+Mpbac0lhVwQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=So0K9GfvfXw9jpdRk/ugt2n6Fp3Aqm0pzJwFlmzgaFepV6/UyVD/QwnVixbxlN+fTL4ZgvEJDJlmwiRdcNQ3ZM/rOtE8eO//X5g8juCxLJf1ACLH92mGQnYX50oTA/rozqLMgcocZ4y7PKTwDBTPrdBGTa3R1J4GcgSMnMg0EDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnCWVTX5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnCWVTX5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728855547; x=1760391547;
  h=date:from:to:cc:subject:message-id;
  bh=jXBfk43BhNOiPlS17tf5nVrmWFCQYs1+Mpbac0lhVwQ=;
  b=CnCWVTX5Lpaxq6AbR003NWTzceqBpR36OSILgJj0OPvJqukivKANST1Q
   CDAG4VYCZO3wmQLKNOrdNF/nbHZnWEDK/Ry0ZJTHM6aQIANDB1GHdhZOe
   RfgoE2m9GOtEU1JBNQkRKjB2cvhlxKYQDI0yymnpzyOgTM7h3FdGYFzes
   3vrXbfpJMrLBAJqlb61tov1hfRoYeJBuJRqwoznjVNHuyu+gKXQvQEaEV
   uBCOxWqS+qYK57BJowliQYtUGaFaoGs1uVcpZ+QcEP0gD6aft522RPx92
   8DWpL9n3B+J2D0F/zBNDCGt0O22JS76HI/L56en7kza+y8FbVtt1jvIpD
   g==;
X-CSE-ConnectionGUID: H2qN5LrpSNuTvuSIWC1Wow==
X-CSE-MsgGUID: lPkctd5zSJSfsrPxYEn92A==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28281214"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="28281214"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 14:39:07 -0700
X-CSE-ConnectionGUID: mztbiwsEQUWYYCQK0PP78Q==
X-CSE-MsgGUID: aOGiKO2XRAG/CmoBbAZvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77729931"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Oct 2024 14:39:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t06Ip-000Ei7-1f;
	Sun, 13 Oct 2024 21:39:03 +0000
Date: Mon, 14 Oct 2024 05:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 031e6b6f3df1881c544eabee7a2c634c5cf3d7c5
Message-ID: <202410140520.go4R2IOk-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 031e6b6f3df1881c544eabee7a2c634c5cf3d7c5  hwmon: (nzxt-kraken2) Simplify specifying static visibility attribute

elapsed time: 2911m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              alldefconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                          ixp4xx_defconfig    clang-20
arm                          pxa3xx_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241013    clang-18
i386        buildonly-randconfig-002-20241013    gcc-12
i386        buildonly-randconfig-003-20241013    clang-18
i386        buildonly-randconfig-004-20241013    gcc-12
i386        buildonly-randconfig-005-20241013    clang-18
i386        buildonly-randconfig-006-20241013    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241013    clang-18
i386                  randconfig-002-20241013    gcc-12
i386                  randconfig-003-20241013    gcc-12
i386                  randconfig-004-20241013    gcc-11
i386                  randconfig-005-20241013    clang-18
i386                  randconfig-006-20241013    clang-18
i386                  randconfig-011-20241013    clang-18
i386                  randconfig-012-20241013    gcc-12
i386                  randconfig-013-20241013    clang-18
i386                  randconfig-014-20241013    gcc-12
i386                  randconfig-015-20241013    clang-18
i386                  randconfig-016-20241013    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath79_defconfig    clang-20
mips                           ip32_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                           allnoconfig    gcc-14.1.0
powerpc                       eiger_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                              allnoconfig    clang-20
s390                                defconfig    gcc-12
sh                                allnoconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-20
sh                          polaris_defconfig    clang-20
sh                           se7619_defconfig    clang-20
sh                   sh7724_generic_defconfig    clang-20
sh                            titan_defconfig    clang-20
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-20
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
