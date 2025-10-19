Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6748F26B761
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Oct 2025 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760890872; cv=none; b=pApo7xsmi+qtw6XMtDFUSsA8SplrqwZKrWcGR4P3MYSzGthiFNNsSKGKQ/IJxeDLCDjhZg4sOD56Ahluo0WD5AUwE7NJfOgUwZBkXp2xKj8KrAj9jEZxn8CxZUe+zxaFH1llR5ybEN51WoFbpzZWIzf7qVMPxrMoTfz9gjj9ZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760890872; c=relaxed/simple;
	bh=tJ6jMKtvq8tdXeCJ8OMvMk2gqMKG4mW1TlM5PsfquGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I2y8383WxfJA9WohZjiUbjoKK03JDhWgInphRmgLN+++AeB4dJHoXCAp6WNFGsYw3k+2dmZK/snzj1npJeTGuJ/KzylxJLd07s6DDV06SBhug6DRMY46S3lhk2GVSCjLSQVv0DAobVYTDU5ajYqaPbeSCAz7X8wC8moUxYerjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hP1VZGRY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hP1VZGRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760890870; x=1792426870;
  h=date:from:to:cc:subject:message-id;
  bh=tJ6jMKtvq8tdXeCJ8OMvMk2gqMKG4mW1TlM5PsfquGc=;
  b=hP1VZGRYNdiKDQCdoY5WtkDjuBh2ny3EmJYCn0EOH1vn0euiFY1TnOlk
   DIppxKA2ZtnDqWP2YpTtJB9r5X4SXvtlh5LISTLwZPH0F20Z6d/qocEx5
   TWxkeOxP5pMcUyMDhDE8yOqc6r0CoYQS3unrNZuUOnRUb+IghGZsJKdmZ
   ZdckcXaPq6bZj8BmZ20TyJjiTqTwd07sGI10ki8UwEC2pqFBncRcQLQRs
   Qv9wiYPaDD0tmD8nupeDq0/tRv51T+pGeIlfICAB4upPr1ShrIThhnorQ
   TclFty65OQSV4yUnYoK9MaDOIfSW1ZwrCVAkXktAmIUr4fvfClqpIHNt6
   g==;
X-CSE-ConnectionGUID: 9mro5mnITZKx1vzZBQ2Otg==
X-CSE-MsgGUID: H/Yn5vloTKSrU7W0u64d9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="63128216"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="63128216"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 09:21:09 -0700
X-CSE-ConnectionGUID: 8qSX1H5FRbG5JAaE4ZYBKQ==
X-CSE-MsgGUID: 5XjACxCnQgaZG1E21choHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="220300380"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2025 09:21:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAW9a-0009C9-1m;
	Sun, 19 Oct 2025 16:21:06 +0000
Date: Mon, 20 Oct 2025 00:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 4f287049755dc7937c4749cf95028e94af1e378f
Message-ID: <202510200044.WekNDbdE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 4f287049755dc7937c4749cf95028e94af1e378f  Merge branch 'fixes-v6.18' into testing

elapsed time: 1165m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251019    gcc-8.5.0
arc                   randconfig-002-20251019    gcc-13.4.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   milbeaut_m10v_defconfig    clang-19
arm                   randconfig-001-20251019    clang-22
arm                   randconfig-002-20251019    gcc-11.5.0
arm                   randconfig-003-20251019    clang-22
arm                   randconfig-004-20251019    clang-22
arm                           stm32_defconfig    gcc-15.1.0
arm                           tegra_defconfig    gcc-15.1.0
arm                        vexpress_defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251019    gcc-13.4.0
arm64                 randconfig-002-20251019    clang-18
arm64                 randconfig-003-20251019    gcc-13.4.0
arm64                 randconfig-004-20251019    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251019    gcc-13.4.0
csky                  randconfig-002-20251019    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20251019    clang-20
hexagon               randconfig-002-20251019    clang-17
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251019    clang-20
i386        buildonly-randconfig-002-20251019    gcc-14
i386        buildonly-randconfig-003-20251019    gcc-14
i386        buildonly-randconfig-004-20251019    clang-20
i386        buildonly-randconfig-005-20251019    gcc-13
i386        buildonly-randconfig-006-20251019    gcc-14
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251019    clang-18
loongarch             randconfig-002-20251019    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                       m5475evb_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251019    gcc-8.5.0
nios2                 randconfig-002-20251019    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251019    gcc-15.1.0
parisc                randconfig-002-20251019    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20251019    clang-17
powerpc               randconfig-002-20251019    gcc-10.5.0
powerpc               randconfig-003-20251019    gcc-11.5.0
powerpc64             randconfig-002-20251019    clang-16
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                    nommu_virt_defconfig    clang-22
riscv                 randconfig-001-20251019    clang-19
riscv                 randconfig-002-20251019    gcc-11.5.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20251019    gcc-8.5.0
s390                  randconfig-002-20251019    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251019    gcc-15.1.0
sh                    randconfig-002-20251019    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251019    gcc-11.5.0
sparc                 randconfig-002-20251019    gcc-13.4.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251019    gcc-8.5.0
sparc64               randconfig-002-20251019    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251019    gcc-13
um                    randconfig-002-20251019    clang-22
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251019    clang-20
x86_64      buildonly-randconfig-002-20251019    gcc-13
x86_64      buildonly-randconfig-003-20251019    clang-20
x86_64      buildonly-randconfig-004-20251019    gcc-14
x86_64      buildonly-randconfig-005-20251019    clang-20
x86_64      buildonly-randconfig-006-20251019    clang-20
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251019    gcc-14.3.0
xtensa                randconfig-002-20251019    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
