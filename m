Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3B013B7AF
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721305542; cv=none; b=PcBT6nOaFABqIt7OcN04OqX3GhGLnSszkyJ3TvPnzl9iixwywyOPeKAuSRW190t6ZpiuUNoxvkDwkKheRj/4QmfKVDo7vr5oyPL5RBDjeXhOPHQlcx23QpgsqAjxNl98zVQV72fVL5SI3LQeM6e4O6bAygP9ZunWR345lpEwBIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721305542; c=relaxed/simple;
	bh=J9qkHa01AQPBmGDeh8ZqjtX4JEw1w3J0VBy4pyoOTiE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pga8ivNuwHO0hG+U/dzNpptlJBF7PQ8NlolybUWO+GfutItRw0YgYjnLkK7IT3hcFJ32uEPYRoPJ6Oq81rCGdu5QKAou4iKdoNQ87bLBn65gaCypZ0sGkJaWBTrpjjgn8ZfGGJgjrRxwao+fYxk9oDXM27d9b8VFBtqAd+isznM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfSEMZPb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfSEMZPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721305540; x=1752841540;
  h=date:from:to:cc:subject:message-id;
  bh=J9qkHa01AQPBmGDeh8ZqjtX4JEw1w3J0VBy4pyoOTiE=;
  b=bfSEMZPbx3KRoQPo7c3m43cppsBagBfcWjB9N1uBDGvLHospevYXK2Cy
   zEY7bDp0aGVjHgIVCcNl4QELtvqQyEeM6z6feBafflUWCOz9r7MQiHFeN
   T7L5J9EDSbMvGwcND7lyRrykg5NsOLNmViTon6z6BY7FCsN8GhC865Toa
   8TG6fbzMetEIRyOiK3aBtaRP0PKfZc2EShDuX7LRvUc37XGQg2TihZ+Wk
   ZC8Q339WkqBLjBqsUz9E6cLFxyuVriOPxIoEIRu1s8qnAksbVJioc6UFm
   kpQF1+wSpdQEWKnmr8mYaWBcU2qBbeOLW6SCfZ2GMQBKwBneImsEHW099
   A==;
X-CSE-ConnectionGUID: 2igu0M0zQJq9iY7igwjygw==
X-CSE-MsgGUID: AOIZXfQdRGCm/gSd8I7ptg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="22724111"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="22724111"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 05:25:39 -0700
X-CSE-ConnectionGUID: zY9YLvKpQaOTJ5DmFpQ9Rw==
X-CSE-MsgGUID: 5a5fzMPdSyaxaqJwQAo0nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="81766896"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2024 05:25:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUQCV-000hEo-22;
	Thu, 18 Jul 2024 12:25:35 +0000
Date: Thu, 18 Jul 2024 20:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 efa5857e3ef62d47720ba9f13e3a5001f0268d57
Message-ID: <202407182028.kElBU8Nx-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: efa5857e3ef62d47720ba9f13e3a5001f0268d57  Merge branch 'hwmon-lm92' into hwmon-staging

elapsed time: 952m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240718   gcc-13.2.0
arc                   randconfig-002-20240718   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                         assabet_defconfig   clang-15
arm                       omap2plus_defconfig   gcc-14.1.0
arm                         orion5x_defconfig   clang-19
arm                   randconfig-001-20240718   clang-19
arm                   randconfig-002-20240718   gcc-14.1.0
arm                   randconfig-003-20240718   clang-19
arm                   randconfig-004-20240718   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240718   clang-15
arm64                 randconfig-002-20240718   clang-19
arm64                 randconfig-003-20240718   gcc-14.1.0
arm64                 randconfig-004-20240718   clang-19
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240718   gcc-14.1.0
csky                  randconfig-002-20240718   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240718   clang-19
hexagon               randconfig-002-20240718   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240718   gcc-11
i386         buildonly-randconfig-002-20240718   gcc-7
i386         buildonly-randconfig-003-20240718   gcc-13
i386         buildonly-randconfig-004-20240718   clang-18
i386         buildonly-randconfig-005-20240718   gcc-9
i386         buildonly-randconfig-006-20240718   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240718   gcc-13
i386                  randconfig-002-20240718   gcc-13
i386                  randconfig-003-20240718   clang-18
i386                  randconfig-004-20240718   clang-18
i386                  randconfig-005-20240718   clang-18
i386                  randconfig-006-20240718   clang-18
i386                  randconfig-011-20240718   gcc-13
i386                  randconfig-012-20240718   gcc-13
i386                  randconfig-013-20240718   gcc-10
i386                  randconfig-014-20240718   clang-18
i386                  randconfig-015-20240718   clang-18
i386                  randconfig-016-20240718   gcc-13
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240718   gcc-14.1.0
loongarch             randconfig-002-20240718   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          amiga_defconfig   gcc-14.1.0
m68k                          hp300_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        bcm47xx_defconfig   clang-15
mips                         cobalt_defconfig   gcc-13.2.0
mips                     loongson2k_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240718   gcc-14.1.0
nios2                 randconfig-002-20240718   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-32bit_defconfig   gcc-14.1.0
parisc                randconfig-001-20240718   gcc-14.1.0
parisc                randconfig-002-20240718   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc                      ep88xc_defconfig   gcc-14.1.0
powerpc                        icon_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240718   clang-17
powerpc               randconfig-002-20240718   clang-19
powerpc               randconfig-003-20240718   gcc-14.1.0
powerpc                     tqm8540_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240718   clang-19
powerpc64             randconfig-002-20240718   gcc-14.1.0
powerpc64             randconfig-003-20240718   clang-19
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240718   clang-17
riscv                 randconfig-002-20240718   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
s390                  randconfig-001-20240718   clang-19
s390                  randconfig-002-20240718   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                          kfr2r09_defconfig   gcc-14.1.0
sh                    randconfig-001-20240718   gcc-14.1.0
sh                    randconfig-002-20240718   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240718   gcc-14.1.0
sparc64               randconfig-002-20240718   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-002-20240718   clang-15
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240718   gcc-11
x86_64       buildonly-randconfig-002-20240718   clang-18
x86_64       buildonly-randconfig-003-20240718   clang-18
x86_64       buildonly-randconfig-004-20240718   clang-18
x86_64       buildonly-randconfig-005-20240718   clang-18
x86_64       buildonly-randconfig-006-20240718   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240718   gcc-13
x86_64                randconfig-002-20240718   gcc-13
x86_64                randconfig-003-20240718   clang-18
x86_64                randconfig-004-20240718   gcc-13
x86_64                randconfig-005-20240718   clang-18
x86_64                randconfig-006-20240718   clang-18
x86_64                randconfig-011-20240718   clang-18
x86_64                randconfig-012-20240718   gcc-9
x86_64                randconfig-013-20240718   clang-18
x86_64                randconfig-014-20240718   clang-18
x86_64                randconfig-015-20240718   clang-18
x86_64                randconfig-016-20240718   clang-18
x86_64                randconfig-071-20240718   clang-18
x86_64                randconfig-072-20240718   clang-18
x86_64                randconfig-073-20240718   clang-18
x86_64                randconfig-074-20240718   gcc-9
x86_64                randconfig-075-20240718   clang-18
x86_64                randconfig-076-20240718   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
