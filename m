Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B027F19ABD4
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Dec 2024 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781308; cv=none; b=QgzCxezE0G6B0fuP2TM0FV3QJJO4GXZeWobc3+ZaqCJSp/4JigU5Vn0Td/l24Eecn6cMHpFehX/i5OZ4sW0Av79bP4z4GAnbvq/oAVP5pNN6IK1vAk8DRGRLFKdveZPZavSQk2h1hS1WBAEskcjgF42jcb9m/Bb13hyzs2e0+Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781308; c=relaxed/simple;
	bh=dnNBF5nxtGwOn+D5fZo2+1GNSDz/rm4Ny4kR5XV3rFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERFFiO/CwAymjAOdZe1yJpusRIkickKO+PCncnlhVDIBFWWYEDIAPCTcZz5VSzKvjVCOh4Owy0MOD/X8VZBQdqEjKe09DgJKBkwWA5A0VLew8Srx4dAu13ktdtZjseQ4zVjr7siU4sVssmF3xSPdlYTd27M6py153J+T1P6JKyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h24OVMmY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h24OVMmY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733781306; x=1765317306;
  h=date:from:to:cc:subject:message-id;
  bh=dnNBF5nxtGwOn+D5fZo2+1GNSDz/rm4Ny4kR5XV3rFA=;
  b=h24OVMmYqW7nF2eVL1u0fnhJtuENVwuJav3XSScCPp0XifSCZP9eH2en
   0Qlr17oPlzwo8mrm70tmfDBC3par70IPuCiGByIqhpINes1HrFsSo19UG
   IExGXoqKLgcffxoehQJZYq2BOPYk60iOMDxg/mpV9XNWbQInZ+5u6eAS1
   e7tKR5GRURuHLVfXXQvdMgD6JUHmVgkelQIF33lhfxoOEubqOpjRBlGtc
   kU+9TRDD6bLOgBtx/WpCqQofDT/hMSIAnI2//dV2VeSkmAsp87I7dPfOO
   IoQnhgMVp7dvUru5XWsocJDqOGU3/RfzAHxFa3gXaK0HOHMUQeO3xDEob
   A==;
X-CSE-ConnectionGUID: iq4pjZ03RQOMVv3MfMtIKA==
X-CSE-MsgGUID: jlsI2CxJRu2c2eOwlTc8xQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="51515092"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="51515092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 13:55:05 -0800
X-CSE-ConnectionGUID: jeWevLxSROCUPdWvi1wywg==
X-CSE-MsgGUID: xTJ8ZsJSTvyZOE5K2R6Hpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95997373"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2024 13:55:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKliX-0004qP-2M;
	Mon, 09 Dec 2024 21:55:01 +0000
Date: Tue, 10 Dec 2024 05:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 2d7f32a8f3a077e864c81b9e287d076e0710345d
Message-ID: <202412100534.evSX5lZV-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 2d7f32a8f3a077e864c81b9e287d076e0710345d  Merge branch 'fixes-v6.13' into testing

Warning ids grouped by kconfigs:

recent_errors
`-- i386-randconfig-141-20241209
    |-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val-.
    `-- drivers-hwmon-hwmon.c-hwmon_attr_show()-error:uninitialized-symbol-val64-.

elapsed time: 1256m

configs tested: 246
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241209    clang-20
arc                   randconfig-001-20241209    gcc-13.2.0
arc                   randconfig-002-20241209    clang-20
arc                   randconfig-002-20241209    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-13.2.0
arc                        vdk_hs38_defconfig    gcc-14.2.0
arc                    vdk_hs38_smp_defconfig    gcc-14.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                           h3600_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-19
arm                      jornada720_defconfig    clang-20
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241209    clang-20
arm                   randconfig-002-20241209    clang-20
arm                   randconfig-003-20241209    clang-20
arm                   randconfig-004-20241209    clang-20
arm                        shmobile_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20241209    clang-20
arm64                 randconfig-001-20241209    gcc-14.2.0
arm64                 randconfig-002-20241209    clang-20
arm64                 randconfig-003-20241209    clang-19
arm64                 randconfig-003-20241209    clang-20
arm64                 randconfig-004-20241209    clang-20
arm64                 randconfig-004-20241209    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20241209    clang-17
csky                  randconfig-001-20241209    gcc-14.2.0
csky                  randconfig-002-20241209    clang-17
csky                  randconfig-002-20241209    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20241209    clang-16
hexagon               randconfig-001-20241209    clang-17
hexagon               randconfig-002-20241209    clang-17
hexagon               randconfig-002-20241209    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241209    clang-19
i386        buildonly-randconfig-002-20241209    clang-19
i386        buildonly-randconfig-003-20241209    clang-19
i386        buildonly-randconfig-004-20241209    clang-19
i386        buildonly-randconfig-005-20241209    clang-19
i386        buildonly-randconfig-006-20241209    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20241209    clang-19
i386                  randconfig-002-20241209    clang-19
i386                  randconfig-003-20241209    clang-19
i386                  randconfig-004-20241209    clang-19
i386                  randconfig-005-20241209    clang-19
i386                  randconfig-006-20241209    clang-19
i386                  randconfig-007-20241209    clang-19
i386                  randconfig-011-20241209    gcc-12
i386                  randconfig-012-20241209    gcc-12
i386                  randconfig-013-20241209    gcc-12
i386                  randconfig-014-20241209    gcc-12
i386                  randconfig-015-20241209    gcc-12
i386                  randconfig-016-20241209    gcc-12
i386                  randconfig-017-20241209    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20241209    clang-17
loongarch             randconfig-001-20241209    gcc-14.2.0
loongarch             randconfig-002-20241209    clang-17
loongarch             randconfig-002-20241209    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    clang-20
mips                      bmips_stb_defconfig    clang-20
mips                         db1xxx_defconfig    clang-20
mips                        omega2p_defconfig    clang-16
mips                        qi_lb60_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20241209    clang-17
nios2                 randconfig-001-20241209    gcc-14.2.0
nios2                 randconfig-002-20241209    clang-17
nios2                 randconfig-002-20241209    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241209    clang-17
parisc                randconfig-001-20241209    gcc-14.2.0
parisc                randconfig-002-20241209    clang-17
parisc                randconfig-002-20241209    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                   bluestone_defconfig    gcc-14.2.0
powerpc                      cm5200_defconfig    clang-20
powerpc               randconfig-001-20241209    clang-17
powerpc               randconfig-001-20241209    gcc-14.2.0
powerpc               randconfig-002-20241209    clang-15
powerpc               randconfig-002-20241209    clang-17
powerpc               randconfig-003-20241209    clang-17
powerpc                     sequoia_defconfig    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                  storcenter_defconfig    gcc-14.2.0
powerpc                         wii_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241209    clang-17
powerpc64             randconfig-001-20241209    gcc-14.2.0
powerpc64             randconfig-002-20241209    clang-17
powerpc64             randconfig-003-20241209    clang-17
powerpc64             randconfig-003-20241209    clang-20
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20241209    clang-19
riscv                 randconfig-001-20241209    gcc-14.2.0
riscv                 randconfig-002-20241209    clang-20
riscv                 randconfig-002-20241209    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241209    clang-16
s390                  randconfig-001-20241209    gcc-14.2.0
s390                  randconfig-002-20241209    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                        dreamcast_defconfig    gcc-14.2.0
sh                     magicpanelr2_defconfig    gcc-14.2.0
sh                    randconfig-001-20241209    gcc-14.2.0
sh                    randconfig-002-20241209    gcc-14.2.0
sh                          rsk7203_defconfig    gcc-14.2.0
sh                          rsk7269_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sh                            titan_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241209    gcc-14.2.0
sparc                 randconfig-002-20241209    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241209    gcc-14.2.0
sparc64               randconfig-002-20241209    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241209    clang-19
um                    randconfig-001-20241209    gcc-14.2.0
um                    randconfig-002-20241209    gcc-12
um                    randconfig-002-20241209    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241209    gcc-12
x86_64      buildonly-randconfig-002-20241209    gcc-12
x86_64      buildonly-randconfig-003-20241209    clang-19
x86_64      buildonly-randconfig-003-20241209    gcc-12
x86_64      buildonly-randconfig-004-20241209    gcc-12
x86_64      buildonly-randconfig-005-20241209    clang-19
x86_64      buildonly-randconfig-005-20241209    gcc-12
x86_64      buildonly-randconfig-006-20241209    clang-19
x86_64      buildonly-randconfig-006-20241209    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241209    gcc-12
x86_64                randconfig-002-20241209    gcc-12
x86_64                randconfig-003-20241209    gcc-12
x86_64                randconfig-004-20241209    gcc-12
x86_64                randconfig-005-20241209    gcc-12
x86_64                randconfig-006-20241209    gcc-12
x86_64                randconfig-007-20241209    gcc-12
x86_64                randconfig-008-20241209    gcc-12
x86_64                randconfig-071-20241209    gcc-12
x86_64                randconfig-072-20241209    gcc-12
x86_64                randconfig-073-20241209    gcc-12
x86_64                randconfig-074-20241209    gcc-12
x86_64                randconfig-075-20241209    gcc-12
x86_64                randconfig-076-20241209    gcc-12
x86_64                randconfig-077-20241209    gcc-12
x86_64                randconfig-078-20241209    gcc-12
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241209    gcc-14.2.0
xtensa                randconfig-002-20241209    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
