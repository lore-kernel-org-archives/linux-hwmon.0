Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA9199FA4
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Dec 2024 10:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951225; cv=none; b=hRSCGRFDhbr1b6WFANxMkCbw4ftn/nMiAAbwRq4GVXq97n8ZWcVbdzYv8bu5e/rHpFOwxVmHj1RBw0oGInsDEp77k6UewCxeKTdx/oO6soW3cHLMzrjV9AY/cQ1kNSpa/ojaOue3vsFie8yapZxbd026gjj1azzf8I521TZA4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951225; c=relaxed/simple;
	bh=XL+xVbsqsR9P53P7OgMcTwYK7rm+lQ4pqBDpdlxD9yE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sYa12A08rRdK92CQSJww5PeyfsLG0I1ur6zhdcAogiWnZrwUGcPsgF/+fzG9IkIg6XsnQtNMLmsGui9glqAUB/89GaZ06gIBELQ+GAddSPDDbPPOLMvaxphf3yaa5fVn7T2Ex9DwBJ1FXSUB9vSfRcMS7bbmcip4iEvHT9GW/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMa7j7eT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMa7j7eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734951223; x=1766487223;
  h=date:from:to:cc:subject:message-id;
  bh=XL+xVbsqsR9P53P7OgMcTwYK7rm+lQ4pqBDpdlxD9yE=;
  b=nMa7j7eTl9HbG8krIZUG65bD021RaLkjlTveXmlywWTA77gezuqP8Jqt
   G0JtlvEQQxqjg8OmA1MtYI1GJBk3mQP8O0Ddc8X0w3KboWK0yFYz+C59v
   pQbU/3NbUUgMLVgEo28jqqS7vpncUJC5ncUUDvfQJS91O2+c1Jueb8AtK
   0MD26WBeEIZr1Yfw23PxCIcjoe0IGrXuev+nZArXHdFk5Nu0Xcot2et7E
   jeuvsVdyEEfeYwcnJT23Q9fXFlcmjRJ/kGc5s/SZiLRjslApfXCMzdrzF
   eNhCEmN7Fc4N3m2P+xF2haGIGqyrkHQezz8hUXuk3LhrJI8UcBIAicxcd
   A==;
X-CSE-ConnectionGUID: 61wYLWMHQHyyQdwM80x9Og==
X-CSE-MsgGUID: 5SuBFgtwQrK23fwFTqlIog==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="23002451"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="23002451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 02:53:42 -0800
X-CSE-ConnectionGUID: dnUwIc4+QMiVC6JFM5uZ8A==
X-CSE-MsgGUID: iTrKVSN6SjKWtcrPn+nC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="99393608"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2024 02:53:41 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPg4B-0003Y5-13;
	Mon, 23 Dec 2024 10:53:39 +0000
Date: Mon, 23 Dec 2024 18:53:30 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 6071d10413ff8489c3e842b19b1e0d539700068d
Message-ID: <202412231815.ondgJt3m-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 6071d10413ff8489c3e842b19b1e0d539700068d  hwmon: (lm75) add I3C support for P3T1755

elapsed time: 980m

configs tested: 127
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.2.0
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                   randconfig-001-20241223    gcc-13.2.0
arc                   randconfig-002-20241223    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                            mmp2_defconfig    gcc-14.2.0
arm                        multi_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20241223    gcc-14.2.0
arm                   randconfig-004-20241223    gcc-14.2.0
arm                        spear3xx_defconfig    clang-16
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241223    gcc-14.2.0
arm64                 randconfig-002-20241223    clang-18
arm64                 randconfig-003-20241223    gcc-14.2.0
arm64                 randconfig-004-20241223    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241223    gcc-14.2.0
csky                  randconfig-002-20241223    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                             defconfig    clang-20
hexagon               randconfig-001-20241223    clang-19
hexagon               randconfig-002-20241223    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-004-20241223    gcc-12
i386        buildonly-randconfig-005-20241223    clang-19
i386        buildonly-randconfig-006-20241223    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241223    gcc-14.2.0
loongarch             randconfig-002-20241223    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-20
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241223    gcc-14.2.0
nios2                 randconfig-002-20241223    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241223    gcc-14.2.0
parisc                randconfig-002-20241223    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                      pmac32_defconfig    clang-20
powerpc               randconfig-001-20241223    clang-18
powerpc               randconfig-002-20241223    clang-16
powerpc               randconfig-003-20241223    clang-20
powerpc64             randconfig-001-20241223    gcc-14.2.0
powerpc64             randconfig-002-20241223    clang-18
powerpc64             randconfig-003-20241223    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-002-20241223    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-002-20241223    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241223    gcc-14.2.0
sh                    randconfig-002-20241223    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    gcc-14.2.0
sh                             shx3_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241223    gcc-14.2.0
sparc                 randconfig-002-20241223    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-002-20241223    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241223    clang-16
um                    randconfig-002-20241223    gcc-12
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241223    gcc-12
x86_64      buildonly-randconfig-002-20241223    clang-19
x86_64      buildonly-randconfig-003-20241223    clang-19
x86_64      buildonly-randconfig-004-20241223    gcc-12
x86_64      buildonly-randconfig-005-20241223    gcc-12
x86_64      buildonly-randconfig-006-20241223    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
