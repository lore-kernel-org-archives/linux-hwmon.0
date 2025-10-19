Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436511096F
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Oct 2025 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861913; cv=none; b=hhcV5aSB9IPl4gDWIPT3iENZPeQ4ud2KbvuAcJIbROt1Ce917RcLZuP0EmpBzFlGaEw/lym56mnxeFg4QLBFNagT3CLPE6LPMDcgn/5yqBeYFYXf+dTdbaYggJKUvDogAIsH7qTuSkJKSFkCsTRsyvln5xOTHOjvTpfedy7Dm8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861913; c=relaxed/simple;
	bh=CkKfMzvkEyvKMHzNwULvOaEof1VvDqUa5OWRMdSm9jo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PJaTyKZrU93ZwDreISApmXFGi7n3O0KYBSvVGSlVGNlbSw5UyPJpGcZQiZXhY6mb7I36J667bjTWFTQ5fmF4iWvTOEjuwJ0oZGNREhQgbXxoqk1+j3BZnDVsGhKYi5q17b1m10zPI9tHVl1/fWoEhg7eQ9M0ibVLCu3uW1io7oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDGZ3Ls5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDGZ3Ls5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760861912; x=1792397912;
  h=date:from:to:cc:subject:message-id;
  bh=CkKfMzvkEyvKMHzNwULvOaEof1VvDqUa5OWRMdSm9jo=;
  b=aDGZ3Ls5YoqrEgHJNjbtC4LC32ezyvPPbH/Yk21DbBlkGCVLTXjTHH/I
   X4gRYftJvocZMlxtroBN4sOAFxznyMYDkPYlEpm9aowcCW9UzQtmJ8GGp
   xWH9fuzwEQODqogzytwkyXAabxczdwa0cdNGVfzNYgtpp+QyZUP264lQy
   JcYI9QUoPKgPMXkZeuZbId+OIdYBWZAx3aV5m5v/osN/o9D9ayWgkX7S6
   ZCrGCcAM0TCCQ6/MRbEZhPy8AdfAS5XErSZnxsIJ6+cwxUmvCSY5BhZck
   ZxU8CYzgyCSyNalrvrATfofMgPeHtB1FlPCVVBh05/AQ7X8hMxj6Jnopy
   g==;
X-CSE-ConnectionGUID: 1Wcg/oMERUaE5fjyvpbPLw==
X-CSE-MsgGUID: iEVbFb90TcahysXCvnkFbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74454615"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="74454615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 01:18:32 -0700
X-CSE-ConnectionGUID: s6509NHcTwuoQCpyF9Wp1A==
X-CSE-MsgGUID: 2T5eS5+/RkOMVOLO1AOr+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="182793465"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2025 01:18:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAOcD-0008wr-34;
	Sun, 19 Oct 2025 08:18:17 +0000
Date: Sun, 19 Oct 2025 16:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 65bc97a5e49ea4174ba7e89afdada3e30e6e39c0
Message-ID: <202510191618.TJuPTJCY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 65bc97a5e49ea4174ba7e89afdada3e30e6e39c0  Update maxim-ic.com links to analog.com

elapsed time: 1058m

configs tested: 128
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251018    gcc-12.5.0
arc                   randconfig-002-20251018    gcc-8.5.0
arc                           tb10x_defconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                         axm55xx_defconfig    clang-22
arm                          exynos_defconfig    clang-22
arm                        multi_v7_defconfig    gcc-15.1.0
arm                       omap2plus_defconfig    gcc-15.1.0
arm                   randconfig-001-20251018    clang-19
arm                   randconfig-002-20251018    clang-20
arm                   randconfig-003-20251018    clang-22
arm                   randconfig-004-20251018    gcc-15.1.0
arm                         vf610m4_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20251018    gcc-8.5.0
arm64                 randconfig-002-20251018    clang-22
arm64                 randconfig-003-20251018    gcc-13.4.0
arm64                 randconfig-004-20251018    gcc-11.5.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20251018    gcc-9.5.0
csky                  randconfig-002-20251018    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20251018    clang-22
hexagon               randconfig-002-20251018    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251018    gcc-14
i386        buildonly-randconfig-002-20251018    gcc-14
i386        buildonly-randconfig-003-20251018    clang-20
i386        buildonly-randconfig-004-20251018    gcc-14
i386        buildonly-randconfig-005-20251018    clang-20
i386        buildonly-randconfig-006-20251018    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251018    clang-22
loongarch             randconfig-002-20251018    gcc-13.4.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251018    gcc-11.5.0
nios2                 randconfig-002-20251018    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251018    gcc-10.5.0
parisc                randconfig-002-20251018    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251018    clang-22
powerpc               randconfig-002-20251018    clang-22
powerpc               randconfig-003-20251018    gcc-14.3.0
powerpc64             randconfig-001-20251018    gcc-10.5.0
powerpc64             randconfig-002-20251018    gcc-12.5.0
powerpc64             randconfig-003-20251018    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20251019    clang-19
riscv                 randconfig-002-20251019    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251019    gcc-8.5.0
s390                  randconfig-002-20251019    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251019    gcc-15.1.0
sh                    randconfig-002-20251019    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251019    gcc-11.5.0
sparc                 randconfig-002-20251019    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251019    gcc-8.5.0
sparc64               randconfig-002-20251019    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251019    gcc-13
um                    randconfig-002-20251019    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251018    gcc-14
x86_64      buildonly-randconfig-002-20251018    gcc-14
x86_64      buildonly-randconfig-003-20251018    gcc-14
x86_64      buildonly-randconfig-004-20251018    gcc-14
x86_64      buildonly-randconfig-005-20251018    gcc-14
x86_64      buildonly-randconfig-006-20251018    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                          iss_defconfig    gcc-15.1.0
xtensa                randconfig-001-20251019    gcc-14.3.0
xtensa                randconfig-002-20251019    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
