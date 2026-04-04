Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C520F377EBF
	for <linux-hwmon@vger.kernel.org>; Sat,  4 Apr 2026 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775286314; cv=none; b=YSrIrfGeqSs4YwVvkd2pSWLVjzbJtbCvq9k+tJlZnNqPucKb/dYSmT7LkPbzufk2JEzESmjS+3QbWUq/ysZnY3vGsFEwjM4iKg9yTSDTREg9oJbmmG7jbBwsS6vLr2Knmu0uG9yeE24hqpwWMIHXt8F0bA1wL34k2d2Lh2sMyVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775286314; c=relaxed/simple;
	bh=GWeQLCxAySK0SR277l0OkxMArCRpQ3QPkEHU2V/5Akk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LzpbshKIvSf2BN8TM+qKRv5F6e8OJEclJnPTLid+s1rzwD0XwGQwC8sEHKHkQ3dmN1clSRgTlPSTUPlqOzYA9/e+9QAUdlXXMMpcYpul4WjuJpcwo+XN4Es+vdzKz8bfWAUZOy/oETOvA7d3Qus/UwB2S88Jm7KaP/4bO0fau8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X33MLaho; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X33MLaho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775286313; x=1806822313;
  h=date:from:to:cc:subject:message-id;
  bh=GWeQLCxAySK0SR277l0OkxMArCRpQ3QPkEHU2V/5Akk=;
  b=X33MLaho9GxRWZsfjKoUguuhiczl2gU3ZVW/AAk3aL7XCN0dXXCbPmwJ
   UmeQPfO3hxB4aM26mAoaAdPiCM55hfPxB2gNIeUsZHpXKhILtJKaCTtWO
   LonPJIMNvqYQgWe6iije41UJdVWM+FHWUBe5zCvBh7l/UJ4cUyPU+ynFl
   BLTM5OooNXLfp9/7tL368qOy21Wu3cIoBmDmUjddKfduzwkvywjpPKzZi
   dUChvGQkY8cb+Q7GdInoEzpdwIkEUtoxQEt3L3wPxH2CbCbrS73o3GqTR
   RVUnlV4jScc1X5/Tmd2eQExjd/4P7f6wkVBBRYWcvF5wJWeeM+cvMesEi
   A==;
X-CSE-ConnectionGUID: PiURyPm1TdmTeQ9cr7zNow==
X-CSE-MsgGUID: Honcr+P7SJScTlpjL9vV4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76227095"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="76227095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 00:05:12 -0700
X-CSE-ConnectionGUID: 0oqaoVDLQPmKlMl9ptheaA==
X-CSE-MsgGUID: AJT8cZv2Qm2/0ALjQqfOGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="229062596"
Received: from lkp-server01.sh.intel.com (HELO 3afb7d003cac) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2026 00:05:11 -0700
Received: from kbuild by 3afb7d003cac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8v48-000000000Yh-2VYb;
	Sat, 04 Apr 2026 07:05:08 +0000
Date: Sat, 04 Apr 2026 15:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7db0b82754140c76774ce01f6110ff0d1c0f2b67
Message-ID: <202604041522.sUuxA3y7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7db0b82754140c76774ce01f6110ff0d1c0f2b67  hwmon: (sparx5) Make it selectable for ARCH_LAN969X

elapsed time: 734m

configs tested: 171
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260404    gcc-15.2.0
arc                   randconfig-002-20260404    gcc-15.2.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260404    gcc-15.2.0
arm                   randconfig-002-20260404    gcc-15.2.0
arm                   randconfig-003-20260404    gcc-15.2.0
arm                   randconfig-004-20260404    gcc-15.2.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260404    gcc-15.2.0
arm64                 randconfig-002-20260404    gcc-15.2.0
arm64                 randconfig-003-20260404    gcc-15.2.0
arm64                 randconfig-004-20260404    gcc-15.2.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260404    gcc-15.2.0
csky                  randconfig-002-20260404    gcc-15.2.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260404    gcc-15.2.0
hexagon               randconfig-002-20260404    gcc-15.2.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260404    clang-20
i386        buildonly-randconfig-002-20260404    clang-20
i386        buildonly-randconfig-003-20260404    clang-20
i386        buildonly-randconfig-004-20260404    clang-20
i386        buildonly-randconfig-005-20260404    clang-20
i386        buildonly-randconfig-006-20260404    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260404    clang-20
i386                  randconfig-002-20260404    clang-20
i386                  randconfig-003-20260404    clang-20
i386                  randconfig-004-20260404    clang-20
i386                  randconfig-005-20260404    clang-20
i386                  randconfig-006-20260404    clang-20
i386                  randconfig-007-20260404    clang-20
i386                  randconfig-011-20260404    clang-20
i386                  randconfig-012-20260404    clang-20
i386                  randconfig-013-20260404    clang-20
i386                  randconfig-014-20260404    clang-20
i386                  randconfig-015-20260404    clang-20
i386                  randconfig-016-20260404    clang-20
i386                  randconfig-017-20260404    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260404    gcc-15.2.0
loongarch             randconfig-002-20260404    gcc-15.2.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                        omega2p_defconfig    clang-23
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260404    gcc-15.2.0
nios2                 randconfig-002-20260404    gcc-15.2.0
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260404    gcc-10.5.0
parisc                randconfig-002-20260404    gcc-10.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                     mpc83xx_defconfig    clang-23
powerpc                    mvme5100_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260404    gcc-10.5.0
powerpc               randconfig-002-20260404    gcc-10.5.0
powerpc64             randconfig-001-20260404    gcc-10.5.0
powerpc64             randconfig-002-20260404    gcc-10.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260404    clang-20
riscv                 randconfig-002-20260404    clang-20
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260404    clang-20
s390                  randconfig-002-20260404    clang-20
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260404    clang-20
sh                    randconfig-002-20260404    clang-20
sh                           se7751_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260404    clang-20
sparc                 randconfig-002-20260404    clang-20
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260404    clang-20
sparc64               randconfig-002-20260404    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260404    clang-20
um                    randconfig-002-20260404    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260404    gcc-13
x86_64      buildonly-randconfig-002-20260404    gcc-13
x86_64      buildonly-randconfig-003-20260404    gcc-13
x86_64      buildonly-randconfig-004-20260404    gcc-13
x86_64      buildonly-randconfig-005-20260404    gcc-13
x86_64      buildonly-randconfig-006-20260404    gcc-13
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260404    gcc-14
x86_64                randconfig-002-20260404    gcc-14
x86_64                randconfig-003-20260404    gcc-14
x86_64                randconfig-004-20260404    gcc-14
x86_64                randconfig-005-20260404    gcc-14
x86_64                randconfig-006-20260404    gcc-14
x86_64                randconfig-011-20260404    gcc-14
x86_64                randconfig-012-20260404    gcc-14
x86_64                randconfig-013-20260404    gcc-14
x86_64                randconfig-014-20260404    gcc-14
x86_64                randconfig-015-20260404    gcc-14
x86_64                randconfig-016-20260404    gcc-14
x86_64                randconfig-071-20260404    gcc-14
x86_64                randconfig-072-20260404    gcc-14
x86_64                randconfig-073-20260404    gcc-14
x86_64                randconfig-074-20260404    gcc-14
x86_64                randconfig-075-20260404    gcc-14
x86_64                randconfig-076-20260404    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260404    clang-20
xtensa                randconfig-002-20260404    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
