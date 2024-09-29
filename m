Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B014117C
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Sep 2024 00:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727568547; cv=none; b=nf13T+M3OCm0zhv1rfULI6ecNZ2MpkCqR8wJHa7o6lPUGGDIvUIFHhql9fgHz5Tq5gCs445ubUBxUXtj5HRF92Wu/Mo0MCV8gEZSKmjfvJx4EtTKpoc86gw8tnoCfq4H8Co2iMU7CjHz3y9dGhxe3o/9p0DNiaHWiBf3rd7ynbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727568547; c=relaxed/simple;
	bh=PDDHd8e6lTSspAXjfBaKymzOyPAVUSi/ioLN44LTMrs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C1afD0a6uxvoo6A4AzS4J2IhF8Nvns3cWcO7w8x3/C0V4DU3qlZe81I7mkwXUCJu8e5mavz6OvS69fm98BBC2Uo2EkrFW+o6PsUbq/pqWKuq2hXxsv3Tv3tFVb2oBR0PghjBlaIPlq66lifLdnmgCMwQB9iNp5gRiHAtoBTSJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5iT0K3A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5iT0K3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727568546; x=1759104546;
  h=date:from:to:cc:subject:message-id;
  bh=PDDHd8e6lTSspAXjfBaKymzOyPAVUSi/ioLN44LTMrs=;
  b=Y5iT0K3Aq1F9prz6xOGGv4W6kXAmzl5v6xgOUvzzR/RrOA8feCQNHiH7
   najacekPJm7xzLy5SfozDX1IX/isxHwji5fJdgBa7uOnIGjUT9QLxcgf0
   JFurGwdP4oeb2GHPllSDSkcfPy04CBWjK9x2cEhFk7BFVhTEg+GPXieTd
   oge5uS15QYBCi4Je7SHVgNfEWFAbzF35k9XrsCxlVfCMEWH+2yOlqyIgY
   i/rTCnybpeDj/r8Uztkf95aCoomquVtNpIIL+Aro4Tp28WBXXZTxfaBUv
   hpTyv3M6P8g6G516SnTim8pjtEjm/gkFgjMK3BxE7U7huxr4y6TU7oiVf
   g==;
X-CSE-ConnectionGUID: MRg70UIWQ6eXEIrbf66g5w==
X-CSE-MsgGUID: 2+CyJFr0R8qkCrdz1btWlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26860853"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26860853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 17:09:05 -0700
X-CSE-ConnectionGUID: 6n1gTwTgQAmGyxE2skXUMA==
X-CSE-MsgGUID: R+9tn1AhS+2L51m98iNCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72775232"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 17:09:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suhUj-000Nlv-15;
	Sun, 29 Sep 2024 00:09:01 +0000
Date: Sun, 29 Sep 2024 08:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 a2990dd2dda98db7e9152b702df51c7dba98e1ad
Message-ID: <202409290825.B1uN5A3j-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: a2990dd2dda98db7e9152b702df51c7dba98e1ad  Merge branch 'fixes-v6.12' into testing

elapsed time: 1288m

configs tested: 209
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                            hsdk_defconfig    clang-20
arc                   randconfig-001-20240928    gcc-14.1.0
arc                   randconfig-002-20240928    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                       aspeed_g5_defconfig    clang-20
arm                          collie_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                            hisi_defconfig    clang-20
arm                       multi_v4t_defconfig    clang-20
arm                       netwinder_defconfig    gcc-14.1.0
arm                          pxa168_defconfig    clang-20
arm                   randconfig-001-20240928    gcc-14.1.0
arm                   randconfig-002-20240928    gcc-14.1.0
arm                   randconfig-003-20240928    gcc-14.1.0
arm                   randconfig-004-20240928    gcc-14.1.0
arm                           sama5_defconfig    clang-20
arm                           sama7_defconfig    clang-20
arm                           sunxi_defconfig    gcc-14.1.0
arm                           tegra_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20240928    gcc-14.1.0
arm64                 randconfig-002-20240928    gcc-14.1.0
arm64                 randconfig-003-20240928    gcc-14.1.0
arm64                 randconfig-004-20240928    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20240928    gcc-14.1.0
csky                  randconfig-002-20240928    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20240928    gcc-14.1.0
hexagon               randconfig-002-20240928    gcc-14.1.0
i386                             alldefconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240928    clang-18
i386        buildonly-randconfig-002-20240928    clang-18
i386        buildonly-randconfig-003-20240928    clang-18
i386        buildonly-randconfig-004-20240928    clang-18
i386        buildonly-randconfig-005-20240928    clang-18
i386        buildonly-randconfig-006-20240928    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240928    clang-18
i386                  randconfig-002-20240928    clang-18
i386                  randconfig-003-20240928    clang-18
i386                  randconfig-004-20240928    clang-18
i386                  randconfig-005-20240928    clang-18
i386                  randconfig-006-20240928    clang-18
i386                  randconfig-011-20240928    clang-18
i386                  randconfig-012-20240928    clang-18
i386                  randconfig-013-20240928    clang-18
i386                  randconfig-014-20240928    clang-18
i386                  randconfig-015-20240928    clang-18
i386                  randconfig-016-20240928    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20240928    gcc-14.1.0
loongarch             randconfig-002-20240928    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         apollo_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                        stmark2_defconfig    gcc-14.1.0
m68k                           sun3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        bcm47xx_defconfig    clang-20
mips                           ip27_defconfig    clang-20
mips                          rb532_defconfig    clang-20
nios2                         3c120_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20240928    gcc-14.1.0
nios2                 randconfig-002-20240928    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                generic-64bit_defconfig    gcc-14.1.0
parisc                randconfig-001-20240928    gcc-14.1.0
parisc                randconfig-002-20240928    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                     kmeter1_defconfig    gcc-14.1.0
powerpc                     mpc83xx_defconfig    gcc-14.1.0
powerpc                      ppc6xx_defconfig    clang-20
powerpc               randconfig-001-20240928    gcc-14.1.0
powerpc               randconfig-002-20240928    gcc-14.1.0
powerpc               randconfig-003-20240928    gcc-14.1.0
powerpc                    socrates_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20240928    gcc-14.1.0
powerpc64             randconfig-002-20240928    gcc-14.1.0
powerpc64             randconfig-003-20240928    gcc-14.1.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20240928    gcc-14.1.0
riscv                 randconfig-002-20240928    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20240928    gcc-14.1.0
s390                  randconfig-002-20240928    gcc-14.1.0
s390                       zfcpdump_defconfig    clang-20
sh                               alldefconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                ecovec24-romimage_defconfig    clang-20
sh                          r7780mp_defconfig    gcc-14.1.0
sh                    randconfig-001-20240928    gcc-14.1.0
sh                    randconfig-002-20240928    gcc-14.1.0
sh                          rsk7201_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc64_defconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20240928    gcc-14.1.0
sparc64               randconfig-002-20240928    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20240928    gcc-14.1.0
um                    randconfig-002-20240928    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240928    clang-18
x86_64      buildonly-randconfig-002-20240928    clang-18
x86_64      buildonly-randconfig-003-20240928    clang-18
x86_64      buildonly-randconfig-004-20240928    clang-18
x86_64      buildonly-randconfig-005-20240928    clang-18
x86_64      buildonly-randconfig-006-20240928    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240928    clang-18
x86_64                randconfig-002-20240928    clang-18
x86_64                randconfig-003-20240928    clang-18
x86_64                randconfig-004-20240928    clang-18
x86_64                randconfig-005-20240928    clang-18
x86_64                randconfig-006-20240928    clang-18
x86_64                randconfig-011-20240928    clang-18
x86_64                randconfig-012-20240928    clang-18
x86_64                randconfig-013-20240928    clang-18
x86_64                randconfig-014-20240928    clang-18
x86_64                randconfig-015-20240928    clang-18
x86_64                randconfig-016-20240928    clang-18
x86_64                randconfig-071-20240928    clang-18
x86_64                randconfig-072-20240928    clang-18
x86_64                randconfig-073-20240928    clang-18
x86_64                randconfig-074-20240928    clang-18
x86_64                randconfig-075-20240928    clang-18
x86_64                randconfig-076-20240928    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    gcc-14.1.0
xtensa                randconfig-001-20240928    gcc-14.1.0
xtensa                randconfig-002-20240928    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
