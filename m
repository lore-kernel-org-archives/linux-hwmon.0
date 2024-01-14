Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8DB7E
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jan 2024 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOuD58Z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705192197; x=1736728197;
  h=date:from:to:cc:subject:message-id;
  bh=QHxqMg6b3G+TVP3Y8tEP6STfW1NXv7kvdR/bMdUhDhs=;
  b=hOuD58Z6OdcWBrsrK2zskkp1Ifbw3ss53uTwxmHGrOjCoJzMjam4XSEo
   uhy2TncRE6GZ0WwfN2hsaHIIjL3Dlkob/24hMx6ANLy19Oa5f0U/MRLjt
   JIavXW1PivFeeaJ5jQgiukGXBYtzD82FQhO1NYXCQsyzDOld+mjuitWi1
   beuqEiN9bGeQL/BFDDMjma8hyLs1f/GUfTXI7WgDT179Z6zIEm5mYnmI5
   dhxBMxoXQe1i20VdF1FTEaAI43WFBGMMJjnvNIygeibcYMl+bzFc8Rm0d
   IhLU0TS6W6LPQayQmmHZNtP3AFsE2ossMNuCZ20FjqsDjGu97h44KsAYB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="6174293"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="6174293"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 16:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="759496240"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="759496240"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2024 16:29:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOoNs-000B2c-1k;
	Sun, 14 Jan 2024 00:29:52 +0000
Date: Sun, 14 Jan 2024 08:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 f4c6556b505c04434788a5505fcc403635f2ce8d
Message-ID: <202401140835.YPKjbNIA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: f4c6556b505c04434788a5505fcc403635f2ce8d  hwmon: (npcm750-pwm-fan) Fix crash observed when instantiating nuvoton,npcm750-pwm-fan

elapsed time: 1478m

configs tested: 168
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240113   gcc  
arc                   randconfig-002-20240113   gcc  
arc                           tb10x_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                           imxrt_defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                         nhk8815_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240113   gcc  
arm                   randconfig-002-20240113   gcc  
arm                   randconfig-003-20240113   gcc  
arm                   randconfig-004-20240113   gcc  
arm                        spear6xx_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240113   gcc  
arm64                 randconfig-002-20240113   gcc  
arm64                 randconfig-003-20240113   gcc  
arm64                 randconfig-004-20240113   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240113   gcc  
csky                  randconfig-002-20240113   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386                                defconfig   gcc  
i386                  randconfig-011-20240113   clang
i386                  randconfig-011-20240114   gcc  
i386                  randconfig-012-20240113   clang
i386                  randconfig-012-20240114   gcc  
i386                  randconfig-013-20240113   clang
i386                  randconfig-013-20240114   gcc  
i386                  randconfig-014-20240113   clang
i386                  randconfig-014-20240114   gcc  
i386                  randconfig-015-20240113   clang
i386                  randconfig-015-20240114   gcc  
i386                  randconfig-016-20240113   clang
i386                  randconfig-016-20240114   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240113   gcc  
loongarch             randconfig-002-20240113   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240113   gcc  
nios2                 randconfig-002-20240113   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240113   gcc  
parisc                randconfig-002-20240113   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240113   gcc  
powerpc               randconfig-002-20240113   gcc  
powerpc               randconfig-003-20240113   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     stx_gp3_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240113   gcc  
powerpc64             randconfig-002-20240113   gcc  
powerpc64             randconfig-003-20240113   gcc  
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20240113   gcc  
riscv                 randconfig-002-20240113   gcc  
riscv                          rv32_defconfig   clang
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
s390                       zfcpdump_defconfig   gcc  
sh                               alldefconfig   gcc  
sh                                allnoconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20240113   gcc  
sh                    randconfig-002-20240113   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240113   gcc  
sparc64               randconfig-002-20240113   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20240113   gcc  
um                    randconfig-002-20240113   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240113   gcc  
x86_64       buildonly-randconfig-002-20240113   gcc  
x86_64       buildonly-randconfig-003-20240113   gcc  
x86_64       buildonly-randconfig-004-20240113   gcc  
x86_64       buildonly-randconfig-005-20240113   gcc  
x86_64       buildonly-randconfig-006-20240113   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-011-20240113   gcc  
x86_64                randconfig-012-20240113   gcc  
x86_64                randconfig-013-20240113   gcc  
x86_64                randconfig-014-20240113   gcc  
x86_64                randconfig-015-20240113   gcc  
x86_64                randconfig-016-20240113   gcc  
x86_64                randconfig-071-20240113   gcc  
x86_64                randconfig-072-20240113   gcc  
x86_64                randconfig-073-20240113   gcc  
x86_64                randconfig-074-20240113   gcc  
x86_64                randconfig-075-20240113   gcc  
x86_64                randconfig-076-20240113   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240113   gcc  
xtensa                randconfig-002-20240113   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
