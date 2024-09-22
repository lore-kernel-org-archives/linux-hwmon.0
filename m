Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC506FBF
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Sep 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726998589; cv=none; b=bB3NZV7Pa4Llk4Cj19fa7ZAdbXOi/71Upm2XpxnubSEfIhkEQfn6Uv8WrX6Vq8Qzs0cCzrlXFw2Dls48Cklg4uf3k8CH5xiXMGukkVxVV9mjrI+/Dd7uhKbe2TZeS3TffrS6Vxf8J32W4tpVoXsaOQxrCBNUeNbn17NC2dBedSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726998589; c=relaxed/simple;
	bh=3Bqd3JHAduytMPwJXuxmPgBX4j+mnhijeT0eaJs1FSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JPZnIvmR4BUzaGzyQ5S9rIhVEAv7c2Rj54GZ6FMCrwVOqigf7tHy44GMuhoEH0QI4P9MswQaWLRFxhwtms/RTLNNzu8A31KCNTyU7iyeu1ynIgCyIHR9M/4SZaU5uxeHbR8e1ilEY5yREwgpiEMozkSgP4hh+u5iOMoiFiDXlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxSu0AFB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxSu0AFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726998588; x=1758534588;
  h=date:from:to:cc:subject:message-id;
  bh=3Bqd3JHAduytMPwJXuxmPgBX4j+mnhijeT0eaJs1FSE=;
  b=VxSu0AFBiHlBt/YFggs8XPFGAi61ohT6tqD/fd/DSiArtDOxJFqmH40f
   Wv7qGsQHAFXsTCNJY/VnSjiGgn+OS3JG8KnNtZ4lTXYGGNh5QRc0n59Bf
   sWw6EmjJ7aaEaktpTm+DI0nErwx8HjVR+r6HbysEgIO74EZkp5atXAuG3
   xAR2KWV1+dpvjpIt+2YIlGa+wgruYmcjPL5ARWuBJ2zQRp19W9p0JUcE7
   CduRPr4ao8Lsg4KSPnOhrfC04JCIY62/Dw4mEMi2/N2E2FXSh4mlu5El1
   jJAH2V5dJgFp3g/X5tB7f+9W1LPI+hOBfdp/U44dKL1QhdYKtue67+h9c
   g==;
X-CSE-ConnectionGUID: AfHE0j8WTrG2+TlIvaqQGQ==
X-CSE-MsgGUID: C8uiVPmnQTCvaB/4I7TDbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25902298"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="25902298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 02:49:47 -0700
X-CSE-ConnectionGUID: V0XpPn48Ra6/Byd277y+vw==
X-CSE-MsgGUID: joAvcwQpTqSFknaPKrq6BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="75319885"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2024 02:49:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssJDr-000GBq-32;
	Sun, 22 Sep 2024 09:49:43 +0000
Date: Sun, 22 Sep 2024 17:49:37 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 aa895d631ec61e24d8467845891c61d03e47df62
Message-ID: <202409221731.YFvzZlqn-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: aa895d631ec61e24d8467845891c61d03e47df62  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 940m

configs tested: 127
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       omap2plus_defconfig    gcc-14.1.0
arm                         orion5x_defconfig    gcc-14.1.0
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
i386        buildonly-randconfig-001-20240922    gcc-12
i386        buildonly-randconfig-002-20240922    gcc-12
i386        buildonly-randconfig-003-20240922    gcc-12
i386        buildonly-randconfig-004-20240922    gcc-12
i386        buildonly-randconfig-005-20240922    gcc-12
i386        buildonly-randconfig-006-20240922    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240922    gcc-12
i386                  randconfig-002-20240922    gcc-12
i386                  randconfig-003-20240922    gcc-12
i386                  randconfig-004-20240922    gcc-12
i386                  randconfig-005-20240922    gcc-12
i386                  randconfig-006-20240922    gcc-12
i386                  randconfig-011-20240922    gcc-12
i386                  randconfig-012-20240922    gcc-12
i386                  randconfig-013-20240922    gcc-12
i386                  randconfig-014-20240922    gcc-12
i386                  randconfig-015-20240922    gcc-12
i386                  randconfig-016-20240922    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          atari_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                            q40_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                        maltaup_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                generic-64bit_defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      bamboo_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    gcc-14.1.0
powerpc                    gamecube_defconfig    gcc-14.1.0
powerpc                     mpc5200_defconfig    gcc-14.1.0
powerpc                      pasemi_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                       zfcpdump_defconfig    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                          lboxre2_defconfig    gcc-14.1.0
sh                           se7724_defconfig    gcc-14.1.0
sh                           sh2007_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                               allyesconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240922    clang-18
x86_64      buildonly-randconfig-002-20240922    clang-18
x86_64      buildonly-randconfig-003-20240922    clang-18
x86_64      buildonly-randconfig-004-20240922    clang-18
x86_64      buildonly-randconfig-005-20240922    clang-18
x86_64      buildonly-randconfig-006-20240922    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240922    clang-18
x86_64                randconfig-002-20240922    clang-18
x86_64                randconfig-003-20240922    clang-18
x86_64                randconfig-004-20240922    clang-18
x86_64                randconfig-005-20240922    clang-18
x86_64                randconfig-006-20240922    clang-18
x86_64                randconfig-011-20240922    clang-18
x86_64                randconfig-012-20240922    clang-18
x86_64                randconfig-013-20240922    clang-18
x86_64                randconfig-014-20240922    clang-18
x86_64                randconfig-015-20240922    clang-18
x86_64                randconfig-016-20240922    clang-18
x86_64                randconfig-071-20240922    clang-18
x86_64                randconfig-072-20240922    clang-18
x86_64                randconfig-073-20240922    clang-18
x86_64                randconfig-074-20240922    clang-18
x86_64                randconfig-075-20240922    clang-18
x86_64                randconfig-076-20240922    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
