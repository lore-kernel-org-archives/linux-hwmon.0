Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836E426D05
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770309201; cv=none; b=q8L0IVlUc9GsIQ1xg7rK4FfbnicJ3rq32z+68rCz6Xz4AqeOsIcPEV8w8IgIKDCjqxtG3sSblgQGfgIxGgF35uobCj+37NnPOs/Nz7HLHvIJuTKbrX6JKZIY7/YdjUcHIBH20058mSSISGHu775CuwKH0utRKd/LpMtDfZUSSG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770309201; c=relaxed/simple;
	bh=OBpDO/4BwXcdeF1Hl/N1/ViWerBtm9qUtR0IUEepmWM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lsHqYNJHJNEqVLGWkbimcvVf/hyATPScEFwI08RkyQoyWc9kQ3HtpgJ8/3MjtYwv8dumjikXUphG7Cahser41fwSiSThxI3LHmnR0r0FU7RitWtzyXs2K/cxm81Yv6CsG9HpKwOgSP7DwKqnQaJw1n9ukPmhSYB8s92rNtbcNmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCMETnRk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCMETnRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770309201; x=1801845201;
  h=date:from:to:cc:subject:message-id;
  bh=OBpDO/4BwXcdeF1Hl/N1/ViWerBtm9qUtR0IUEepmWM=;
  b=NCMETnRkHiCVfrojZbsnZ68ooMeZI2yQ7M+PHkV8Grya55x/xYWQrzKt
   pmCdSm5oPwyq23ik28c1LtjfR6ZcxYuZ28//630CiAye+dAfcyu+MeLNd
   c1dOmTpPNciPWnz0T5A2B1aXB1yE20OWeAM65hIToO7M88UkisOLFAHVX
   8Ap4LSbphJa2gusmC0iG7QZjtDA+yzVutTqKIInKlPaufWfJ7IU/I+PuQ
   WecOi72YpgGeVYwV6mWbhIEndSxJ82rRd41P6/BZCiVO7UhP+PJSagf13
   kGHcv4o+UxkExQOQQuzbv5DUsr1UhKlgkOjTUP19jS4lw59vWjGczRfBj
   A==;
X-CSE-ConnectionGUID: q8HC1DicTdGdJFZNkghAtA==
X-CSE-MsgGUID: 0gCHuqykT0W/8hviRYcUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="74112024"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="74112024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 08:33:20 -0800
X-CSE-ConnectionGUID: Kj9OvfC3R+mUBddX8mkGKw==
X-CSE-MsgGUID: 5JKqX1+NT4SH0POwblxF5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="233527088"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Feb 2026 08:33:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo2I8-00000000k0W-3KJ2;
	Thu, 05 Feb 2026 16:33:16 +0000
Date: Fri, 06 Feb 2026 00:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 831a2b27914cc880130ffe8fb8d1e65a5324d07f
Message-ID: <202602060032.dcLjU7T4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 831a2b27914cc880130ffe8fb8d1e65a5324d07f  hwmon: (occ) Mark occ_init_attribute() as __printf

elapsed time: 1069m

configs tested: 237
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    clang-22
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                      axs103_smp_defconfig    clang-18
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260205    gcc-8.5.0
arc                   randconfig-002-20260205    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                       aspeed_g4_defconfig    gcc-15.2.0
arm                         bcm2835_defconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                      jornada720_defconfig    clang-22
arm                            mps2_defconfig    clang-22
arm                       multi_v4t_defconfig    gcc-15.2.0
arm                           omap1_defconfig    gcc-15.2.0
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260205    gcc-8.5.0
arm                   randconfig-002-20260205    gcc-8.5.0
arm                   randconfig-003-20260205    gcc-8.5.0
arm                   randconfig-004-20260205    gcc-8.5.0
arm                             rpc_defconfig    gcc-15.2.0
arm                        vexpress_defconfig    gcc-15.2.0
arm                         vf610m4_defconfig    clang-22
arm                    vt8500_v6_v7_defconfig    clang-22
arm64                            alldefconfig    gcc-14
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260205    gcc-10.5.0
arm64                 randconfig-002-20260205    gcc-10.5.0
arm64                 randconfig-003-20260205    gcc-10.5.0
arm64                 randconfig-004-20260205    gcc-10.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260205    gcc-10.5.0
csky                  randconfig-002-20260205    gcc-10.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260205    gcc-15.2.0
hexagon               randconfig-002-20260205    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260205    gcc-14
i386        buildonly-randconfig-002-20260205    gcc-14
i386        buildonly-randconfig-003-20260205    gcc-14
i386        buildonly-randconfig-004-20260205    gcc-14
i386        buildonly-randconfig-005-20260205    gcc-14
i386        buildonly-randconfig-006-20260205    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260205    gcc-13
i386                  randconfig-002-20260205    gcc-13
i386                  randconfig-003-20260205    gcc-13
i386                  randconfig-004-20260205    gcc-13
i386                  randconfig-005-20260205    gcc-13
i386                  randconfig-006-20260205    gcc-13
i386                  randconfig-007-20260205    gcc-13
i386                  randconfig-011-20260205    clang-20
i386                  randconfig-012-20260205    clang-20
i386                  randconfig-013-20260205    clang-20
i386                  randconfig-014-20260205    clang-20
i386                  randconfig-015-20260205    clang-20
i386                  randconfig-016-20260205    clang-20
i386                  randconfig-017-20260205    clang-20
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260205    gcc-15.2.0
loongarch             randconfig-002-20260205    gcc-15.2.0
m68k                             alldefconfig    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                         amcore_defconfig    clang-18
m68k                                defconfig    clang-19
m68k                        m5307c3_defconfig    gcc-15.2.0
m68k                        m5407c3_defconfig    gcc-14
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ci20_defconfig    gcc-14
mips                         db1xxx_defconfig    gcc-15.2.0
mips                  decstation_64_defconfig    gcc-15.2.0
mips                            gpr_defconfig    clang-18
mips                           ip22_defconfig    clang-22
mips                           ip22_defconfig    gcc-15.2.0
mips                           ip30_defconfig    gcc-14
mips                     loongson2k_defconfig    clang-18
mips                          malta_defconfig    gcc-14
mips                      malta_kvm_defconfig    gcc-15.2.0
mips                  maltasmvp_eva_defconfig    clang-18
mips                      pic32mzda_defconfig    clang-18
mips                         rt305x_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260205    gcc-15.2.0
nios2                 randconfig-002-20260205    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
openrisc                       virt_defconfig    clang-22
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260205    gcc-9.5.0
parisc                randconfig-002-20260205    gcc-9.5.0
parisc64                            defconfig    clang-19
powerpc                     akebono_defconfig    clang-18
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                   currituck_defconfig    clang-22
powerpc                       eiger_defconfig    gcc-15.2.0
powerpc                      ep88xc_defconfig    gcc-14
powerpc                       holly_defconfig    clang-18
powerpc                   lite5200b_defconfig    gcc-14
powerpc                      mgcoge_defconfig    gcc-15.2.0
powerpc                     mpc512x_defconfig    gcc-15.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-15.2.0
powerpc                 mpc834x_itx_defconfig    gcc-15.2.0
powerpc                     powernv_defconfig    clang-18
powerpc                      ppc44x_defconfig    gcc-15.2.0
powerpc                       ppc64_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260205    gcc-9.5.0
powerpc               randconfig-002-20260205    gcc-9.5.0
powerpc                     tqm8548_defconfig    gcc-15.2.0
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc                      tqm8xx_defconfig    clang-22
powerpc                         wii_defconfig    gcc-15.2.0
powerpc64                        alldefconfig    clang-18
powerpc64             randconfig-001-20260205    gcc-9.5.0
powerpc64             randconfig-002-20260205    gcc-9.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260205    clang-19
riscv                 randconfig-002-20260205    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260205    clang-19
s390                  randconfig-002-20260205    clang-19
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    clang-18
sh                    randconfig-001-20260205    clang-19
sh                    randconfig-002-20260205    clang-19
sh                          rsk7201_defconfig    clang-18
sh                          rsk7264_defconfig    clang-22
sh                      rts7751r2d1_defconfig    clang-22
sh                           se7343_defconfig    clang-22
sh                           se7619_defconfig    gcc-15.2.0
sh                   secureedge5410_defconfig    gcc-15.2.0
sh                           sh2007_defconfig    gcc-15.2.0
sh                     sh7710voipgw_defconfig    gcc-15.2.0
sh                        sh7757lcr_defconfig    clang-18
sh                            shmin_defconfig    clang-22
sh                             shx3_defconfig    clang-18
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260205    gcc-12.5.0
sparc                 randconfig-002-20260205    gcc-12.5.0
sparc64                          alldefconfig    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260205    gcc-12.5.0
sparc64               randconfig-002-20260205    gcc-12.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             i386_defconfig    gcc-15.2.0
um                    randconfig-001-20260205    gcc-12.5.0
um                    randconfig-002-20260205    gcc-12.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260205    gcc-14
x86_64      buildonly-randconfig-002-20260205    gcc-14
x86_64      buildonly-randconfig-003-20260205    gcc-14
x86_64      buildonly-randconfig-004-20260205    gcc-14
x86_64      buildonly-randconfig-005-20260205    gcc-14
x86_64      buildonly-randconfig-006-20260205    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260205    clang-20
x86_64                randconfig-002-20260205    clang-20
x86_64                randconfig-003-20260205    clang-20
x86_64                randconfig-004-20260205    clang-20
x86_64                randconfig-005-20260205    clang-20
x86_64                randconfig-006-20260205    clang-20
x86_64                randconfig-011-20260205    clang-20
x86_64                randconfig-012-20260205    clang-20
x86_64                randconfig-013-20260205    clang-20
x86_64                randconfig-014-20260205    clang-20
x86_64                randconfig-015-20260205    clang-20
x86_64                randconfig-016-20260205    clang-20
x86_64                randconfig-071-20260205    clang-20
x86_64                randconfig-072-20260205    clang-20
x86_64                randconfig-073-20260205    clang-20
x86_64                randconfig-074-20260205    clang-20
x86_64                randconfig-075-20260205    clang-20
x86_64                randconfig-076-20260205    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                          iss_defconfig    gcc-15.2.0
xtensa                randconfig-001-20260205    gcc-12.5.0
xtensa                randconfig-002-20260205    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
