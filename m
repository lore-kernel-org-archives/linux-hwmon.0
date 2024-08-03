Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B85F9CC
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Aug 2024 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722650348; cv=none; b=sjhYUq39cbNPHMC97JiG1+Nn2wQo0PxtzBGO8wMHfYg13qpXu4kYRd90QjKjLgeaK9CcJF9PDZxoIwqSqYIBbQZgSau6dQBluohvMAq+4r4tv0vHWDKMYBHnTtMbtXSX9iwrb1mLCFMM7s9pV/HA/wnKqeIBP2OlY/aIuZwvVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722650348; c=relaxed/simple;
	bh=JDFs83aC836VI3n9DSS9DbG5+zSvvvMCbCOwqXXE70E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BAiZ6okSgBa7DiZ3Q2NMmTYH7nPdWiEVJVXziNkk8Zt5w3MkKuWhOXIdxC3tFSsipkfXVhISzgoOA0/o7ax1u1DcXZfcwXF568sy7IW0Ewzw7YgmC7vtlBpI4Jwsegyx03Yj/3mmsY1BbPId1KJUXLof0MkdCMTOMAuRWXG+HUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moVTBL7j; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moVTBL7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722650346; x=1754186346;
  h=date:from:to:cc:subject:message-id;
  bh=JDFs83aC836VI3n9DSS9DbG5+zSvvvMCbCOwqXXE70E=;
  b=moVTBL7jtVxuwDiihoiz2nLuFCKmVEwpAFlf80ysfA3pWIlamGT+hTco
   gH0DQpsoCPMeJ9s7zDzB6VjKx+9om45TssLsVWd2NeUkwlJ7XrAgEsgwz
   B0OIQ2EkEIstiMFqWkfXWZdiNHtuteCVjlC4ZFEZsnDk4SwgF+EOECNkn
   VAjQEGDB/dUWve/FSFrPr9c+SQA9HdBGIyujdcyMWtmHsBLM5+JlCXui7
   ssVlDYMP4doUqec3DRnU1YehH5SQosyn/whhujgMqWpYw0XsawnXS6H0D
   vO7GDKhmzywtwL62t0si9gGWEJktxKiy07ZjiEsIdRX99syGkrMdC18D5
   Q==;
X-CSE-ConnectionGUID: E/INjPWgQAul6mqdYwn3bA==
X-CSE-MsgGUID: GhnL8MMNRPC8Dpb7/g00KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="43204190"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="43204190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 18:59:05 -0700
X-CSE-ConnectionGUID: bb2+0OZcRkCvJAskHZSbXQ==
X-CSE-MsgGUID: TFxPLKazRA+x4dqA6+nuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55239995"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Aug 2024 18:59:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa42w-000xjs-0e;
	Sat, 03 Aug 2024 01:59:02 +0000
Date: Sat, 03 Aug 2024 09:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 11acd1f88f7c7074ddba5b3e36fbe07f297602ad
Message-ID: <202408030956.sQHnroD0-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 11acd1f88f7c7074ddba5b3e36fbe07f297602ad  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1460m

configs tested: 191
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arc                   randconfig-001-20240802   gcc-13.2.0
arc                   randconfig-002-20240802   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                      integrator_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   clang-20
arm                   randconfig-001-20240802   gcc-13.2.0
arm                   randconfig-002-20240802   gcc-13.2.0
arm                   randconfig-003-20240802   gcc-13.2.0
arm                   randconfig-004-20240802   gcc-13.2.0
arm                             rpc_defconfig   clang-20
arm                             rpc_defconfig   gcc-13.2.0
arm                         s3c6400_defconfig   gcc-13.2.0
arm                       spear13xx_defconfig   clang-20
arm                           spitz_defconfig   gcc-13.2.0
arm                           sunxi_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240802   gcc-13.2.0
arm64                 randconfig-002-20240802   gcc-13.2.0
arm64                 randconfig-003-20240802   gcc-13.2.0
arm64                 randconfig-004-20240802   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240802   gcc-13.2.0
csky                  randconfig-002-20240802   gcc-13.2.0
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240802   gcc-13
i386         buildonly-randconfig-002-20240802   gcc-13
i386         buildonly-randconfig-003-20240802   gcc-13
i386         buildonly-randconfig-004-20240802   gcc-13
i386         buildonly-randconfig-005-20240802   gcc-13
i386         buildonly-randconfig-006-20240802   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240802   gcc-13
i386                  randconfig-002-20240802   gcc-13
i386                  randconfig-003-20240802   gcc-13
i386                  randconfig-004-20240802   gcc-13
i386                  randconfig-005-20240802   gcc-13
i386                  randconfig-006-20240802   gcc-13
i386                  randconfig-011-20240802   gcc-13
i386                  randconfig-012-20240802   gcc-13
i386                  randconfig-013-20240802   gcc-13
i386                  randconfig-014-20240802   gcc-13
i386                  randconfig-015-20240802   gcc-13
i386                  randconfig-016-20240802   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240802   gcc-13.2.0
loongarch             randconfig-002-20240802   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                           virt_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                malta_qemu_32r6_defconfig   gcc-13.2.0
mips                      maltasmvp_defconfig   gcc-13.2.0
mips                   sb1250_swarm_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240802   gcc-13.2.0
nios2                 randconfig-002-20240802   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                    or1ksim_defconfig   gcc-13.2.0
openrisc                 simple_smp_defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240802   gcc-13.2.0
parisc                randconfig-002-20240802   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-13.2.0
powerpc                      katmai_defconfig   clang-20
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     rainier_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240802   gcc-13.2.0
powerpc               randconfig-003-20240802   gcc-13.2.0
powerpc                     sequoia_defconfig   gcc-13.2.0
powerpc                      tqm8xx_defconfig   clang-20
powerpc64                        alldefconfig   clang-20
powerpc64             randconfig-001-20240802   gcc-13.2.0
powerpc64             randconfig-002-20240802   gcc-13.2.0
powerpc64             randconfig-003-20240802   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240802   gcc-13.2.0
riscv                 randconfig-002-20240802   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240802   gcc-13.2.0
s390                  randconfig-002-20240802   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                        edosk7760_defconfig   gcc-13.2.0
sh                 kfr2r09-romimage_defconfig   gcc-13.2.0
sh                    randconfig-001-20240802   gcc-13.2.0
sh                    randconfig-002-20240802   gcc-13.2.0
sh                          rsk7269_defconfig   gcc-13.2.0
sh                           se7206_defconfig   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                             sh03_defconfig   gcc-13.2.0
sh                            titan_defconfig   gcc-13.2.0
sh                          urquell_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240802   gcc-13.2.0
sparc64               randconfig-002-20240802   gcc-13.2.0
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240802   gcc-13.2.0
um                    randconfig-002-20240802   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240802   gcc-11
x86_64       buildonly-randconfig-002-20240802   gcc-11
x86_64       buildonly-randconfig-003-20240802   gcc-11
x86_64       buildonly-randconfig-004-20240802   gcc-11
x86_64       buildonly-randconfig-005-20240802   gcc-11
x86_64       buildonly-randconfig-006-20240802   gcc-11
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                                  kexec   clang-18
x86_64                randconfig-001-20240802   gcc-11
x86_64                randconfig-002-20240802   gcc-11
x86_64                randconfig-003-20240802   gcc-11
x86_64                randconfig-004-20240802   gcc-11
x86_64                randconfig-005-20240802   gcc-11
x86_64                randconfig-006-20240802   gcc-11
x86_64                randconfig-011-20240802   gcc-11
x86_64                randconfig-012-20240802   gcc-11
x86_64                randconfig-013-20240802   gcc-11
x86_64                randconfig-014-20240802   gcc-11
x86_64                randconfig-015-20240802   gcc-11
x86_64                randconfig-016-20240802   gcc-11
x86_64                randconfig-071-20240802   gcc-11
x86_64                randconfig-072-20240802   gcc-11
x86_64                randconfig-073-20240802   gcc-11
x86_64                randconfig-074-20240802   gcc-11
x86_64                randconfig-075-20240802   gcc-11
x86_64                randconfig-076-20240802   gcc-11
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                  audio_kc705_defconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-13.2.0
xtensa                randconfig-001-20240802   gcc-13.2.0
xtensa                randconfig-002-20240802   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
