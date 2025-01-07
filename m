Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427115B135
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jan 2025 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272622; cv=none; b=WbkkiwobSfIjUid5aMznZIjs7gxBL9Pz7MXHhez0RWudMF3BQP6TI2tGJJz5xAcozTGBUDofODsOXclxSQyIC+EXk50eIU0uKJZwuvN9juGh7wOjI47epAIgq91fdLpg7e7TQ20gHaXSWbolHF7XHL+8lrdl69r7HNxtPNcek3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272622; c=relaxed/simple;
	bh=JYj8bCgIfnMskbsi6iENNvfcgynChXERj0CWE1/EBrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WpvjqfrcSVbs1Jsz1noqx+vFhaPaYge8BvjX6q0TNBdFcZ+mMZX5/H/Xcaxb4jFQERVhLQY6brZTXYlS+jhB5vJqFDSNzrrVJSfEMpSFt5sTcee6QasQn+QMtqRQm0D5Xz68ntQMV70zrIhjEfWEGwXbsQN3MCbUjLZxupU1cZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmYcFLLq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmYcFLLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736272622; x=1767808622;
  h=date:from:to:cc:subject:message-id;
  bh=JYj8bCgIfnMskbsi6iENNvfcgynChXERj0CWE1/EBrg=;
  b=EmYcFLLqhFQdluB+2+B8El5u7qYGCfh9Vf1oI9H7rCD2pxH7lgBIc9qi
   g7UwksOyak52W/5PmlBEAVBrSnc+8g3MzStOOHzvKgTI1XXp03fmMtANQ
   TUhrDIXSSnZk8E8+OE9pGyNk08IPIDUWBAvK684/pBa303Pw0s2+VcoLM
   b8JJdXnqm9K3RwufrjeNKtUZzvM7sgPFTrwFXElmgZLIMwgegfLN9ESlL
   dkgrFDYCIi6zWRY4K97BzdRSsD4WuIyukOSllUByjq6USZaqRKbSQpDZE
   8itx8N6vmsGsBAShWslQv433BNq2XrPFSNlQMCHE3AQIY+arZV0WJJO0n
   A==;
X-CSE-ConnectionGUID: qZfQlZOxRuuLee2ILfXErg==
X-CSE-MsgGUID: y/2izdTlRh6AnEoYqQidGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36351664"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36351664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:57:01 -0800
X-CSE-ConnectionGUID: a+qn6wTpQECtttn7CkCFfA==
X-CSE-MsgGUID: nztxvmFdS160FYA+AnVj3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103687132"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jan 2025 09:57:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVDp3-000F3z-2P;
	Tue, 07 Jan 2025 17:56:57 +0000
Date: Wed, 08 Jan 2025 01:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 b3bdfb0c8115d71263efd442ac2f825cb286b241
Message-ID: <202501080155.j5wEgsaR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: b3bdfb0c8115d71263efd442ac2f825cb286b241  hwmon: (drivetemp) Fix driver producing garbage data when SCSI errors occur

elapsed time: 1458m

configs tested: 125
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250107    gcc-13.2.0
arc                   randconfig-002-20250107    gcc-13.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                        mvebu_v5_defconfig    gcc-14.2.0
arm                   randconfig-001-20250107    clang-20
arm                   randconfig-002-20250107    clang-19
arm                   randconfig-003-20250107    clang-20
arm                   randconfig-004-20250107    gcc-14.2.0
arm                        realview_defconfig    clang-19
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250107    clang-15
arm64                 randconfig-002-20250107    clang-20
arm64                 randconfig-003-20250107    gcc-14.2.0
arm64                 randconfig-004-20250107    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250107    gcc-14.2.0
csky                  randconfig-002-20250107    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250107    clang-20
hexagon               randconfig-002-20250107    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386        buildonly-randconfig-001-20250107    clang-19
i386        buildonly-randconfig-002-20250107    clang-19
i386        buildonly-randconfig-003-20250107    clang-19
i386        buildonly-randconfig-004-20250107    gcc-12
i386        buildonly-randconfig-005-20250107    gcc-12
i386        buildonly-randconfig-006-20250107    clang-19
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250107    gcc-14.2.0
loongarch             randconfig-002-20250107    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250107    gcc-14.2.0
nios2                 randconfig-002-20250107    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250107    gcc-14.2.0
parisc                randconfig-002-20250107    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      katmai_defconfig    clang-18
powerpc                   lite5200b_defconfig    clang-20
powerpc                   motionpro_defconfig    clang-17
powerpc                     mpc5200_defconfig    clang-20
powerpc                 mpc8315_rdb_defconfig    clang-20
powerpc                     mpc83xx_defconfig    clang-20
powerpc               randconfig-001-20250107    gcc-14.2.0
powerpc               randconfig-002-20250107    gcc-14.2.0
powerpc               randconfig-003-20250107    clang-20
powerpc64             randconfig-001-20250107    clang-15
powerpc64             randconfig-002-20250107    clang-20
powerpc64             randconfig-003-20250107    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                 randconfig-001-20250107    clang-15
riscv                 randconfig-002-20250107    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250107    gcc-14.2.0
s390                  randconfig-002-20250107    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                    randconfig-001-20250107    gcc-14.2.0
sh                    randconfig-002-20250107    gcc-14.2.0
sh                            shmin_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250107    gcc-14.2.0
sparc                 randconfig-002-20250107    gcc-14.2.0
sparc                       sparc64_defconfig    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250107    gcc-14.2.0
sparc64               randconfig-002-20250107    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250107    gcc-12
um                    randconfig-002-20250107    clang-20
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64      buildonly-randconfig-001-20250107    clang-19
x86_64      buildonly-randconfig-002-20250107    gcc-12
x86_64      buildonly-randconfig-003-20250107    clang-19
x86_64      buildonly-randconfig-004-20250107    gcc-12
x86_64      buildonly-randconfig-005-20250107    clang-19
x86_64      buildonly-randconfig-006-20250107    clang-19
x86_64                              defconfig    gcc-11
xtensa                           alldefconfig    gcc-14.2.0
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250107    gcc-14.2.0
xtensa                randconfig-002-20250107    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
