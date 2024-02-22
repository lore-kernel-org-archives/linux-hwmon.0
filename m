Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B36A1419A4
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Feb 2024 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708616753; cv=none; b=guz3HFbNTMe07AwquYEWEAtvxDnyR4PwJ7Hq4Ia4XfhsG6OwF4hViqkJ9qlL4xc4xb+kJGqr7GspkS1L9nq4risq+E8r9ty1CjYjmVX4PI4JK6/+96N6Wp4v7rdaOr7EhXNbg5ycTc3iuPAj5Ckrs7YDlex2bca+YsXn2wtsOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708616753; c=relaxed/simple;
	bh=uH8+nvIdkTPGmhuXAJnP+Ob51cgkxdZqHXdm3uaeoPA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S7LEe/1Vde+vePKtHxV83wyUeCkzzdIvR0FdIAcHf4OdnFo0TbA4P8lYWQSrf+LBR4QP1O/+p7a5/atLiVS9c4AZWd9AkkPuOHhrqlogBHNnK2WEOzNHVMMpe4+iKuGHqSQ32/I4kSuzcKde+SmCSfYiui1xWZkZKgwTgOyrF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caRPDRsa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caRPDRsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708616749; x=1740152749;
  h=date:from:to:cc:subject:message-id;
  bh=uH8+nvIdkTPGmhuXAJnP+Ob51cgkxdZqHXdm3uaeoPA=;
  b=caRPDRsaqkuxenm4iAx1sT7C1/nBU3v32EJlrPdvr1Rgb8ocghOgl8ah
   g+2kGLJctzp0EDuFbyzy8IRfPhzAD+AaR5i9X+8M561WNaBaQ+ZO4pSRe
   i1PAqqfNsmM6BiqLROvuXGXYHLqL6EBrk8+RH4tRCf39VBO6WXDhoI1jj
   FnHFdNX9X1wljCEJV9XI0VrqwHv2jN4mnKLhYektDBh3F39xRhM3q83qL
   k+i1WBP7Nmd4uwRXygZU+wRDtjXAHGIvCO3M7xYCgJb6REMNq6fdFVICd
   Ig3u49T2btmj2urcFy/f7bd9/LLGhtxdQUfL3mFDqiWG9b5wKHXnpiUC9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3346312"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3346312"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="10214361"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Feb 2024 07:45:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdBGF-0006Ri-2P;
	Thu, 22 Feb 2024 15:45:32 +0000
Date: Thu, 22 Feb 2024 23:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD REGRESSION
 cf5ad17ee6a41ed51d21338d62e4654bd2198695
Message-ID: <202402222304.lGDmbiwP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: cf5ad17ee6a41ed51d21338d62e4654bd2198695  hwmon: (nct6775) Fix access to temperature configuration registers

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-allmodconfig
    `-- standard-input:Error:unknown-pseudo-op:cfi_def_

elapsed time: 1452m

configs tested: 178
configs skipped: 8

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20240222   gcc  
arc                   randconfig-002-20240222   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                        neponset_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20240222   gcc  
arm                   randconfig-002-20240222   gcc  
arm                         s5pv210_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                        vexpress_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-002-20240222   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240222   gcc  
csky                  randconfig-002-20240222   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240222   gcc  
i386         buildonly-randconfig-002-20240222   clang
i386         buildonly-randconfig-003-20240222   clang
i386         buildonly-randconfig-004-20240222   gcc  
i386         buildonly-randconfig-005-20240222   clang
i386         buildonly-randconfig-006-20240222   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240222   clang
i386                  randconfig-002-20240222   clang
i386                  randconfig-003-20240222   gcc  
i386                  randconfig-004-20240222   clang
i386                  randconfig-005-20240222   gcc  
i386                  randconfig-006-20240222   clang
i386                  randconfig-011-20240222   gcc  
i386                  randconfig-012-20240222   clang
i386                  randconfig-013-20240222   gcc  
i386                  randconfig-014-20240222   gcc  
i386                  randconfig-015-20240222   clang
i386                  randconfig-016-20240222   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240222   gcc  
loongarch             randconfig-002-20240222   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                            q40_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip28_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240222   gcc  
nios2                 randconfig-002-20240222   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240222   gcc  
parisc                randconfig-002-20240222   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64             randconfig-003-20240222   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240222   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240222   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20240222   gcc  
sh                    randconfig-002-20240222   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240222   gcc  
sparc64               randconfig-002-20240222   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-003-20240222   gcc  
x86_64       buildonly-randconfig-005-20240222   gcc  
x86_64       buildonly-randconfig-006-20240222   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-005-20240222   gcc  
x86_64                randconfig-006-20240222   gcc  
x86_64                randconfig-012-20240222   gcc  
x86_64                randconfig-014-20240222   gcc  
x86_64                randconfig-074-20240222   gcc  
x86_64                randconfig-075-20240222   gcc  
x86_64                randconfig-076-20240222   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240222   gcc  
xtensa                randconfig-002-20240222   gcc  
xtensa                         virt_defconfig   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
