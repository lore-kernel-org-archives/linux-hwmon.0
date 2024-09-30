Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A2194096
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Sep 2024 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727716828; cv=none; b=pHX2wfDm1iCgeSNetUpCumE6H/ozO8A0BvydH8hBh5bjAgMrm9AXM30s12piAGjMo5SCwdcEXcYm6i4FGOMHuEl5KfdFQKMBW1JI6hnL+Ahyoio2gStY8Y9HTqjFMuaeeacD9f+XkU5RFCFTk2nGgxY11ggKPfhvra5HG0wZS+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727716828; c=relaxed/simple;
	bh=UpL3TvZzy7NhQU9b6sbg8b8t6ZO6EbZDOwTvsYo01ls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LmMp6iW5Ay15UcGm+AnVSPE6q+u3oe8F87vy8gXUT6LiGUjiJbOdAD8TgfqwHrhXZvSGWUoKL/eXF9kO0l1L3b2qNG1fdlzNjwHQisVMZBsnGl3yeDhWSpaotShAOqjSwwiUL06UThgYa96sh68kCZUEAUSsUuqJ7hKJerMe1bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0DySVPE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0DySVPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727716827; x=1759252827;
  h=date:from:to:cc:subject:message-id;
  bh=UpL3TvZzy7NhQU9b6sbg8b8t6ZO6EbZDOwTvsYo01ls=;
  b=P0DySVPE4N3maIf84HbbCOIyu8pnTSyWfuuUz83tKxJp1PGKn1gVywfg
   yP3z4VK42vQSFiiSLQHLqLZ8JmecGchFURG3AlXO6z4kyLp7PiRq3/fyH
   /qHt+ySktNd6wI/av1YVR6fWjIFDA9WyAz4TrhBMF9UWkytr67IR+fOy4
   Qz2SnBg9VXTEswbQIa2ttwDFyQJEno9uOIo1Ode1OfASYE6ktqa+dlWs7
   vV28Lke8f5T/0xXDI5u3/1Ct3k5cfJz1H9I7iRmN03aCwMBR5M2pM5MKT
   hlMdkFJoPwjkUVp1hNMdeJ7J7iBGP0lemefZh7yA6r0FAwcHMjzjNnhUA
   g==;
X-CSE-ConnectionGUID: OBqZg5D3TDiPxQ4RNgvaQA==
X-CSE-MsgGUID: hYD2UV7cSQ23m6PMLxL0Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38210009"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="38210009"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 10:20:26 -0700
X-CSE-ConnectionGUID: Z7bHDS7qQr+kOP2g5sqjEg==
X-CSE-MsgGUID: ZpUjGgQiSWyZufvZU4L4jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="77921320"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Sep 2024 10:20:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svK4M-000Pij-2r;
	Mon, 30 Sep 2024 17:20:22 +0000
Date: Tue, 01 Oct 2024 01:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 7cb93b5c69d755bfc49a681386fd0aab134fd2b6
Message-ID: <202410010104.lIeUMMkJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 7cb93b5c69d755bfc49a681386fd0aab134fd2b6  Merge branch 'fixes-v6.12' into testing

elapsed time: 798m

configs tested: 158
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    clang-20
arc                           tb10x_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allmodconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                          ep93xx_defconfig    clang-20
arm                      integrator_defconfig    clang-20
arm                         orion5x_defconfig    clang-20
arm                        realview_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240930    clang-18
i386        buildonly-randconfig-001-20240930    gcc-12
i386        buildonly-randconfig-002-20240930    clang-18
i386        buildonly-randconfig-003-20240930    clang-18
i386        buildonly-randconfig-004-20240930    clang-18
i386        buildonly-randconfig-004-20240930    gcc-12
i386        buildonly-randconfig-005-20240930    clang-18
i386        buildonly-randconfig-006-20240930    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240930    clang-18
i386                  randconfig-002-20240930    clang-18
i386                  randconfig-003-20240930    clang-18
i386                  randconfig-003-20240930    gcc-12
i386                  randconfig-004-20240930    clang-18
i386                  randconfig-005-20240930    clang-18
i386                  randconfig-006-20240930    clang-18
i386                  randconfig-011-20240930    clang-18
i386                  randconfig-012-20240930    clang-18
i386                  randconfig-013-20240930    clang-18
i386                  randconfig-013-20240930    gcc-12
i386                  randconfig-014-20240930    clang-18
i386                  randconfig-014-20240930    gcc-12
i386                  randconfig-015-20240930    clang-18
i386                  randconfig-016-20240930    clang-18
i386                  randconfig-016-20240930    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch                 loongson3_defconfig    clang-20
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          sun3x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                           ci20_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    clang-20
powerpc                   bluestone_defconfig    clang-20
powerpc                      cm5200_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                            hp6xx_defconfig    clang-20
sh                           se7619_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    clang-20
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240930    gcc-11
x86_64      buildonly-randconfig-002-20240930    gcc-11
x86_64      buildonly-randconfig-003-20240930    gcc-11
x86_64      buildonly-randconfig-004-20240930    gcc-11
x86_64      buildonly-randconfig-005-20240930    gcc-11
x86_64      buildonly-randconfig-006-20240930    gcc-11
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240930    gcc-11
x86_64                randconfig-002-20240930    gcc-11
x86_64                randconfig-003-20240930    gcc-11
x86_64                randconfig-004-20240930    gcc-11
x86_64                randconfig-005-20240930    gcc-11
x86_64                randconfig-006-20240930    gcc-11
x86_64                randconfig-011-20240930    gcc-11
x86_64                randconfig-012-20240930    gcc-11
x86_64                randconfig-013-20240930    gcc-11
x86_64                randconfig-014-20240930    gcc-11
x86_64                randconfig-015-20240930    gcc-11
x86_64                randconfig-016-20240930    gcc-11
x86_64                randconfig-071-20240930    gcc-11
x86_64                randconfig-072-20240930    gcc-11
x86_64                randconfig-073-20240930    gcc-11
x86_64                randconfig-074-20240930    gcc-11
x86_64                randconfig-075-20240930    gcc-11
x86_64                randconfig-076-20240930    gcc-11
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
