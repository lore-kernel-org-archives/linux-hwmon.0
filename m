Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC72716DEDA
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 18:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279362; cv=none; b=KElTEIIU3bjZqKsG2WopV6KArIGR6T/roi1a0OTTN631CmA+xlXC7hrp+LNJBKz0MOQC708A/QhgsMORzUZ269WjC8lqQpX2P2MvZeo32cgJwsr4Hip8xborW9SmeDyXA2IjnRhECNdWYGBfEepp9cxAZaxXcb/9Uslpat+aaK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279362; c=relaxed/simple;
	bh=9NczQu8BWHdp62zvkg7SLLQlJVcUQxmEEdzOnR2M41k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M4TXahWhYbklvbF9EUj9bplPkWhj3eUvzcCtSop/U/a7+6ZfyTU7eZZGJ1SQ4Zv0LceFyLg+8THl/t2FtRpWzK83Dse5HLenEPCU6AxBBgVPhihnlvq1eflLFIgoo0U5i/LNeJiNpWVc/ca9ahYp534ChekRvyI0wdeR+MgA7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSu66XIR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSu66XIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722279360; x=1753815360;
  h=date:from:to:cc:subject:message-id;
  bh=9NczQu8BWHdp62zvkg7SLLQlJVcUQxmEEdzOnR2M41k=;
  b=kSu66XIRtbgyD0n1N52QA9KPKTVxRQKDuaHINoeEZvdVVTRlUbg3wp5N
   JRHFaBJDsgBkPJJHLVjFc6ioXStgjLLMyB+OAYWecn7hcSHQCWMsTSKIR
   Gob1h0K9OoVZwkJgztjGwZvO75OUn2axvIsHDvW8EePFdx6MX82zwFznB
   wpMDubZyLx9dXXTRp8v7saRPRMEbq+cI7uZqKyKGwGhV+6zl+KVz3n39i
   cbHDe030hj92ElUnhrUllpudHY8+3HRYyBwu26paMirBUg/Twu2l909iP
   1PxEJHPwCsnh9ZI05f4enMV5upphoIjh03nptJdLWsz+76tCPwoqZ8QX+
   A==;
X-CSE-ConnectionGUID: Kl64/Hk5T6OgzNm9xIFXKA==
X-CSE-MsgGUID: pa7TVGOxToW0CHNuZyWfYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="45475206"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="45475206"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 11:56:00 -0700
X-CSE-ConnectionGUID: WyNo+pEMQoKKVxlRv7jSiQ==
X-CSE-MsgGUID: 9+vm7g3eQ9+edRadSWXKnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="58860150"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jul 2024 11:55:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYVXI-000ry8-1i;
	Mon, 29 Jul 2024 18:55:56 +0000
Date: Tue, 30 Jul 2024 02:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 5dd04164a65b546e958711258bf04d610e44d765
Message-ID: <202407300202.h0Q0jVRE-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 5dd04164a65b546e958711258bf04d610e44d765  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 883m

configs tested: 263
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240729   gcc-13.2.0
arc                   randconfig-002-20240729   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                         axm55xx_defconfig   clang-20
arm                                 defconfig   gcc-13.2.0
arm                      footbridge_defconfig   gcc-13.2.0
arm                       imx_v4_v5_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-13.2.0
arm                          ixp4xx_defconfig   gcc-14.1.0
arm                          pxa168_defconfig   clang-20
arm                   randconfig-001-20240729   gcc-13.2.0
arm                   randconfig-001-20240729   gcc-14.1.0
arm                   randconfig-002-20240729   gcc-13.2.0
arm                   randconfig-002-20240729   gcc-14.1.0
arm                   randconfig-003-20240729   gcc-13.2.0
arm                   randconfig-003-20240729   gcc-14.1.0
arm                   randconfig-004-20240729   clang-20
arm                   randconfig-004-20240729   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240729   clang-17
arm64                 randconfig-001-20240729   gcc-13.2.0
arm64                 randconfig-002-20240729   clang-20
arm64                 randconfig-002-20240729   gcc-13.2.0
arm64                 randconfig-003-20240729   gcc-13.2.0
arm64                 randconfig-003-20240729   gcc-14.1.0
arm64                 randconfig-004-20240729   clang-20
arm64                 randconfig-004-20240729   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240729   gcc-13.2.0
csky                  randconfig-001-20240729   gcc-14.1.0
csky                  randconfig-002-20240729   gcc-13.2.0
csky                  randconfig-002-20240729   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon               randconfig-001-20240729   clang-20
hexagon               randconfig-002-20240729   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240729   clang-18
i386         buildonly-randconfig-002-20240729   clang-18
i386         buildonly-randconfig-002-20240729   gcc-13
i386         buildonly-randconfig-003-20240729   clang-18
i386         buildonly-randconfig-004-20240729   clang-18
i386         buildonly-randconfig-004-20240729   gcc-10
i386         buildonly-randconfig-005-20240729   clang-18
i386         buildonly-randconfig-006-20240729   clang-18
i386         buildonly-randconfig-006-20240729   gcc-8
i386                                defconfig   clang-18
i386                  randconfig-001-20240729   clang-18
i386                  randconfig-001-20240729   gcc-12
i386                  randconfig-002-20240729   clang-18
i386                  randconfig-003-20240729   clang-18
i386                  randconfig-003-20240729   gcc-10
i386                  randconfig-004-20240729   clang-18
i386                  randconfig-004-20240729   gcc-13
i386                  randconfig-005-20240729   clang-18
i386                  randconfig-005-20240729   gcc-8
i386                  randconfig-006-20240729   clang-18
i386                  randconfig-006-20240729   gcc-13
i386                  randconfig-011-20240729   clang-18
i386                  randconfig-011-20240729   gcc-13
i386                  randconfig-012-20240729   clang-18
i386                  randconfig-013-20240729   clang-18
i386                  randconfig-013-20240729   gcc-9
i386                  randconfig-014-20240729   clang-18
i386                  randconfig-015-20240729   clang-18
i386                  randconfig-015-20240729   gcc-13
i386                  randconfig-016-20240729   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240729   gcc-13.2.0
loongarch             randconfig-001-20240729   gcc-14.1.0
loongarch             randconfig-002-20240729   gcc-13.2.0
loongarch             randconfig-002-20240729   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5475evb_defconfig   gcc-13.2.0
m68k                            mac_defconfig   gcc-13.2.0
m68k                        mvme147_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                      malta_kvm_defconfig   gcc-13.2.0
mips                           rs90_defconfig   gcc-13.2.0
mips                           xway_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240729   gcc-13.2.0
nios2                 randconfig-001-20240729   gcc-14.1.0
nios2                 randconfig-002-20240729   gcc-13.2.0
nios2                 randconfig-002-20240729   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           alldefconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240729   gcc-13.2.0
parisc                randconfig-001-20240729   gcc-14.1.0
parisc                randconfig-002-20240729   gcc-13.2.0
parisc                randconfig-002-20240729   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-17
powerpc                      katmai_defconfig   gcc-13.2.0
powerpc                 mpc8313_rdb_defconfig   gcc-13.2.0
powerpc                 mpc8315_rdb_defconfig   gcc-13.2.0
powerpc                 mpc834x_itx_defconfig   clang-20
powerpc                  mpc866_ads_defconfig   clang-20
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240729   gcc-13.2.0
powerpc64             randconfig-001-20240729   gcc-14.1.0
powerpc64             randconfig-002-20240729   gcc-13.2.0
powerpc64             randconfig-002-20240729   gcc-14.1.0
powerpc64             randconfig-003-20240729   gcc-13.2.0
powerpc64             randconfig-003-20240729   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240729   clang-16
riscv                 randconfig-001-20240729   gcc-13.2.0
riscv                 randconfig-002-20240729   clang-20
riscv                 randconfig-002-20240729   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240729   clang-20
s390                  randconfig-001-20240729   gcc-13.2.0
s390                  randconfig-002-20240729   gcc-13.2.0
s390                  randconfig-002-20240729   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   gcc-13.2.0
sh                          lboxre2_defconfig   gcc-14.1.0
sh                    randconfig-001-20240729   gcc-13.2.0
sh                    randconfig-001-20240729   gcc-14.1.0
sh                    randconfig-002-20240729   gcc-13.2.0
sh                    randconfig-002-20240729   gcc-14.1.0
sh                          sdk7786_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-14.1.0
sh                           sh2007_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc                       sparc32_defconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240729   gcc-13.2.0
sparc64               randconfig-001-20240729   gcc-14.1.0
sparc64               randconfig-002-20240729   gcc-13.2.0
sparc64               randconfig-002-20240729   gcc-14.1.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240729   clang-14
um                    randconfig-001-20240729   gcc-13.2.0
um                    randconfig-002-20240729   gcc-13.2.0
um                    randconfig-002-20240729   gcc-8
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240729   clang-18
x86_64       buildonly-randconfig-002-20240729   clang-18
x86_64       buildonly-randconfig-002-20240729   gcc-13
x86_64       buildonly-randconfig-003-20240729   clang-18
x86_64       buildonly-randconfig-003-20240729   gcc-10
x86_64       buildonly-randconfig-004-20240729   clang-18
x86_64       buildonly-randconfig-004-20240729   gcc-10
x86_64       buildonly-randconfig-005-20240729   clang-18
x86_64       buildonly-randconfig-005-20240729   gcc-10
x86_64       buildonly-randconfig-006-20240729   clang-18
x86_64       buildonly-randconfig-006-20240729   gcc-10
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240729   clang-18
x86_64                randconfig-001-20240729   gcc-13
x86_64                randconfig-002-20240729   clang-18
x86_64                randconfig-003-20240729   clang-18
x86_64                randconfig-004-20240729   clang-18
x86_64                randconfig-005-20240729   clang-18
x86_64                randconfig-006-20240729   clang-18
x86_64                randconfig-011-20240729   clang-18
x86_64                randconfig-011-20240729   gcc-8
x86_64                randconfig-012-20240729   clang-18
x86_64                randconfig-012-20240729   gcc-8
x86_64                randconfig-013-20240729   clang-18
x86_64                randconfig-013-20240729   gcc-13
x86_64                randconfig-014-20240729   clang-18
x86_64                randconfig-015-20240729   clang-18
x86_64                randconfig-015-20240729   gcc-13
x86_64                randconfig-016-20240729   clang-18
x86_64                randconfig-071-20240729   clang-18
x86_64                randconfig-071-20240729   gcc-13
x86_64                randconfig-072-20240729   clang-18
x86_64                randconfig-072-20240729   gcc-13
x86_64                randconfig-073-20240729   clang-18
x86_64                randconfig-074-20240729   clang-18
x86_64                randconfig-074-20240729   gcc-8
x86_64                randconfig-075-20240729   clang-18
x86_64                randconfig-075-20240729   gcc-12
x86_64                randconfig-076-20240729   clang-18
x86_64                randconfig-076-20240729   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                       common_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240729   gcc-13.2.0
xtensa                randconfig-001-20240729   gcc-14.1.0
xtensa                randconfig-002-20240729   gcc-13.2.0
xtensa                randconfig-002-20240729   gcc-14.1.0
xtensa                    smp_lx200_defconfig   gcc-14.1.0
xtensa                         virt_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
