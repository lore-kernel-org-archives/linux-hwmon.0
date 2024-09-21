Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AE64D
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Sep 2024 00:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726879403; cv=none; b=t0NylbF/eM+ol5pNRsMohy6nhJcA6S4UYRW06m7SYBj77s0V6jCAQ3XrRJ4prfZ7SWhdsvGs0r2lwWEo/KZNgVvkqMG1I0bklK4/W+jgFuXq+rixt1e9kUZ3SgdytSqGd9GqywjjtDonfY51ItL3DWY6B+AOUObfShBQfjtAHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726879403; c=relaxed/simple;
	bh=CPwYciGHvikO7Ft2vAuxt4yzICbd7Wx2Ix+pmS9ufm0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZwOzk9yAyB3JTK+Kx0abNewVM/qoXIEBv/GwQV+/TODJgOLgJAcf2qclGL6vjp3R6NMFpHTCGIToLFH25d2w2gFdg39pd29EiBZkk4kDGJHa50uzuR2xDOOTNHmHJlYF2V0Y57/TLlcFFBtf888zgdqnoT5VlSdCB2jUm4t/SK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD6eyPxX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD6eyPxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726879402; x=1758415402;
  h=date:from:to:cc:subject:message-id;
  bh=CPwYciGHvikO7Ft2vAuxt4yzICbd7Wx2Ix+pmS9ufm0=;
  b=bD6eyPxXEui/349verhM42qaZNr7pcENdeIr7Fakhrf2y5dViHPiiDWd
   RvxbBzs8d5rZ67TsdguYlBxp/Ytj95GYAMfh43X357kZs4HlMHF541i7O
   sL5vS8/m8QYyKwESB6AmGaI8TTX+a7lQTsfOuS67KfuZziGYVGBSRAoSc
   4K2nrTlJ9tHhTV1O/cAiJpNpuGgTAz70rWS5c7SqwvZ00+VQ6cEdZlgkK
   8/hGZeKKtQiAUcoGeKlMVxG0DIjwyWoTNBF6rLmNt9lm3N5MC/Abm+nyl
   J3+L95Hqe64dKAVSVSCQHM9tHV949XTb7ujJzISfmyNMS5mGQo1c27rmL
   w==;
X-CSE-ConnectionGUID: 0xkIksMtQvulb8nid5KyXQ==
X-CSE-MsgGUID: eEetRrMhTt+cw2ADFKTuwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29629435"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="29629435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 17:43:21 -0700
X-CSE-ConnectionGUID: d54E2mLiTvCeHo3Wk9Ivog==
X-CSE-MsgGUID: 2kN2PIjGS6+sw2+xuwInGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70918518"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 17:43:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sroDV-000EzH-1g;
	Sat, 21 Sep 2024 00:43:17 +0000
Date: Sat, 21 Sep 2024 08:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 6d30ed0b1c5a92a3461c44177225734afc07fbcd
Message-ID: <202409210806.kJPbTlog-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 6d30ed0b1c5a92a3461c44177225734afc07fbcd  hwmon: intel-m10-bmc-hwmon: relabel Columbiaville to CVL Die Temperature

elapsed time: 1063m

configs tested: 229
configs skipped: 6

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
arc                   randconfig-001-20240920    clang-20
arc                   randconfig-002-20240920    clang-20
arc                           tb10x_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                         assabet_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                   milbeaut_m10v_defconfig    clang-20
arm                        multi_v7_defconfig    gcc-14.1.0
arm                             mxs_defconfig    clang-20
arm                   randconfig-001-20240920    clang-20
arm                   randconfig-002-20240920    clang-20
arm                   randconfig-003-20240920    clang-20
arm                   randconfig-004-20240920    clang-20
arm                             rpc_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm                       versatile_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240920    clang-20
arm64                 randconfig-002-20240920    clang-20
arm64                 randconfig-003-20240920    clang-20
arm64                 randconfig-004-20240920    clang-20
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240920    clang-20
csky                  randconfig-002-20240920    clang-20
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240920    clang-20
hexagon               randconfig-002-20240920    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240920    gcc-12
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240920    gcc-12
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240920    gcc-12
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240920    gcc-12
i386        buildonly-randconfig-004-20240921    clang-18
i386        buildonly-randconfig-005-20240920    gcc-12
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240920    gcc-12
i386        buildonly-randconfig-006-20240921    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240920    gcc-12
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240920    gcc-12
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240920    gcc-12
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240920    gcc-12
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240920    gcc-12
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240920    gcc-12
i386                  randconfig-006-20240921    clang-18
i386                  randconfig-011-20240920    gcc-12
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240920    gcc-12
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240920    gcc-12
i386                  randconfig-013-20240921    clang-18
i386                  randconfig-014-20240920    gcc-12
i386                  randconfig-014-20240921    clang-18
i386                  randconfig-015-20240920    gcc-12
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240920    gcc-12
i386                  randconfig-016-20240921    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240920    clang-20
loongarch             randconfig-002-20240920    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    gcc-14.1.0
m68k                       m5475evb_defconfig    gcc-14.1.0
m68k                            q40_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                     cu1000-neo_defconfig    clang-20
mips                     cu1830-neo_defconfig    clang-20
mips                           ip27_defconfig    clang-20
mips                           ip28_defconfig    gcc-14.1.0
mips                           rs90_defconfig    clang-20
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240920    clang-20
nios2                 randconfig-002-20240920    clang-20
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20240920    clang-20
parisc                randconfig-002-20240920    clang-20
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    gcc-14.1.0
powerpc                   currituck_defconfig    gcc-14.1.0
powerpc                    gamecube_defconfig    clang-20
powerpc                      ppc64e_defconfig    clang-20
powerpc                      ppc6xx_defconfig    gcc-14.1.0
powerpc               randconfig-002-20240920    clang-20
powerpc                    sam440ep_defconfig    clang-20
powerpc                  storcenter_defconfig    gcc-14.1.0
powerpc64                        alldefconfig    gcc-14.1.0
powerpc64             randconfig-001-20240920    clang-20
powerpc64             randconfig-002-20240920    clang-20
powerpc64             randconfig-003-20240920    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    clang-20
riscv                 randconfig-001-20240920    clang-20
riscv                 randconfig-002-20240920    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240920    clang-20
s390                  randconfig-002-20240920    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                          r7780mp_defconfig    gcc-14.1.0
sh                    randconfig-001-20240920    clang-20
sh                    randconfig-002-20240920    clang-20
sh                   sh7724_generic_defconfig    gcc-14.1.0
sh                            titan_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240920    clang-20
sparc64               randconfig-002-20240920    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240920    clang-20
um                    randconfig-002-20240920    clang-20
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240920    gcc-12
x86_64      buildonly-randconfig-001-20240921    clang-18
x86_64      buildonly-randconfig-002-20240920    gcc-12
x86_64      buildonly-randconfig-002-20240921    clang-18
x86_64      buildonly-randconfig-003-20240920    gcc-12
x86_64      buildonly-randconfig-003-20240921    clang-18
x86_64      buildonly-randconfig-004-20240920    gcc-12
x86_64      buildonly-randconfig-004-20240921    clang-18
x86_64      buildonly-randconfig-005-20240920    gcc-12
x86_64      buildonly-randconfig-005-20240921    clang-18
x86_64      buildonly-randconfig-006-20240920    gcc-12
x86_64      buildonly-randconfig-006-20240921    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240920    gcc-12
x86_64                randconfig-001-20240921    clang-18
x86_64                randconfig-002-20240920    gcc-12
x86_64                randconfig-002-20240921    clang-18
x86_64                randconfig-003-20240920    gcc-12
x86_64                randconfig-003-20240921    clang-18
x86_64                randconfig-004-20240920    gcc-12
x86_64                randconfig-004-20240921    clang-18
x86_64                randconfig-005-20240920    gcc-12
x86_64                randconfig-005-20240921    clang-18
x86_64                randconfig-006-20240920    gcc-12
x86_64                randconfig-006-20240921    clang-18
x86_64                randconfig-011-20240920    gcc-12
x86_64                randconfig-011-20240921    clang-18
x86_64                randconfig-012-20240920    gcc-12
x86_64                randconfig-012-20240921    clang-18
x86_64                randconfig-013-20240920    gcc-12
x86_64                randconfig-013-20240921    clang-18
x86_64                randconfig-014-20240920    gcc-12
x86_64                randconfig-014-20240921    clang-18
x86_64                randconfig-015-20240920    gcc-12
x86_64                randconfig-015-20240921    clang-18
x86_64                randconfig-016-20240920    gcc-12
x86_64                randconfig-016-20240921    clang-18
x86_64                randconfig-071-20240920    gcc-12
x86_64                randconfig-071-20240921    clang-18
x86_64                randconfig-072-20240920    gcc-12
x86_64                randconfig-072-20240921    clang-18
x86_64                randconfig-073-20240920    gcc-12
x86_64                randconfig-073-20240921    clang-18
x86_64                randconfig-074-20240920    gcc-12
x86_64                randconfig-074-20240921    clang-18
x86_64                randconfig-075-20240920    gcc-12
x86_64                randconfig-075-20240921    clang-18
x86_64                randconfig-076-20240920    gcc-12
x86_64                randconfig-076-20240921    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  audio_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240920    clang-20
xtensa                randconfig-002-20240920    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
