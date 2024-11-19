Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFEA1CBE86
	for <linux-hwmon@vger.kernel.org>; Tue, 19 Nov 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732023477; cv=none; b=UpeLEkc/NmneWj3IHJu0W+Z7uPpMSS/MPz2DS0PoIF19QGUh86C2ew+j6FtZcpkBSdkdR5ZCMaSPxOeOkkHHD1JKoDb0MgTXYdlNNFs/Je8r2HQll9ztbJgAOhCauiRP13iyy0hx9R8+qPFVOkcejSJkILvohZFQQMSzOvFOFsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732023477; c=relaxed/simple;
	bh=9gtIfMYI/897W8EyXzNXkpk52HB1aDQIfsTl9YANLeo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CGSsaoXSdQYd9Mhv8k9ob+N/WbE3cIWMRYoaZCStQi68M7Dv0dY0dqxIBx8C9AtnqNlnWaEoKKtvTGvl+Cu6FegfMNHpogaWwXbSlrTdeCcWZMgt40d2eLT9lZ8oOXLMVdJYDideIO7JIyruMclMxNwihjlt1Lxp8abC/e7dcNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqAs9d3a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqAs9d3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732023476; x=1763559476;
  h=date:from:to:cc:subject:message-id;
  bh=9gtIfMYI/897W8EyXzNXkpk52HB1aDQIfsTl9YANLeo=;
  b=fqAs9d3aNSUThecZxuipGx/qhYFFnEO2lhbr0PgzwMLnNMPCx4Dx196+
   GDOngyV1+uqvLPCHoskoL7Ccf/Um1qb0ZdVQiN5T8dF6tbGwh+C56PXmh
   9UtZLIiBSJOytOmDPExrdmDoEmXM9rhNKZfu8OsctxnPhnVo+FiRHpKA6
   jJ1W9EqloGhmErv/F05zANVbRl5n9avkpOX57IozvyLi5OnGYESagpSOh
   olJ5XOYyCcPF5fJNMAWKOSSNRDpLCwfF0ZjN4n3eqqBcl84Vy1+9fXYUz
   3/f0pGhcbXwUUyqROfroelmlgeufyXsNWv3j3VtSka0IvSfIH62Cp70fc
   Q==;
X-CSE-ConnectionGUID: KK03OB+aT6eKG5SjuTtk9w==
X-CSE-MsgGUID: YKGfpQvfSQqwd/fKUr3w+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35691270"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35691270"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 05:37:53 -0800
X-CSE-ConnectionGUID: WA1w07sFSUmyGfzNpSTt3g==
X-CSE-MsgGUID: kmzEBVANQGCMkpXa6jFfeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="89571188"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2024 05:37:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDOQP-000068-0j;
	Tue, 19 Nov 2024 13:37:49 +0000
Date: Tue, 19 Nov 2024 20:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 b66eef7e5bbbf2d646ac3274b64fa19ac2130860
Message-ID: <202411192022.90whHa59-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: b66eef7e5bbbf2d646ac3274b64fa19ac2130860  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1287m

configs tested: 256
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsimosci_defconfig    clang-15
arc                   randconfig-001-20241119    gcc-14.2.0
arc                   randconfig-002-20241119    gcc-14.2.0
arc                           tb10x_defconfig    clang-20
arc                        vdk_hs38_defconfig    clang-20
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                        clps711x_defconfig    clang-15
arm                                 defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-20
arm                            hisi_defconfig    clang-20
arm                        keystone_defconfig    clang-20
arm                         lpc32xx_defconfig    clang-15
arm                   milbeaut_m10v_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                          pxa910_defconfig    clang-20
arm                             pxa_defconfig    clang-20
arm                   randconfig-001-20241119    gcc-14.2.0
arm                   randconfig-002-20241119    gcc-14.2.0
arm                   randconfig-003-20241119    gcc-14.2.0
arm                   randconfig-004-20241119    gcc-14.2.0
arm                             rpc_defconfig    clang-20
arm                           sama5_defconfig    clang-20
arm                       spear13xx_defconfig    clang-20
arm                        spear3xx_defconfig    clang-15
arm                        spear6xx_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm                    vt8500_v6_v7_defconfig    clang-20
arm                         wpcm450_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241119    gcc-14.2.0
arm64                 randconfig-002-20241119    gcc-14.2.0
arm64                 randconfig-003-20241119    gcc-14.2.0
arm64                 randconfig-004-20241119    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241119    gcc-14.2.0
csky                  randconfig-002-20241119    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241119    gcc-14.2.0
hexagon               randconfig-002-20241119    gcc-14.2.0
i386                             alldefconfig    clang-20
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241119    clang-19
i386        buildonly-randconfig-002-20241119    clang-19
i386        buildonly-randconfig-002-20241119    gcc-12
i386        buildonly-randconfig-003-20241119    clang-19
i386        buildonly-randconfig-003-20241119    gcc-12
i386        buildonly-randconfig-004-20241119    clang-19
i386        buildonly-randconfig-005-20241119    clang-19
i386        buildonly-randconfig-006-20241119    clang-19
i386        buildonly-randconfig-006-20241119    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241119    clang-19
i386                  randconfig-001-20241119    gcc-12
i386                  randconfig-002-20241119    clang-19
i386                  randconfig-003-20241119    clang-19
i386                  randconfig-003-20241119    gcc-12
i386                  randconfig-004-20241119    clang-19
i386                  randconfig-004-20241119    gcc-11
i386                  randconfig-005-20241119    clang-19
i386                  randconfig-005-20241119    gcc-11
i386                  randconfig-006-20241119    clang-19
i386                  randconfig-011-20241119    clang-19
i386                  randconfig-012-20241119    clang-19
i386                  randconfig-013-20241119    clang-19
i386                  randconfig-014-20241119    clang-19
i386                  randconfig-014-20241119    gcc-12
i386                  randconfig-015-20241119    clang-19
i386                  randconfig-016-20241119    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241119    gcc-14.2.0
loongarch             randconfig-002-20241119    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                          hp300_defconfig    clang-15
m68k                       m5208evb_defconfig    clang-20
m68k                       m5249evb_defconfig    clang-20
m68k                       m5275evb_defconfig    clang-15
m68k                        m5307c3_defconfig    clang-20
m68k                            mac_defconfig    clang-20
m68k                        mvme147_defconfig    clang-20
m68k                            q40_defconfig    clang-20
m68k                          sun3x_defconfig    clang-15
m68k                           virt_defconfig    clang-15
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-20
mips                         db1xxx_defconfig    clang-20
mips                          eyeq5_defconfig    clang-20
mips                           gcw0_defconfig    clang-15
mips                           ip27_defconfig    clang-20
mips                        omega2p_defconfig    clang-20
mips                        qi_lb60_defconfig    clang-20
mips                       rbtx49xx_defconfig    clang-20
mips                        vocore2_defconfig    clang-15
mips                           xway_defconfig    clang-20
nios2                         3c120_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241119    gcc-14.2.0
nios2                 randconfig-002-20241119    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241119    gcc-14.2.0
parisc                randconfig-002-20241119    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-15
powerpc                     ep8248e_defconfig    clang-20
powerpc                          g5_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      katmai_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-15
powerpc                      mgcoge_defconfig    clang-20
powerpc                 mpc836x_rdk_defconfig    clang-15
powerpc                  mpc866_ads_defconfig    clang-20
powerpc                  mpc885_ads_defconfig    clang-20
powerpc                     ppa8548_defconfig    clang-15
powerpc               randconfig-001-20241119    gcc-14.2.0
powerpc               randconfig-002-20241119    gcc-14.2.0
powerpc               randconfig-003-20241119    gcc-14.2.0
powerpc                     redwood_defconfig    clang-20
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241119    gcc-14.2.0
powerpc64             randconfig-002-20241119    gcc-14.2.0
powerpc64             randconfig-003-20241119    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
riscv                 randconfig-001-20241119    gcc-14.2.0
riscv                 randconfig-002-20241119    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241119    gcc-14.2.0
s390                  randconfig-002-20241119    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                             espt_defconfig    clang-20
sh                               j2_defconfig    clang-20
sh                 kfr2r09-romimage_defconfig    clang-20
sh                    randconfig-001-20241119    gcc-14.2.0
sh                    randconfig-002-20241119    gcc-14.2.0
sh                           se7712_defconfig    clang-20
sh                           se7722_defconfig    clang-20
sh                           se7724_defconfig    clang-15
sh                        sh7763rdp_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241119    gcc-14.2.0
sparc64               randconfig-002-20241119    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-15
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241119    gcc-14.2.0
um                    randconfig-002-20241119    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241119    gcc-12
x86_64      buildonly-randconfig-002-20241119    gcc-12
x86_64      buildonly-randconfig-003-20241119    gcc-12
x86_64      buildonly-randconfig-004-20241119    gcc-12
x86_64      buildonly-randconfig-005-20241119    gcc-12
x86_64      buildonly-randconfig-006-20241119    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241119    gcc-12
x86_64                randconfig-002-20241119    gcc-12
x86_64                randconfig-003-20241119    gcc-12
x86_64                randconfig-004-20241119    gcc-12
x86_64                randconfig-005-20241119    gcc-12
x86_64                randconfig-006-20241119    gcc-12
x86_64                randconfig-011-20241119    gcc-12
x86_64                randconfig-012-20241119    gcc-12
x86_64                randconfig-013-20241119    gcc-12
x86_64                randconfig-014-20241119    gcc-12
x86_64                randconfig-015-20241119    gcc-12
x86_64                randconfig-016-20241119    gcc-12
x86_64                randconfig-071-20241119    gcc-12
x86_64                randconfig-072-20241119    gcc-12
x86_64                randconfig-073-20241119    gcc-12
x86_64                randconfig-074-20241119    gcc-12
x86_64                randconfig-075-20241119    gcc-12
x86_64                randconfig-076-20241119    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241119    gcc-14.2.0
xtensa                randconfig-002-20241119    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
