Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F544C2E3
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Jul 2024 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721554101; cv=none; b=NnEieRAP5DNzgDLQw7pf0v6KIU8ua29b3vixpt8pyAkyjqEmtDFgvpmPCR35j8Pe86ORG+2bxmjnRRK/V792eYDvhIY8bHD6dEILgxuqAKW1VuVQZNga19vjpdL7ggwXC9U/umAD8ieDIhO6lhi1YQWZQKR58qeQEIsNq9rhzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721554101; c=relaxed/simple;
	bh=reGuZfey4DJYSIU/bVlQv22M1jAMIV6wKGkA5twlNg4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qrySiO7skwNw61pk4rIZ49zbgLYnF8al7t5PKASIZ2Zmh8VowHOqx2ksycETpTjufAEFg3zY8brE8mKay7hhVcrIzz8I9EZcOdWqxFzYuu8OOYrS5VB/zZzJaKYTI0WuoCDU18fnxqE1irfH8QN52c0xFJqXO5TIrH6L9I7bCUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSiezCqv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSiezCqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721554098; x=1753090098;
  h=date:from:to:cc:subject:message-id;
  bh=reGuZfey4DJYSIU/bVlQv22M1jAMIV6wKGkA5twlNg4=;
  b=ZSiezCqvBm3rcHNEZu+VExhhHt+JgEO7hBitmv+qR5mOuX6clV/wjNxw
   6B61iMKEjXIH3hmfu6M/NWlQg81m4OOnjMQz7UxK84MTvrWc2LNZUESCO
   3MjR1nS9fzBkWZ03Y9K7MIFcacsIq6k1FXu29rcihlh+3uFhLg5uC1qjo
   R9Qq6eiE81b/wg55jfi1Yfh4LOZh4QZfPX2Tep7Fo99XmIsuHJhC78m8X
   FX9NZ5qvpy06eIUDeh7Om4eWzlL4csNDjL9os4jQ4lkBNyT5O8pMgI3y+
   lkzEfJ+JTL0LRaZ1tmPSzfa31gl+ipEROq4eg6wdlVmFfXUBgLK/3Wo52
   w==;
X-CSE-ConnectionGUID: VlYiWbg+STOc8BP6i2/62Q==
X-CSE-MsgGUID: 8t59x8aVRReO2FLdKJwIPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18836818"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="18836818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 02:28:15 -0700
X-CSE-ConnectionGUID: PpjFpa2ESg+ECfi7eWZ5JQ==
X-CSE-MsgGUID: Ejb/RVM/Qo6RNv0r4/s0lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51843630"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2024 02:28:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVSrU-000kAQ-0F;
	Sun, 21 Jul 2024 09:28:12 +0000
Date: Sun, 21 Jul 2024 17:27:30 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 2b6984e6b9a0f4f0e6fa79156f9860179bffc315
Message-ID: <202407211727.rOVJGnFx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 2b6984e6b9a0f4f0e6fa79156f9860179bffc315  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 724m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240721   gcc-13.2.0
arc                   randconfig-002-20240721   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                        multi_v7_defconfig   gcc-14.1.0
arm                         mv78xx0_defconfig   clang-19
arm                   randconfig-001-20240721   gcc-14.1.0
arm                   randconfig-002-20240721   gcc-14.1.0
arm                   randconfig-003-20240721   gcc-14.1.0
arm                   randconfig-004-20240721   gcc-14.1.0
arm                           sama5_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240721   gcc-14.1.0
arm64                 randconfig-002-20240721   gcc-14.1.0
arm64                 randconfig-003-20240721   gcc-14.1.0
arm64                 randconfig-004-20240721   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240721   gcc-14.1.0
csky                  randconfig-002-20240721   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240721   clang-19
hexagon               randconfig-002-20240721   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240721   gcc-8
i386         buildonly-randconfig-002-20240721   clang-18
i386         buildonly-randconfig-003-20240721   clang-18
i386         buildonly-randconfig-004-20240721   clang-18
i386         buildonly-randconfig-005-20240721   gcc-13
i386         buildonly-randconfig-006-20240721   gcc-8
i386                                defconfig   clang-18
i386                  randconfig-001-20240721   gcc-8
i386                  randconfig-002-20240721   gcc-10
i386                  randconfig-003-20240721   gcc-13
i386                  randconfig-004-20240721   clang-18
i386                  randconfig-005-20240721   gcc-13
i386                  randconfig-006-20240721   gcc-13
i386                  randconfig-011-20240721   gcc-13
i386                  randconfig-012-20240721   clang-18
i386                  randconfig-013-20240721   gcc-11
i386                  randconfig-014-20240721   gcc-13
i386                  randconfig-015-20240721   gcc-11
i386                  randconfig-016-20240721   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240721   gcc-14.1.0
loongarch             randconfig-002-20240721   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                         apollo_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath25_defconfig   clang-19
mips                     decstation_defconfig   gcc-13.2.0
mips                           gcw0_defconfig   clang-19
mips                           ip30_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240721   gcc-14.1.0
nios2                 randconfig-002-20240721   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-14.1.0
parisc                randconfig-001-20240721   gcc-14.1.0
parisc                randconfig-002-20240721   gcc-14.1.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                      arches_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240721   gcc-14.1.0
powerpc               randconfig-002-20240721   clang-16
powerpc               randconfig-003-20240721   clang-19
powerpc                    socrates_defconfig   gcc-14.1.0
powerpc                     tqm8540_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240721   gcc-14.1.0
powerpc64             randconfig-002-20240721   gcc-14.1.0
powerpc64             randconfig-003-20240721   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240721   clang-19
riscv                 randconfig-002-20240721   gcc-14.1.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240721   clang-19
s390                  randconfig-002-20240721   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          r7780mp_defconfig   gcc-14.1.0
sh                    randconfig-001-20240721   gcc-14.1.0
sh                    randconfig-002-20240721   gcc-14.1.0
sh                           se7750_defconfig   gcc-14.1.0
sh                           se7751_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240721   gcc-14.1.0
sparc64               randconfig-002-20240721   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240721   gcc-13
um                    randconfig-002-20240721   gcc-13
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240721   clang-18
x86_64       buildonly-randconfig-002-20240721   clang-18
x86_64       buildonly-randconfig-003-20240721   gcc-13
x86_64       buildonly-randconfig-004-20240721   clang-18
x86_64       buildonly-randconfig-005-20240721   clang-18
x86_64       buildonly-randconfig-006-20240721   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240721   gcc-13
x86_64                randconfig-002-20240721   clang-18
x86_64                randconfig-003-20240721   clang-18
x86_64                randconfig-004-20240721   gcc-13
x86_64                randconfig-005-20240721   gcc-9
x86_64                randconfig-006-20240721   clang-18
x86_64                randconfig-012-20240721   gcc-8
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240721   gcc-14.1.0
xtensa                randconfig-002-20240721   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
