Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6C20C472
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Feb 2025 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738605304; cv=none; b=P5+2vU+ZtRJHpnAeVHbaqlgjb+urE2qSUxtqxKJVFMqWzwaTfsfC6Mg61Vv0OHFT1vxg+LQ3H2pgD9dXswl6w1vl6iXRTdsAs0qizuQlH49hgvX9BAih0w66FlHa2mRniTWdxsxTu4BwEslKRQjZ++9la5WNoo8EHUoUnjeRYdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738605304; c=relaxed/simple;
	bh=C+ijidn/OLe3aRW7+aaLo7Dc1BlZrN07UKauyOWx6So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cA5s5WvObIrPX7hsj2agP9YBqFNsQiBj/VV96vtzfUGXJKlO9/B6VPwhzv9fnrYH6YOCw1EmGJ3xXnfNA/yDxhCwkITqzyc4giskTXRT2NrC30ImKHDgLnaw6tbDE31zDVFn9PSNHQ3M+vxObk5KLsBKrgmBgD1Kd+xbRxRiI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWOM2+wY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWOM2+wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738605303; x=1770141303;
  h=date:from:to:cc:subject:message-id;
  bh=C+ijidn/OLe3aRW7+aaLo7Dc1BlZrN07UKauyOWx6So=;
  b=gWOM2+wYOv3S7DOU63RwoAs4tDhFju21yOhtJLdLS+wKrdo2lhSVSP0L
   CKqc7jXrl7EE4Byh2BRiUfSSexY9DDepaxoAsWNXxdnYiN1mN0aWg5kkD
   jUitypo7pbu7563VBtnneIiDkS0OFpnjFk0lxF4HaShFAPumSXWIO+hF+
   zM0SkWAQVik8d1BDVzJft61HZ+PZUiGYfQmtwlAOC2mtchPUnE8hGhpsU
   DKFhuUV9m6un0o6m7T4spqChLDb0y0vbytkkGiu0l2rv4T59HEzUagB5K
   XZBLccrdxSnkdyx6DYusXtkOHmrIbIXAE2PAfCO3EgvwNNLsr6SBweBA3
   A==;
X-CSE-ConnectionGUID: Xez2pN6gT4+5B8+s2JqG/w==
X-CSE-MsgGUID: uIj4s2LgQYqi3z+DMa5L8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39137944"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="39137944"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:55:02 -0800
X-CSE-ConnectionGUID: LE7KRddbTNaKGxvD4ImUsQ==
X-CSE-MsgGUID: oSou6dJkT9q7vZ5Oh09i2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="115344489"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 09:55:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf0ew-000rHd-1b;
	Mon, 03 Feb 2025 17:54:58 +0000
Date: Tue, 04 Feb 2025 01:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 edd2a8b46eed70c6e3398ff74178892175ff1d76
Message-ID: <202502040155.bOEJHEk2-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: edd2a8b46eed70c6e3398ff74178892175ff1d76  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 971m

configs tested: 226
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                        nsim_700_defconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20250203    gcc-13.2.0
arc                   randconfig-002-20250203    gcc-13.2.0
arc                           tb10x_defconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                        multi_v7_defconfig    gcc-14.2.0
arm                        neponset_defconfig    gcc-14.2.0
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250203    clang-18
arm                   randconfig-001-20250203    gcc-13.2.0
arm                   randconfig-002-20250203    gcc-13.2.0
arm                   randconfig-002-20250203    gcc-14.2.0
arm                   randconfig-003-20250203    clang-18
arm                   randconfig-003-20250203    gcc-13.2.0
arm                   randconfig-004-20250203    gcc-13.2.0
arm                   randconfig-004-20250203    gcc-14.2.0
arm                           u8500_defconfig    gcc-13.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250203    gcc-13.2.0
arm64                 randconfig-001-20250203    gcc-14.2.0
arm64                 randconfig-002-20250203    gcc-13.2.0
arm64                 randconfig-002-20250203    gcc-14.2.0
arm64                 randconfig-003-20250203    gcc-13.2.0
arm64                 randconfig-003-20250203    gcc-14.2.0
arm64                 randconfig-004-20250203    gcc-13.2.0
arm64                 randconfig-004-20250203    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250203    gcc-14.2.0
csky                  randconfig-002-20250203    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250203    clang-21
hexagon               randconfig-001-20250203    gcc-14.2.0
hexagon               randconfig-002-20250203    clang-21
hexagon               randconfig-002-20250203    gcc-14.2.0
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250203    gcc-12
i386        buildonly-randconfig-002-20250203    gcc-12
i386        buildonly-randconfig-003-20250203    clang-19
i386        buildonly-randconfig-004-20250203    gcc-12
i386        buildonly-randconfig-005-20250203    clang-19
i386        buildonly-randconfig-006-20250203    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250203    clang-19
i386                  randconfig-002-20250203    clang-19
i386                  randconfig-003-20250203    clang-19
i386                  randconfig-004-20250203    clang-19
i386                  randconfig-005-20250203    clang-19
i386                  randconfig-006-20250203    clang-19
i386                  randconfig-007-20250203    clang-19
i386                  randconfig-011-20250203    clang-19
i386                  randconfig-012-20250203    clang-19
i386                  randconfig-013-20250203    clang-19
i386                  randconfig-014-20250203    clang-19
i386                  randconfig-015-20250203    clang-19
i386                  randconfig-016-20250203    clang-19
i386                  randconfig-017-20250203    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250203    gcc-14.2.0
loongarch             randconfig-002-20250203    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-13.2.0
mips                           jazz_defconfig    clang-21
mips                      maltasmvp_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250203    gcc-14.2.0
nios2                 randconfig-002-20250203    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250203    gcc-14.2.0
parisc                randconfig-002-20250203    gcc-14.2.0
parisc64                         alldefconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                    gamecube_defconfig    clang-16
powerpc                     mpc512x_defconfig    clang-21
powerpc                 mpc8315_rdb_defconfig    clang-21
powerpc                 mpc832x_rdb_defconfig    gcc-14.2.0
powerpc               mpc834x_itxgp_defconfig    clang-18
powerpc                      pmac32_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250203    clang-21
powerpc               randconfig-001-20250203    gcc-14.2.0
powerpc               randconfig-002-20250203    clang-16
powerpc               randconfig-002-20250203    gcc-14.2.0
powerpc               randconfig-003-20250203    gcc-14.2.0
powerpc                    socrates_defconfig    gcc-13.2.0
powerpc                     stx_gp3_defconfig    gcc-13.2.0
powerpc                     taishan_defconfig    gcc-13.2.0
powerpc                         wii_defconfig    gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250203    gcc-14.2.0
powerpc64             randconfig-002-20250203    clang-18
powerpc64             randconfig-002-20250203    gcc-14.2.0
powerpc64             randconfig-003-20250203    gcc-14.2.0
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250203    clang-16
riscv                 randconfig-001-20250203    gcc-14.2.0
riscv                 randconfig-002-20250203    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250203    clang-19
s390                  randconfig-001-20250203    gcc-14.2.0
s390                  randconfig-002-20250203    clang-21
s390                  randconfig-002-20250203    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250203    gcc-14.2.0
sh                    randconfig-002-20250203    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-13.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250203    gcc-14.2.0
sparc                 randconfig-002-20250203    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250203    gcc-14.2.0
sparc64               randconfig-002-20250203    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250203    gcc-12
um                    randconfig-001-20250203    gcc-14.2.0
um                    randconfig-002-20250203    clang-18
um                    randconfig-002-20250203    gcc-14.2.0
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250203    clang-19
x86_64      buildonly-randconfig-001-20250203    gcc-12
x86_64      buildonly-randconfig-002-20250203    gcc-12
x86_64      buildonly-randconfig-003-20250203    gcc-12
x86_64      buildonly-randconfig-004-20250203    clang-19
x86_64      buildonly-randconfig-004-20250203    gcc-12
x86_64      buildonly-randconfig-005-20250203    gcc-12
x86_64      buildonly-randconfig-006-20250203    gcc-12
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250203    gcc-12
x86_64                randconfig-002-20250203    gcc-12
x86_64                randconfig-003-20250203    gcc-12
x86_64                randconfig-004-20250203    gcc-12
x86_64                randconfig-005-20250203    gcc-12
x86_64                randconfig-006-20250203    gcc-12
x86_64                randconfig-007-20250203    gcc-12
x86_64                randconfig-008-20250203    gcc-12
x86_64                randconfig-071-20250203    gcc-12
x86_64                randconfig-071-20250204    gcc-12
x86_64                randconfig-072-20250203    gcc-12
x86_64                randconfig-072-20250204    gcc-12
x86_64                randconfig-073-20250203    gcc-12
x86_64                randconfig-073-20250204    gcc-12
x86_64                randconfig-074-20250203    gcc-12
x86_64                randconfig-074-20250204    gcc-12
x86_64                randconfig-075-20250203    gcc-12
x86_64                randconfig-075-20250204    gcc-12
x86_64                randconfig-076-20250203    gcc-12
x86_64                randconfig-076-20250204    gcc-12
x86_64                randconfig-077-20250203    gcc-12
x86_64                randconfig-077-20250204    gcc-12
x86_64                randconfig-078-20250203    gcc-12
x86_64                randconfig-078-20250204    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250203    gcc-14.2.0
xtensa                randconfig-002-20250203    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
