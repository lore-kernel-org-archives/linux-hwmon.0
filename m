Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA86F3314DE
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 05:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775797724; cv=none; b=Jh42RLUlxuwrMU1qcBmRoBreWTBq1CQm4zkg6vlFFHmxesMN4tvMbOTga4R4taSGScY1X+K3wsEBe6Zd9xv71JJDHA6iq90Brbdv3eH4NhNJd2UHeXfXkSn5YR7PIKcL4BiTPnkbFE568JxXhho9BgdUL3TQZdha9yQVni+f5x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775797724; c=relaxed/simple;
	bh=qr9S96/AiyMJi3ryjBMCKC+TkoHqF0WHvboJeyXGmfE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WiRKCJ/YeUUz/FGJ0uqxOiUq+2Y2gm53fIke/uqcFbIIqwLFwFt8px/Ge1b0IMna6NsIyWCou00vsssAsjBs22sHdIF70ktuoCVqX7wJ3uQ0SjLcCyy9O7ERVKXIpFyqNXnbr3hKFO+cPswes3Ygx49+eRSxgFXjbNpiFA7twxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpApGm9P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpApGm9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775797723; x=1807333723;
  h=date:from:to:cc:subject:message-id;
  bh=qr9S96/AiyMJi3ryjBMCKC+TkoHqF0WHvboJeyXGmfE=;
  b=dpApGm9Pv8xG+hZxk8JBF7nSMlVYWLX8JXhlC/mXsvt8TIv5YTTRWVyC
   roo+8eUb9E4EW7zHbbfB/o5NimyKRzQJeGpcTHYROJ89jrUirwNGQzYfm
   hzt5KhAZ/7i2rjfIDw8yx0815Vz/ivuWRsUWU8BDewHzRsoHj7QvVkfaG
   lm/qvrzCuRmLZzyZhRtyPJA9yOjSzgQRhcTDfvQ6MxHdOeWr9o77VR/14
   Z13si5gCfagBU12Gt/M3DrjDD8siMsX0zKRgDpEscq8LdO71noBkUfk4R
   3R6c+ol0J0cwptf3Zne4GbvzsUs96F84W+mUQfjFQXHmlh1vpOMjU48Qc
   w==;
X-CSE-ConnectionGUID: /FimD6oZRyeXk1ebdvDLHg==
X-CSE-MsgGUID: KcQcMFARSgeML1dz2SyEbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87890464"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87890464"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 22:08:42 -0700
X-CSE-ConnectionGUID: e6IiRa9iRLW+/BFmlw7nNw==
X-CSE-MsgGUID: aioAeLrFSfSY84mDg2C5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="224244957"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2026 22:08:40 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB46f-000000000qY-1Z85;
	Fri, 10 Apr 2026 05:08:37 +0000
Date: Fri, 10 Apr 2026 13:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 0b30c1037a6a48a4c293d45c6cbe8e312633782f
Message-ID: <202604101359.4D860Ucq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 0b30c1037a6a48a4c293d45c6cbe8e312633782f  hwmon: (yogafan) various markup improvements

elapsed time: 3334m

configs tested: 190
configs skipped: 19

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260408    clang-23
arc                   randconfig-001-20260408    gcc-8.5.0
arc                   randconfig-002-20260408    clang-23
arc                   randconfig-002-20260408    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                         lpc18xx_defconfig    clang-23
arm                   randconfig-001-20260408    clang-23
arm                   randconfig-001-20260408    gcc-8.5.0
arm                   randconfig-002-20260408    clang-23
arm                   randconfig-003-20260408    clang-23
arm                   randconfig-004-20260408    clang-23
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260408    gcc-14.3.0
arm64                 randconfig-002-20260408    gcc-14.3.0
arm64                 randconfig-003-20260408    gcc-14.3.0
arm64                 randconfig-004-20260408    gcc-14.3.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260408    gcc-14.3.0
csky                  randconfig-002-20260408    gcc-14.3.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260408    clang-23
hexagon               randconfig-002-20260408    clang-23
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260408    clang-20
i386        buildonly-randconfig-002-20260408    clang-20
i386        buildonly-randconfig-003-20260408    clang-20
i386        buildonly-randconfig-004-20260408    clang-20
i386        buildonly-randconfig-005-20260408    clang-20
i386        buildonly-randconfig-006-20260408    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260408    clang-20
i386                  randconfig-002-20260408    clang-20
i386                  randconfig-003-20260408    clang-20
i386                  randconfig-004-20260408    clang-20
i386                  randconfig-005-20260408    clang-20
i386                  randconfig-006-20260408    clang-20
i386                  randconfig-007-20260408    clang-20
i386                  randconfig-011-20260408    gcc-14
i386                  randconfig-012-20260408    gcc-14
i386                  randconfig-013-20260408    gcc-14
i386                  randconfig-014-20260408    gcc-14
i386                  randconfig-015-20260408    gcc-14
i386                  randconfig-016-20260408    gcc-14
i386                  randconfig-017-20260408    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260408    clang-23
loongarch             randconfig-002-20260408    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
m68k                                defconfig    gcc-15.2.0
m68k                        stmark2_defconfig    gcc-15.2.0
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
microblaze                          defconfig    gcc-15.2.0
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                               defconfig    gcc-15.2.0
nios2                 randconfig-001-20260408    clang-23
nios2                 randconfig-002-20260408    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-11.5.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260408    gcc-8.5.0
parisc                randconfig-002-20260408    gcc-8.5.0
parisc64                            defconfig    clang-19
parisc64                            defconfig    gcc-15.2.0
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                     ksi8560_defconfig    gcc-15.2.0
powerpc                   motionpro_defconfig    clang-23
powerpc               randconfig-001-20260408    gcc-8.5.0
powerpc               randconfig-002-20260408    gcc-8.5.0
powerpc64             randconfig-001-20260408    gcc-8.5.0
powerpc64             randconfig-002-20260408    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260408    clang-23
riscv                 randconfig-001-20260408    gcc-15.2.0
riscv                 randconfig-002-20260408    clang-23
riscv                 randconfig-002-20260408    gcc-15.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260408    clang-23
s390                  randconfig-002-20260408    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260408    clang-23
sh                    randconfig-001-20260408    gcc-15.2.0
sh                    randconfig-002-20260408    clang-23
sh                    randconfig-002-20260408    gcc-15.2.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260408    gcc-14
sparc                 randconfig-002-20260408    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260408    gcc-14
sparc64               randconfig-002-20260408    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260408    gcc-14
um                    randconfig-002-20260408    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260408    clang-20
x86_64      buildonly-randconfig-002-20260408    clang-20
x86_64      buildonly-randconfig-003-20260408    clang-20
x86_64      buildonly-randconfig-004-20260408    clang-20
x86_64      buildonly-randconfig-005-20260408    clang-20
x86_64      buildonly-randconfig-006-20260408    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260408    gcc-12
x86_64                randconfig-002-20260408    gcc-12
x86_64                randconfig-003-20260408    gcc-12
x86_64                randconfig-004-20260408    gcc-12
x86_64                randconfig-005-20260408    gcc-12
x86_64                randconfig-006-20260408    gcc-12
x86_64                randconfig-011-20260408    clang-20
x86_64                randconfig-012-20260408    clang-20
x86_64                randconfig-013-20260408    clang-20
x86_64                randconfig-014-20260408    clang-20
x86_64                randconfig-015-20260408    clang-20
x86_64                randconfig-016-20260408    clang-20
x86_64                randconfig-071-20260408    clang-20
x86_64                randconfig-072-20260408    clang-20
x86_64                randconfig-073-20260408    clang-20
x86_64                randconfig-074-20260408    clang-20
x86_64                randconfig-075-20260408    clang-20
x86_64                randconfig-076-20260408    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-11.5.0
xtensa                randconfig-001-20260408    gcc-14
xtensa                randconfig-002-20260408    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
