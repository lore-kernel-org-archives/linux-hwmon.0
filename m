Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB691311AC
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720876884; cv=none; b=I1wxApuSl9AmnQEgaqj6JHFOH8amfFlae9b4fSEfX7boRxReUoM+aatSZc4XyVxJHYKVoE7XeJsxs7CY2iydK+CG+3XNzTDmBw4h7psHh4pbZYnFzHlLXzRKUSBycn+/8YqNOb0dXzFm9+r3iGjrekcMv0EAEOHCLvDmdco+fYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720876884; c=relaxed/simple;
	bh=L4pjrhTJvqNhBPr9ne1sJDvy1qNP5QoevsB+TEK1Q9E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fV7QdNzPVaQx4LipYZ4mexMEx2LsLi1/BqJUu4KLkkdCKH0CtpS7mU6Ey7ygn1YPp2kwkH6ZuorV38e7LxwdIB+apv5d+u8yDe1GJDhjIguVY1dG+7g9raV71U1l73RYM5lrlBAks+VUVUvWobBTsYtsO5jAIYxdEMredxSusmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKmdl74M; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKmdl74M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720876882; x=1752412882;
  h=date:from:to:cc:subject:message-id;
  bh=L4pjrhTJvqNhBPr9ne1sJDvy1qNP5QoevsB+TEK1Q9E=;
  b=dKmdl74M2pEn9y4fq2L2Opma1bP8UYHiwih0gEMCpk0HahoFqLINN08S
   kbLVGit6SuLe0TKgXbiOADjSXgh0l2BJ1cBrS2dy4k9YVyIqN8k62VUst
   h1dT59mTEKZxJzZ64dzEXqDlSkFWaFn7Q4mvlQsHNAYHv7ceY+NeKrBkL
   1K1kW27xGGA+4izc/GY3i7mcMdji1wa14pL8UGcWSiNTCFrjQAlJ0o5cS
   WX2h3X76mBmhJBmN2zOfcoBdxudpbzGa21KkJNzBPr5k22fa2vMIXtQLZ
   vbKJ2Ef2NjonUFf/x+0ztvm7akEzY0zH03BrqRkfZd/vVAWbMWhJgFSwZ
   Q==;
X-CSE-ConnectionGUID: Vte9gcSQTYC5WWqueLgsAg==
X-CSE-MsgGUID: BLfybQ8TSG+UmsUXVzjNHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28905646"
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="28905646"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 06:21:22 -0700
X-CSE-ConnectionGUID: HdHOgiqRSj2sNFsWBjPMCA==
X-CSE-MsgGUID: 4ejetqVcS+6EY+AMrdcGQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,206,1716274800"; 
   d="scan'208";a="79862545"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Jul 2024 06:21:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sScgf-000c5v-1r;
	Sat, 13 Jul 2024 13:21:17 +0000
Date: Sat, 13 Jul 2024 21:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS WITH WARNING
 80e45111b670e9c913398f5ad54196a99a739497
Message-ID: <202407132156.NUEURedb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 80e45111b670e9c913398f5ad54196a99a739497  Merge branch 'hwmon-lm95234' into hwmon-staging

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202407130915.X917zHwW-lkp@intel.com

Warning: (recently discovered and may have been fixed)

drivers/hwmon/lm95234.c:223:7: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]

Unverified Warning (likely false positive, please contact us if interested):

drivers/hwmon/lm95234.c:223 lm95234_temp_read() error: uninitialized symbol 'ret'.

Warning ids grouped by kconfigs:

recent_errors
|-- arm-randconfig-004-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- arm64-allmodconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- hexagon-allmodconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- hexagon-allyesconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- hexagon-randconfig-002-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-001-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-002-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-buildonly-randconfig-004-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-randconfig-004-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-randconfig-011-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-randconfig-016-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- i386-randconfig-141-20240713
|   `-- drivers-hwmon-lm95234.c-lm95234_temp_read()-error:uninitialized-symbol-ret-.
|-- mips-randconfig-r064-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- powerpc-allyesconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- powerpc-randconfig-r132-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- powerpc64-randconfig-003-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- powerpc64-randconfig-r121-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- riscv-allmodconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- riscv-allyesconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- s390-allmodconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- um-allmodconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- um-randconfig-001-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-allyesconfig
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-004-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-buildonly-randconfig-006-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-001-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-003-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-006-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-012-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-076-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-123-20240713
|   `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here
|-- x86_64-randconfig-161-20240713
|   `-- drivers-hwmon-lm95234.c-lm95234_temp_read()-error:uninitialized-symbol-ret-.
`-- x86_64-rhel-8.3-rust
    `-- drivers-hwmon-lm95234.c:warning:variable-ret-is-uninitialized-when-used-here

elapsed time: 1272m

configs tested: 210
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240713   gcc-13.2.0
arc                   randconfig-002-20240713   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                       aspeed_g4_defconfig   gcc-13.2.0
arm                         at91_dt_defconfig   clang-19
arm                     davinci_all_defconfig   gcc-13.2.0
arm                                 defconfig   gcc-13.2.0
arm                           h3600_defconfig   gcc-13.2.0
arm                           imxrt_defconfig   gcc-13.2.0
arm                       omap2plus_defconfig   gcc-14.1.0
arm                   randconfig-001-20240713   gcc-13.2.0
arm                   randconfig-002-20240713   gcc-13.2.0
arm                   randconfig-003-20240713   gcc-13.2.0
arm                   randconfig-004-20240713   gcc-13.2.0
arm                        realview_defconfig   clang-19
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240713   gcc-13.2.0
arm64                 randconfig-002-20240713   gcc-13.2.0
arm64                 randconfig-003-20240713   gcc-13.2.0
arm64                 randconfig-004-20240713   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240713   gcc-13.2.0
csky                  randconfig-002-20240713   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240713   clang-18
i386         buildonly-randconfig-002-20240713   clang-18
i386         buildonly-randconfig-003-20240713   clang-18
i386         buildonly-randconfig-003-20240713   gcc-8
i386         buildonly-randconfig-004-20240713   clang-18
i386         buildonly-randconfig-005-20240713   clang-18
i386         buildonly-randconfig-005-20240713   gcc-13
i386         buildonly-randconfig-006-20240713   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240713   clang-18
i386                  randconfig-001-20240713   gcc-10
i386                  randconfig-002-20240713   clang-18
i386                  randconfig-002-20240713   gcc-13
i386                  randconfig-003-20240713   clang-18
i386                  randconfig-003-20240713   gcc-13
i386                  randconfig-004-20240713   clang-18
i386                  randconfig-005-20240713   clang-18
i386                  randconfig-005-20240713   gcc-10
i386                  randconfig-006-20240713   clang-18
i386                  randconfig-006-20240713   gcc-12
i386                  randconfig-011-20240713   clang-18
i386                  randconfig-012-20240713   clang-18
i386                  randconfig-012-20240713   gcc-7
i386                  randconfig-013-20240713   clang-18
i386                  randconfig-013-20240713   gcc-13
i386                  randconfig-014-20240713   clang-18
i386                  randconfig-014-20240713   gcc-13
i386                  randconfig-015-20240713   clang-18
i386                  randconfig-015-20240713   gcc-11
i386                  randconfig-016-20240713   clang-18
loongarch                        alldefconfig   gcc-14.1.0
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240713   gcc-13.2.0
loongarch             randconfig-002-20240713   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                       bvme6000_defconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
microblaze                      mmu_defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                      bmips_stb_defconfig   gcc-13.2.0
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                     loongson1b_defconfig   gcc-14.1.0
mips                      loongson3_defconfig   clang-19
mips                      malta_kvm_defconfig   gcc-14.1.0
mips                malta_qemu_32r6_defconfig   clang-19
mips                      maltasmvp_defconfig   gcc-14.1.0
mips                        maltaup_defconfig   clang-19
mips                           mtx1_defconfig   gcc-13.2.0
mips                          rm200_defconfig   gcc-13.2.0
mips                           rs90_defconfig   clang-19
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240713   gcc-13.2.0
nios2                 randconfig-002-20240713   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240713   gcc-13.2.0
parisc                randconfig-002-20240713   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                     asp8347_defconfig   clang-19
powerpc                 canyonlands_defconfig   clang-19
powerpc                      cm5200_defconfig   gcc-13.2.0
powerpc                       eiger_defconfig   clang-19
powerpc                   motionpro_defconfig   gcc-13.2.0
powerpc                   motionpro_defconfig   gcc-14.1.0
powerpc                     mpc512x_defconfig   clang-19
powerpc                     mpc5200_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                      ppc44x_defconfig   clang-19
powerpc               randconfig-001-20240713   gcc-13.2.0
powerpc               randconfig-002-20240713   gcc-13.2.0
powerpc               randconfig-003-20240713   gcc-13.2.0
powerpc                     tqm8555_defconfig   clang-19
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240713   gcc-13.2.0
powerpc64             randconfig-002-20240713   gcc-13.2.0
powerpc64             randconfig-003-20240713   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv                    nommu_k210_defconfig   gcc-14.1.0
riscv                 randconfig-001-20240713   gcc-13.2.0
riscv                 randconfig-002-20240713   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240713   gcc-13.2.0
s390                  randconfig-002-20240713   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                         ap325rxa_defconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-14.1.0
sh                    randconfig-001-20240713   gcc-13.2.0
sh                    randconfig-002-20240713   gcc-13.2.0
sh                             shx3_defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240713   gcc-13.2.0
sparc64               randconfig-002-20240713   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240713   gcc-13.2.0
um                    randconfig-002-20240713   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240713   clang-18
x86_64       buildonly-randconfig-002-20240713   clang-18
x86_64       buildonly-randconfig-003-20240713   clang-18
x86_64       buildonly-randconfig-004-20240713   clang-18
x86_64       buildonly-randconfig-005-20240713   clang-18
x86_64       buildonly-randconfig-006-20240713   clang-18
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240713   clang-18
x86_64                randconfig-002-20240713   clang-18
x86_64                randconfig-003-20240713   clang-18
x86_64                randconfig-004-20240713   clang-18
x86_64                randconfig-005-20240713   clang-18
x86_64                randconfig-006-20240713   clang-18
x86_64                randconfig-011-20240713   clang-18
x86_64                randconfig-012-20240713   clang-18
x86_64                randconfig-013-20240713   clang-18
x86_64                randconfig-014-20240713   clang-18
x86_64                randconfig-015-20240713   clang-18
x86_64                randconfig-016-20240713   clang-18
x86_64                randconfig-071-20240713   clang-18
x86_64                randconfig-072-20240713   clang-18
x86_64                randconfig-073-20240713   clang-18
x86_64                randconfig-074-20240713   clang-18
x86_64                randconfig-075-20240713   clang-18
x86_64                randconfig-076-20240713   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240713   gcc-13.2.0
xtensa                randconfig-002-20240713   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
