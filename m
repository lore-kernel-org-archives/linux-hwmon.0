Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C232721E
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791889; cv=none; b=vGTKg40VfNJtYjekMmzoPkZpOvtZSjijIhF8uWVmyOqjlmqLmTMZT3vfgNXP1Mx0HeNFjSTU28DvE8Q95o6GtG6Rnm2+HOTtRQBR/RWL5QiB72z1xt2bhUd7Zn8jzLibGgZfdbk/7sPr1Cyu9VI5ylEfTjRqp2DHnyGgbKig4Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791889; c=relaxed/simple;
	bh=fZ1LcWT4W4exvCC26RZneVym5lHubVxVkYNu6o8dsoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HJqB7BP4fzam8EjE0K0VbgYrruTzSsY7g2mlJzkdtPXXeGJ+aBeC5Hzkw+2XvtKUdo0stqmOgxkAHkns3lZVy1c1jWzaD56SRYu4+3nRTdCeLL47anQEl/T2XvK2Q7DITF+OJh0b/s4gUYhxCxkC0RRCV0fPIcLFTreIZHdGOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1qmlGxe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1qmlGxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765791887; x=1797327887;
  h=date:from:to:cc:subject:message-id;
  bh=fZ1LcWT4W4exvCC26RZneVym5lHubVxVkYNu6o8dsoA=;
  b=B1qmlGxeCa/ful9D0/+A5FV83+hyNHBOeKpoQXU9KhbViGpnW15dmgtk
   DYAMD4FnO60Nb2q2O3oQiaGnk1I3hUfzOoqix116w6fHS06qUsREb3RPT
   GCPMmZiKEUPN9GrlWeSqNMn5UcY07z8eP6SWWXAahcRgmOUPH5+y3mgJp
   lR2IoUPBubtWwScP7ZMZPMLeK8NhlGD/WgT6njT9RbnM/wRoF2NEZ1x9Z
   5iTYG71k36UfD/JOsdeYC1zlpz8EkynLoKIXJbtwjIOTiDkOv638Tsztk
   IoGJ54W0XI4mlgdP/oYF2SQe/+16YDlLZXf1CzDWP1tigggoCQs0tzRTT
   Q==;
X-CSE-ConnectionGUID: dM9vlXytT+ixp7Nkox8CTg==
X-CSE-MsgGUID: OoGfUUnOS0S5htvliwH1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67649848"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67649848"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:44:46 -0800
X-CSE-ConnectionGUID: 2KPiPT+IQveaP0o6MwYhIw==
X-CSE-MsgGUID: 10sCHrPsTxmKQI2n45tdTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228752586"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 15 Dec 2025 01:44:45 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV57i-0000000009t-1e4g;
	Mon, 15 Dec 2025 09:44:41 +0000
Date: Mon, 15 Dec 2025 17:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22
Message-ID: <202512151706.IQDM1MJ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22  hwmon: (sht3x) add support for SHT85

elapsed time: 908m

configs tested: 271
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                        nsimosci_defconfig    gcc-15.1.0
arc                   randconfig-001-20251215    clang-22
arc                   randconfig-001-20251215    gcc-10.5.0
arc                   randconfig-002-20251215    clang-22
arc                   randconfig-002-20251215    gcc-12.5.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                                 defconfig    gcc-15.1.0
arm                           imxrt_defconfig    gcc-15.1.0
arm                      integrator_defconfig    clang-22
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20251215    clang-22
arm                   randconfig-002-20251215    clang-22
arm                   randconfig-003-20251215    clang-22
arm                   randconfig-004-20251215    clang-22
arm                   randconfig-004-20251215    gcc-10.5.0
arm                         s3c6400_defconfig    gcc-15.1.0
arm                        shmobile_defconfig    gcc-15.1.0
arm                           tegra_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251215    clang-22
arm64                 randconfig-002-20251215    clang-22
arm64                 randconfig-003-20251215    clang-22
arm64                 randconfig-004-20251215    clang-22
arm64                 randconfig-004-20251215    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251215    clang-22
csky                  randconfig-001-20251215    gcc-13.4.0
csky                  randconfig-002-20251215    clang-22
csky                  randconfig-002-20251215    gcc-9.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251215    clang-16
hexagon               randconfig-001-20251215    gcc-11.5.0
hexagon               randconfig-002-20251215    clang-22
hexagon               randconfig-002-20251215    gcc-11.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251215    clang-20
i386        buildonly-randconfig-002-20251215    clang-20
i386        buildonly-randconfig-003-20251215    clang-20
i386        buildonly-randconfig-003-20251215    gcc-14
i386        buildonly-randconfig-004-20251215    clang-20
i386        buildonly-randconfig-005-20251215    clang-20
i386        buildonly-randconfig-006-20251215    clang-20
i386        buildonly-randconfig-006-20251215    gcc-14
i386                                defconfig    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251215    clang-20
i386                  randconfig-002-20251215    clang-20
i386                  randconfig-003-20251215    clang-20
i386                  randconfig-004-20251215    clang-20
i386                  randconfig-005-20251215    clang-20
i386                  randconfig-006-20251215    clang-20
i386                  randconfig-007-20251215    clang-20
i386                  randconfig-011-20251215    clang-20
i386                  randconfig-011-20251215    gcc-14
i386                  randconfig-012-20251215    gcc-12
i386                  randconfig-012-20251215    gcc-14
i386                  randconfig-013-20251215    clang-20
i386                  randconfig-013-20251215    gcc-14
i386                  randconfig-014-20251215    gcc-14
i386                  randconfig-015-20251215    clang-20
i386                  randconfig-015-20251215    gcc-14
i386                  randconfig-016-20251215    gcc-14
i386                  randconfig-017-20251215    clang-20
i386                  randconfig-017-20251215    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251215    gcc-11.5.0
loongarch             randconfig-001-20251215    gcc-14.3.0
loongarch             randconfig-002-20251215    clang-18
loongarch             randconfig-002-20251215    gcc-11.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.1.0
m68k                        m5407c3_defconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                      bmips_stb_defconfig    gcc-15.1.0
mips                  cavium_octeon_defconfig    gcc-15.1.0
mips                           ip22_defconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251215    gcc-11.5.0
nios2                 randconfig-002-20251215    gcc-11.5.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251215    gcc-12.5.0
parisc                randconfig-001-20251215    gcc-9.5.0
parisc                randconfig-002-20251215    gcc-11.5.0
parisc                randconfig-002-20251215    gcc-9.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                   motionpro_defconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251215    gcc-9.5.0
powerpc               randconfig-002-20251215    clang-22
powerpc               randconfig-002-20251215    gcc-9.5.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20251215    gcc-8.5.0
powerpc64             randconfig-001-20251215    gcc-9.5.0
powerpc64             randconfig-002-20251215    clang-22
powerpc64             randconfig-002-20251215    gcc-9.5.0
riscv                            alldefconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251215    clang-22
riscv                 randconfig-002-20251215    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251215    clang-22
s390                  randconfig-002-20251215    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                 kfr2r09-romimage_defconfig    gcc-15.1.0
sh                    randconfig-001-20251215    clang-22
sh                    randconfig-001-20251215    gcc-13.4.0
sh                    randconfig-002-20251215    clang-22
sh                    randconfig-002-20251215    gcc-15.1.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251215    gcc-15.1.0
sparc                 randconfig-002-20251215    gcc-12.5.0
sparc                 randconfig-002-20251215    gcc-15.1.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251215    clang-20
sparc64               randconfig-001-20251215    gcc-15.1.0
sparc64               randconfig-002-20251215    gcc-13.4.0
sparc64               randconfig-002-20251215    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.1.0
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251215    clang-22
um                    randconfig-001-20251215    gcc-15.1.0
um                    randconfig-002-20251215    gcc-14
um                    randconfig-002-20251215    gcc-15.1.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251215    clang-20
x86_64      buildonly-randconfig-001-20251215    gcc-14
x86_64      buildonly-randconfig-002-20251215    clang-20
x86_64      buildonly-randconfig-003-20251215    clang-20
x86_64      buildonly-randconfig-004-20251215    clang-20
x86_64      buildonly-randconfig-005-20251215    clang-20
x86_64      buildonly-randconfig-006-20251215    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251215    gcc-14
x86_64                randconfig-002-20251215    gcc-14
x86_64                randconfig-003-20251215    gcc-14
x86_64                randconfig-004-20251215    clang-20
x86_64                randconfig-004-20251215    gcc-14
x86_64                randconfig-005-20251215    gcc-14
x86_64                randconfig-006-20251215    clang-20
x86_64                randconfig-006-20251215    gcc-14
x86_64                randconfig-011-20251215    clang-20
x86_64                randconfig-011-20251215    gcc-14
x86_64                randconfig-012-20251215    clang-20
x86_64                randconfig-012-20251215    gcc-14
x86_64                randconfig-013-20251215    clang-20
x86_64                randconfig-013-20251215    gcc-14
x86_64                randconfig-014-20251215    clang-20
x86_64                randconfig-014-20251215    gcc-14
x86_64                randconfig-015-20251215    gcc-13
x86_64                randconfig-015-20251215    gcc-14
x86_64                randconfig-016-20251215    gcc-14
x86_64                randconfig-071-20251215    clang-20
x86_64                randconfig-071-20251215    gcc-14
x86_64                randconfig-072-20251215    clang-20
x86_64                randconfig-072-20251215    gcc-14
x86_64                randconfig-073-20251215    gcc-14
x86_64                randconfig-074-20251215    gcc-13
x86_64                randconfig-074-20251215    gcc-14
x86_64                randconfig-075-20251215    clang-20
x86_64                randconfig-075-20251215    gcc-14
x86_64                randconfig-076-20251215    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20251215    gcc-15.1.0
xtensa                randconfig-001-20251215    gcc-8.5.0
xtensa                randconfig-002-20251215    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
