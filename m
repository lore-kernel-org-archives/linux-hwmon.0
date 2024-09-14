Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A168316426
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Sep 2024 13:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726320303; cv=none; b=eCOpQWlWy9g0ayGXjIiqPJQWRqgw4lt45vqzPf9bwv2OqmznN5VyYjQeroadkiAEAuZbmN6crv4YNFDp5D1dx56tMZC9GmP7BGl2CMG46zPfxqgeRnvHx7iQC0h93yfiO9jWVlTLHSVWMjmb7q5aTw/yJj4BKLHhlhcB+hFBeNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726320303; c=relaxed/simple;
	bh=MjiRFMiM2ZRoYn6vF+Fz8TJ5El9HJY3ld9hMPY4t1D8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWoJtYPegRc4rLwJiXNQTWhvAHaStDpXb1yTuZtksitCFqBhfVPYR2hjzThAxdQVu1oESBNQzmSCSqvwN2WBMNQ4eOCIF4p6Ca6Dn+vr8gTySUDZ6ZG6A4Ym2jXyMZYjKZ7Ee2ZhP+gpVX2Qsf9gbh5iEXLcUGVVYHaIIIeMIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiMKOEOG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiMKOEOG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726320301; x=1757856301;
  h=date:from:to:cc:subject:message-id;
  bh=MjiRFMiM2ZRoYn6vF+Fz8TJ5El9HJY3ld9hMPY4t1D8=;
  b=EiMKOEOGprbCNBLgYU+RFPcDmbdKwc5up9CRc+Ddz8RTF0H70sHp0/e4
   DUXFtZwqvmbbprR6kkT3rDgOE3AfNaJX5eF0/tOV+0TX8vm+GdzjrcOHq
   OaRo8CQ6jicPuVaxatq8rnDKPkCypu2Iyx/gbFdcdS54WQFHzYB8ctv+d
   ATnZ68Uwm39o/czsLSPeR2KT5I/uL+MTG8s9DIdBfPgUf/LJBTsDTseWQ
   wUaLtzmvaHjvav0AePTL8H9K1OPAAR6du5qAV9rIrMywamFkmzmSG9dtV
   znb5I6dkK6XPTV8MtUV6gDrg2HGRvX1lXk4zZhxmYmvPQkY95bxPr9c8K
   g==;
X-CSE-ConnectionGUID: 9KXk2hLzR2q9YhfYWJTKow==
X-CSE-MsgGUID: yDiaHROHQamcQCubeSsRlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="24698524"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="24698524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 06:25:01 -0700
X-CSE-ConnectionGUID: 7xJD/TBTSoSBSRpA89JvYA==
X-CSE-MsgGUID: 1+836crwTQi+i8fblz+SaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68268552"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Sep 2024 06:24:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spSll-0007mA-2A;
	Sat, 14 Sep 2024 13:24:57 +0000
Date: Sat, 14 Sep 2024 21:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 b40b2fb5623418e729b4eb2b80b3da3c62290b8d
Message-ID: <202409142115.tOsXeCg0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: b40b2fb5623418e729b4eb2b80b3da3c62290b8d  Merge branch 'fixes-v6.11' into testing

elapsed time: 1212m

configs tested: 150
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
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                      jornada720_defconfig    clang-20
arm                            mmp2_defconfig    clang-20
arm                        multi_v5_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    clang-20
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240914    clang-18
i386        buildonly-randconfig-002-20240914    clang-18
i386        buildonly-randconfig-003-20240914    clang-18
i386        buildonly-randconfig-004-20240914    clang-18
i386        buildonly-randconfig-005-20240914    clang-18
i386        buildonly-randconfig-006-20240914    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240914    clang-18
i386                  randconfig-002-20240914    clang-18
i386                  randconfig-003-20240914    clang-18
i386                  randconfig-004-20240914    clang-18
i386                  randconfig-005-20240914    clang-18
i386                  randconfig-006-20240914    clang-18
i386                  randconfig-011-20240914    clang-18
i386                  randconfig-012-20240914    clang-18
i386                  randconfig-013-20240914    clang-18
i386                  randconfig-014-20240914    clang-18
i386                  randconfig-015-20240914    clang-18
i386                  randconfig-016-20240914    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5249evb_defconfig    clang-20
m68k                        m5307c3_defconfig    clang-20
m68k                          multi_defconfig    clang-20
m68k                        mvme16x_defconfig    clang-20
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                     loongson1b_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                      pic32mzda_defconfig    clang-20
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                 simple_smp_defconfig    clang-20
parisc                           alldefconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                      chrp32_defconfig    clang-20
powerpc                   microwatt_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                      ppc44x_defconfig    clang-20
powerpc                     rainier_defconfig    clang-20
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7705_defconfig    clang-20
sh                            shmin_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240914    clang-18
x86_64      buildonly-randconfig-002-20240914    clang-18
x86_64      buildonly-randconfig-003-20240914    clang-18
x86_64      buildonly-randconfig-004-20240914    clang-18
x86_64      buildonly-randconfig-005-20240914    clang-18
x86_64      buildonly-randconfig-006-20240914    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240914    clang-18
x86_64                randconfig-002-20240914    clang-18
x86_64                randconfig-003-20240914    clang-18
x86_64                randconfig-004-20240914    clang-18
x86_64                randconfig-005-20240914    clang-18
x86_64                randconfig-006-20240914    clang-18
x86_64                randconfig-011-20240914    clang-18
x86_64                randconfig-012-20240914    clang-18
x86_64                randconfig-013-20240914    clang-18
x86_64                randconfig-014-20240914    clang-18
x86_64                randconfig-015-20240914    clang-18
x86_64                randconfig-016-20240914    clang-18
x86_64                randconfig-071-20240914    clang-18
x86_64                randconfig-072-20240914    clang-18
x86_64                randconfig-073-20240914    clang-18
x86_64                randconfig-074-20240914    clang-18
x86_64                randconfig-075-20240914    clang-18
x86_64                randconfig-076-20240914    clang-18
x86_64                          rhel-8.3-rust    clang-18
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
