Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198AE30BF69
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 17:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535407; cv=none; b=BawCFQo52eFwgg1bVlqK7iY7zVJnIKv96O8sL0J7so7FDpQMuz9zl+VHtib+sus9mXLhebTIFXszVLGNXdpVME0qhlu/aVjUS/Tbfx20XheA9MAB17j81fuLajUWgM4auJolJUw/AM1npS8dmsyLCjPh686ya8T2Dyh74DoYAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535407; c=relaxed/simple;
	bh=e39LHAshWWgrXq6CVCqXR7zzIIRAqVASAts33LUD/oQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cdpi9/64T0orRdxXlhBgXaNfqsUT3xS/RYZwb1DxEZzcYYx8AmBcyBRmKiOmUKRBW2obnf6AmaV+ierMxYV0zZm07DJLn2djvPG9yUM/h5EDb/EHuQCmF9TqGhB4ok2MfXau5HV56kCkr3wuD4U6stUKY3ZDaDgRuUD+9RZCWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZ5l/awl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZ5l/awl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769535406; x=1801071406;
  h=date:from:to:cc:subject:message-id;
  bh=e39LHAshWWgrXq6CVCqXR7zzIIRAqVASAts33LUD/oQ=;
  b=dZ5l/awleOHFMsazUFYt9iXAwxV4kZVojt+lmnVmILZmtzBJQV/zdBhJ
   kQCHuwhBhwebKhfo64ySobJ7gD9zzfnB9lckumdL6kuI3cWTIC+2FGJAj
   v3QEH0N0Q++FOWDXlpybtmkO2UDJMw/Zpnk9r5Qtcv/Xu/As/B4XSDZpa
   lygcPtJcLgOeZR/zrYnOq0zczD/E3uA43WpNGvAIh2pGB55uTtFUAt6Wj
   Y5jejPZQ5k41LILrEz7L4kJnfJZT5k3JMdhwxaMSAPJcuamGpHE3e8H3N
   NGqwjVXahCodMz4sbRfI6r4U87SB38ukLySQs9JNLSG5lQpMr5jjJJwE0
   g==;
X-CSE-ConnectionGUID: domDPTunSTGqObpjfUWYUA==
X-CSE-MsgGUID: BJIwFK1KRr24KpvM2145VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81046340"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81046340"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 09:36:45 -0800
X-CSE-ConnectionGUID: FsJD+gJnToSZ4frMQzyZeg==
X-CSE-MsgGUID: YdqqT5WmSaCE3U45nRog0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="239288462"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2026 09:36:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkmzZ-00000000Ym4-3Xyq;
	Tue, 27 Jan 2026 17:36:41 +0000
Date: Wed, 28 Jan 2026 01:35:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 53fb882448b58b8dc746c642104d15cdc00a4d27
Message-ID: <202601280136.gJQwXa1Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 53fb882448b58b8dc746c642104d15cdc00a4d27  hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist

elapsed time: 721m

configs tested: 198
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260127    gcc-14.3.0
arc                   randconfig-002-20260127    gcc-14.3.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                            mmp2_defconfig    gcc-15.2.0
arm                          pxa168_defconfig    gcc-15.2.0
arm                   randconfig-001-20260127    gcc-14.3.0
arm                   randconfig-002-20260127    gcc-14.3.0
arm                   randconfig-003-20260127    gcc-14.3.0
arm                   randconfig-004-20260127    gcc-14.3.0
arm                         vf610m4_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260127    gcc-15.2.0
arm64                 randconfig-002-20260127    gcc-15.2.0
arm64                 randconfig-003-20260127    gcc-15.2.0
arm64                 randconfig-004-20260127    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260127    gcc-15.2.0
csky                  randconfig-002-20260127    gcc-15.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260127    gcc-15.2.0
hexagon               randconfig-002-20260127    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260127    gcc-14
i386        buildonly-randconfig-002-20260127    gcc-14
i386        buildonly-randconfig-003-20260127    gcc-14
i386        buildonly-randconfig-004-20260127    gcc-14
i386        buildonly-randconfig-005-20260127    gcc-14
i386        buildonly-randconfig-006-20260127    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260127    clang-20
i386                  randconfig-002-20260127    clang-20
i386                  randconfig-003-20260127    clang-20
i386                  randconfig-004-20260127    clang-20
i386                  randconfig-005-20260127    clang-20
i386                  randconfig-006-20260127    clang-20
i386                  randconfig-007-20260127    clang-20
i386                  randconfig-011-20260127    gcc-14
i386                  randconfig-012-20260127    gcc-14
i386                  randconfig-013-20260127    gcc-14
i386                  randconfig-014-20260127    gcc-14
i386                  randconfig-015-20260127    gcc-14
i386                  randconfig-016-20260127    gcc-14
i386                  randconfig-017-20260127    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260127    gcc-15.2.0
loongarch             randconfig-002-20260127    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                          atari_defconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                       lemote2f_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260127    gcc-15.2.0
nios2                 randconfig-002-20260127    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.2.0
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.2.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260127    gcc-11.5.0
parisc                randconfig-002-20260127    gcc-11.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.2.0
powerpc                     mpc512x_defconfig    gcc-15.2.0
powerpc                      pcm030_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260127    gcc-11.5.0
powerpc               randconfig-002-20260127    gcc-11.5.0
powerpc64             randconfig-001-20260127    gcc-11.5.0
powerpc64             randconfig-002-20260127    gcc-11.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                    nommu_virt_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260127    clang-22
riscv                 randconfig-002-20260127    clang-22
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260127    clang-22
s390                  randconfig-002-20260127    clang-22
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.2.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260127    clang-22
sh                    randconfig-002-20260127    clang-22
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.2.0
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260127    gcc-15.2.0
sparc                 randconfig-002-20260127    gcc-15.2.0
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260127    gcc-15.2.0
sparc64               randconfig-002-20260127    gcc-15.2.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260127    gcc-15.2.0
um                    randconfig-002-20260127    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260127    gcc-14
x86_64      buildonly-randconfig-002-20260127    gcc-14
x86_64      buildonly-randconfig-003-20260127    gcc-14
x86_64      buildonly-randconfig-004-20260127    gcc-14
x86_64      buildonly-randconfig-005-20260127    gcc-14
x86_64      buildonly-randconfig-006-20260127    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260127    clang-20
x86_64                randconfig-002-20260127    clang-20
x86_64                randconfig-003-20260127    clang-20
x86_64                randconfig-004-20260127    clang-20
x86_64                randconfig-005-20260127    clang-20
x86_64                randconfig-006-20260127    clang-20
x86_64                randconfig-011-20260127    clang-20
x86_64                randconfig-012-20260127    clang-20
x86_64                randconfig-013-20260127    clang-20
x86_64                randconfig-014-20260127    clang-20
x86_64                randconfig-015-20260127    clang-20
x86_64                randconfig-016-20260127    clang-20
x86_64                randconfig-071-20260127    gcc-14
x86_64                randconfig-072-20260127    gcc-14
x86_64                randconfig-073-20260127    gcc-14
x86_64                randconfig-074-20260127    gcc-14
x86_64                randconfig-075-20260127    gcc-14
x86_64                randconfig-076-20260127    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.2.0
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260127    gcc-15.2.0
xtensa                randconfig-002-20260127    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
