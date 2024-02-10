Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB6F5BAF4
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Feb 2024 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707581068; cv=none; b=NZTJZKUGy/dpaNtwQodfU4GQcmt+rUDhVFCnHhh6HbW6M3FAPCEhl2RJeotgusTHqqTYPiBXmuHcQQakhl6CKIgv9OQ3pP809lvwKOwlVFHtrwJGZcQ+Z/UaQAjzKOlG3ra1NAE3UkNPY4lKxmsDNnr6E03Yy5y5/K6fBdi9zIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707581068; c=relaxed/simple;
	bh=6vxaUQ00s7mY+8nt/PrcaVoIqCfS4JxaIddE0Cpd6OQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UYbb12pI8DmQ3vntOZPAQe/vghOuUnK7LeM3INktGHi8NdU9MDivq2SBWjyPEAJE1SRdlM/JhsCFo7fCtmAFdx+0P83mxE2mSo9iYBCSBpwu5oHv0FRH1dSaO1jtSFyPHXZQV2L4ghYxO5AkfLdcijoQe6oTPlP0F3bxxgpjQN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuQpfD/u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuQpfD/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707581066; x=1739117066;
  h=date:from:to:cc:subject:message-id;
  bh=6vxaUQ00s7mY+8nt/PrcaVoIqCfS4JxaIddE0Cpd6OQ=;
  b=DuQpfD/uAGHRvdzYr4WkxAbCNG9EOduwDEK85gdYDYl2x+Xq9RoT12Gk
   uSShnNA5GAUMH631hV5ifh25XdCigLvG8vr0AbhfHlBrXZY28PHs//6dV
   k75iN7i95qCXs4HdDy00KwOUD7ELeYS/Kts/BPgYJnVC6iCmlCY1yXCBH
   ehP3OFyjTN/NdtvJbXigo/dCpT/yMvByWdg7C9eIwgDC0/qHaH9IiDH76
   lR05kP7nVP6G+2bOBWFkd4sYTEYWDQjbG9JNGQg7ixO00U8xr+LsFda8z
   tcYHaW+G42jrDvURetljqxKWVyVzE47id677Kjv6a8A7c/9HuzXyhvhRN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12941761"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12941761"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 08:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="25419457"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2024 08:04:24 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYpq1-0005ng-2g;
	Sat, 10 Feb 2024 16:04:21 +0000
Date: Sun, 11 Feb 2024 00:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 f3a1cc17a7f916619911d83cd383ad88927c146a
Message-ID: <202402110048.zEKW1oGN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: f3a1cc17a7f916619911d83cd383ad88927c146a  hwmon: (oxp-sensors) Add support for Ayaneo Air Plus 7320u.

elapsed time: 1445m

configs tested: 178
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
arc                   randconfig-001-20240210   gcc  
arc                   randconfig-002-20240210   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                      jornada720_defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                             mxs_defconfig   clang
arm                   randconfig-001-20240210   gcc  
arm                   randconfig-002-20240210   gcc  
arm                   randconfig-003-20240210   gcc  
arm                   randconfig-004-20240210   gcc  
arm                        shmobile_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240210   clang
arm64                 randconfig-002-20240210   gcc  
arm64                 randconfig-003-20240210   gcc  
arm64                 randconfig-004-20240210   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240210   gcc  
csky                  randconfig-002-20240210   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240210   clang
hexagon               randconfig-002-20240210   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240210   clang
i386         buildonly-randconfig-002-20240210   gcc  
i386         buildonly-randconfig-003-20240210   clang
i386         buildonly-randconfig-004-20240210   clang
i386         buildonly-randconfig-005-20240210   clang
i386         buildonly-randconfig-006-20240210   clang
i386                                defconfig   clang
i386                  randconfig-001-20240210   gcc  
i386                  randconfig-002-20240210   gcc  
i386                  randconfig-003-20240210   clang
i386                  randconfig-004-20240210   clang
i386                  randconfig-005-20240210   gcc  
i386                  randconfig-006-20240210   gcc  
i386                  randconfig-011-20240210   clang
i386                  randconfig-012-20240210   clang
i386                  randconfig-013-20240210   clang
i386                  randconfig-014-20240210   gcc  
i386                  randconfig-015-20240210   gcc  
i386                  randconfig-016-20240210   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240210   gcc  
loongarch             randconfig-002-20240210   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           xway_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240210   gcc  
nios2                 randconfig-002-20240210   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240210   gcc  
parisc                randconfig-002-20240210   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                      cm5200_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc               randconfig-001-20240210   gcc  
powerpc               randconfig-002-20240210   clang
powerpc               randconfig-003-20240210   gcc  
powerpc64             randconfig-001-20240210   clang
powerpc64             randconfig-002-20240210   clang
powerpc64             randconfig-003-20240210   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240210   gcc  
riscv                 randconfig-002-20240210   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240210   gcc  
s390                  randconfig-002-20240210   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                    randconfig-001-20240210   gcc  
sh                    randconfig-002-20240210   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240210   gcc  
sparc64               randconfig-002-20240210   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240210   gcc  
um                    randconfig-002-20240210   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240210   gcc  
x86_64       buildonly-randconfig-002-20240210   gcc  
x86_64       buildonly-randconfig-003-20240210   gcc  
x86_64       buildonly-randconfig-004-20240210   clang
x86_64       buildonly-randconfig-005-20240210   clang
x86_64       buildonly-randconfig-006-20240210   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240210   clang
x86_64                randconfig-002-20240210   clang
x86_64                randconfig-003-20240210   gcc  
x86_64                randconfig-004-20240210   clang
x86_64                randconfig-005-20240210   clang
x86_64                randconfig-006-20240210   gcc  
x86_64                randconfig-011-20240210   gcc  
x86_64                randconfig-012-20240210   clang
x86_64                randconfig-013-20240210   clang
x86_64                randconfig-014-20240210   clang
x86_64                randconfig-015-20240210   gcc  
x86_64                randconfig-016-20240210   clang
x86_64                randconfig-071-20240210   gcc  
x86_64                randconfig-072-20240210   gcc  
x86_64                randconfig-073-20240210   clang
x86_64                randconfig-074-20240210   gcc  
x86_64                randconfig-075-20240210   clang
x86_64                randconfig-076-20240210   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240210   gcc  
xtensa                randconfig-002-20240210   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
