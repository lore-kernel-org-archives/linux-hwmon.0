Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C638F258
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326877; cv=none; b=rv32l1qghLtnlbQr2BKyIEmIwei+RPg11Ns/pUotGbg0Q37Q20tZvFzbBh6tdcg+c+hKKem4ao/nbB9abdwO7wfz6QCjENMAMiAg/8fuYOR33WgFdH9rJeBd9LRJ9VZDLblQhW8FdxU1hi7jVBVDNd/xzy3wDVRRqEaJgyIBVt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326877; c=relaxed/simple;
	bh=Vru0vhu4JBS5RfKhnkHKFsOY7u+G8dHC2MA7fjHap5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RCJrGDAjk+fxExowQBwyD7xoDF0x8mrEcRFfv4WueuCxkVGDg+kmvq95L2NUGtnmw3QQ9tOEJ+68Z7aenTqlG9TqS7lPWgUna0qIPBhf++D5JeG6W0pxjwNmREcomfHeKI7PyPAugSEtIjSK8CFtU+L/CiKhMj3MRSCULntFiuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM5w2oFk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM5w2oFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768326875; x=1799862875;
  h=date:from:to:cc:subject:message-id;
  bh=Vru0vhu4JBS5RfKhnkHKFsOY7u+G8dHC2MA7fjHap5M=;
  b=jM5w2oFksPgduesrhWHzH0l06JDS9oiledexJgGU/k1RMfON/6rqL9+u
   Ec4PASSOCQL8sBXyajjS7FDQpogc0JpkUW9C0bRNLyKCKjdNKFAsnZsBx
   WKvMP0OG5ZjsnztX1OBGhGtE0W9qNLvmtcBj8hF2Thi/885bUPwi9DjI4
   UaAsOsNAMgkhsVcAWVMTYMS9FTcFILjALhe8n77ALYLgUX6efpauFX2gV
   PBA1owXf9rPO4Dlhr9QJx3RnG0iEq/LHcTB4Xx9jVNMtunmat7FRSlvIE
   i6m8dlTvqk4Hz6UJoc2g1atf36DGPW1O43o/zfBH/l/rIN5t1GuiDm2Nu
   g==;
X-CSE-ConnectionGUID: fDMABSuoTACrKmLH1QDE2Q==
X-CSE-MsgGUID: 3yhPFpR8SmmO2I1TI4PcgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="79916754"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="79916754"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:54:35 -0800
X-CSE-ConnectionGUID: Fh4Q4gpsSnSE9WUjk5sFEg==
X-CSE-MsgGUID: 5xbpEw2bRXyvjHSEWdRtJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235704858"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jan 2026 09:54:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfib8-00000000FCS-3jTJ;
	Tue, 13 Jan 2026 17:54:30 +0000
Date: Wed, 14 Jan 2026 01:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 01d8d7107bf8034fe8693ee71abcb71dcd9c2d99
Message-ID: <202601140133.5TX3vZxx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 01d8d7107bf8034fe8693ee71abcb71dcd9c2d99  hwmon: (gpd-fan) add support for Micro PC 2

elapsed time: 747m

configs tested: 245
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                          axs101_defconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260113    clang-22
arc                   randconfig-001-20260114    gcc-10.5.0
arc                   randconfig-002-20260113    clang-22
arc                   randconfig-002-20260114    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                       imx_v6_v7_defconfig    gcc-15.2.0
arm                   randconfig-001-20260113    clang-22
arm                   randconfig-001-20260114    gcc-10.5.0
arm                   randconfig-002-20260113    clang-22
arm                   randconfig-002-20260114    gcc-10.5.0
arm                   randconfig-003-20260113    clang-22
arm                   randconfig-003-20260114    gcc-10.5.0
arm                   randconfig-004-20260113    clang-22
arm                   randconfig-004-20260114    gcc-10.5.0
arm                        spear3xx_defconfig    gcc-15.2.0
arm                           spitz_defconfig    gcc-15.2.0
arm                         wpcm450_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260113    clang-22
arm64                 randconfig-001-20260114    clang-22
arm64                 randconfig-002-20260113    clang-22
arm64                 randconfig-002-20260114    clang-22
arm64                 randconfig-003-20260113    clang-22
arm64                 randconfig-003-20260114    clang-22
arm64                 randconfig-004-20260113    clang-22
arm64                 randconfig-004-20260114    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260113    clang-22
csky                  randconfig-001-20260114    clang-22
csky                  randconfig-002-20260113    clang-22
csky                  randconfig-002-20260114    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260113    clang-22
hexagon               randconfig-001-20260114    clang-22
hexagon               randconfig-002-20260113    clang-22
hexagon               randconfig-002-20260114    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260113    clang-20
i386        buildonly-randconfig-002-20260113    clang-20
i386        buildonly-randconfig-003-20260113    clang-20
i386        buildonly-randconfig-004-20260113    clang-20
i386        buildonly-randconfig-005-20260113    clang-20
i386        buildonly-randconfig-006-20260113    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260113    clang-20
i386                  randconfig-001-20260113    gcc-14
i386                  randconfig-002-20260113    clang-20
i386                  randconfig-003-20260113    clang-20
i386                  randconfig-004-20260113    clang-20
i386                  randconfig-004-20260113    gcc-14
i386                  randconfig-005-20260113    clang-20
i386                  randconfig-006-20260113    clang-20
i386                  randconfig-007-20260113    clang-20
i386                  randconfig-007-20260113    gcc-14
i386                  randconfig-011-20260113    gcc-14
i386                  randconfig-011-20260114    gcc-14
i386                  randconfig-012-20260113    gcc-14
i386                  randconfig-012-20260114    gcc-14
i386                  randconfig-013-20260113    gcc-14
i386                  randconfig-013-20260114    gcc-14
i386                  randconfig-014-20260113    gcc-14
i386                  randconfig-014-20260114    gcc-14
i386                  randconfig-015-20260113    gcc-14
i386                  randconfig-015-20260114    gcc-14
i386                  randconfig-016-20260113    gcc-14
i386                  randconfig-016-20260114    gcc-14
i386                  randconfig-017-20260113    gcc-14
i386                  randconfig-017-20260114    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260113    clang-22
loongarch             randconfig-001-20260114    clang-22
loongarch             randconfig-002-20260113    clang-22
loongarch             randconfig-002-20260114    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                        mvme147_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                  cavium_octeon_defconfig    gcc-15.2.0
mips                           gcw0_defconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-15.2.0
mips                           rs90_defconfig    gcc-15.2.0
nios2                         10m50_defconfig    gcc-15.2.0
nios2                         3c120_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260113    clang-22
nios2                 randconfig-001-20260114    clang-22
nios2                 randconfig-002-20260113    clang-22
nios2                 randconfig-002-20260114    clang-22
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260113    clang-19
parisc                randconfig-001-20260114    gcc-14.3.0
parisc                randconfig-002-20260113    clang-19
parisc                randconfig-002-20260114    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc               randconfig-001-20260113    clang-19
powerpc               randconfig-001-20260114    gcc-14.3.0
powerpc               randconfig-002-20260113    clang-19
powerpc               randconfig-002-20260114    gcc-14.3.0
powerpc64             randconfig-001-20260113    clang-19
powerpc64             randconfig-001-20260114    gcc-14.3.0
powerpc64             randconfig-002-20260113    clang-19
powerpc64             randconfig-002-20260114    gcc-14.3.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-15.2.0
riscv                 randconfig-001-20260113    gcc-9.5.0
riscv                 randconfig-001-20260114    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-15.2.0
riscv                 randconfig-002-20260113    gcc-8.5.0
riscv                 randconfig-002-20260114    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260113    gcc-15.2.0
s390                  randconfig-001-20260113    gcc-8.5.0
s390                  randconfig-001-20260114    gcc-15.2.0
s390                  randconfig-002-20260113    gcc-14.3.0
s390                  randconfig-002-20260113    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-15.2.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          landisk_defconfig    gcc-15.2.0
sh                    randconfig-001-20260113    gcc-15.2.0
sh                    randconfig-001-20260114    gcc-15.2.0
sh                    randconfig-002-20260113    gcc-14.3.0
sh                    randconfig-002-20260113    gcc-15.2.0
sh                    randconfig-002-20260114    gcc-15.2.0
sh                      rts7751r2d1_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260113    gcc-14.3.0
sparc                 randconfig-001-20260113    gcc-8.5.0
sparc                 randconfig-002-20260113    gcc-14.3.0
sparc                 randconfig-002-20260113    gcc-8.5.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260113    gcc-14.3.0
sparc64               randconfig-002-20260113    gcc-14.3.0
sparc64               randconfig-002-20260113    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260113    gcc-14
um                    randconfig-001-20260113    gcc-14.3.0
um                    randconfig-002-20260113    clang-22
um                    randconfig-002-20260113    gcc-14.3.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260113    clang-20
x86_64      buildonly-randconfig-002-20260113    clang-20
x86_64      buildonly-randconfig-003-20260113    clang-20
x86_64      buildonly-randconfig-004-20260113    clang-20
x86_64      buildonly-randconfig-005-20260113    clang-20
x86_64      buildonly-randconfig-006-20260113    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260113    gcc-14
x86_64                randconfig-001-20260114    gcc-14
x86_64                randconfig-002-20260113    gcc-14
x86_64                randconfig-002-20260114    gcc-14
x86_64                randconfig-003-20260113    clang-20
x86_64                randconfig-003-20260113    gcc-14
x86_64                randconfig-003-20260114    gcc-14
x86_64                randconfig-004-20260113    gcc-14
x86_64                randconfig-004-20260114    gcc-14
x86_64                randconfig-005-20260113    gcc-14
x86_64                randconfig-005-20260114    gcc-14
x86_64                randconfig-006-20260113    gcc-14
x86_64                randconfig-006-20260114    gcc-14
x86_64                randconfig-011-20260113    clang-20
x86_64                randconfig-011-20260113    gcc-13
x86_64                randconfig-012-20260113    clang-20
x86_64                randconfig-013-20260113    clang-20
x86_64                randconfig-014-20260113    clang-20
x86_64                randconfig-014-20260113    gcc-13
x86_64                randconfig-015-20260113    clang-20
x86_64                randconfig-015-20260113    gcc-14
x86_64                randconfig-016-20260113    clang-20
x86_64                randconfig-071-20260113    clang-20
x86_64                randconfig-072-20260113    clang-20
x86_64                randconfig-073-20260113    clang-20
x86_64                randconfig-074-20260113    clang-20
x86_64                randconfig-075-20260113    clang-20
x86_64                randconfig-076-20260113    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260113    gcc-14.3.0
xtensa                randconfig-001-20260113    gcc-9.5.0
xtensa                randconfig-002-20260113    gcc-14.3.0
xtensa                randconfig-002-20260113    gcc-15.2.0
xtensa                    smp_lx200_defconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
