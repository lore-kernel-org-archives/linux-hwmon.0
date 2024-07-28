Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A75E1D52B
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722157921; cv=none; b=rZz6qCw60RtUP8t6OnNk+ya77Mo8orrHriZ73khULwIAJyZbwZEmGTdIv+T3nzj9ej4v5mfhZied9/s2W2Uw7GBwnsB7ad5ae4CPZXorB7L6nfqA/e+VfTOndRAAJ8PuLJOadoqvjceOHFeqq+41lzj3v1kiVTHQb/W8+vlmkMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722157921; c=relaxed/simple;
	bh=CAfZXQbToSNxQ4hAN0Wyl8QtdZOD2IK6m9iVLDsWxd8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZiNG8oTUGklJkRV1Atm0jLoYKU8OveG9GEClyo/6UiJWxPH7HsDeQcBLk1/4SW7LwZNxRJ5UGqU0NMu0jpKZ9fJitfvQHzEq4dP5n7fqHQosVSVvSjlPYxQmZOy84UWjidnmCZdeESAoZ8PrJzrCDZMBrUz/j6LkMD3ODLvGQ1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OyPuzLjy; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyPuzLjy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722157919; x=1753693919;
  h=date:from:to:cc:subject:message-id;
  bh=CAfZXQbToSNxQ4hAN0Wyl8QtdZOD2IK6m9iVLDsWxd8=;
  b=OyPuzLjyfSB/jqHu5pra//EOOkMRT3vrgPPKTTQOMm6WddFcVmQSXNcz
   1/7zdRE3jIZzJjo5PMoHkJgedsfwIT+06LEuBLwCEv75U97ZAa+CnZsQi
   fizf7jxAcjaiXLdNCSBgcJ9TdFDKUppKPistNv6o3R3FiPrJgZP5q6Ozd
   3LkqLxqI8zbRwTt4hdT85uPrfjx03SsUWc9Prc6klTOaMN8n/gKxKDRKe
   nMuKXeer006xGX9CEgDacmUv15nHsw6OzcXBvK1vVy4Lp1wSyDb4X6khm
   8YfAJ1BAyG9k8vpUkj32xnpEMGqeHfdBXu5rQdROObNtpclRzXatd8Ah1
   g==;
X-CSE-ConnectionGUID: DLFYLy5zTACOSPqDmCDX7g==
X-CSE-MsgGUID: dl303b0sRharDoC9lt9YBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="20062979"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="20062979"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 02:11:58 -0700
X-CSE-ConnectionGUID: tauG9Lk1RmSax8o8xywp2A==
X-CSE-MsgGUID: ENYxrRL/Ro2zlvXAcJEAEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="57962764"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Jul 2024 02:11:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXzwZ-000qfi-22;
	Sun, 28 Jul 2024 09:11:55 +0000
Date: Sun, 28 Jul 2024 17:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 b932d7bb014188ebcf91485cff34a67b53b56884
Message-ID: <202407281729.bEalPGrl-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: b932d7bb014188ebcf91485cff34a67b53b56884  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1021m

configs tested: 166
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240728   gcc-13.2.0
arc                   randconfig-002-20240728   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                   randconfig-001-20240728   clang-20
arm                   randconfig-002-20240728   clang-20
arm                   randconfig-003-20240728   gcc-14.1.0
arm                   randconfig-004-20240728   gcc-14.1.0
arm                             rpc_defconfig   clang-20
arm                         s5pv210_defconfig   gcc-14.1.0
arm                        spear3xx_defconfig   clang-16
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240728   gcc-14.1.0
arm64                 randconfig-002-20240728   clang-20
arm64                 randconfig-003-20240728   gcc-14.1.0
arm64                 randconfig-004-20240728   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240728   gcc-14.1.0
csky                  randconfig-002-20240728   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240728   clang-15
hexagon               randconfig-002-20240728   clang-17
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240728   clang-18
i386         buildonly-randconfig-002-20240728   gcc-13
i386         buildonly-randconfig-003-20240728   gcc-11
i386         buildonly-randconfig-004-20240728   gcc-13
i386         buildonly-randconfig-005-20240728   gcc-11
i386         buildonly-randconfig-006-20240728   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240728   gcc-13
i386                  randconfig-002-20240728   gcc-13
i386                  randconfig-003-20240728   gcc-7
i386                  randconfig-004-20240728   gcc-13
i386                  randconfig-005-20240728   clang-18
i386                  randconfig-006-20240728   gcc-13
i386                  randconfig-011-20240728   gcc-13
i386                  randconfig-012-20240728   gcc-12
i386                  randconfig-013-20240728   clang-18
i386                  randconfig-014-20240728   gcc-13
i386                  randconfig-015-20240728   gcc-13
i386                  randconfig-016-20240728   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240728   gcc-14.1.0
loongarch             randconfig-002-20240728   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                          multi_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                           ip30_defconfig   gcc-14.1.0
mips                     loongson1c_defconfig   gcc-13.2.0
mips                      pic32mzda_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240728   gcc-14.1.0
nios2                 randconfig-002-20240728   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240728   gcc-14.1.0
parisc                randconfig-002-20240728   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                    amigaone_defconfig   gcc-14.1.0
powerpc                      bamboo_defconfig   clang-20
powerpc                      cm5200_defconfig   clang-20
powerpc                    ge_imp3a_defconfig   gcc-14.1.0
powerpc                     rainier_defconfig   gcc-14.1.0
powerpc                  storcenter_defconfig   gcc-14.1.0
powerpc64             randconfig-001-20240728   clang-20
powerpc64             randconfig-002-20240728   gcc-14.1.0
powerpc64             randconfig-003-20240728   clang-17
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240728   clang-20
riscv                 randconfig-002-20240728   clang-15
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240728   clang-16
s390                  randconfig-002-20240728   gcc-14.1.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                 kfr2r09-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240728   gcc-14.1.0
sh                    randconfig-002-20240728   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240728   gcc-14.1.0
sparc64               randconfig-002-20240728   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240728   gcc-11
um                    randconfig-002-20240728   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240728   gcc-13
x86_64       buildonly-randconfig-002-20240728   clang-18
x86_64       buildonly-randconfig-003-20240728   clang-18
x86_64       buildonly-randconfig-004-20240728   gcc-13
x86_64       buildonly-randconfig-005-20240728   clang-18
x86_64       buildonly-randconfig-006-20240728   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240728   clang-18
x86_64                randconfig-002-20240728   gcc-13
x86_64                randconfig-003-20240728   gcc-13
x86_64                randconfig-004-20240728   gcc-8
x86_64                randconfig-005-20240728   gcc-12
x86_64                randconfig-006-20240728   gcc-13
x86_64                randconfig-011-20240728   clang-18
x86_64                randconfig-012-20240728   clang-18
x86_64                randconfig-013-20240728   gcc-13
x86_64                randconfig-014-20240728   clang-18
x86_64                randconfig-015-20240728   gcc-11
x86_64                randconfig-016-20240728   clang-18
x86_64                randconfig-071-20240728   clang-18
x86_64                randconfig-072-20240728   gcc-13
x86_64                randconfig-073-20240728   clang-18
x86_64                randconfig-074-20240728   clang-18
x86_64                randconfig-075-20240728   clang-18
x86_64                randconfig-076-20240728   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-001-20240728   gcc-14.1.0
xtensa                randconfig-002-20240728   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
