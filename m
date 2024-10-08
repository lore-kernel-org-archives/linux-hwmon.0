Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A89B23A6
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Oct 2024 05:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728363878; cv=none; b=GQf9LcLnNmCA7x9BDxlHuCmE8upAUndhxazuPrV7AS6vpgSzHBmWih//DdxLpN2/WwSUatur+M+1sNkHI/P59o7cgpbv/VfSZBXCOeo5gyCTKFbFNhfzmHlPduZZdBeTZlKUjDS7Gn3kLa9P6it9/enSOQ7Oxrw1qXDZfDt4T7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728363878; c=relaxed/simple;
	bh=WGAl9uGB9VtTOIWUYz/9H0sZ4Pz3bpJyePUXLnpdaBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SBl3cw4FhbfvOeUfboBv+ypO50SpS2cftgzLl6mACgw281rUs4xrrQVseZ/ViLRs36m6oOiRD+gT0ZSpnn+f6dqud1wVC8EH37XWTmoqZ/kGDHE0jTkTeJTLxMWpds5DMXjoq2gh356AzX0rSTT9R4ZvhLLKCjOzALUboLeUoVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P19bsfJP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P19bsfJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728363877; x=1759899877;
  h=date:from:to:cc:subject:message-id;
  bh=WGAl9uGB9VtTOIWUYz/9H0sZ4Pz3bpJyePUXLnpdaBI=;
  b=P19bsfJP7P1o4jH06dfz+WMS7/qAyDqMpHvs/Mdc8wKiIxBhEq/FfrlI
   kY9xlZkGS6tRYUF/KW+F5aOnuAKgDtb6bDQmvZi/7f0G8/doFUHJsel/h
   bpRvbC1U+XoPjS2IGjuGKuIRQldm9N7iuB5EETGPdKEChZjWkCZo5z+PF
   +/IWqt7yMki3yv59xSnV3/8szmOIUn9d0ivY7LCWoC8Juv4XPlefDnooT
   pNN3sqzMjX3Gu56p7LvfSckeXc8ru/lK101IKsVRAUYnMSaoXXncL34OX
   lQIZiWo4B7TxSNIdqB0tmKmGhG/Iv/3DYDASIZLnGQ/URLW6AlAwnbYyj
   g==;
X-CSE-ConnectionGUID: /nXb0sUqRw+wQjdNml7GJA==
X-CSE-MsgGUID: JFphSgaUSfipHArE1hkIqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27416911"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27416911"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 22:04:36 -0700
X-CSE-ConnectionGUID: DWQ069ORQEuHqrRZuMQonQ==
X-CSE-MsgGUID: IX6ZA91HTdiuLqEzaqmDaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="75269698"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Oct 2024 22:04:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy2Oe-0005vA-20;
	Tue, 08 Oct 2024 05:04:32 +0000
Date: Tue, 08 Oct 2024 13:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 2d6c668902e5834f54d7eb673318455492730cbf
Message-ID: <202410081340.qJV71dLc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 2d6c668902e5834f54d7eb673318455492730cbf  hwmon: (max1668) Add missing dependency on REGMAP_I2C

elapsed time: 778m

configs tested: 178
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                   randconfig-001-20241008    gcc-14.1.0
arc                   randconfig-002-20241008    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                          pxa3xx_defconfig    gcc-14.1.0
arm                   randconfig-001-20241008    gcc-14.1.0
arm                   randconfig-002-20241008    gcc-14.1.0
arm                   randconfig-003-20241008    gcc-14.1.0
arm                   randconfig-004-20241008    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241008    gcc-14.1.0
arm64                 randconfig-002-20241008    gcc-14.1.0
arm64                 randconfig-003-20241008    gcc-14.1.0
arm64                 randconfig-004-20241008    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241008    gcc-14.1.0
csky                  randconfig-002-20241008    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241008    gcc-14.1.0
hexagon               randconfig-002-20241008    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241008    clang-18
i386        buildonly-randconfig-002-20241008    clang-18
i386        buildonly-randconfig-003-20241008    clang-18
i386        buildonly-randconfig-004-20241008    clang-18
i386        buildonly-randconfig-005-20241008    clang-18
i386        buildonly-randconfig-006-20241008    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241008    clang-18
i386                  randconfig-002-20241008    clang-18
i386                  randconfig-003-20241008    clang-18
i386                  randconfig-004-20241008    clang-18
i386                  randconfig-005-20241008    clang-18
i386                  randconfig-006-20241008    clang-18
i386                  randconfig-011-20241008    clang-18
i386                  randconfig-012-20241008    clang-18
i386                  randconfig-013-20241008    clang-18
i386                  randconfig-014-20241008    clang-18
i386                  randconfig-015-20241008    clang-18
i386                  randconfig-016-20241008    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241008    gcc-14.1.0
loongarch             randconfig-002-20241008    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          hp300_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                      loongson3_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241008    gcc-14.1.0
nios2                 randconfig-002-20241008    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
openrisc                       virt_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241008    gcc-14.1.0
parisc                randconfig-002-20241008    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                       eiger_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                     ppa8548_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241008    gcc-14.1.0
powerpc               randconfig-002-20241008    gcc-14.1.0
powerpc               randconfig-003-20241008    gcc-14.1.0
powerpc                     tqm8540_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241008    gcc-14.1.0
powerpc64             randconfig-002-20241008    gcc-14.1.0
powerpc64             randconfig-003-20241008    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241008    gcc-14.1.0
riscv                 randconfig-002-20241008    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241008    gcc-14.1.0
s390                  randconfig-002-20241008    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.1.0
sh                    randconfig-001-20241008    gcc-14.1.0
sh                    randconfig-002-20241008    gcc-14.1.0
sh                           se7712_defconfig    gcc-14.1.0
sh                           se7780_defconfig    gcc-14.1.0
sparc                            alldefconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241008    gcc-14.1.0
sparc64               randconfig-002-20241008    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241008    gcc-14.1.0
um                    randconfig-002-20241008    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241008    gcc-12
x86_64      buildonly-randconfig-002-20241008    gcc-12
x86_64      buildonly-randconfig-003-20241008    gcc-12
x86_64      buildonly-randconfig-004-20241008    gcc-12
x86_64      buildonly-randconfig-005-20241008    gcc-12
x86_64      buildonly-randconfig-006-20241008    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241008    gcc-12
x86_64                randconfig-002-20241008    gcc-12
x86_64                randconfig-003-20241008    gcc-12
x86_64                randconfig-004-20241008    gcc-12
x86_64                randconfig-005-20241008    gcc-12
x86_64                randconfig-006-20241008    gcc-12
x86_64                randconfig-011-20241008    gcc-12
x86_64                randconfig-012-20241008    gcc-12
x86_64                randconfig-013-20241008    gcc-12
x86_64                randconfig-014-20241008    gcc-12
x86_64                randconfig-015-20241008    gcc-12
x86_64                randconfig-016-20241008    gcc-12
x86_64                randconfig-071-20241008    gcc-12
x86_64                randconfig-072-20241008    gcc-12
x86_64                randconfig-073-20241008    gcc-12
x86_64                randconfig-074-20241008    gcc-12
x86_64                randconfig-075-20241008    gcc-12
x86_64                randconfig-076-20241008    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241008    gcc-14.1.0
xtensa                randconfig-002-20241008    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
