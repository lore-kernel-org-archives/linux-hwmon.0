Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE85660
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Jun 2024 23:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719705030; cv=none; b=Ej2PyjLVjblguFMEx0tETypgyWnI8Ps5yztivqQmPvzLqEJIvYLvHVrxbx4NY/k9njKaf5M5XbUc7wzfTpqreq/q+zAFVpW4Mb29felz7CFUHccmon0a3nsXCuYQQeyMcjJ4rBMeU9A+vVQd/zqqg8qaV9Zg2jV4wyEl7I7JYWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719705030; c=relaxed/simple;
	bh=wVzIyHEVYZK6JBZ3fcY52s3oMbflm48jJ6QHx11vEtw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TOTRFiqNMCrl4YGqpWXFr+jjEIQec9F0ryq1qcdFW4pSAsr6x3dXL5S0W+G9vwuPRLDL1V+/cbfaoSFBVsqGteuZOoK4YaLnWuNb4yLbzvEx6XI6lqdNrZ+IwXV79sGlmhqUHSaaQTlq+ltqB4dahkchLIVJQcDfhpVXJGWHZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBybrJ8h; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBybrJ8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719705028; x=1751241028;
  h=date:from:to:cc:subject:message-id;
  bh=wVzIyHEVYZK6JBZ3fcY52s3oMbflm48jJ6QHx11vEtw=;
  b=QBybrJ8h6/CG0ZBirPNbgJJCmp5zI8B5Jv8+IwPAo1uvrpIRnNB/6Tk9
   iPbQUvI3mLh9jG/bJeWlZO+D5FPKHOh1sNW76vUkwp9j0gHT+yBkBGI/1
   R/2W6D4SDuisnY40/OUEuCWEzlT9FZYmsOgGZcdLGbFIaZFVHMjDxOQxm
   mhtaqTegYVa8BpheqeHEf4C6QsP9VvFZzO0gkxvjzIP6GuqoQkMpxCtVF
   2mUqXdKYc6XXDsoKevkJY/SN9fLyARBWuV90+QhEJCpoLV72+YV/cmHu0
   CCNG6qYcDKqnH+ro5dhY+W4qmM8tlVR0DDZvjG9cj9g/MxaNE9eAMpjT2
   A==;
X-CSE-ConnectionGUID: IWlgATOeRViTFOH7pNWDmA==
X-CSE-MsgGUID: MrzVp5NrR3KMZg7VgIxFdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11118"; a="34297530"
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; 
   d="scan'208";a="34297530"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2024 16:50:27 -0700
X-CSE-ConnectionGUID: hgQqYK4oRQC1kSAjF3mxYw==
X-CSE-MsgGUID: Qfw3H6g5QOmomakiBGexmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,173,1716274800"; 
   d="scan'208";a="49996939"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jun 2024 16:50:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNhpo-000KQi-0T;
	Sat, 29 Jun 2024 23:50:24 +0000
Date: Sun, 30 Jun 2024 07:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 6c05a1d1492ca810836af513366aba921fbee6a8
Message-ID: <202406300701.L0W7v4YS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 6c05a1d1492ca810836af513366aba921fbee6a8  Merge branch 'hwmon-amc6821' into testing

elapsed time: 1875m

configs tested: 187
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240629   gcc-13.2.0
arc                   randconfig-002-20240629   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                     am200epdkit_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                        mvebu_v5_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                   randconfig-001-20240629   gcc-13.2.0
arm                   randconfig-002-20240629   gcc-13.2.0
arm                   randconfig-003-20240629   gcc-13.2.0
arm                   randconfig-004-20240629   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240629   gcc-13.2.0
arm64                 randconfig-002-20240629   gcc-13.2.0
arm64                 randconfig-003-20240629   gcc-13.2.0
arm64                 randconfig-004-20240629   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240629   gcc-13.2.0
csky                  randconfig-002-20240629   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240629   gcc-7
i386         buildonly-randconfig-001-20240630   clang-18
i386         buildonly-randconfig-002-20240629   clang-18
i386         buildonly-randconfig-002-20240629   gcc-7
i386         buildonly-randconfig-002-20240630   clang-18
i386         buildonly-randconfig-003-20240629   clang-18
i386         buildonly-randconfig-003-20240629   gcc-7
i386         buildonly-randconfig-003-20240630   clang-18
i386         buildonly-randconfig-004-20240629   gcc-13
i386         buildonly-randconfig-004-20240629   gcc-7
i386         buildonly-randconfig-004-20240630   clang-18
i386         buildonly-randconfig-005-20240629   gcc-13
i386         buildonly-randconfig-005-20240629   gcc-7
i386         buildonly-randconfig-005-20240630   clang-18
i386         buildonly-randconfig-006-20240629   clang-18
i386         buildonly-randconfig-006-20240629   gcc-7
i386         buildonly-randconfig-006-20240630   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240629   clang-18
i386                  randconfig-001-20240629   gcc-7
i386                  randconfig-001-20240630   clang-18
i386                  randconfig-002-20240629   gcc-7
i386                  randconfig-002-20240629   gcc-9
i386                  randconfig-002-20240630   clang-18
i386                  randconfig-003-20240629   clang-18
i386                  randconfig-003-20240629   gcc-7
i386                  randconfig-003-20240630   clang-18
i386                  randconfig-004-20240629   gcc-7
i386                  randconfig-004-20240629   gcc-9
i386                  randconfig-004-20240630   clang-18
i386                  randconfig-005-20240629   gcc-13
i386                  randconfig-005-20240629   gcc-7
i386                  randconfig-005-20240630   clang-18
i386                  randconfig-006-20240629   clang-18
i386                  randconfig-006-20240629   gcc-7
i386                  randconfig-006-20240630   clang-18
i386                  randconfig-011-20240629   gcc-13
i386                  randconfig-011-20240629   gcc-7
i386                  randconfig-011-20240630   clang-18
i386                  randconfig-012-20240629   clang-18
i386                  randconfig-012-20240629   gcc-7
i386                  randconfig-012-20240630   clang-18
i386                  randconfig-013-20240629   gcc-12
i386                  randconfig-013-20240629   gcc-7
i386                  randconfig-013-20240630   clang-18
i386                  randconfig-014-20240629   gcc-13
i386                  randconfig-014-20240629   gcc-7
i386                  randconfig-014-20240630   clang-18
i386                  randconfig-015-20240629   gcc-12
i386                  randconfig-015-20240629   gcc-7
i386                  randconfig-015-20240630   clang-18
i386                  randconfig-016-20240629   gcc-13
i386                  randconfig-016-20240629   gcc-7
i386                  randconfig-016-20240630   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240629   gcc-13.2.0
loongarch             randconfig-002-20240629   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5249evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.2.0
mips                         rt305x_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240629   gcc-13.2.0
nios2                 randconfig-002-20240629   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240629   gcc-13.2.0
parisc                randconfig-002-20240629   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                       holly_defconfig   gcc-13.2.0
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240629   gcc-13.2.0
powerpc               randconfig-002-20240629   gcc-13.2.0
powerpc               randconfig-003-20240629   gcc-13.2.0
powerpc                     tqm8541_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240629   gcc-13.2.0
powerpc64             randconfig-002-20240629   gcc-13.2.0
powerpc64             randconfig-003-20240629   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                 randconfig-001-20240629   gcc-13.2.0
riscv                 randconfig-002-20240629   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240629   gcc-13.2.0
s390                  randconfig-002-20240629   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                         apsh4a3a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240629   gcc-13.2.0
sh                    randconfig-002-20240629   gcc-13.2.0
sh                          rsk7203_defconfig   gcc-13.2.0
sh                           se7343_defconfig   gcc-13.2.0
sh                           se7780_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240629   gcc-13.2.0
sparc64               randconfig-002-20240629   gcc-13.2.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240629   gcc-13.2.0
um                    randconfig-002-20240629   gcc-13.2.0
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240630   gcc-13
x86_64       buildonly-randconfig-002-20240630   gcc-13
x86_64       buildonly-randconfig-003-20240630   gcc-13
x86_64       buildonly-randconfig-004-20240630   gcc-13
x86_64       buildonly-randconfig-005-20240630   gcc-13
x86_64       buildonly-randconfig-006-20240630   gcc-13
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240630   gcc-13
x86_64                randconfig-002-20240630   gcc-13
x86_64                randconfig-003-20240630   gcc-13
x86_64                randconfig-004-20240630   gcc-13
x86_64                randconfig-005-20240630   gcc-13
x86_64                randconfig-006-20240630   gcc-13
x86_64                randconfig-011-20240630   gcc-13
x86_64                randconfig-012-20240630   gcc-13
x86_64                randconfig-013-20240630   gcc-13
x86_64                randconfig-014-20240630   gcc-13
x86_64                randconfig-015-20240630   gcc-13
x86_64                randconfig-016-20240630   gcc-13
x86_64                randconfig-071-20240630   gcc-13
x86_64                randconfig-072-20240630   gcc-13
x86_64                randconfig-073-20240630   gcc-13
x86_64                randconfig-074-20240630   gcc-13
x86_64                randconfig-075-20240630   gcc-13
x86_64                randconfig-076-20240630   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240629   gcc-13.2.0
xtensa                randconfig-002-20240629   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
