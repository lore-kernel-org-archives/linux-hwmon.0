Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77472DA75A
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Feb 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770571815; cv=none; b=dyUT+0HT7BYXuIa/64T0WbgeYCcw+J9BzrgmTrlbzV8CZ7J2PI2yFx4i+QvriRah4tsIR8MH//Pvofs+Ngh6QJ0vlq0uQO/qPxAl6nJUh6cKvBDi2CQDaPwRzKHZy1QgJ1cGCxj6+tU//WjmVutJagb0qqnlT50kuGU8Cm1GjxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770571815; c=relaxed/simple;
	bh=NkmMtFs2wvWMC7frOyTDNl+z/ddSkv4aETgHRV0Ex8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vt/dkFIY3uN/dqkdGY9tak1M2CmFUzUawOgmHU5DLNblXag7LeTncIQtYvz5sCfbGneJFVqdyphY7dDUgny5ErPYwVNNP2qz2PgHeThCHfsU4DRd4g+EAxRzADN5xx4A8TFAJuU0rcPhcEjIkUjqdAh9uW7pC1UXbxkeUKR6dJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0qpnjgm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0qpnjgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770571814; x=1802107814;
  h=date:from:to:cc:subject:message-id;
  bh=NkmMtFs2wvWMC7frOyTDNl+z/ddSkv4aETgHRV0Ex8M=;
  b=b0qpnjgmquzTx2F2/iiprP0386W50nej7EbEAgSX8muANO3i7+EtCEt/
   f7qrLk3x4byPZ5g+cIaFyt28S2b553HGsoRd63MO2jdb01gERD0g8vIxP
   1BRYwvX7164XUxhtUG7nPxakEmMKzCChX9Qlw4XYmWM2s+KxvnPUuHNs3
   ynfuFap0DJF0x2PzOD1vnw1HTCoIubhT7t+tUjHbBvy+Jxez0kbIaRUgn
   MwqkdyfToAZDfNEbDW8h57KX658ytZ8HYystcobehGKO8/nzBwp/GqjKr
   XN/DBV0neNMfGOcB71H7Gxf9GH58Gcgknbj3dqNSJAxeH+NEU4G9PJic3
   w==;
X-CSE-ConnectionGUID: twYdKEVOQaa4eBKDwVfUEg==
X-CSE-MsgGUID: 9QA0cv9PTh6pepb32QYHDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="59266088"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="59266088"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 09:30:14 -0800
X-CSE-ConnectionGUID: EdFPpSr4TzS/SC0bdV+iTQ==
X-CSE-MsgGUID: AJWaLT0/TDeRQxd89g0AEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="210569874"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Feb 2026 09:30:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vp8bq-00000000mK8-3DN3;
	Sun, 08 Feb 2026 17:30:10 +0000
Date: Mon, 09 Feb 2026 01:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 69d9d891cb0ad3b3e32789da712dae5461c72553
Message-ID: <202602090103.ZAbnjsBN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 69d9d891cb0ad3b3e32789da712dae5461c72553  Revert "hwmon: (ibmpex) fix use-after-free in high/low store"

elapsed time: 1351m

configs tested: 232
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              alldefconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                     nsimosci_hs_defconfig    gcc-15.2.0
arc                   randconfig-001-20260208    gcc-12.5.0
arc                   randconfig-002-20260208    gcc-12.5.0
arc                        vdk_hs38_defconfig    gcc-15.2.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                        clps711x_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    gcc-15.2.0
arm                          exynos_defconfig    gcc-15.2.0
arm                           imxrt_defconfig    gcc-15.2.0
arm                        keystone_defconfig    clang-22
arm                         lpc18xx_defconfig    gcc-15.2.0
arm                         orion5x_defconfig    gcc-15.2.0
arm                   randconfig-001-20260208    gcc-12.5.0
arm                   randconfig-002-20260208    gcc-12.5.0
arm                   randconfig-003-20260208    gcc-12.5.0
arm                   randconfig-004-20260208    gcc-12.5.0
arm                        shmobile_defconfig    gcc-15.2.0
arm                        spear3xx_defconfig    clang-22
arm                           spitz_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260208    gcc-15.2.0
arm64                 randconfig-002-20260208    gcc-15.2.0
arm64                 randconfig-003-20260208    gcc-15.2.0
arm64                 randconfig-004-20260208    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260208    gcc-15.2.0
csky                  randconfig-002-20260208    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260208    gcc-12.5.0
hexagon               randconfig-002-20260208    gcc-12.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260208    gcc-14
i386        buildonly-randconfig-002-20260208    gcc-14
i386        buildonly-randconfig-003-20260208    gcc-14
i386        buildonly-randconfig-004-20260208    gcc-14
i386        buildonly-randconfig-005-20260208    gcc-14
i386        buildonly-randconfig-006-20260208    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260208    gcc-14
i386                  randconfig-002-20260208    gcc-14
i386                  randconfig-003-20260208    gcc-14
i386                  randconfig-004-20260208    gcc-14
i386                  randconfig-005-20260208    gcc-14
i386                  randconfig-006-20260208    gcc-14
i386                  randconfig-007-20260208    gcc-14
i386                  randconfig-011-20260208    gcc-14
i386                  randconfig-012-20260208    gcc-14
i386                  randconfig-013-20260208    gcc-14
i386                  randconfig-014-20260208    gcc-14
i386                  randconfig-015-20260208    gcc-14
i386                  randconfig-016-20260208    gcc-14
i386                  randconfig-017-20260208    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260208    gcc-12.5.0
loongarch             randconfig-002-20260208    gcc-12.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
m68k                       m5249evb_defconfig    clang-22
m68k                           sun3_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                         db1xxx_defconfig    gcc-15.2.0
mips                      loongson3_defconfig    clang-22
mips                      pic32mzda_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260208    gcc-12.5.0
nios2                 randconfig-002-20260208    gcc-12.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260208    gcc-10.5.0
parisc                randconfig-002-20260208    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     asp8347_defconfig    clang-22
powerpc                 canyonlands_defconfig    clang-22
powerpc                       holly_defconfig    gcc-15.2.0
powerpc                     ksi8560_defconfig    gcc-15.2.0
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    clang-22
powerpc                     mpc5200_defconfig    clang-22
powerpc               mpc834x_itxgp_defconfig    clang-22
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc                      pasemi_defconfig    gcc-15.2.0
powerpc                     ppa8548_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260208    gcc-10.5.0
powerpc               randconfig-002-20260208    gcc-10.5.0
powerpc                     redwood_defconfig    gcc-15.2.0
powerpc                     skiroot_defconfig    gcc-15.2.0
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc                      tqm8xx_defconfig    gcc-15.2.0
powerpc                        warp_defconfig    gcc-15.2.0
powerpc                         wii_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260208    gcc-10.5.0
powerpc64             randconfig-002-20260208    gcc-10.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260208    clang-22
riscv                 randconfig-002-20260208    clang-22
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260208    clang-22
s390                  randconfig-002-20260208    clang-22
s390                  randconfig-002-20260208    gcc-10.5.0
s390                       zfcpdump_defconfig    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                        dreamcast_defconfig    clang-22
sh                         ecovec24_defconfig    gcc-15.2.0
sh                               j2_defconfig    clang-22
sh                    randconfig-001-20260208    clang-22
sh                    randconfig-001-20260208    gcc-11.5.0
sh                    randconfig-002-20260208    clang-22
sh                    randconfig-002-20260208    gcc-15.2.0
sh                          rsk7203_defconfig    gcc-15.2.0
sh                           se7705_defconfig    gcc-15.2.0
sh                           se7722_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    clang-22
sh                           sh2007_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    gcc-15.2.0
sh                        sh7785lcr_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260208    gcc-11.5.0
sparc                 randconfig-002-20260208    gcc-11.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260208    gcc-11.5.0
sparc64               randconfig-002-20260208    gcc-11.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260208    gcc-11.5.0
um                    randconfig-002-20260208    gcc-11.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260208    gcc-14
x86_64      buildonly-randconfig-002-20260208    gcc-14
x86_64      buildonly-randconfig-003-20260208    gcc-14
x86_64      buildonly-randconfig-004-20260208    gcc-14
x86_64      buildonly-randconfig-005-20260208    gcc-14
x86_64      buildonly-randconfig-006-20260208    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260208    gcc-14
x86_64                randconfig-002-20260208    gcc-14
x86_64                randconfig-003-20260208    gcc-14
x86_64                randconfig-004-20260208    gcc-14
x86_64                randconfig-005-20260208    gcc-14
x86_64                randconfig-006-20260208    gcc-14
x86_64                randconfig-011-20260208    clang-20
x86_64                randconfig-012-20260208    clang-20
x86_64                randconfig-013-20260208    clang-20
x86_64                randconfig-014-20260208    clang-20
x86_64                randconfig-015-20260208    clang-20
x86_64                randconfig-016-20260208    clang-20
x86_64                randconfig-071-20260208    clang-20
x86_64                randconfig-072-20260208    clang-20
x86_64                randconfig-073-20260208    clang-20
x86_64                randconfig-074-20260208    clang-20
x86_64                randconfig-075-20260208    clang-20
x86_64                randconfig-076-20260208    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260208    gcc-11.5.0
xtensa                randconfig-002-20260208    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
