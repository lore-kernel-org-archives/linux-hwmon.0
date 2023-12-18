Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DE4FF84
	for <linux-hwmon@vger.kernel.org>; Mon, 18 Dec 2023 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5d/bchu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702918269; x=1734454269;
  h=date:from:to:cc:subject:message-id;
  bh=oCGSCqic9tvpxs8dDZKuuweTZXYDa1rulh8Igh3phK4=;
  b=N5d/bchuK7ARE1zabZQwNbv1QkyprsjvDOqPP51BgWij59rRfiuw2WSx
   vz0Ccrw1ju4JRJSvyyE0WheLWJadXQYdjbDJG1Fjo9qu9JpjnTAwA20Y1
   nmZal3JkAXm4PbmSCXJZhc+lbt98wlmGRoSn9ObBB03ExKA8LDTQyGIk3
   K8bHMJCeRYvZx0IRYHkJCQYt011NCRZxodg3q0VtAn9vQQ6F6ou4jeH6E
   7xZggLbplkH3UjaeZ83qfhqveVYT5/+8tA+egZzN6icLlJDVzycscKcUh
   yXm0PNYuUNZcLU92eMnGToF24HkjIMuHCHSNs/yWEWRY04k0D44JDAYbm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="385957290"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="385957290"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 08:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="948835290"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="948835290"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Dec 2023 08:51:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFGpd-0004L1-1G;
	Mon, 18 Dec 2023 16:51:05 +0000
Date: Tue, 19 Dec 2023 00:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 db79be9d970740b2310b1eece69c34bcea06c340
Message-ID: <202312190034.C6kGUz0G-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: db79be9d970740b2310b1eece69c34bcea06c340  hwmon: (pmbus) Add support for MPS Multi-phase mp2856/mp2857 controller

elapsed time: 1471m

configs tested: 175
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231218   gcc  
arc                   randconfig-002-20231218   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                           h3600_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231218   gcc  
arm                   randconfig-002-20231218   gcc  
arm                   randconfig-003-20231218   gcc  
arm                   randconfig-004-20231218   gcc  
arm                             rpc_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231218   gcc  
arm64                 randconfig-002-20231218   gcc  
arm64                 randconfig-003-20231218   gcc  
arm64                 randconfig-004-20231218   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231218   gcc  
csky                  randconfig-002-20231218   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231218   gcc  
i386         buildonly-randconfig-002-20231218   gcc  
i386         buildonly-randconfig-003-20231218   gcc  
i386         buildonly-randconfig-004-20231218   gcc  
i386         buildonly-randconfig-005-20231218   gcc  
i386         buildonly-randconfig-006-20231218   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231218   gcc  
i386                  randconfig-002-20231218   gcc  
i386                  randconfig-003-20231218   gcc  
i386                  randconfig-004-20231218   gcc  
i386                  randconfig-005-20231218   gcc  
i386                  randconfig-006-20231218   gcc  
i386                  randconfig-011-20231218   clang
i386                  randconfig-012-20231218   clang
i386                  randconfig-013-20231218   clang
i386                  randconfig-014-20231218   clang
i386                  randconfig-015-20231218   clang
i386                  randconfig-016-20231218   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231218   gcc  
loongarch             randconfig-002-20231218   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231218   gcc  
nios2                 randconfig-002-20231218   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20231218   gcc  
parisc                randconfig-002-20231218   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc               randconfig-001-20231218   gcc  
powerpc               randconfig-002-20231218   gcc  
powerpc               randconfig-003-20231218   gcc  
powerpc64             randconfig-001-20231218   gcc  
powerpc64             randconfig-002-20231218   gcc  
powerpc64             randconfig-003-20231218   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231218   gcc  
riscv                 randconfig-002-20231218   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20231218   gcc  
sh                    randconfig-002-20231218   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231218   gcc  
sparc64               randconfig-002-20231218   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231218   gcc  
um                    randconfig-002-20231218   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231218   gcc  
x86_64       buildonly-randconfig-002-20231218   gcc  
x86_64       buildonly-randconfig-003-20231218   gcc  
x86_64       buildonly-randconfig-004-20231218   gcc  
x86_64       buildonly-randconfig-005-20231218   gcc  
x86_64       buildonly-randconfig-006-20231218   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20231218   gcc  
x86_64                randconfig-012-20231218   gcc  
x86_64                randconfig-013-20231218   gcc  
x86_64                randconfig-014-20231218   gcc  
x86_64                randconfig-015-20231218   gcc  
x86_64                randconfig-016-20231218   gcc  
x86_64                randconfig-071-20231218   gcc  
x86_64                randconfig-072-20231218   gcc  
x86_64                randconfig-073-20231218   gcc  
x86_64                randconfig-074-20231218   gcc  
x86_64                randconfig-075-20231218   gcc  
x86_64                randconfig-076-20231218   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20231218   gcc  
xtensa                randconfig-002-20231218   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
