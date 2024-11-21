Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA944C6F
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 03:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732159954; cv=none; b=EjkpGXH7ZLsftS/O2JfFbheUSfDrIYRj5fbDRUUGurSEiJb1w+BJeCBS4NSQBFsViBtJJC+qOFCjONTJpozt/i1g8sMq12KaqMSA+O0Boy3p5Hgp8msy0qQSwQWsedSbKDi24aGgOltDox29N9fdpgZAXCswS9fjfDDjN5YzjZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732159954; c=relaxed/simple;
	bh=FahZSEP+N6e7Q1ih4oEKLBYVeHcwLCzGppiE00cfFlA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VSs+tWDudNhnPP1BfwN/dUMoGNZG2xVXrdUmFmNzngZAKkG11Z4mlaMM/OB7GzCz6BF9VflYgokQui0XfYYfvTh92+SVTJJCp3SIj9YrzpksZhQx2fUO+7m6E19gA0ZB0kz127js35CV18JP/wXZCD3BF7PYvExqw4hfo6xQK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvYkWUxT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvYkWUxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732159952; x=1763695952;
  h=date:from:to:cc:subject:message-id;
  bh=FahZSEP+N6e7Q1ih4oEKLBYVeHcwLCzGppiE00cfFlA=;
  b=TvYkWUxTFL1RhSwyMIz+Ss6OGQBMUe5Nwf9joCiMo7F06VSEpA9H041v
   jFTZRGqwYp0nBtUgwH8EeN54BxNCOFVKABV83RD4PHi0eGPtNNmOJwpD/
   2wvoVbUFBG6Pg8RgZI8uSwGNK9TgVENeVbWogc2FGeCxEUXkVhtrrnbmZ
   D0Eo+okgoN+bL5qEYh0KCFkNzHG2AIsuxEGWUgApAB7TDFZ/REtfV2ikE
   +RNqfkjWwu7PcepE6sY9J2TxjN9gy7zo+RckvJKYk91zjv0M59KRdSHDO
   cflFY5hsA4yIDHrrnSGyGTmn8Y9Uy3DGzkORqCjpDHcbk/8xKlkJcxpB/
   w==;
X-CSE-ConnectionGUID: aZP6YujWTvmWUGstOQIoUQ==
X-CSE-MsgGUID: eihz2WMlQJuAsIOAVBlvUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="19838984"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="19838984"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 19:32:32 -0800
X-CSE-ConnectionGUID: BLoTtXTiS8+Remwxvgaqjw==
X-CSE-MsgGUID: 6HrPTG8mSZ2FDTg4CBMcpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; 
   d="scan'208";a="127650957"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2024 19:32:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDxvg-0001bD-2w;
	Thu, 21 Nov 2024 03:32:28 +0000
Date: Thu, 21 Nov 2024 11:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 06bfc0d9cd85458378e67c82c27383e0a013a3d6
Message-ID: <202411211108.XJWSx2NA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: 06bfc0d9cd85458378e67c82c27383e0a013a3d6  io_uring: add separate freeptr type for slab

elapsed time: 1442m

configs tested: 79
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
alpha                  allyesconfig    gcc-14.2.0
arc                    allmodconfig    gcc-13.2.0
arc                     allnoconfig    gcc-13.2.0
arc                    allyesconfig    gcc-13.2.0
arc         randconfig-001-20241121    gcc-13.2.0
arc         randconfig-002-20241121    gcc-13.2.0
arm                    allmodconfig    gcc-14.2.0
arm                     allnoconfig    clang-20
arm                    allyesconfig    gcc-14.2.0
arm         randconfig-001-20241121    clang-20
arm         randconfig-002-20241121    gcc-14.2.0
arm         randconfig-003-20241121    clang-20
arm         randconfig-004-20241121    gcc-14.2.0
arm64                  allmodconfig    clang-20
arm64                   allnoconfig    gcc-14.2.0
arm64       randconfig-001-20241121    clang-20
arm64       randconfig-002-20241121    clang-20
arm64       randconfig-003-20241121    gcc-14.2.0
arm64       randconfig-004-20241121    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
csky        randconfig-001-20241121    gcc-14.2.0
csky        randconfig-002-20241121    gcc-14.2.0
hexagon                allmodconfig    clang-20
hexagon                 allnoconfig    clang-20
hexagon                allyesconfig    clang-20
hexagon     randconfig-001-20241121    clang-20
hexagon     randconfig-002-20241121    clang-15
i386                   allmodconfig    gcc-12
i386                    allnoconfig    gcc-12
loongarch              allmodconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
loongarch   randconfig-001-20241121    gcc-14.2.0
loongarch   randconfig-002-20241121    gcc-14.2.0
m68k                   allmodconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
m68k                   allyesconfig    gcc-14.2.0
microblaze             allmodconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
microblaze             allyesconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
nios2       randconfig-001-20241121    gcc-14.2.0
nios2       randconfig-002-20241121    gcc-14.2.0
openrisc                allnoconfig    gcc-14.2.0
openrisc               allyesconfig    gcc-14.2.0
parisc                 allmodconfig    gcc-14.2.0
parisc                  allnoconfig    gcc-14.2.0
parisc                 allyesconfig    gcc-14.2.0
parisc      randconfig-001-20241121    gcc-14.2.0
parisc      randconfig-002-20241121    gcc-14.2.0
powerpc                allmodconfig    gcc-14.2.0
powerpc                 allnoconfig    gcc-14.2.0
powerpc     randconfig-001-20241121    clang-15
powerpc     randconfig-002-20241121    gcc-14.2.0
powerpc     randconfig-003-20241121    clang-20
powerpc64   randconfig-001-20241121    gcc-14.2.0
powerpc64   randconfig-002-20241121    clang-20
powerpc64   randconfig-003-20241121    clang-20
riscv                   allnoconfig    gcc-14.2.0
riscv       randconfig-001-20241121    gcc-14.2.0
riscv       randconfig-002-20241121    gcc-14.2.0
s390                   allmodconfig    clang-20
s390                    allnoconfig    clang-20
s390                   allyesconfig    gcc-14.2.0
s390        randconfig-001-20241121    gcc-14.2.0
s390        randconfig-002-20241121    clang-20
sh                     allmodconfig    gcc-14.2.0
sh                     allyesconfig    gcc-14.2.0
sh          randconfig-001-20241121    gcc-14.2.0
sh          randconfig-002-20241121    gcc-14.2.0
sparc                  allmodconfig    gcc-14.2.0
um                     allmodconfig    clang-20
um                      allnoconfig    clang-17
um                     allyesconfig    gcc-12
x86_64                  allnoconfig    clang-19
x86_64                    defconfig    gcc-11
x86_64                        kexec    clang-19
x86_64                     rhel-9.4    gcc-12

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
