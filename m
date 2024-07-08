Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DD812E4A
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jul 2024 06:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720419909; cv=none; b=ZseZ9cXBq9i6ooaoIVc31l5HTBDB22HjdujMpqTy7ZEstxsnCEPmkj9PTYnK6SqBoM9RfkIA+2wifs+kFiJmxoS8XIoFPIfbUfcrqxpfugwnlwAbgEflcrX7WdHvvnJEPGWzRbvfCj6tmAdJWYahqhDAcPLr9UoW1S7xetCROfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720419909; c=relaxed/simple;
	bh=2Q043Tf3iRTiKX6DVDTvJnHp/39kpn1yTmYpo5TyNdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DsFKHvmCrJzCcFsEU9H13iRJnkdVbtg1BHL6pjoh5MdLZ2jt/4Qo7DasNdsav7MO1zOGIONNDiUEq4ALOuVEg/UonQpnRQ3tOxNA3FvFm6dGxTb0XGKE0lvlhGFTyNTIT4A4Fq/RR/45UKtJ8QKK1uOKf2fMzz6fLBuU30IkZ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYtJdnVG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYtJdnVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720419908; x=1751955908;
  h=date:from:to:cc:subject:message-id;
  bh=2Q043Tf3iRTiKX6DVDTvJnHp/39kpn1yTmYpo5TyNdk=;
  b=NYtJdnVG5T9Imamlk5ToIKWaHh00SEcQKr7Get/0IbV/lPW5IvcwWlR3
   cUdP0agBX9o3ffOypZ4vOlvNTOTiEoDquo89C48qg/C9j3fpcqU7ZoJXo
   0CDPhUhX0xgkaO8aVpQXxLKWqmk/fKaDoXr93FHsPWx+d8Gj8cEqfIPKI
   DLpz4PsiNlFxjNtCjD0XbnMB1FYGoJEfEQAhhvFoJF7gfNXho7BruxVsm
   esOan5aZn6b1FUdmHMRkMf7zwhuo7MMVcMvYWP18dUyMQvuexwLnBG2xY
   lceLfk2KOxetcroS4Ko2ZurSBJ7UjEw7dphSEx7asgV7Q9TFi5olbc0Fj
   w==;
X-CSE-ConnectionGUID: N6MhEAIlRaiDomWaARGzPQ==
X-CSE-MsgGUID: ou/Zoze+S8SVoKJuBG/Nsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17476047"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="17476047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 23:25:07 -0700
X-CSE-ConnectionGUID: B98k1gcpSCarjttW0sqyTg==
X-CSE-MsgGUID: 4UM7OXQnQDywr6dPFl+idA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; 
   d="scan'208";a="47835088"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jul 2024 23:25:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQho7-000VY2-0r;
	Mon, 08 Jul 2024 06:25:03 +0000
Date: Mon, 08 Jul 2024 14:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 5c1de37969b7bc0abcb20b86e91e70caebbd4f89
Message-ID: <202407081434.l39FbJFv-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 5c1de37969b7bc0abcb20b86e91e70caebbd4f89  hwmon: (w83627ehf) Fix underflows seen when writing limit attributes

elapsed time: 808m

configs tested: 210
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs103_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                        nsimosci_defconfig   gcc-13.2.0
arc                   randconfig-001-20240708   gcc-13.2.0
arc                   randconfig-002-20240708   gcc-13.2.0
arc                           tb10x_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-13.2.0
arm                        clps711x_defconfig   clang-19
arm                                 defconfig   gcc-13.2.0
arm                            dove_defconfig   gcc-13.2.0
arm                       multi_v4t_defconfig   gcc-13.2.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm                         nhk8815_defconfig   clang-19
arm                           omap1_defconfig   gcc-13.2.0
arm                   randconfig-001-20240708   gcc-13.2.0
arm                   randconfig-002-20240708   gcc-13.2.0
arm                   randconfig-003-20240708   clang-16
arm                   randconfig-004-20240708   gcc-13.2.0
arm                           sama5_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240708   gcc-13.2.0
arm64                 randconfig-002-20240708   clang-19
arm64                 randconfig-003-20240708   gcc-13.2.0
arm64                 randconfig-004-20240708   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240708   gcc-13.2.0
csky                  randconfig-002-20240708   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240708   clang-19
hexagon               randconfig-002-20240708   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240708   clang-18
i386         buildonly-randconfig-002-20240708   gcc-13
i386         buildonly-randconfig-003-20240708   clang-18
i386         buildonly-randconfig-004-20240708   clang-18
i386         buildonly-randconfig-005-20240708   clang-18
i386         buildonly-randconfig-006-20240708   gcc-13
i386                                defconfig   clang-18
i386                  randconfig-001-20240708   clang-18
i386                  randconfig-002-20240708   clang-18
i386                  randconfig-003-20240708   gcc-13
i386                  randconfig-004-20240708   clang-18
i386                  randconfig-005-20240708   clang-18
i386                  randconfig-006-20240708   clang-18
i386                  randconfig-011-20240708   gcc-13
i386                  randconfig-012-20240708   gcc-9
i386                  randconfig-013-20240708   gcc-13
i386                  randconfig-014-20240708   clang-18
i386                  randconfig-015-20240708   clang-18
i386                  randconfig-016-20240708   clang-18
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch                 loongson3_defconfig   gcc-13.2.0
loongarch             randconfig-001-20240708   gcc-13.2.0
loongarch             randconfig-002-20240708   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                     loongson1c_defconfig   clang-19
mips                      pic32mzda_defconfig   clang-19
mips                          rb532_defconfig   clang-19
mips                        vocore2_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240708   gcc-13.2.0
nios2                 randconfig-002-20240708   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240708   gcc-13.2.0
parisc                randconfig-002-20240708   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                          allyesconfig   gcc-13.2.0
powerpc                      bamboo_defconfig   gcc-13.2.0
powerpc                        cell_defconfig   clang-19
powerpc                        cell_defconfig   gcc-13.2.0
powerpc                   currituck_defconfig   clang-19
powerpc                  iss476-smp_defconfig   gcc-13.2.0
powerpc                 linkstation_defconfig   gcc-13.2.0
powerpc                     mpc83xx_defconfig   clang-19
powerpc                     ppa8548_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240708   gcc-13.2.0
powerpc               randconfig-002-20240708   clang-19
powerpc               randconfig-003-20240708   gcc-13.2.0
powerpc                     tqm5200_defconfig   gcc-13.2.0
powerpc                 xes_mpc85xx_defconfig   gcc-13.2.0
powerpc64             randconfig-001-20240708   gcc-13.2.0
powerpc64             randconfig-002-20240708   gcc-13.2.0
powerpc64             randconfig-003-20240708   gcc-13.2.0
riscv                            allmodconfig   clang-19
riscv                            allmodconfig   gcc-13.2.0
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                            allyesconfig   gcc-13.2.0
riscv                               defconfig   gcc-13.2.0
riscv                    nommu_virt_defconfig   gcc-13.2.0
riscv                 randconfig-001-20240708   gcc-13.2.0
riscv                 randconfig-002-20240708   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240708   clang-19
s390                  randconfig-002-20240708   clang-19
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                         ecovec24_defconfig   gcc-13.2.0
sh                    randconfig-001-20240708   gcc-13.2.0
sh                    randconfig-002-20240708   gcc-13.2.0
sh                      rts7751r2d1_defconfig   gcc-13.2.0
sh                           se7619_defconfig   gcc-13.2.0
sh                           se7750_defconfig   gcc-13.2.0
sh                   secureedge5410_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                          alldefconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240708   gcc-13.2.0
sparc64               randconfig-002-20240708   gcc-13.2.0
um                               alldefconfig   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240708   gcc-13
um                    randconfig-002-20240708   gcc-10
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240708   gcc-13
x86_64       buildonly-randconfig-002-20240708   gcc-10
x86_64       buildonly-randconfig-002-20240708   gcc-13
x86_64       buildonly-randconfig-003-20240708   gcc-10
x86_64       buildonly-randconfig-003-20240708   gcc-13
x86_64       buildonly-randconfig-004-20240708   gcc-13
x86_64       buildonly-randconfig-005-20240708   gcc-13
x86_64       buildonly-randconfig-005-20240708   gcc-8
x86_64       buildonly-randconfig-006-20240708   gcc-13
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240708   clang-18
x86_64                randconfig-001-20240708   gcc-13
x86_64                randconfig-002-20240708   gcc-13
x86_64                randconfig-003-20240708   gcc-13
x86_64                randconfig-004-20240708   gcc-13
x86_64                randconfig-005-20240708   gcc-13
x86_64                randconfig-005-20240708   gcc-7
x86_64                randconfig-006-20240708   gcc-13
x86_64                randconfig-011-20240708   clang-18
x86_64                randconfig-011-20240708   gcc-13
x86_64                randconfig-012-20240708   clang-18
x86_64                randconfig-012-20240708   gcc-13
x86_64                randconfig-013-20240708   gcc-12
x86_64                randconfig-013-20240708   gcc-13
x86_64                randconfig-014-20240708   clang-18
x86_64                randconfig-014-20240708   gcc-13
x86_64                randconfig-015-20240708   gcc-13
x86_64                randconfig-016-20240708   gcc-13
x86_64                randconfig-071-20240708   clang-18
x86_64                randconfig-071-20240708   gcc-13
x86_64                randconfig-072-20240708   gcc-13
x86_64                randconfig-073-20240708   clang-18
x86_64                randconfig-073-20240708   gcc-13
x86_64                randconfig-074-20240708   clang-18
x86_64                randconfig-074-20240708   gcc-13
x86_64                randconfig-075-20240708   gcc-13
x86_64                randconfig-075-20240708   gcc-8
x86_64                randconfig-076-20240708   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240708   gcc-13.2.0
xtensa                randconfig-002-20240708   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
