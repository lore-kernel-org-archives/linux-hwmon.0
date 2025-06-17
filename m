Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DD2F5302
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Jun 2025 21:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197386; cv=none; b=kiNC430BpsX4GIU/SkmmKiwP9UUKNIPLwOZfsrYdsedMRNpxpTjHSNuvNMD9pYKmHgDz9vfdFjp75q9kXhfIHx5xZ5hvU8cCNikIrm4l4ncZeRvYzFSAXyg2zhkQ1Hvg6nDcYVyEXek6b+FbH8hCRU/39O31d1HBa3tj6qc7ugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197386; c=relaxed/simple;
	bh=/S+CLE+4ECFSCbimD116mqJfOGtOFLoR9WzP4g/qEkM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IQbiB4rUPm2vPeo0uEnXgW9ycOrn4bU9CFyoQYa6ti+RoUfd2rlecooPvWVAI4yzB0sfcsBw+1M+H+8uor+7PP9wp3AoJT+mR4SfMdApXskrdEMAogqMeqKR6B4qtXu35A11Yq/8qjbB7qwutZRXZvZsdKRwCb+Zm7Wn7zu8h5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8ypR4NQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8ypR4NQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750197384; x=1781733384;
  h=date:from:to:cc:subject:message-id;
  bh=/S+CLE+4ECFSCbimD116mqJfOGtOFLoR9WzP4g/qEkM=;
  b=O8ypR4NQKiOIEK8MVsJBu7HfxP+DTbNjuBVE43TUkdi4bKGo+iAJDcSB
   Ea7/jUJaEudZEYog6hPSn0XV881+QoEQ38sbhPmDEQCdzjDz6Xkq6As4G
   eZSCVNSTeNasWg1TbV5/yPxnBa8tha6pSW9pYjsspf1igQ/Dt14jXBJrr
   Rfwmsu3FTQ9bhnqb3MuYpmDxAgt+u8M4wNXwInetYZpD8Aoy/GemXH58x
   Hf7ceIO/I98B5wOBmlActm3WiCYl/UK6CRvGK/379q0QuursWz0NaIkLv
   a3hKIN9n1favUKX91jkny+FrhJK9tA8SFnrtB2cCltpJ/NZK+kFjiEaLW
   w==;
X-CSE-ConnectionGUID: zo4K4PYWTvOBBRSKgPZLyA==
X-CSE-MsgGUID: 0n1z6z/VSVuf7hqujTuluA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52374304"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52374304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 14:56:24 -0700
X-CSE-ConnectionGUID: Z7GB0vEnR1W76jAKfhLclQ==
X-CSE-MsgGUID: f2fwXOMgSqGzYlwUZsWmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="154326647"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jun 2025 14:56:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uReI0-000JAc-1R;
	Tue, 17 Jun 2025 21:56:20 +0000
Date: Wed, 18 Jun 2025 05:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 a41a9728941f7406a8035d0f19f45f8f3cf65b03
Message-ID: <202506180553.KoI43AMW-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: a41a9728941f7406a8035d0f19f45f8f3cf65b03  hwmon: emc2305: Set initial PWM minimum value during probe based on thermal state

elapsed time: 1405m

configs tested: 127
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250617    gcc-11.5.0
arc                   randconfig-002-20250617    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         at91_dt_defconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                          ixp4xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250617    gcc-8.5.0
arm                   randconfig-002-20250617    clang-21
arm                   randconfig-003-20250617    clang-21
arm                   randconfig-004-20250617    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250617    gcc-11.5.0
arm64                 randconfig-002-20250617    clang-21
arm64                 randconfig-003-20250617    gcc-8.5.0
arm64                 randconfig-004-20250617    gcc-12.3.0
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250617    gcc-13.3.0
csky                  randconfig-002-20250617    gcc-12.4.0
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250617    clang-21
hexagon               randconfig-002-20250617    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250617    gcc-12
i386        buildonly-randconfig-002-20250617    clang-20
i386        buildonly-randconfig-003-20250617    gcc-12
i386        buildonly-randconfig-004-20250617    gcc-12
i386        buildonly-randconfig-005-20250617    gcc-12
i386        buildonly-randconfig-006-20250617    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch             randconfig-001-20250617    gcc-15.1.0
loongarch             randconfig-002-20250617    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          rb532_defconfig    clang-18
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250617    gcc-10.5.0
nios2                 randconfig-002-20250617    gcc-14.2.0
openrisc                         alldefconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250617    gcc-8.5.0
parisc                randconfig-002-20250617    gcc-8.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                        cell_defconfig    gcc-15.1.0
powerpc                 linkstation_defconfig    clang-20
powerpc                      mgcoge_defconfig    clang-21
powerpc                  mpc866_ads_defconfig    clang-21
powerpc                      pasemi_defconfig    clang-21
powerpc               randconfig-001-20250617    gcc-8.5.0
powerpc               randconfig-002-20250617    clang-16
powerpc               randconfig-003-20250617    gcc-12.4.0
powerpc64             randconfig-001-20250617    gcc-14.3.0
powerpc64             randconfig-002-20250617    clang-21
powerpc64             randconfig-003-20250617    gcc-13.3.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250617    clang-21
riscv                 randconfig-002-20250617    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250617    clang-21
s390                  randconfig-002-20250617    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                             espt_defconfig    gcc-15.1.0
sh                    randconfig-001-20250617    gcc-12.4.0
sh                    randconfig-002-20250617    gcc-14.3.0
sh                      rts7751r2d1_defconfig    gcc-15.1.0
sh                           se7619_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250617    gcc-12.4.0
sparc                 randconfig-002-20250617    gcc-13.3.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250617    gcc-15.1.0
sparc64               randconfig-002-20250617    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250617    gcc-12
um                    randconfig-002-20250617    clang-21
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250617    clang-20
x86_64      buildonly-randconfig-002-20250617    clang-20
x86_64      buildonly-randconfig-003-20250617    gcc-11
x86_64      buildonly-randconfig-004-20250617    gcc-12
x86_64      buildonly-randconfig-005-20250617    gcc-12
x86_64      buildonly-randconfig-006-20250617    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250617    gcc-10.5.0
xtensa                randconfig-002-20250617    gcc-12.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
