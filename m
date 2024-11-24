Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FAB847C
	for <linux-hwmon@vger.kernel.org>; Sun, 24 Nov 2024 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732431721; cv=none; b=XJ3MtBFrjmwAFPkZnyk0cFLns4KNYFbjfnqo58txGVoHBgYtEsemAGIbgzMli2m3XnRR2+L2167VyFQR58UxKZ9ztfuNakx0699IT2XG51ExSk4h9zC7orRp9jnTHf6okdDPW5Pu0Hwodgbn8l4ef0ysoL6RfbP/bl3AVlz7/2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732431721; c=relaxed/simple;
	bh=EWhz3bKDqboqx0Ox5A+l7HM9B/KCqxmus1z+Mz+Vb1Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YQgUoIcVFBJVXcFohKReTNE+s15CAy5dyoTeUgQsmXEMwveUvuQBJg5z/FEYqVYDG7XwooIliFO1XniIl9VLBuQnDnYI/J+XJs+2d5Hyp+8dffMaB1UnwzReaRHJkPqMVYQpBheqx7qRysRnu614FkvtsLcwULvoEY/RIMRPmDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQn/2IjH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQn/2IjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732431718; x=1763967718;
  h=date:from:to:cc:subject:message-id;
  bh=EWhz3bKDqboqx0Ox5A+l7HM9B/KCqxmus1z+Mz+Vb1Q=;
  b=IQn/2IjHdlvNXZKdmLwut8GlLGfEforL0bXiBTtlCGuAxK5mEy64CdPT
   XSjwWLEs7tGFAl/EeT8GDQa4FKvpzqeS2uh94GSn4yqt5/Jbg4RspUaTt
   nNvtdxIAuiP52pp0zD5ltJ+bG9tGfhIaZj28wntaka2AhIJnW9opVcrNo
   xcKdUcBsHwZr3Znu7cjrNsLi0YYHcJKHCzt2MMWVSReHoc0xu6pdnHBaP
   D4msJ5a3+TIfIAjWSag39W6IwZ6T19iINlrtLUhmmEbAuHBTrTTtIFxja
   w5udB+PyGCu/H716oxDni8LNVvQbXp2csbd3yBfcg8uOvpyTgFjF2tBa8
   w==;
X-CSE-ConnectionGUID: SmlNVW/eT+Scu5h3wAf9PQ==
X-CSE-MsgGUID: qMGCDu43StiGVk6oOvsQjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11265"; a="36322230"
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="36322230"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 23:01:58 -0800
X-CSE-ConnectionGUID: dbbn+w4XROy7SJUquGdCNQ==
X-CSE-MsgGUID: tjeNg4MAS6OBhJWIKuF+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,180,1728975600"; 
   d="scan'208";a="128462061"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Nov 2024 23:01:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tF6d0-0004uQ-38;
	Sun, 24 Nov 2024 07:01:54 +0000
Date: Sun, 24 Nov 2024 15:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 6a537bb9887fb41c8b6468c9834281c643282dbb
Message-ID: <202411241552.Gr0xgto6-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 6a537bb9887fb41c8b6468c9834281c643282dbb  Merge branch 'fixes-v6.13' into testing

elapsed time: 721m

configs tested: 245
configs skipped: 21

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                        nsimosci_defconfig    clang-20
arc                   randconfig-001-20241124    clang-14
arc                   randconfig-001-20241124    gcc-13.2.0
arc                   randconfig-002-20241124    clang-14
arc                   randconfig-002-20241124    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    clang-20
arm                              alldefconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                         axm55xx_defconfig    gcc-14.2.0
arm                          ep93xx_defconfig    clang-14
arm                      footbridge_defconfig    gcc-14.2.0
arm                            mps2_defconfig    clang-20
arm                       multi_v4t_defconfig    gcc-14.2.0
arm                            qcom_defconfig    clang-20
arm                   randconfig-001-20241124    clang-14
arm                   randconfig-001-20241124    gcc-14.2.0
arm                   randconfig-002-20241124    clang-14
arm                   randconfig-002-20241124    clang-20
arm                   randconfig-003-20241124    clang-14
arm                   randconfig-003-20241124    gcc-14.2.0
arm                   randconfig-004-20241124    clang-14
arm                   randconfig-004-20241124    gcc-14.2.0
arm                           sama5_defconfig    gcc-14.2.0
arm                           sunxi_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241124    clang-14
arm64                 randconfig-001-20241124    gcc-14.2.0
arm64                 randconfig-002-20241124    clang-14
arm64                 randconfig-002-20241124    gcc-14.2.0
arm64                 randconfig-003-20241124    clang-14
arm64                 randconfig-004-20241124    clang-14
arm64                 randconfig-004-20241124    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241124    clang-14
csky                  randconfig-001-20241124    gcc-14.2.0
csky                  randconfig-002-20241124    clang-14
csky                  randconfig-002-20241124    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241124    clang-14
hexagon               randconfig-001-20241124    clang-20
hexagon               randconfig-002-20241124    clang-14
hexagon               randconfig-002-20241124    clang-20
i386        buildonly-randconfig-001-20241124    clang-19
i386        buildonly-randconfig-001-20241124    gcc-11
i386        buildonly-randconfig-002-20241124    clang-19
i386        buildonly-randconfig-002-20241124    gcc-12
i386        buildonly-randconfig-003-20241124    clang-19
i386        buildonly-randconfig-003-20241124    gcc-12
i386        buildonly-randconfig-004-20241124    clang-19
i386        buildonly-randconfig-004-20241124    gcc-12
i386        buildonly-randconfig-005-20241124    clang-19
i386        buildonly-randconfig-005-20241124    gcc-12
i386        buildonly-randconfig-006-20241124    clang-19
i386        buildonly-randconfig-006-20241124    gcc-11
i386                  randconfig-001-20241124    clang-19
i386                  randconfig-001-20241124    gcc-12
i386                  randconfig-002-20241124    clang-19
i386                  randconfig-003-20241124    clang-19
i386                  randconfig-004-20241124    clang-19
i386                  randconfig-005-20241124    clang-19
i386                  randconfig-005-20241124    gcc-12
i386                  randconfig-006-20241124    clang-19
i386                  randconfig-011-20241124    clang-19
i386                  randconfig-011-20241124    gcc-12
i386                  randconfig-012-20241124    clang-19
i386                  randconfig-013-20241124    clang-19
i386                  randconfig-013-20241124    gcc-12
i386                  randconfig-014-20241124    clang-19
i386                  randconfig-015-20241124    clang-19
i386                  randconfig-016-20241124    clang-19
i386                  randconfig-016-20241124    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241124    clang-14
loongarch             randconfig-001-20241124    gcc-14.2.0
loongarch             randconfig-002-20241124    clang-14
loongarch             randconfig-002-20241124    gcc-14.2.0
m68k                             alldefconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
m68k                            q40_defconfig    clang-20
m68k                          sun3x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                      mmu_defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-20
mips                           xway_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241124    clang-14
nios2                 randconfig-001-20241124    gcc-14.2.0
nios2                 randconfig-002-20241124    clang-14
nios2                 randconfig-002-20241124    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                generic-32bit_defconfig    clang-20
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20241124    clang-14
parisc                randconfig-001-20241124    gcc-14.2.0
parisc                randconfig-002-20241124    clang-14
parisc                randconfig-002-20241124    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        icon_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-20
powerpc                 mpc837x_rdb_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc                         ps3_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241124    clang-14
powerpc               randconfig-001-20241124    gcc-14.2.0
powerpc               randconfig-002-20241124    clang-14
powerpc               randconfig-002-20241124    gcc-14.2.0
powerpc               randconfig-003-20241124    clang-14
powerpc               randconfig-003-20241124    clang-20
powerpc                     sequoia_defconfig    clang-20
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    clang-20
powerpc64             randconfig-001-20241124    clang-14
powerpc64             randconfig-001-20241124    clang-20
powerpc64             randconfig-002-20241124    clang-14
powerpc64             randconfig-002-20241124    gcc-14.2.0
powerpc64             randconfig-003-20241124    clang-14
powerpc64             randconfig-003-20241124    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-20
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241124    clang-14
riscv                 randconfig-001-20241124    gcc-14.2.0
riscv                 randconfig-002-20241124    clang-14
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241124    clang-14
s390                  randconfig-001-20241124    gcc-14.2.0
s390                  randconfig-002-20241124    clang-14
s390                  randconfig-002-20241124    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                         ecovec24_defconfig    gcc-14.2.0
sh                             espt_defconfig    gcc-14.2.0
sh                          r7785rp_defconfig    clang-20
sh                    randconfig-001-20241124    clang-14
sh                    randconfig-001-20241124    gcc-14.2.0
sh                    randconfig-002-20241124    clang-14
sh                    randconfig-002-20241124    gcc-14.2.0
sh                           se7780_defconfig    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                          urquell_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    clang-20
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64               randconfig-001-20241124    clang-14
sparc64               randconfig-001-20241124    gcc-14.2.0
sparc64               randconfig-002-20241124    clang-14
sparc64               randconfig-002-20241124    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241124    clang-14
um                    randconfig-001-20241124    gcc-12
um                    randconfig-002-20241124    clang-14
um                    randconfig-002-20241124    gcc-12
x86_64      buildonly-randconfig-001-20241124    gcc-12
x86_64      buildonly-randconfig-002-20241124    gcc-12
x86_64      buildonly-randconfig-003-20241124    gcc-12
x86_64      buildonly-randconfig-004-20241124    gcc-12
x86_64      buildonly-randconfig-005-20241124    clang-19
x86_64      buildonly-randconfig-005-20241124    gcc-12
x86_64      buildonly-randconfig-006-20241124    clang-19
x86_64      buildonly-randconfig-006-20241124    gcc-12
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241124    clang-19
x86_64                randconfig-001-20241124    gcc-12
x86_64                randconfig-002-20241124    clang-19
x86_64                randconfig-002-20241124    gcc-12
x86_64                randconfig-003-20241124    clang-19
x86_64                randconfig-003-20241124    gcc-12
x86_64                randconfig-004-20241124    gcc-12
x86_64                randconfig-005-20241124    gcc-12
x86_64                randconfig-006-20241124    clang-19
x86_64                randconfig-006-20241124    gcc-12
x86_64                randconfig-011-20241124    gcc-12
x86_64                randconfig-012-20241124    clang-19
x86_64                randconfig-012-20241124    gcc-12
x86_64                randconfig-013-20241124    gcc-11
x86_64                randconfig-013-20241124    gcc-12
x86_64                randconfig-014-20241124    gcc-12
x86_64                randconfig-015-20241124    gcc-12
x86_64                randconfig-016-20241124    gcc-12
x86_64                randconfig-071-20241124    clang-19
x86_64                randconfig-071-20241124    gcc-12
x86_64                randconfig-072-20241124    gcc-12
x86_64                randconfig-073-20241124    gcc-12
x86_64                randconfig-074-20241124    gcc-12
x86_64                randconfig-075-20241124    gcc-11
x86_64                randconfig-075-20241124    gcc-12
x86_64                randconfig-076-20241124    gcc-11
x86_64                randconfig-076-20241124    gcc-12
x86_64                               rhel-9.4    gcc-12
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241124    clang-14
xtensa                randconfig-001-20241124    gcc-14.2.0
xtensa                randconfig-002-20241124    clang-14
xtensa                randconfig-002-20241124    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                    xip_kc705_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
