Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE3231A37
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2025 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210818; cv=none; b=iGI/KetN0YN5JPPpPoAX2qDdVgJ2WGM8sgazpV14gycWGkSTM+vO6+tvairVGuJibLMKQ5dYL0ioAatFxbQ33VgodLipstIfwNwimoTe8jEK9gtg2EDnETBgqbJVhEg5s+szHC0lYlU6N/v4Fui8UpDYGb0ZHDYEhHR4fld4DQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210818; c=relaxed/simple;
	bh=b4MIqFdHsTKwg3IHIG688eGIUYfYXu6TSo6Oz6ZPnN0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pB4w040kVx30Ytbv1vu24tIQb23F/yIOVO/H50l6jDJR/HNPOGkm6Rk+tndWn3em9nRQQehamJnigKOkDX3k+MH6HWaExbTwxyJDd4VqWTiIGrcHMTECuY4Q2jlvWe6Wwspi1HX2iSWC8KdoxerRnoY5536PpcPZSNYnlyFRUMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hidoHIx4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hidoHIx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739210816; x=1770746816;
  h=date:from:to:cc:subject:message-id;
  bh=b4MIqFdHsTKwg3IHIG688eGIUYfYXu6TSo6Oz6ZPnN0=;
  b=hidoHIx4rW89dhdQaa3ysma6iuGXCLch8N5Y3nondVTlc+jJNtC21Y01
   G9RwoL6v62gvpf9mZZ23h2urfQ/OBiLyT2T4eq5wi0BCszXCFnPHNTQcb
   /AtY7K0TAJwx/OHXprVO51mjjhmWUM0E4IpAD8e1rcSriU1QWhtqnbkjx
   MDGXodj6zvMwfuIpn26Fl6QVa4sVeUHNHpOLHfOPOphtNr+A1hae1SgC5
   oi83keAx2ZDP5NIak/5CcL5SuuxWWIFjZezDqEyuB8EBfrZ+PK5gPgvOr
   qSquyN4vRfd6+qKlc8j0EFFPT3TUR1gFRazqESqx07jby57Gr08PYuT2Y
   g==;
X-CSE-ConnectionGUID: MMNbhdJoTH2zBX3fiywB3Q==
X-CSE-MsgGUID: u5Pcdm3cQJ+Xhbl+mQeFtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39671097"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39671097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:06:55 -0800
X-CSE-ConnectionGUID: wWBAirAqS6+Az9RdYtPe5w==
X-CSE-MsgGUID: UVWdaoZFQyGH6cJYOofvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="112776099"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Feb 2025 10:06:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thYBH-0013AN-2e;
	Mon, 10 Feb 2025 18:06:51 +0000
Date: Tue, 11 Feb 2025 02:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 6d8661556ec51a9c6198518872e5dcdc74c34cc0
Message-ID: <202502110248.5ARNLry9-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: 6d8661556ec51a9c6198518872e5dcdc74c34cc0  dmaengine: tegra210-adma: Fix build error due to 64-by-32 division

elapsed time: 799m

configs tested: 174
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250210    clang-21
arc                   randconfig-001-20250210    gcc-13.2.0
arc                   randconfig-002-20250210    clang-21
arc                   randconfig-002-20250210    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250210    clang-16
arm                   randconfig-001-20250210    clang-21
arm                   randconfig-002-20250210    clang-21
arm                   randconfig-002-20250210    gcc-14.2.0
arm                   randconfig-003-20250210    clang-16
arm                   randconfig-003-20250210    clang-21
arm                   randconfig-004-20250210    clang-21
arm                   randconfig-004-20250210    gcc-14.2.0
arm                             rpc_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250210    clang-21
arm64                 randconfig-001-20250210    gcc-14.2.0
arm64                 randconfig-002-20250210    clang-21
arm64                 randconfig-003-20250210    clang-21
arm64                 randconfig-004-20250210    clang-21
arm64                 randconfig-004-20250210    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250210    gcc-14.2.0
csky                  randconfig-002-20250210    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250210    clang-21
hexagon               randconfig-002-20250210    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250210    gcc-12
i386        buildonly-randconfig-002-20250210    gcc-12
i386        buildonly-randconfig-003-20250210    clang-19
i386        buildonly-randconfig-004-20250210    gcc-12
i386        buildonly-randconfig-005-20250210    gcc-12
i386        buildonly-randconfig-006-20250210    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-011-20250210    gcc-12
i386                  randconfig-012-20250210    gcc-12
i386                  randconfig-013-20250210    gcc-12
i386                  randconfig-014-20250210    gcc-12
i386                  randconfig-015-20250210    gcc-12
i386                  randconfig-016-20250210    gcc-12
i386                  randconfig-017-20250210    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250210    gcc-14.2.0
loongarch             randconfig-002-20250210    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          amiga_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250210    gcc-14.2.0
nios2                 randconfig-002-20250210    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250210    gcc-14.2.0
parisc                randconfig-002-20250210    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-16
powerpc                       holly_defconfig    gcc-14.2.0
powerpc                  mpc885_ads_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250210    clang-21
powerpc               randconfig-002-20250210    clang-21
powerpc               randconfig-003-20250210    gcc-14.2.0
powerpc64             randconfig-001-20250210    gcc-14.2.0
powerpc64             randconfig-002-20250210    gcc-14.2.0
powerpc64             randconfig-003-20250210    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250210    clang-21
riscv                 randconfig-002-20250210    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250210    gcc-14.2.0
s390                  randconfig-002-20250210    clang-19
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                          r7780mp_defconfig    gcc-14.2.0
sh                    randconfig-001-20250210    gcc-14.2.0
sh                    randconfig-002-20250210    gcc-14.2.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250210    gcc-14.2.0
sparc                 randconfig-002-20250210    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250210    gcc-14.2.0
sparc64               randconfig-002-20250210    gcc-14.2.0
um                               alldefconfig    clang-19
um                               allmodconfig    clang-21
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250210    clang-18
um                    randconfig-002-20250210    clang-16
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250210    clang-19
x86_64      buildonly-randconfig-002-20250210    gcc-12
x86_64      buildonly-randconfig-003-20250210    clang-19
x86_64      buildonly-randconfig-004-20250210    clang-19
x86_64      buildonly-randconfig-005-20250210    clang-19
x86_64      buildonly-randconfig-006-20250210    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250210    clang-19
x86_64                randconfig-002-20250210    clang-19
x86_64                randconfig-003-20250210    clang-19
x86_64                randconfig-004-20250210    clang-19
x86_64                randconfig-005-20250210    clang-19
x86_64                randconfig-006-20250210    clang-19
x86_64                randconfig-007-20250210    clang-19
x86_64                randconfig-008-20250210    clang-19
x86_64                randconfig-071-20250210    gcc-12
x86_64                randconfig-072-20250210    gcc-12
x86_64                randconfig-073-20250210    gcc-12
x86_64                randconfig-074-20250210    gcc-12
x86_64                randconfig-075-20250210    gcc-12
x86_64                randconfig-076-20250210    gcc-12
x86_64                randconfig-077-20250210    gcc-12
x86_64                randconfig-078-20250210    gcc-12
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250210    gcc-14.2.0
xtensa                randconfig-002-20250210    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
