Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18924B4A
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 12:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726835091; cv=none; b=V9nQSP8SMGYoIpV1NzQgJEFugnzWZmXhlHoDqsaA7i/ncJBtPLf0CV24akvNbO6hBnDltrXU/bFf6+I25lZjDmxIS65NFCLkW1f35VAFNkPe7dfpAhp2Gec/0SJAUw7iiZ+vb03anRNqFjpE0s9FGyvedJb5tad/AP0q4d0yDXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726835091; c=relaxed/simple;
	bh=kCeaur+e0HT5reTmN06hM/VlYbtFXvTKaKniuvAAjug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bepMRbvOfsnqxt+2Iv1JRDVzD9e0cZjC+3Q+vIwg5KQW2Oban1PoiwBxnq7WfS5bUrDUs43q+yXHFwiz89uGmlQzSckDqpGhLbaVyTy1U6GHD+kWX+dxllZDUz1DYbb9RQDbwbDdSXloAfho0R8ikBdXy3JuNlu8s7UVVJ1V1sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF6mSPjC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF6mSPjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726835089; x=1758371089;
  h=date:from:to:cc:subject:message-id;
  bh=kCeaur+e0HT5reTmN06hM/VlYbtFXvTKaKniuvAAjug=;
  b=LF6mSPjCLxCciN+UY21xR0QRYludyQ/neNSDIZXboL1CBYnlsPELR79Z
   bjQhxwpWFlohTr2T61D+WnTvcbQhnC7Ev2fv/jkEC4BVM71ilnMjetTGe
   PrFDFDJVjTdsp6FOaa4djfkh1fUr3aePfcEZWXn6wXDNZpovpkpLvKohJ
   JzMxkfxN8mXrACxjx75Gw51ierS12ZlkrHyNhFsYIvSOkVMyFjHBl5n4q
   c5UYfX8vO7og4sN6wCPuGtjv5zXRNIwrdtl5uQezHJGEVeNsKxjQezMXm
   pTlSrKwRcnceEugzFLdFH1ECJr3eP5Vsqy3M/WFbXDIJGYewdeQuOGmS5
   A==;
X-CSE-ConnectionGUID: uXxmqdYeTlyAKAGh+DfAlQ==
X-CSE-MsgGUID: L4TQwJF4TWO9l8im66/fKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="13606489"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="13606489"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 05:24:48 -0700
X-CSE-ConnectionGUID: 28IlvgUbRluli/bQBACK1g==
X-CSE-MsgGUID: DgI9fAr1QmWDpRmPLc0RBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="69882876"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2024 05:24:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srcgn-000EMv-0g;
	Fri, 20 Sep 2024 12:24:45 +0000
Date: Fri, 20 Sep 2024 20:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 cc0db4a1cd791f8bfc616307388626d14d61a7d5
Message-ID: <202409202013.lSYyEcYJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: cc0db4a1cd791f8bfc616307388626d14d61a7d5  Merge branch 'hwmon-max16065' into hwmon-staging

elapsed time: 1996m

configs tested: 112
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arc                 nsimosci_hs_smp_defconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm                     davinci_all_defconfig    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                           allnoconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240920    gcc-12
i386        buildonly-randconfig-002-20240920    gcc-12
i386        buildonly-randconfig-003-20240920    gcc-12
i386        buildonly-randconfig-004-20240920    gcc-12
i386        buildonly-randconfig-005-20240920    gcc-12
i386        buildonly-randconfig-006-20240920    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240920    gcc-12
i386                  randconfig-002-20240920    gcc-12
i386                  randconfig-003-20240920    gcc-12
i386                  randconfig-004-20240920    gcc-12
i386                  randconfig-005-20240920    gcc-12
i386                  randconfig-006-20240920    gcc-12
i386                  randconfig-011-20240920    gcc-12
i386                  randconfig-012-20240920    gcc-12
i386                  randconfig-013-20240920    gcc-12
i386                  randconfig-014-20240920    gcc-12
i386                  randconfig-015-20240920    gcc-12
i386                  randconfig-016-20240920    gcc-12
loongarch                        alldefconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                      mmu_defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         db1xxx_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                     akebono_defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      katmai_defconfig    gcc-14.1.0
powerpc                       maple_defconfig    gcc-14.1.0
powerpc                   microwatt_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                               j2_defconfig    gcc-14.1.0
sh                          rsk7201_defconfig    gcc-14.1.0
sh                          rsk7269_defconfig    gcc-14.1.0
sh                     sh7710voipgw_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240920    gcc-12
x86_64      buildonly-randconfig-002-20240920    gcc-12
x86_64      buildonly-randconfig-003-20240920    gcc-12
x86_64      buildonly-randconfig-004-20240920    gcc-12
x86_64      buildonly-randconfig-005-20240920    gcc-12
x86_64      buildonly-randconfig-006-20240920    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240920    gcc-12
x86_64                randconfig-002-20240920    gcc-12
x86_64                randconfig-003-20240920    gcc-12
x86_64                randconfig-004-20240920    gcc-12
x86_64                randconfig-005-20240920    gcc-12
x86_64                randconfig-006-20240920    gcc-12
x86_64                randconfig-011-20240920    gcc-12
x86_64                randconfig-012-20240920    gcc-12
x86_64                randconfig-013-20240920    gcc-12
x86_64                randconfig-014-20240920    gcc-12
x86_64                randconfig-015-20240920    gcc-12
x86_64                randconfig-016-20240920    gcc-12
x86_64                randconfig-071-20240920    gcc-12
x86_64                randconfig-072-20240920    gcc-12
x86_64                randconfig-073-20240920    gcc-12
x86_64                randconfig-074-20240920    gcc-12
x86_64                randconfig-075-20240920    gcc-12
x86_64                randconfig-076-20240920    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                          iss_defconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
