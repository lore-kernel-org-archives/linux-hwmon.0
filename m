Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0915189BB6
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 01:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772760336; cv=none; b=heTnSI9Da+EnJDbrJqyNkTOoIgGTZEbRzIof8htFdXrit0IObgfaLHW7QnrYwjNZwh4jtZ8MgCJ3Y5RIObn1E1kB6RycjtKCkxFqoyqRg8rTm/bLMXfHz1rN7lwYycj/qfWY3f4+txZ+9r5HcmioXSGp8UuEE8zQoA7NoDmfW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772760336; c=relaxed/simple;
	bh=UN1Sf0VRqf88hB7EKYAEbYb2iANlD8aXKbk6koXqxoA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PkRujGB7+OMw7a8mOaTSXZv9OrhWB0xQp0mjmaYYQUsD2myJ9mRG80E+io67tdvbIEFuBD7UNeh/HbNyT2vCrI03LBRuXc5vqw2Zut3aBcX/wUhyFFwlzaV94PhJOBFUT6LRSSrygyU73/nBLWDEmQHw9hvGtaY6UsEDdvfPJe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jr3cdbUH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jr3cdbUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772760335; x=1804296335;
  h=date:from:to:cc:subject:message-id;
  bh=UN1Sf0VRqf88hB7EKYAEbYb2iANlD8aXKbk6koXqxoA=;
  b=jr3cdbUH5/YsCTdCVrEtJD3rzrffH3Nq2pK75MGc2dxsIJTsLUrvkIh4
   ydlzDUTWGZDkrCXgJV67l5DG8YWWsjpvcZuN4OeoprnyjkBO1LfTkM1kw
   9p/JZPc4OoXc8w3GcHECdnju0NsEoY+7MG+dhJbsWFyoc0pwy/MIgxgqB
   vG1fR06Drbct1LF9Eb03Eif/ozvHd8in8hScgoXwdseAevg029MC2Y9dF
   IG8QoKE2U/suH9Z8G8YzlafxeuVnqg8jyChIhxa1U33Zx35/rFonlvvL5
   +TYvNOTMp7qsvoJZ9Z6liR0RZKNom+aKLph7dqrpgKmsPEgA6427hj+SH
   w==;
X-CSE-ConnectionGUID: 0eDLVKlHQ/ikX8txPgWkHw==
X-CSE-MsgGUID: 93PslETNQKGhNe6DwVU2Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91255037"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="91255037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 17:25:35 -0800
X-CSE-ConnectionGUID: 56KoHwAWQQGJwV/grBoQFw==
X-CSE-MsgGUID: lCCwi3NrRNCIZPgT43DP+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="217997333"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Mar 2026 17:25:33 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyJwY-000000000AH-1msZ;
	Fri, 06 Mar 2026 01:25:30 +0000
Date: Fri, 06 Mar 2026 09:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 25dd70a03b1f5f3aa71e1a5091ecd9cd2a13ee43
Message-ID: <202603060909.ljzeA9gA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 25dd70a03b1f5f3aa71e1a5091ecd9cd2a13ee43  hwmon: (pmbus/q54sj108a2) fix stack overflow in debugfs read

elapsed time: 1468m

configs tested: 239
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
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260305    clang-19
arc                   randconfig-001-20260306    gcc-14.3.0
arc                   randconfig-002-20260305    clang-19
arc                   randconfig-002-20260306    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260305    clang-19
arm                   randconfig-001-20260306    gcc-14.3.0
arm                   randconfig-002-20260305    clang-19
arm                   randconfig-002-20260306    gcc-14.3.0
arm                   randconfig-003-20260305    clang-19
arm                   randconfig-003-20260306    gcc-14.3.0
arm                   randconfig-004-20260305    clang-19
arm                   randconfig-004-20260306    gcc-14.3.0
arm                        spear3xx_defconfig    clang-17
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260305    gcc-8.5.0
arm64                 randconfig-002-20260305    gcc-8.5.0
arm64                 randconfig-003-20260305    gcc-8.5.0
arm64                 randconfig-004-20260305    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260305    gcc-8.5.0
csky                  randconfig-002-20260305    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260305    gcc-15.2.0
hexagon               randconfig-001-20260306    clang-23
hexagon               randconfig-002-20260305    gcc-15.2.0
hexagon               randconfig-002-20260306    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260306    gcc-14
i386        buildonly-randconfig-002-20260306    gcc-14
i386        buildonly-randconfig-003-20260306    gcc-14
i386        buildonly-randconfig-004-20260306    gcc-14
i386        buildonly-randconfig-005-20260306    gcc-14
i386        buildonly-randconfig-006-20260306    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260305    gcc-14
i386                  randconfig-001-20260306    clang-20
i386                  randconfig-002-20260305    gcc-14
i386                  randconfig-002-20260306    clang-20
i386                  randconfig-003-20260305    gcc-14
i386                  randconfig-003-20260306    clang-20
i386                  randconfig-004-20260305    gcc-14
i386                  randconfig-004-20260306    clang-20
i386                  randconfig-005-20260305    gcc-14
i386                  randconfig-005-20260306    clang-20
i386                  randconfig-006-20260305    gcc-14
i386                  randconfig-006-20260306    clang-20
i386                  randconfig-007-20260305    gcc-14
i386                  randconfig-007-20260306    clang-20
i386                  randconfig-011-20260306    gcc-14
i386                  randconfig-012-20260306    gcc-14
i386                  randconfig-013-20260306    gcc-14
i386                  randconfig-014-20260306    gcc-14
i386                  randconfig-015-20260306    gcc-14
i386                  randconfig-016-20260306    gcc-14
i386                  randconfig-017-20260306    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260305    gcc-15.2.0
loongarch             randconfig-001-20260306    clang-23
loongarch             randconfig-002-20260305    gcc-15.2.0
loongarch             randconfig-002-20260306    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                malta_qemu_32r6_defconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260305    gcc-15.2.0
nios2                 randconfig-001-20260306    clang-23
nios2                 randconfig-002-20260305    gcc-15.2.0
nios2                 randconfig-002-20260306    clang-23
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.2.0
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260305    gcc-9.5.0
parisc                randconfig-001-20260306    gcc-14.3.0
parisc                randconfig-002-20260305    gcc-9.5.0
parisc                randconfig-002-20260306    gcc-14.3.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260305    gcc-9.5.0
powerpc               randconfig-001-20260306    gcc-14.3.0
powerpc               randconfig-002-20260305    gcc-9.5.0
powerpc               randconfig-002-20260306    gcc-14.3.0
powerpc64             randconfig-001-20260305    gcc-9.5.0
powerpc64             randconfig-001-20260306    gcc-14.3.0
powerpc64             randconfig-002-20260305    gcc-9.5.0
powerpc64             randconfig-002-20260306    gcc-14.3.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv             nommu_k210_sdcard_defconfig    gcc-15.2.0
riscv                 randconfig-001-20260305    clang-23
riscv                 randconfig-001-20260306    clang-19
riscv                 randconfig-002-20260305    clang-23
riscv                 randconfig-002-20260306    clang-19
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260305    clang-23
s390                  randconfig-001-20260306    clang-19
s390                  randconfig-002-20260305    clang-23
s390                  randconfig-002-20260306    clang-19
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.2.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260305    clang-23
sh                    randconfig-001-20260306    clang-19
sh                    randconfig-002-20260305    clang-23
sh                    randconfig-002-20260306    clang-19
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260305    gcc-14.3.0
sparc                 randconfig-001-20260306    gcc-9.5.0
sparc                 randconfig-002-20260305    gcc-14.3.0
sparc                 randconfig-002-20260306    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260305    gcc-14.3.0
sparc64               randconfig-001-20260306    gcc-9.5.0
sparc64               randconfig-002-20260305    gcc-14.3.0
sparc64               randconfig-002-20260306    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260305    gcc-14.3.0
um                    randconfig-001-20260306    gcc-9.5.0
um                    randconfig-002-20260305    gcc-14.3.0
um                    randconfig-002-20260306    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260305    clang-20
x86_64      buildonly-randconfig-001-20260306    clang-20
x86_64      buildonly-randconfig-002-20260305    clang-20
x86_64      buildonly-randconfig-002-20260306    clang-20
x86_64      buildonly-randconfig-003-20260305    clang-20
x86_64      buildonly-randconfig-003-20260306    clang-20
x86_64      buildonly-randconfig-004-20260305    clang-20
x86_64      buildonly-randconfig-004-20260306    clang-20
x86_64      buildonly-randconfig-005-20260305    clang-20
x86_64      buildonly-randconfig-005-20260306    clang-20
x86_64      buildonly-randconfig-006-20260305    clang-20
x86_64      buildonly-randconfig-006-20260306    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260305    clang-20
x86_64                randconfig-001-20260306    gcc-14
x86_64                randconfig-002-20260305    clang-20
x86_64                randconfig-002-20260306    gcc-14
x86_64                randconfig-003-20260305    clang-20
x86_64                randconfig-003-20260306    gcc-14
x86_64                randconfig-004-20260305    clang-20
x86_64                randconfig-004-20260306    gcc-14
x86_64                randconfig-005-20260305    clang-20
x86_64                randconfig-005-20260306    gcc-14
x86_64                randconfig-006-20260305    clang-20
x86_64                randconfig-006-20260306    gcc-14
x86_64                randconfig-011-20260305    clang-20
x86_64                randconfig-012-20260305    clang-20
x86_64                randconfig-013-20260305    clang-20
x86_64                randconfig-014-20260305    clang-20
x86_64                randconfig-015-20260305    clang-20
x86_64                randconfig-016-20260305    clang-20
x86_64                randconfig-071-20260305    gcc-14
x86_64                randconfig-071-20260306    gcc-14
x86_64                randconfig-072-20260305    gcc-14
x86_64                randconfig-072-20260306    gcc-14
x86_64                randconfig-073-20260305    gcc-14
x86_64                randconfig-073-20260306    gcc-14
x86_64                randconfig-074-20260305    gcc-14
x86_64                randconfig-074-20260306    gcc-14
x86_64                randconfig-075-20260305    gcc-14
x86_64                randconfig-075-20260306    gcc-14
x86_64                randconfig-076-20260305    gcc-14
x86_64                randconfig-076-20260306    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260305    gcc-14.3.0
xtensa                randconfig-001-20260306    gcc-9.5.0
xtensa                randconfig-002-20260305    gcc-14.3.0
xtensa                randconfig-002-20260306    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
