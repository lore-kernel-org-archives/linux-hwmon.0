Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B7EA4
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 02:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722045616; cv=none; b=P4kZVCIUhrWyLYmPg1Rl2OjGGxo1BfN70WBV2fwN1C6uUY2ilSyv3vpxV0SK07Jb+utWiR0CqPDogXfk5vv2M9MYoWWcKDuiAhoDi1Qdm/t4fCAz14GrCOzj7dx9KL7puHuN7bvnPQ1fsq8N5VipVfWfdHowi15j74KAOXOveso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722045616; c=relaxed/simple;
	bh=1yOHNo0kc39L7HyqgBZMrtz5rCCTnnmCkWao+d2+/vo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l42DweXv9GSbSK+K/TKo2UP7QLYXLycNFyweDL3hrdDfx7GwvieZOLmgXtEy6EuSlBC0RTrRVBmBdI8ZZh7I6mP6RYhwt+y8Doz8FOI4qcl8h+hBTBHCsOcxdXO3vnu4a2mr6o9l9pJ1eggOI8VyWHnFprkvf6HqfK8lOpUr+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y75CZuxB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y75CZuxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722045615; x=1753581615;
  h=date:from:to:cc:subject:message-id;
  bh=1yOHNo0kc39L7HyqgBZMrtz5rCCTnnmCkWao+d2+/vo=;
  b=Y75CZuxBLlQ1D6VkKLixN0EmmCRtNg5qKUdvRHkwOEQwyNq2wWjXSUT4
   4emkc1DcpPUJ1yRh63SstcWkdCsB7h8/RYQEz+L2uUVKIlkk+cVCjZTWO
   t0DTtCKHesUd4DlNH5K/bd+3unv6XLtj3JNu21rJ578mznbKtJjp5f4pp
   gEvigh5wwTolo54jYlLyCoiDgG1N0P7rNzjQV9Aaw1RdulwxYQj5njI/S
   xP7kd8UESsSyLQc9Hx/69HPIpilxdkOfOV3b0jk7dNPTTLFd0Ct42uN7D
   mnlyRvjG2INepQZA9MWFfjjxHZKgu/OT/FraLgoOS9/TsmTpbuCsNasop
   g==;
X-CSE-ConnectionGUID: M/uOvi6uSaaPFc1sb7Db4A==
X-CSE-MsgGUID: pxQ2KOehQJqIroDLB13FUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460283"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="19460283"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 19:00:14 -0700
X-CSE-ConnectionGUID: JaguwpuCRTupMUTPvalD7g==
X-CSE-MsgGUID: paAESL4LSoKBU7i0iLADQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="53108547"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2024 19:00:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXWjB-000pYO-2p;
	Sat, 27 Jul 2024 02:00:09 +0000
Date: Sat, 27 Jul 2024 10:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 6e81ea22c8e1477335846e9294630cb04a5bcff7
Message-ID: <202407271000.Pxe8LhN9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 6e81ea22c8e1477335846e9294630cb04a5bcff7  Merge branch 'kunit-improvements' into testing

elapsed time: 1446m

configs tested: 264
configs skipped: 6

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
arc                                 defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240726   gcc-13.2.0
arc                   randconfig-002-20240726   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                          gemini_defconfig   clang-20
arm                        keystone_defconfig   clang-20
arm                            mmp2_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                        mvebu_v5_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-13.2.0
arm                          pxa168_defconfig   clang-20
arm                          pxa910_defconfig   gcc-13.2.0
arm                   randconfig-001-20240726   gcc-13.2.0
arm                   randconfig-002-20240726   gcc-13.2.0
arm                   randconfig-003-20240726   gcc-13.2.0
arm                   randconfig-004-20240726   gcc-13.2.0
arm                         s3c6400_defconfig   clang-20
arm                           tegra_defconfig   gcc-13.2.0
arm                        vexpress_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240726   gcc-13.2.0
arm64                 randconfig-002-20240726   gcc-13.2.0
arm64                 randconfig-003-20240726   gcc-13.2.0
arm64                 randconfig-004-20240726   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240726   gcc-13.2.0
csky                  randconfig-002-20240726   gcc-13.2.0
hexagon                           allnoconfig   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240726   gcc-13
i386         buildonly-randconfig-001-20240727   gcc-13
i386         buildonly-randconfig-002-20240726   clang-18
i386         buildonly-randconfig-002-20240726   gcc-13
i386         buildonly-randconfig-002-20240727   gcc-13
i386         buildonly-randconfig-003-20240726   gcc-13
i386         buildonly-randconfig-003-20240727   gcc-13
i386         buildonly-randconfig-004-20240726   clang-18
i386         buildonly-randconfig-004-20240726   gcc-13
i386         buildonly-randconfig-004-20240727   gcc-13
i386         buildonly-randconfig-005-20240726   gcc-13
i386         buildonly-randconfig-005-20240726   gcc-7
i386         buildonly-randconfig-005-20240727   gcc-13
i386         buildonly-randconfig-006-20240726   clang-18
i386         buildonly-randconfig-006-20240726   gcc-13
i386         buildonly-randconfig-006-20240727   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240726   gcc-13
i386                  randconfig-001-20240727   gcc-13
i386                  randconfig-002-20240726   gcc-13
i386                  randconfig-002-20240727   gcc-13
i386                  randconfig-003-20240726   clang-18
i386                  randconfig-003-20240726   gcc-13
i386                  randconfig-003-20240727   gcc-13
i386                  randconfig-004-20240726   gcc-13
i386                  randconfig-004-20240727   gcc-13
i386                  randconfig-005-20240726   clang-18
i386                  randconfig-005-20240726   gcc-13
i386                  randconfig-005-20240727   gcc-13
i386                  randconfig-006-20240726   clang-18
i386                  randconfig-006-20240726   gcc-13
i386                  randconfig-006-20240727   gcc-13
i386                  randconfig-011-20240726   gcc-13
i386                  randconfig-011-20240727   gcc-13
i386                  randconfig-012-20240726   gcc-13
i386                  randconfig-012-20240726   gcc-8
i386                  randconfig-012-20240727   gcc-13
i386                  randconfig-013-20240726   gcc-10
i386                  randconfig-013-20240726   gcc-13
i386                  randconfig-013-20240727   gcc-13
i386                  randconfig-014-20240726   gcc-13
i386                  randconfig-014-20240727   gcc-13
i386                  randconfig-015-20240726   clang-18
i386                  randconfig-015-20240726   gcc-13
i386                  randconfig-015-20240727   gcc-13
i386                  randconfig-016-20240726   gcc-13
i386                  randconfig-016-20240727   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240726   gcc-13.2.0
loongarch             randconfig-002-20240726   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                            q40_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                       bmips_be_defconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.2.0
mips                     decstation_defconfig   gcc-13.2.0
mips                          eyeq5_defconfig   clang-20
mips                           gcw0_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                           xway_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240726   gcc-13.2.0
nios2                 randconfig-002-20240726   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                 simple_smp_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240726   gcc-13.2.0
parisc                randconfig-002-20240726   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                    amigaone_defconfig   gcc-13.2.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   clang-20
powerpc                       ebony_defconfig   clang-20
powerpc                       ebony_defconfig   gcc-13.2.0
powerpc                        icon_defconfig   gcc-13.2.0
powerpc                 mpc832x_rdb_defconfig   clang-20
powerpc                  mpc866_ads_defconfig   gcc-13.2.0
powerpc                  mpc885_ads_defconfig   clang-20
powerpc               randconfig-002-20240726   gcc-13.2.0
powerpc               randconfig-003-20240726   gcc-13.2.0
powerpc                     taishan_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240726   gcc-13.2.0
powerpc64             randconfig-002-20240726   gcc-13.2.0
powerpc64             randconfig-003-20240726   gcc-13.2.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240726   gcc-13.2.0
riscv                 randconfig-002-20240726   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240726   gcc-13.2.0
s390                  randconfig-002-20240726   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        dreamcast_defconfig   gcc-13.2.0
sh                          r7780mp_defconfig   gcc-13.2.0
sh                    randconfig-001-20240726   gcc-13.2.0
sh                    randconfig-002-20240726   gcc-13.2.0
sh                          rsk7264_defconfig   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                          sdk7780_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240726   gcc-13.2.0
sparc64               randconfig-002-20240726   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240726   gcc-13.2.0
um                    randconfig-002-20240726   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240726   gcc-13
x86_64       buildonly-randconfig-001-20240727   gcc-8
x86_64       buildonly-randconfig-002-20240726   gcc-13
x86_64       buildonly-randconfig-002-20240727   gcc-8
x86_64       buildonly-randconfig-003-20240726   gcc-13
x86_64       buildonly-randconfig-003-20240727   gcc-8
x86_64       buildonly-randconfig-004-20240726   gcc-13
x86_64       buildonly-randconfig-004-20240727   gcc-8
x86_64       buildonly-randconfig-005-20240726   gcc-13
x86_64       buildonly-randconfig-005-20240727   gcc-8
x86_64       buildonly-randconfig-006-20240726   gcc-13
x86_64       buildonly-randconfig-006-20240727   gcc-8
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240726   gcc-13
x86_64                randconfig-001-20240727   gcc-8
x86_64                randconfig-002-20240726   gcc-13
x86_64                randconfig-002-20240727   gcc-8
x86_64                randconfig-003-20240726   gcc-13
x86_64                randconfig-003-20240727   gcc-8
x86_64                randconfig-004-20240726   gcc-13
x86_64                randconfig-004-20240727   gcc-8
x86_64                randconfig-005-20240726   gcc-13
x86_64                randconfig-005-20240727   gcc-8
x86_64                randconfig-006-20240726   gcc-13
x86_64                randconfig-006-20240727   gcc-8
x86_64                randconfig-011-20240726   gcc-13
x86_64                randconfig-011-20240727   gcc-8
x86_64                randconfig-012-20240726   gcc-13
x86_64                randconfig-012-20240727   gcc-8
x86_64                randconfig-013-20240726   gcc-13
x86_64                randconfig-013-20240727   gcc-8
x86_64                randconfig-014-20240726   gcc-13
x86_64                randconfig-014-20240727   gcc-8
x86_64                randconfig-015-20240726   gcc-13
x86_64                randconfig-015-20240727   gcc-8
x86_64                randconfig-016-20240726   gcc-13
x86_64                randconfig-016-20240727   gcc-8
x86_64                randconfig-071-20240726   gcc-13
x86_64                randconfig-071-20240727   gcc-8
x86_64                randconfig-072-20240726   gcc-13
x86_64                randconfig-072-20240727   gcc-8
x86_64                randconfig-073-20240726   gcc-13
x86_64                randconfig-073-20240727   gcc-8
x86_64                randconfig-074-20240726   gcc-13
x86_64                randconfig-074-20240727   gcc-8
x86_64                randconfig-075-20240726   gcc-13
x86_64                randconfig-075-20240727   gcc-8
x86_64                randconfig-076-20240726   gcc-13
x86_64                randconfig-076-20240727   gcc-8
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240726   gcc-13.2.0
xtensa                randconfig-002-20240726   gcc-13.2.0
xtensa                    smp_lx200_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
