Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7921F932
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Jun 2024 23:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717975244; cv=none; b=GLm55gGRpawlbT0izbu2CNOiSxwKRCIEidpW+PRvJH4TiUwygqDnagwaXOBqbUFgzzlDbikQHI97geJF6+tHLixm+43AwYeeXcV7cIsGjdgQVa7eUJ+KJS71OhksNaSicIx7DHNW0bdLcXldk5m6W2zcrgYhcQ4N6vA+XGkC2oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717975244; c=relaxed/simple;
	bh=VQlnV98LSUw6n4f8Dyr0rsHGSGq08bBJjd/3TRwmpTg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R1YKQ27hkCBbf8A4vbcJnNRDvSBqCnB+/7GqWQHi5p9avZ0iGqEvLAUmlPzfYlgCmZ+uHscQ52Ur1EKw0pNlezY02vmkj6aJwNNPQKJzNBhijbEfXHRSd2CDfvTQimNd4PMsrOlCftNlrgycDdQT1zDrDlxPL5/7TxcpHik4PdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7jYB4ae; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7jYB4ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717975243; x=1749511243;
  h=date:from:to:cc:subject:message-id;
  bh=VQlnV98LSUw6n4f8Dyr0rsHGSGq08bBJjd/3TRwmpTg=;
  b=A7jYB4aeQ0Wc73x3nlVLMraYvC4DhQLL9pEJencC83RTpXbM63f0ptcW
   8wOSvDQd19UGejWXa13XUDIr2r/1FzuZrk4sQ6uGMy+jWx4D2gMkjMW5a
   1VdSLVC4Ai08hMWL06nVYlj+Du6K+J/ZKekWqrRNPv2v1qsCH0hWZpke7
   osQkojMSHrhhbrUFPR6XqL7JNkZo/DOs2g0WM51emYRrn6ui9c7rDkQaJ
   8H5HPgx4GvNIDaFiauoG3MJG2j9ETxU414l/ai9uQbnEtBzh4WbTFfCpS
   Lv2pzeyqumMmChydRBj+JBXCxzh7ttFsFf77jeHrw1vJb78zAOkTDybI5
   Q==;
X-CSE-ConnectionGUID: seM0lp/8TGWTLiiRrEicGg==
X-CSE-MsgGUID: mc4TbQLZSI2nJpb9y+nkrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25734150"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25734150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:20:42 -0700
X-CSE-ConnectionGUID: DLfxWTtyTxSCKFzShb39vA==
X-CSE-MsgGUID: v61mTRW8S+Wh4e4ezwTr+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="43450760"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jun 2024 16:20:41 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGRq3-0001fG-0p;
	Sun, 09 Jun 2024 23:20:39 +0000
Date: Mon, 10 Jun 2024 07:20:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 fb7a4931ef141054970ed065151a879764553206
Message-ID: <202406100734.qRPcv7o4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: fb7a4931ef141054970ed065151a879764553206  hwmon: add missing MODULE_DESCRIPTION() macros

elapsed time: 1444m

configs tested: 160
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
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                       netwinder_defconfig   gcc  
arm                         s5pv210_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240609   gcc  
i386         buildonly-randconfig-001-20240610   clang
i386         buildonly-randconfig-002-20240609   gcc  
i386         buildonly-randconfig-003-20240609   gcc  
i386         buildonly-randconfig-004-20240609   gcc  
i386         buildonly-randconfig-004-20240610   clang
i386         buildonly-randconfig-005-20240609   clang
i386         buildonly-randconfig-006-20240609   gcc  
i386         buildonly-randconfig-006-20240610   clang
i386                                defconfig   clang
i386                  randconfig-001-20240609   clang
i386                  randconfig-002-20240609   clang
i386                  randconfig-003-20240609   gcc  
i386                  randconfig-004-20240609   gcc  
i386                  randconfig-005-20240609   clang
i386                  randconfig-005-20240610   clang
i386                  randconfig-006-20240609   clang
i386                  randconfig-011-20240609   clang
i386                  randconfig-011-20240610   clang
i386                  randconfig-012-20240609   clang
i386                  randconfig-012-20240610   clang
i386                  randconfig-013-20240609   clang
i386                  randconfig-013-20240610   clang
i386                  randconfig-014-20240609   clang
i386                  randconfig-014-20240610   clang
i386                  randconfig-015-20240609   gcc  
i386                  randconfig-015-20240610   clang
i386                  randconfig-016-20240609   clang
i386                  randconfig-016-20240610   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                     loongson2k_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                        fsp2_defconfig   gcc  
powerpc                        icon_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                     kmeter1_defconfig   gcc  
powerpc                      ppc64e_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-002-20240610   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240610   clang
x86_64                randconfig-006-20240610   clang
x86_64                randconfig-011-20240610   clang
x86_64                randconfig-015-20240610   clang
x86_64                randconfig-016-20240610   clang
x86_64                randconfig-072-20240610   clang
x86_64                randconfig-073-20240610   clang
x86_64                randconfig-075-20240610   clang
x86_64                randconfig-076-20240610   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
