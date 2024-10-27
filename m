Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF64C83
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Oct 2024 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730051305; cv=none; b=I+dxdzLBuu+Lri7yAELyUCPgV+zNn1Wyd7ETCwD+7xXM8dkW7JQwqVP8uTtuccmz31X9DcEDZktyg9h1MpsmTPieHq1AxbGNrgPWOE6fVIRVgNd/+jHPFkH+SMu6cGRw0B5mR7EgJEn3LqPJqDv17EtG715XUSMT9dMfmsCMTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730051305; c=relaxed/simple;
	bh=JOKtaQw4vC3Qf3HR3NTgTEWTkYA+bo7MdfLuA3jjhXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hB6kxA+Ji7l+RBl4rKM8dsuZ1enGPyIj2mlZUJsMJG6QzynbH/TR0drCodAZQFDZa51eHSATAWb5878U7ZM6lBGcP/0T7TO5WMh+FirpmctX/lb3n/+0lw2C3ertd9WxbwsbpIF5XiNPIhU1x2lAVqgjvNc+ISzbiltzpelUxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdaFaW8+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdaFaW8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730051302; x=1761587302;
  h=date:from:to:cc:subject:message-id;
  bh=JOKtaQw4vC3Qf3HR3NTgTEWTkYA+bo7MdfLuA3jjhXc=;
  b=kdaFaW8+Q5Oc2aaXfg6v2rVX3HcYCtxxHy15KI6j5ZM0Tm20BwaKa/Rm
   a62WCKa73UFhX1t8JJizWwq5qFY5uR4kCL+bXcwHRkjwLHMOAFrH5jF4H
   q7L3xQsCJS9SpEEWZiyaV3S/QfxRwvjI3VxkPxIxwERilGhHC9PJdjVHV
   epIU/mmojEQ+6ajopgapDzd51TFISGNRIIb7AEHmkffwmr4NncrjQiTNk
   BNeTNKztudnoLOoMhjBxuV0tHJL1HsEkMWW3wYiwGwJh8czTeMyHV1YAd
   iaADroOo0O5xZRI/QlWN+GOHgHwHKdehAKGoYBLal4msA3CV+ePhQiJgw
   w==;
X-CSE-ConnectionGUID: VRVHoEsdQKiIgvC+Th/+Ow==
X-CSE-MsgGUID: /FZMMpKJSSO7N0bPXz+yFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="55060813"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="55060813"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 10:48:21 -0700
X-CSE-ConnectionGUID: PUSQDZUrSQKtBq672kMhfQ==
X-CSE-MsgGUID: 15Nx++YTR3qs20NidKG27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="86514657"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2024 10:48:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t57NA-000ase-0p;
	Sun, 27 Oct 2024 17:48:16 +0000
Date: Mon, 28 Oct 2024 01:47:35 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 c76877ab8564cd9fb2981a919abb9858e199a851
Message-ID: <202410280123.XGP8cJ8j-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: c76877ab8564cd9fb2981a919abb9858e199a851  Merge branch 'fixes-v6.12' into testing

elapsed time: 1296m

configs tested: 221
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                            hsdk_defconfig    clang-20
arc                        nsim_700_defconfig    gcc-14.1.0
arc                   randconfig-001-20241027    gcc-14.1.0
arc                   randconfig-002-20241027    gcc-14.1.0
arm                              alldefconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                        clps711x_defconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      integrator_defconfig    clang-20
arm                        mvebu_v7_defconfig    clang-20
arm                         nhk8815_defconfig    clang-20
arm                   randconfig-001-20241027    gcc-14.1.0
arm                   randconfig-002-20241027    gcc-14.1.0
arm                   randconfig-003-20241027    gcc-14.1.0
arm                   randconfig-004-20241027    gcc-14.1.0
arm                           sama7_defconfig    clang-20
arm                           spitz_defconfig    clang-20
arm                           sunxi_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm                        vexpress_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241027    gcc-14.1.0
arm64                 randconfig-002-20241027    gcc-14.1.0
arm64                 randconfig-003-20241027    gcc-14.1.0
arm64                 randconfig-004-20241027    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241027    gcc-14.1.0
csky                  randconfig-002-20241027    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241027    gcc-14.1.0
hexagon               randconfig-002-20241027    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241027    gcc-12
i386        buildonly-randconfig-002-20241027    gcc-12
i386        buildonly-randconfig-003-20241027    gcc-12
i386        buildonly-randconfig-004-20241027    gcc-12
i386        buildonly-randconfig-005-20241027    gcc-12
i386        buildonly-randconfig-006-20241027    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241027    gcc-12
i386                  randconfig-002-20241027    gcc-12
i386                  randconfig-003-20241027    gcc-12
i386                  randconfig-004-20241027    gcc-12
i386                  randconfig-005-20241027    gcc-12
i386                  randconfig-006-20241027    gcc-12
i386                  randconfig-011-20241027    gcc-12
i386                  randconfig-012-20241027    gcc-12
i386                  randconfig-013-20241027    gcc-12
i386                  randconfig-014-20241027    gcc-12
i386                  randconfig-015-20241027    gcc-12
i386                  randconfig-016-20241027    gcc-12
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241027    gcc-14.1.0
loongarch             randconfig-002-20241027    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          amiga_defconfig    gcc-14.1.0
m68k                         apollo_defconfig    clang-20
m68k                         apollo_defconfig    gcc-14.1.0
m68k                          atari_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        m5272c3_defconfig    gcc-14.1.0
m68k                        m5407c3_defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
m68k                           virt_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm63xx_defconfig    gcc-14.1.0
mips                      bmips_stb_defconfig    clang-20
mips                            gpr_defconfig    clang-20
mips                           ip28_defconfig    gcc-14.1.0
mips                           ip32_defconfig    gcc-14.1.0
mips                          rb532_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241027    gcc-14.1.0
nios2                 randconfig-002-20241027    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241027    gcc-14.1.0
parisc                randconfig-002-20241027    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      arches_defconfig    clang-20
powerpc                      ep88xc_defconfig    clang-20
powerpc                        fsp2_defconfig    clang-20
powerpc                       maple_defconfig    clang-20
powerpc                     mpc512x_defconfig    clang-20
powerpc                      pasemi_defconfig    clang-20
powerpc               randconfig-001-20241027    gcc-14.1.0
powerpc               randconfig-002-20241027    gcc-14.1.0
powerpc               randconfig-003-20241027    gcc-14.1.0
powerpc                     tqm5200_defconfig    clang-20
powerpc                        warp_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241027    gcc-14.1.0
powerpc64             randconfig-002-20241027    gcc-14.1.0
powerpc64             randconfig-003-20241027    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                    nommu_virt_defconfig    clang-20
riscv                 randconfig-001-20241027    gcc-14.1.0
riscv                 randconfig-002-20241027    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241027    gcc-14.1.0
s390                  randconfig-002-20241027    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    gcc-14.1.0
sh                          r7780mp_defconfig    clang-20
sh                    randconfig-001-20241027    gcc-14.1.0
sh                    randconfig-002-20241027    gcc-14.1.0
sh                          sdk7786_defconfig    gcc-14.1.0
sh                           se7722_defconfig    clang-20
sh                            shmin_defconfig    gcc-14.1.0
sh                             shx3_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241027    gcc-14.1.0
sparc64               randconfig-002-20241027    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241027    gcc-14.1.0
um                    randconfig-002-20241027    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241027    gcc-12
x86_64      buildonly-randconfig-002-20241027    gcc-12
x86_64      buildonly-randconfig-003-20241027    gcc-12
x86_64      buildonly-randconfig-004-20241027    gcc-12
x86_64      buildonly-randconfig-005-20241027    gcc-12
x86_64      buildonly-randconfig-006-20241027    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241027    gcc-12
x86_64                randconfig-002-20241027    gcc-12
x86_64                randconfig-003-20241027    gcc-12
x86_64                randconfig-004-20241027    gcc-12
x86_64                randconfig-005-20241027    gcc-12
x86_64                randconfig-006-20241027    gcc-12
x86_64                randconfig-011-20241027    gcc-12
x86_64                randconfig-012-20241027    gcc-12
x86_64                randconfig-013-20241027    gcc-12
x86_64                randconfig-014-20241027    gcc-12
x86_64                randconfig-015-20241027    gcc-12
x86_64                randconfig-016-20241027    gcc-12
x86_64                randconfig-071-20241027    gcc-12
x86_64                randconfig-072-20241027    gcc-12
x86_64                randconfig-073-20241027    gcc-12
x86_64                randconfig-074-20241027    gcc-12
x86_64                randconfig-075-20241027    gcc-12
x86_64                randconfig-076-20241027    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-19
x86_64                         rhel-8.3-kunit    clang-19
x86_64                           rhel-8.3-ltp    clang-19
x86_64                          rhel-8.3-rust    clang-19
xtensa                            allnoconfig    gcc-14.1.0
xtensa                randconfig-001-20241027    gcc-14.1.0
xtensa                randconfig-002-20241027    gcc-14.1.0
xtensa                         virt_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
