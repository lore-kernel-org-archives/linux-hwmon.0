Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122D1E882F
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jan 2025 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738338031; cv=none; b=bXswbYZ1/MhKwu7zX38xaLICDJTtzXMsqJQPhdg2wBnrOD1vUGTD13M1pX0v5wxvtopoJcDxZ12M3QP+vTg67MHpLb8sbxkGKRkmYXJIvXTHdJzIBu+bgjzkbU+vo28Km/4OXVd5phTIrAUZdV55FaR/7lNU0XuJpwzVI8b4a3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738338031; c=relaxed/simple;
	bh=3cJXNMXvRBFaP9RK4HnpzeD6Q1z6dhYUjwrpkQEW22Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwK4nN0kGkI/U10cgYCVKxPBITKgRfeFAeWC7oLiaNxIHeB5e3zzllBpf/hYavDAd3Rd1C/3ugz6viIQ0faw3gQPEleosOgCCJvvRFemeH7TwlnnHJPcNMAEXXFiagp+B7TvNXwV9w1ZFkLfy0FePfj1g+a8UCRQsLpmLNHFEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=coivc/Wb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="coivc/Wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738338029; x=1769874029;
  h=date:from:to:cc:subject:message-id;
  bh=3cJXNMXvRBFaP9RK4HnpzeD6Q1z6dhYUjwrpkQEW22Q=;
  b=coivc/Wb48xRwxn5Ztl2js7KKjai6gPnl403sGvwp/vkhQTGGfYdf3/y
   pyKh2sCAb+YoJxRmhUBa1/2QWBBITaJEiaGonPN5gJh0HDX1Oqf0gsf7t
   qBHhT5UIr3nCrCVDs62r9XfCW8soen0wwFwdeGF/hVwo0Iv1r629YdGgm
   E508WJuDfh6YNhAffwTWs8WgIRJqSrzS0CzPOR+ko+HV3hmWgvt+9gXn/
   Ig13/ra1596jruA6kCFXCPqpFO4mHcU+q9y//qCrwWzQvz+EDPpz4LsGz
   ULP6fjEMuW2kKmkLW7Ja23dJX+dlJ9Dc1rFjhcR8Me4FVDF1atS82vjm2
   w==;
X-CSE-ConnectionGUID: No3afLeAR1y1UEwn6Ox1uA==
X-CSE-MsgGUID: SVC83SHdT7+MdVOaMls1LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38792113"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="38792113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 07:40:27 -0800
X-CSE-ConnectionGUID: nZGBP8YnR0OeSIwb5jbTvw==
X-CSE-MsgGUID: dYUGj0BQR5Cg3rMsVNPNYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="110228388"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jan 2025 07:40:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdt83-000mXt-1m;
	Fri, 31 Jan 2025 15:40:23 +0000
Date: Fri, 31 Jan 2025 23:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 f8cdf428b8804f12e51d0472234e20ea5b55837b
Message-ID: <202501312311.lh24kKPq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: f8cdf428b8804f12e51d0472234e20ea5b55837b  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1187m

configs tested: 215
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-21
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250131    gcc-13.2.0
arc                   randconfig-002-20250131    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                          gemini_defconfig    gcc-14.2.0
arm                          ixp4xx_defconfig    gcc-14.2.0
arm                   randconfig-001-20250131    clang-17
arm                   randconfig-002-20250131    clang-15
arm                   randconfig-003-20250131    gcc-14.2.0
arm                   randconfig-004-20250131    gcc-14.2.0
arm                           tegra_defconfig    gcc-14.2.0
arm                        vexpress_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250131    clang-15
arm64                 randconfig-002-20250131    gcc-14.2.0
arm64                 randconfig-003-20250131    clang-21
arm64                 randconfig-004-20250131    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250131    clang-21
csky                  randconfig-001-20250131    gcc-14.2.0
csky                  randconfig-002-20250131    clang-21
csky                  randconfig-002-20250131    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250131    clang-21
hexagon               randconfig-002-20250131    clang-21
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250131    clang-19
i386        buildonly-randconfig-002-20250131    clang-19
i386        buildonly-randconfig-003-20250131    gcc-12
i386        buildonly-randconfig-004-20250131    gcc-12
i386        buildonly-randconfig-005-20250131    clang-19
i386        buildonly-randconfig-006-20250131    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250131    clang-19
i386                  randconfig-002-20250131    clang-19
i386                  randconfig-003-20250131    clang-19
i386                  randconfig-004-20250131    clang-19
i386                  randconfig-005-20250131    clang-19
i386                  randconfig-006-20250131    clang-19
i386                  randconfig-007-20250131    clang-19
i386                  randconfig-011-20250131    gcc-12
i386                  randconfig-012-20250131    gcc-12
i386                  randconfig-013-20250131    gcc-12
i386                  randconfig-014-20250131    gcc-12
i386                  randconfig-015-20250131    gcc-12
i386                  randconfig-016-20250131    gcc-12
i386                  randconfig-017-20250131    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250131    clang-21
loongarch             randconfig-001-20250131    gcc-14.2.0
loongarch             randconfig-002-20250131    clang-21
loongarch             randconfig-002-20250131    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                           ip22_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250131    clang-21
nios2                 randconfig-001-20250131    gcc-14.2.0
nios2                 randconfig-002-20250131    clang-21
nios2                 randconfig-002-20250131    gcc-14.2.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250131    clang-21
parisc                randconfig-001-20250131    gcc-14.2.0
parisc                randconfig-002-20250131    clang-21
parisc                randconfig-002-20250131    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                    adder875_defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc                        icon_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250131    clang-21
powerpc               randconfig-001-20250131    gcc-14.2.0
powerpc               randconfig-002-20250131    clang-15
powerpc               randconfig-002-20250131    clang-21
powerpc               randconfig-003-20250131    clang-21
powerpc                    socrates_defconfig    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250131    clang-15
powerpc64             randconfig-001-20250131    clang-21
powerpc64             randconfig-002-20250131    clang-17
powerpc64             randconfig-002-20250131    clang-21
powerpc64             randconfig-003-20250131    clang-15
powerpc64             randconfig-003-20250131    clang-21
riscv                            alldefconfig    gcc-14.2.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250131    gcc-14.2.0
riscv                 randconfig-002-20250131    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250131    gcc-14.2.0
s390                  randconfig-002-20250131    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250131    gcc-14.2.0
sh                    randconfig-002-20250131    gcc-14.2.0
sh                      rts7751r2d1_defconfig    gcc-14.2.0
sh                           se7619_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250131    gcc-14.2.0
sparc                 randconfig-002-20250131    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250131    gcc-14.2.0
sparc64               randconfig-002-20250131    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                                allnoconfig    clang-21
um                               allyesconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250131    gcc-14.2.0
um                    randconfig-002-20250131    gcc-14.2.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250131    gcc-11
x86_64      buildonly-randconfig-002-20250131    clang-19
x86_64      buildonly-randconfig-003-20250131    gcc-12
x86_64      buildonly-randconfig-004-20250131    gcc-12
x86_64      buildonly-randconfig-005-20250131    clang-19
x86_64      buildonly-randconfig-006-20250131    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250131    clang-19
x86_64                randconfig-002-20250131    clang-19
x86_64                randconfig-003-20250131    clang-19
x86_64                randconfig-004-20250131    clang-19
x86_64                randconfig-005-20250131    clang-19
x86_64                randconfig-006-20250131    clang-19
x86_64                randconfig-007-20250131    clang-19
x86_64                randconfig-008-20250131    clang-19
x86_64                randconfig-071-20250131    clang-19
x86_64                randconfig-072-20250131    clang-19
x86_64                randconfig-073-20250131    clang-19
x86_64                randconfig-074-20250131    clang-19
x86_64                randconfig-075-20250131    clang-19
x86_64                randconfig-076-20250131    clang-19
x86_64                randconfig-077-20250131    clang-19
x86_64                randconfig-078-20250131    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250131    gcc-14.2.0
xtensa                randconfig-002-20250131    gcc-14.2.0
xtensa                    smp_lx200_defconfig    gcc-14.2.0
xtensa                         virt_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
