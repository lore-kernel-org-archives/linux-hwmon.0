Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73442AF1D
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Dec 2024 10:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734948760; cv=none; b=X5jl/l9HnQtS1wtEl0VyAi0TvfkXhD3BwrpqgMbravxKpuRyBfrhNaFBg+Kwn1EJUze4esFb7wso8hWpiwHOSYmopCMkz0faWvHq9gOyz74mL0t+k8bKl7qcmlf9PGk/t2JhfAhnfS6TANlloI4KOCPMCYlg6kHGISLMIJU8mqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734948760; c=relaxed/simple;
	bh=ep1scgDUErWIonkymkxBz+PP7pu7BQ66w4n3gWWa1MM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yy9wSoIgQMnGLJ+P3328UmVlc1vUFTVGBQbPuDgi5H7RMBQEYqydzLsOuyHTs7vrIdV33aQp1IuvanYc1IDUI0EsLJoKbQw0L8ju2bD+n3q9Mq/nnoGwJBoD3tXxvomHRvvn1jJTdQsFe2Oy0e1NUv0vscnFgq3E2xnmLwZBWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/IXCryt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/IXCryt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734948758; x=1766484758;
  h=date:from:to:cc:subject:message-id;
  bh=ep1scgDUErWIonkymkxBz+PP7pu7BQ66w4n3gWWa1MM=;
  b=e/IXCrytNdqgKFl7/l5/Wi9rZ9F7I1ZaKzxP0uMa8i3fX1TqEI2rrTdc
   xHUGRQlH8rbd+JS3iGxxX4Px+CDvOjLp9qR8KaGhL9QQl2FNcQsBtM3su
   JAuRhqC/z+f9zWO6jS5f6hKQXaCjBdqmMP+hrcZm7eU1fApI/+3RjW9+R
   6dFJpwCnmaV5Un5apTzIPUoKwrUsH/n3o0pfKh35qWm3c/z21DIAbmPLG
   CtgPwBvuRrVkKYQVEHjfG3bV2t4odZ+kVZCnncC0j3hA3AFT/BJ5+SaX1
   Y+M5LmbhmUN9E9XSjs1WpER1cHong1ppT7y2cQHDcXk2miRDX6r2121UZ
   g==;
X-CSE-ConnectionGUID: N+W5fsBPTBG60KjzyM7hbQ==
X-CSE-MsgGUID: t16ZT4C4RjuO6yXOVPLnOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="52811987"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="52811987"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 02:12:38 -0800
X-CSE-ConnectionGUID: 0VGREiICSCqzncXYHph0/A==
X-CSE-MsgGUID: wslTAV+MQG25yE0sQfo1yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="98940070"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2024 02:12:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPfQQ-0003X9-0D;
	Mon, 23 Dec 2024 10:12:34 +0000
Date: Mon, 23 Dec 2024 18:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 a2878100c96e3ff5eeeb64d0536ec94498773c58
Message-ID: <202412231847.gTJBkx08-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: a2878100c96e3ff5eeeb64d0536ec94498773c58  ARM: imx: Re-introduce the PINCTRL selection

elapsed time: 723m

configs tested: 158
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20241223    gcc-13.2.0
arc                   randconfig-002-20241223    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                          pxa168_defconfig    clang-16
arm                   randconfig-001-20241223    gcc-14.2.0
arm                   randconfig-002-20241223    clang-16
arm                   randconfig-003-20241223    clang-20
arm                   randconfig-004-20241223    gcc-14.2.0
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
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241223    clang-19
hexagon               randconfig-002-20241223    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241223    clang-19
i386        buildonly-randconfig-002-20241223    clang-19
i386        buildonly-randconfig-003-20241223    clang-19
i386        buildonly-randconfig-004-20241223    gcc-12
i386        buildonly-randconfig-005-20241223    clang-19
i386        buildonly-randconfig-006-20241223    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20241223    clang-19
i386                  randconfig-012-20241223    clang-19
i386                  randconfig-013-20241223    clang-19
i386                  randconfig-014-20241223    clang-19
i386                  randconfig-015-20241223    clang-19
i386                  randconfig-016-20241223    clang-19
i386                  randconfig-017-20241223    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241223    gcc-14.2.0
loongarch             randconfig-002-20241223    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        stmark2_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                           ip30_defconfig    gcc-14.2.0
mips                      maltaaprp_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241223    gcc-14.2.0
nios2                 randconfig-002-20241223    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
openrisc                  or1klitex_defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241223    gcc-14.2.0
parisc                randconfig-002-20241223    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      katmai_defconfig    clang-18
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                   motionpro_defconfig    clang-17
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241223    clang-18
powerpc               randconfig-002-20241223    clang-16
powerpc               randconfig-003-20241223    clang-20
powerpc64                        alldefconfig    clang-20
powerpc64             randconfig-001-20241223    gcc-14.2.0
powerpc64             randconfig-002-20241223    clang-18
powerpc64             randconfig-003-20241223    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241223    clang-20
riscv                 randconfig-002-20241223    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20241223    clang-20
s390                  randconfig-002-20241223    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20241223    gcc-14.2.0
sh                    randconfig-002-20241223    gcc-14.2.0
sh                             sh03_defconfig    gcc-14.2.0
sh                        sh7785lcr_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241223    gcc-14.2.0
sparc                 randconfig-002-20241223    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241223    gcc-14.2.0
sparc64               randconfig-002-20241223    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241223    clang-16
um                    randconfig-002-20241223    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
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
xtensa                randconfig-001-20241223    gcc-14.2.0
xtensa                randconfig-002-20241223    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
