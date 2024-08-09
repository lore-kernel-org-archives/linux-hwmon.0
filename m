Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B5A79F5
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Aug 2024 00:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723163703; cv=none; b=RYVjijONzH1rvikomIzOMJqf1Vjr2vnBupyXYH0478Xzj35G5VcQBE31ciH4RuT+hnUkDX9fp3kfEHAcNDOrIW+rE9npRau2le05fXQeIup33m7VHB7Q7Dm/VDeV9mD0AXlmRqZYvopkHnksPMwR0aB3j/teEeaKY/g8lg8cvHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723163703; c=relaxed/simple;
	bh=9AN+XHXHr3ayckXqb0Z1VuCUm9yoHxASTp/5CHFLcmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nho9jwrZebRiBi/g6n+/K4Vx0VedrRrPTCTudY6zouN+Dw6PAE16hg3uttrozNEe4uMgrynQwcJgaj4nag3QAsyNfv4gmDU+I5mGk+eLZjmcgQ6TEJzBTv/GQGHJ4+w/92v1DfJ4Sdb5ITD3kjM0yTVTDxC37iVjhStAnzc3hhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hkK6q/s1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkK6q/s1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723163702; x=1754699702;
  h=date:from:to:cc:subject:message-id;
  bh=9AN+XHXHr3ayckXqb0Z1VuCUm9yoHxASTp/5CHFLcmw=;
  b=hkK6q/s1Ivr1SPb0y4+bu6Y/0qzTTEQt1vbnAXhR11UF4KIkJkgyMsFG
   mvwVMwts/EC7E8qckJEN+jSBXobuAF6tqVfKEl5oCLesD06BTJ8fellyF
   NC4QRosokeLgWVfpxK/5PZge31MTh7DvZ29U0Oyw12joc9T13VUzZ7vUL
   kmy0d4TMXu55X0Bc5f9PqHdB9dsZSypU5EyZXxsK1zJUb4P2XTpO8re85
   qAbTy4sSLG6GiZqNOQehAuYDWX/TMfShvV832chXO+6ms7EKWp5v/otNe
   MmMnTwUbwIqeqf4vMe9bZck4oSWk+xH9na6E/sBHtc09Mn6s7o1ue0XyS
   w==;
X-CSE-ConnectionGUID: ZWRO2igiQ7OZHvBMd3oJmQ==
X-CSE-MsgGUID: YuCc0J8DSE2VUFbF+SwlPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21131780"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21131780"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:35:01 -0700
X-CSE-ConnectionGUID: u+XdnTlLSre2fvPyg7l2qw==
X-CSE-MsgGUID: GI6DCI0tRPuRG7TzAkmCpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="88276749"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Aug 2024 17:35:00 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDar-0006gM-2z;
	Fri, 09 Aug 2024 00:34:57 +0000
Date: Fri, 09 Aug 2024 08:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 679d51771510ad76815ce5835b9fd5abcf14c6e3
Message-ID: <202408090840.wMLC2woA-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 679d51771510ad76815ce5835b9fd5abcf14c6e3  Merge branch 'kpsingh-static' into testing

elapsed time: 1342m

configs tested: 198
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240808   gcc-13.2.0
arc                   randconfig-002-20240808   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                         assabet_defconfig   clang-15
arm                          collie_defconfig   clang-15
arm                                 defconfig   gcc-13.2.0
arm                            mmp2_defconfig   clang-15
arm                            mmp2_defconfig   gcc-14.1.0
arm                          moxart_defconfig   clang-15
arm                       netwinder_defconfig   gcc-14.1.0
arm                   randconfig-001-20240808   gcc-13.2.0
arm                   randconfig-002-20240808   gcc-13.2.0
arm                   randconfig-003-20240808   gcc-13.2.0
arm                   randconfig-004-20240808   gcc-13.2.0
arm                         s3c6400_defconfig   clang-15
arm                       spear13xx_defconfig   clang-15
arm                           spitz_defconfig   gcc-14.1.0
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240808   gcc-13.2.0
arm64                 randconfig-002-20240808   gcc-13.2.0
arm64                 randconfig-003-20240808   gcc-13.2.0
arm64                 randconfig-004-20240808   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240808   gcc-13.2.0
csky                  randconfig-002-20240808   gcc-13.2.0
hexagon                          allmodconfig   clang-20
hexagon                          allyesconfig   clang-20
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240808   clang-18
i386         buildonly-randconfig-001-20240809   gcc-12
i386         buildonly-randconfig-002-20240808   clang-18
i386         buildonly-randconfig-002-20240809   gcc-12
i386         buildonly-randconfig-003-20240808   clang-18
i386         buildonly-randconfig-003-20240809   gcc-12
i386         buildonly-randconfig-004-20240808   clang-18
i386         buildonly-randconfig-004-20240809   gcc-12
i386         buildonly-randconfig-005-20240808   clang-18
i386         buildonly-randconfig-005-20240809   gcc-12
i386         buildonly-randconfig-006-20240808   clang-18
i386         buildonly-randconfig-006-20240809   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240808   clang-18
i386                  randconfig-001-20240809   gcc-12
i386                  randconfig-002-20240808   clang-18
i386                  randconfig-002-20240809   gcc-12
i386                  randconfig-003-20240808   clang-18
i386                  randconfig-003-20240809   gcc-12
i386                  randconfig-004-20240808   clang-18
i386                  randconfig-004-20240809   gcc-12
i386                  randconfig-005-20240808   clang-18
i386                  randconfig-005-20240809   gcc-12
i386                  randconfig-006-20240808   clang-18
i386                  randconfig-006-20240809   gcc-12
i386                  randconfig-011-20240808   clang-18
i386                  randconfig-011-20240809   gcc-12
i386                  randconfig-012-20240808   clang-18
i386                  randconfig-012-20240809   gcc-12
i386                  randconfig-013-20240808   clang-18
i386                  randconfig-013-20240809   gcc-12
i386                  randconfig-014-20240808   clang-18
i386                  randconfig-014-20240809   gcc-12
i386                  randconfig-015-20240808   clang-18
i386                  randconfig-015-20240809   gcc-12
i386                  randconfig-016-20240808   clang-18
i386                  randconfig-016-20240809   gcc-12
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240808   gcc-13.2.0
loongarch             randconfig-002-20240808   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-14.1.0
m68k                       m5475evb_defconfig   gcc-14.1.0
m68k                        mvme16x_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ip30_defconfig   gcc-14.1.0
mips                           ip32_defconfig   clang-15
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240808   gcc-13.2.0
nios2                 randconfig-002-20240808   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
openrisc                       virt_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240808   gcc-13.2.0
parisc                randconfig-002-20240808   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      arches_defconfig   gcc-14.1.0
powerpc                   bluestone_defconfig   clang-15
powerpc                 mpc8313_rdb_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240808   gcc-13.2.0
powerpc               randconfig-002-20240808   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-14.1.0
powerpc                     sequoia_defconfig   gcc-14.1.0
powerpc64                        alldefconfig   clang-15
powerpc64             randconfig-001-20240808   gcc-13.2.0
powerpc64             randconfig-002-20240808   gcc-13.2.0
powerpc64             randconfig-003-20240808   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-14.1.0
riscv             nommu_k210_sdcard_defconfig   clang-15
riscv                 randconfig-001-20240808   gcc-13.2.0
riscv                 randconfig-002-20240808   gcc-13.2.0
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240808   gcc-13.2.0
s390                  randconfig-002-20240808   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240808   gcc-13.2.0
sh                    randconfig-002-20240808   gcc-13.2.0
sh                        sh7763rdp_defconfig   gcc-14.1.0
sparc                            alldefconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240808   gcc-13.2.0
sparc64               randconfig-002-20240808   gcc-13.2.0
um                               allmodconfig   clang-20
um                               allmodconfig   gcc-13.3.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-12
um                               allyesconfig   gcc-13.3.0
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240808   gcc-13.2.0
um                    randconfig-002-20240808   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240808   gcc-12
x86_64       buildonly-randconfig-002-20240808   gcc-12
x86_64       buildonly-randconfig-003-20240808   gcc-12
x86_64       buildonly-randconfig-004-20240808   gcc-12
x86_64       buildonly-randconfig-005-20240808   gcc-12
x86_64       buildonly-randconfig-006-20240808   gcc-12
x86_64                              defconfig   clang-18
x86_64                randconfig-001-20240808   gcc-12
x86_64                randconfig-002-20240808   gcc-12
x86_64                randconfig-003-20240808   gcc-12
x86_64                randconfig-004-20240808   gcc-12
x86_64                randconfig-005-20240808   gcc-12
x86_64                randconfig-006-20240808   gcc-12
x86_64                randconfig-011-20240808   gcc-12
x86_64                randconfig-012-20240808   gcc-12
x86_64                randconfig-013-20240808   gcc-12
x86_64                randconfig-014-20240808   gcc-12
x86_64                randconfig-015-20240808   gcc-12
x86_64                randconfig-016-20240808   gcc-12
x86_64                randconfig-071-20240808   gcc-12
x86_64                randconfig-072-20240808   gcc-12
x86_64                randconfig-073-20240808   gcc-12
x86_64                randconfig-074-20240808   gcc-12
x86_64                randconfig-075-20240808   gcc-12
x86_64                randconfig-076-20240808   gcc-12
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                       common_defconfig   gcc-14.1.0
xtensa                randconfig-001-20240808   gcc-13.2.0
xtensa                randconfig-002-20240808   gcc-13.2.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
