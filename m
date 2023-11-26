Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAiXFdfn"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE8AB101
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Nov 2023 23:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700984245; x=1732520245;
  h=date:from:to:cc:subject:message-id;
  bh=cYPPMeaVhNffX3IhChER+sRccuZbxfLNts9svnbHzGU=;
  b=RAiXFdfna0xfmkxDywI3umAAc1irYFkpdp3tQoXMVY9wiFtlXlo+gZSc
   p9nyLk5oy9pk7KIPeJYdpjja2F8VyedF9hIzk7PQfCRR8Bb2VsqgnyBPM
   D0fZTHWHTJhLNq1hXhueDeZVABWv8+LUnecs44jmweW6WEBx8eSdl3Ch9
   be+D90lxXt4YDnTzKWKNpt0BktJcZ1XjoJSzS2gbbyMAuuUNr1NpNIi0O
   j+DvLtoam1zMa9Gbmz3Kui7qn3cAKoCx53hXuglTtk5lDyhlss91vpRXt
   +WT1R4161mdBUC/XYpJltkBpHsayAEGr8wXvTQbI95dWkH7X8TvNnVHsF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="392316311"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="392316311"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 23:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="744244764"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="744244764"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Nov 2023 23:37:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r79hg-0004x4-1b;
	Sun, 26 Nov 2023 07:37:20 +0000
Date: Sun, 26 Nov 2023 15:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 f903139441884c1da34fbfa9a33c14e1bb85f292
Message-ID: <202311261527.JxtuLqdi-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: f903139441884c1da34fbfa9a33c14e1bb85f292  hwmon: (nct6775) Fix fan speed set failure in automatic mode

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-001-20231126
|   `-- include-linux-platform_data-cros_ec_commands.h:warning:field-within-struct-ec_params_motion_sense-is-less-aligned-than-union-ec_params_motion_sense::(anonymous-at-include-linux-platform_data-cros_ec_c
|-- arm-randconfig-002-20231126
|   |-- drivers-infiniband-core-mad_priv.h:warning:field-wc-within-struct-ib_mad_private_header-is-less-aligned-than-struct-ib_wc-and-is-usually-due-to-struct-ib_mad_private_header-being-packed-which-can-lead
|   `-- net-smc-smc_llc.c:warning:field-within-struct-smc_llc_hdr-is-less-aligned-than-union-smc_llc_hdr::(anonymous-at-net-smc-smc_llc.c)-and-is-usually-due-to-struct-smc_llc_hdr-being-packed-which-can-lead-
|-- arm-randconfig-003-20231126
|   `-- drivers-infiniband-core-mad_priv.h:warning:field-wc-within-struct-ib_mad_private_header-is-less-aligned-than-struct-ib_wc-and-is-usually-due-to-struct-ib_mad_private_header-being-packed-which-can-lead
`-- arm-randconfig-004-20231126
    `-- include-linux-platform_data-cros_ec_commands.h:warning:field-within-struct-ec_params_motion_sense-is-less-aligned-than-union-ec_params_motion_sense::(anonymous-at-include-linux-platform_data-cros_ec_c

elapsed time: 928m

configs tested: 186
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231126   gcc  
arc                   randconfig-002-20231126   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                                 defconfig   clang
arm                      jornada720_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                        neponset_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20231126   clang
arm                   randconfig-002-20231126   clang
arm                   randconfig-003-20231126   clang
arm                   randconfig-004-20231126   clang
arm                             rpc_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231126   clang
arm64                 randconfig-002-20231126   clang
arm64                 randconfig-003-20231126   clang
arm64                 randconfig-004-20231126   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231126   gcc  
csky                  randconfig-002-20231126   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231126   clang
hexagon               randconfig-002-20231126   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231126   clang
i386         buildonly-randconfig-002-20231126   clang
i386         buildonly-randconfig-003-20231126   clang
i386         buildonly-randconfig-004-20231126   clang
i386         buildonly-randconfig-005-20231126   clang
i386         buildonly-randconfig-006-20231126   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231126   clang
i386                  randconfig-002-20231126   clang
i386                  randconfig-003-20231126   clang
i386                  randconfig-004-20231126   clang
i386                  randconfig-005-20231126   clang
i386                  randconfig-006-20231126   clang
i386                  randconfig-011-20231126   gcc  
i386                  randconfig-012-20231126   gcc  
i386                  randconfig-013-20231126   gcc  
i386                  randconfig-014-20231126   gcc  
i386                  randconfig-015-20231126   gcc  
i386                  randconfig-016-20231126   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231126   gcc  
loongarch             randconfig-002-20231126   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                     cu1830-neo_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231126   gcc  
nios2                 randconfig-002-20231126   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231126   gcc  
parisc                randconfig-002-20231126   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                   microwatt_defconfig   clang
powerpc                    mvme5100_defconfig   clang
powerpc               randconfig-001-20231126   clang
powerpc               randconfig-002-20231126   clang
powerpc               randconfig-003-20231126   clang
powerpc                     tqm8548_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc64             randconfig-001-20231126   clang
powerpc64             randconfig-002-20231126   clang
powerpc64             randconfig-003-20231126   clang
riscv                            alldefconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231126   clang
riscv                 randconfig-002-20231126   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231126   gcc  
s390                  randconfig-002-20231126   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20231126   gcc  
sh                    randconfig-002-20231126   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231126   gcc  
sparc64               randconfig-002-20231126   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231126   clang
um                    randconfig-002-20231126   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231126   clang
x86_64       buildonly-randconfig-002-20231126   clang
x86_64       buildonly-randconfig-003-20231126   clang
x86_64       buildonly-randconfig-004-20231126   clang
x86_64       buildonly-randconfig-005-20231126   clang
x86_64       buildonly-randconfig-006-20231126   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231126   gcc  
x86_64                randconfig-002-20231126   gcc  
x86_64                randconfig-003-20231126   gcc  
x86_64                randconfig-004-20231126   gcc  
x86_64                randconfig-005-20231126   gcc  
x86_64                randconfig-006-20231126   gcc  
x86_64                randconfig-011-20231126   clang
x86_64                randconfig-012-20231126   clang
x86_64                randconfig-013-20231126   clang
x86_64                randconfig-014-20231126   clang
x86_64                randconfig-015-20231126   clang
x86_64                randconfig-016-20231126   clang
x86_64                randconfig-071-20231126   clang
x86_64                randconfig-072-20231126   clang
x86_64                randconfig-073-20231126   clang
x86_64                randconfig-074-20231126   clang
x86_64                randconfig-075-20231126   clang
x86_64                randconfig-076-20231126   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20231126   gcc  
xtensa                randconfig-002-20231126   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
