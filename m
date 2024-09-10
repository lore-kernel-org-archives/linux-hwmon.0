Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3092619412D
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2024 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995644; cv=none; b=TTjnL9GUj+WaWIJTNKPcIxgVkt9Zov8a5uZVmNY5XIAzM11VsG/T3SQQEo0P3ar854bzj/eiT9Lm2QEHhjeELd9L/gn5O8gMCL8IGvjm/ysSQ7ELBO6xeP/UQClGSuS61RJnsWNyzTkpLL2T0uU3MIuY4zO9m/Wh0epagI+GXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995644; c=relaxed/simple;
	bh=BMuhEb9tVY4ugYzUW4hhMen43nAsJ2x/x4Z3MnlvCMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c329dNzUcIcfJ8rU1zXqqdl0HvVVnZaxftsgXsLa0mks3CJexYvum6lfVem6TuxStSMOlhIPHbRZK4UkzZIM42saZrFD1rIDapdcXziR1dX2KM++pv/HH5eZjA/5d9yGbqFT80VSHkqwd+tt19PQFqi3Maa4MAVSWolcrwQJz00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRtmo/sM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRtmo/sM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725995642; x=1757531642;
  h=date:from:to:cc:subject:message-id;
  bh=BMuhEb9tVY4ugYzUW4hhMen43nAsJ2x/x4Z3MnlvCMs=;
  b=RRtmo/sMUDUQP3bK9sTQkKHURyQNeGHxp56o8etxtxe72xAW8xEUZgCU
   u8FAMheHa3/Omauk4ljaPuM3zV/tzqZkH0mEJNkujCYQH0KlDEBkpyUra
   BW9bVR3iBAQhm1Wos8AJJ6joGD2c4Xty1gxcehh167MgSXuaIWZ0L/o5W
   kxWhYqd2UYoxfHWM4hA8gDIz/mna0HJx4zbzWqnrKViRJ+VZoZ4qP1LTf
   YO6Fqf5SGfBxsT7uaW4wGovdNsnZ6urFio3bIHiZ+NZbPDhZDJItjpfYA
   k3NKwT1/753WX4mGvKsiQ4ohxpnknpU1EyfjhOTHoEHdJukAc2JwpR+E9
   g==;
X-CSE-ConnectionGUID: CLM9VCZNSyum7atMhWt6Cw==
X-CSE-MsgGUID: kDECyNfLQMC3Ktvlb8FFJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24870955"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24870955"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 12:14:01 -0700
X-CSE-ConnectionGUID: miyxnXocQoWIQl0JahUvvg==
X-CSE-MsgGUID: +m/xbDIOTGajycNdGwpQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="104594628"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Sep 2024 12:14:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so6JK-0002Vw-1d;
	Tue, 10 Sep 2024 19:13:58 +0000
Date: Wed, 11 Sep 2024 03:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 215df6a5803763a380f820aa98520b62384c6690
Message-ID: <202409110349.MsnZCwjf-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 215df6a5803763a380f820aa98520b62384c6690  Merge branch 'fixes-v6.11' into testing

elapsed time: 1467m

configs tested: 143
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                         at91_dt_defconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                      integrator_defconfig   clang-20
arm                      jornada720_defconfig   clang-20
arm                           sama7_defconfig   clang-20
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                           allnoconfig   gcc-14.1.0
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240910   clang-18
i386         buildonly-randconfig-001-20240910   gcc-12
i386         buildonly-randconfig-002-20240910   clang-18
i386         buildonly-randconfig-002-20240910   gcc-12
i386         buildonly-randconfig-003-20240910   clang-18
i386         buildonly-randconfig-003-20240910   gcc-12
i386         buildonly-randconfig-004-20240910   clang-18
i386         buildonly-randconfig-005-20240910   clang-18
i386         buildonly-randconfig-006-20240910   clang-18
i386         buildonly-randconfig-006-20240910   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240910   clang-18
i386                  randconfig-001-20240910   gcc-12
i386                  randconfig-002-20240910   clang-18
i386                  randconfig-002-20240910   gcc-12
i386                  randconfig-003-20240910   clang-18
i386                  randconfig-003-20240910   gcc-12
i386                  randconfig-004-20240910   clang-18
i386                  randconfig-004-20240910   gcc-12
i386                  randconfig-005-20240910   clang-18
i386                  randconfig-005-20240910   gcc-12
i386                  randconfig-006-20240910   clang-18
i386                  randconfig-011-20240910   clang-18
i386                  randconfig-011-20240910   gcc-12
i386                  randconfig-012-20240910   clang-18
i386                  randconfig-013-20240910   clang-18
i386                  randconfig-014-20240910   clang-18
i386                  randconfig-014-20240910   gcc-12
i386                  randconfig-015-20240910   clang-18
i386                  randconfig-015-20240910   gcc-12
i386                  randconfig-016-20240910   clang-18
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   clang-20
m68k                                defconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                     loongson2k_defconfig   clang-20
mips                      pic32mzda_defconfig   clang-20
mips                       rbtx49xx_defconfig   clang-20
mips                           xway_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                       eiger_defconfig   clang-20
powerpc                  iss476-smp_defconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                        sh7785lcr_defconfig   clang-20
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                                allnoconfig   clang-17
um                                allnoconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240910   gcc-12
x86_64       buildonly-randconfig-002-20240910   gcc-12
x86_64       buildonly-randconfig-003-20240910   gcc-12
x86_64       buildonly-randconfig-004-20240910   gcc-12
x86_64       buildonly-randconfig-005-20240910   gcc-12
x86_64       buildonly-randconfig-006-20240910   gcc-12
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240910   gcc-12
x86_64                randconfig-002-20240910   gcc-12
x86_64                randconfig-003-20240910   gcc-12
x86_64                randconfig-004-20240910   gcc-12
x86_64                randconfig-005-20240910   gcc-12
x86_64                randconfig-006-20240910   gcc-12
x86_64                randconfig-011-20240910   gcc-12
x86_64                randconfig-012-20240910   gcc-12
x86_64                randconfig-013-20240910   gcc-12
x86_64                randconfig-014-20240910   gcc-12
x86_64                randconfig-015-20240910   gcc-12
x86_64                randconfig-016-20240910   gcc-12
x86_64                randconfig-071-20240910   gcc-12
x86_64                randconfig-072-20240910   gcc-12
x86_64                randconfig-073-20240910   gcc-12
x86_64                randconfig-074-20240910   gcc-12
x86_64                randconfig-075-20240910   gcc-12
x86_64                randconfig-076-20240910   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
