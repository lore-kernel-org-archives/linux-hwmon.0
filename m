Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98601187561
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Oct 2024 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729341575; cv=none; b=Ef4aP9VhRUgW+2ORqIT2qYMhmeFXzvLGZl5zmWSco/np2jZZOQjjGrhZO+cBOBpAwp/Hfrk2Q6lDl0Fxok7f/W5GwwOJAobakD2ciEQboix6FR9g/XzgtNOTDSllvmj5JuPrDWr7iQqKCNFwO9aQ+Wq0oKNZU6BREpb5qtYEP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729341575; c=relaxed/simple;
	bh=h65lfKVlUiKYhVmVYB9CVQwY5gIbrVj2G9ZhAnRC160=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fa/pjM6dq+N6ISV3DNjWihqEbS1vjXKEMqCUpMLUD80xI9cYzP6f+FaqEPUD10OzzinX8JRej8OlmbngW2BnzUoBXuc0lwyvFe9hDrQjYT5ZSF6uYhrg9X7MsAanY05c/EH9EbwDtnfWOtUdJdqiUgHD1BBR/Lsft8CpFoiUcf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rw8+HGv5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rw8+HGv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729341573; x=1760877573;
  h=date:from:to:cc:subject:message-id;
  bh=h65lfKVlUiKYhVmVYB9CVQwY5gIbrVj2G9ZhAnRC160=;
  b=Rw8+HGv5UaETuZ/cBIyjSJPKaRBwYmHyLyiGkBmCC46QG8yGFSg62eje
   v1jDNPAJHX2ULsIP1vhQ3IIhs+kga/6rpUZHEEuHTK3a7CiRIKPDp+eAY
   LP+f/HulQ0VlbEDoeYSjb6FK6ImhjWB4BHlBzPjdL7ICW28xzjCJM71+g
   qtZsumqFp4FGMd8iag4oI/pr9DQzNbQadI6/RMFSRNvFNcCc0pRAP3BrP
   tYw6Py84Jpd2ZkCIQBP3ZVHRyXs5skK8Kaw01u/UbG/x18eLzwL6OuRdZ
   gsCgSwlOi5iflDXw+Gt7Yk7vkrFGye7pv9t4vYF7lRG5+WqVlWz09sBUY
   Q==;
X-CSE-ConnectionGUID: sfNwAR++Rd6fwkFKL8TVOg==
X-CSE-MsgGUID: 8HElbsXnQ6yxd2dHU6h7bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="16483165"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="16483165"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 05:39:33 -0700
X-CSE-ConnectionGUID: bj7reuWITGacg0PgePr51Q==
X-CSE-MsgGUID: TFqunpmBSLq7dTpSOc1VAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="78696865"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Oct 2024 05:39:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t28jy-000Ozp-0B;
	Sat, 19 Oct 2024 12:39:30 +0000
Date: Sat, 19 Oct 2024 20:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 7b54fd2d69e13e2a0302e77d05f8fb61efe450b9
Message-ID: <202410192013.YtO1OPIt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 7b54fd2d69e13e2a0302e77d05f8fb61efe450b9  Merge branch 'fixes-v6.12' into testing

elapsed time: 2226m

configs tested: 119
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                      axs103_smp_defconfig    clang-20
arc                        vdk_hs38_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                              allyesconfig    clang-20
arm                     am200epdkit_defconfig    clang-20
arm                          sp7021_defconfig    clang-20
arm                           u8500_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241019    clang-18
i386        buildonly-randconfig-002-20241019    clang-18
i386        buildonly-randconfig-003-20241019    clang-18
i386        buildonly-randconfig-004-20241019    clang-18
i386        buildonly-randconfig-005-20241019    clang-18
i386        buildonly-randconfig-006-20241019    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241019    clang-18
i386                  randconfig-002-20241019    clang-18
i386                  randconfig-003-20241019    clang-18
i386                  randconfig-004-20241019    clang-18
i386                  randconfig-005-20241019    clang-18
i386                  randconfig-006-20241019    clang-18
i386                  randconfig-011-20241019    clang-18
i386                  randconfig-012-20241019    clang-18
i386                  randconfig-013-20241019    clang-18
i386                  randconfig-014-20241019    clang-18
i386                  randconfig-015-20241019    clang-18
i386                  randconfig-016-20241019    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                         amcore_defconfig    clang-20
m68k                          hp300_defconfig    clang-20
m68k                        stmark2_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                            defconfig    gcc-12
parisc                            allnoconfig    clang-20
parisc                              defconfig    gcc-12
parisc                generic-32bit_defconfig    clang-20
powerpc                           allnoconfig    clang-20
powerpc                       ebony_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                     mpc512x_defconfig    clang-20
riscv                             allnoconfig    clang-20
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                           se7705_defconfig    clang-20
sh                           se7722_defconfig    clang-20
sh                  sh7785lcr_32bit_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241019    clang-18
x86_64      buildonly-randconfig-002-20241019    clang-18
x86_64      buildonly-randconfig-003-20241019    clang-18
x86_64      buildonly-randconfig-004-20241019    clang-18
x86_64      buildonly-randconfig-005-20241019    clang-18
x86_64      buildonly-randconfig-006-20241019    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241019    clang-18
x86_64                randconfig-002-20241019    clang-18
x86_64                randconfig-003-20241019    clang-18
x86_64                randconfig-004-20241019    clang-18
x86_64                randconfig-005-20241019    clang-18
x86_64                randconfig-006-20241019    clang-18
x86_64                randconfig-011-20241019    clang-18
x86_64                randconfig-012-20241019    clang-18
x86_64                randconfig-013-20241019    clang-18
x86_64                randconfig-014-20241019    clang-18
x86_64                randconfig-015-20241019    clang-18
x86_64                randconfig-016-20241019    clang-18
x86_64                randconfig-071-20241019    clang-18
x86_64                randconfig-072-20241019    clang-18
x86_64                randconfig-073-20241019    clang-18
x86_64                randconfig-074-20241019    clang-18
x86_64                randconfig-075-20241019    clang-18
x86_64                randconfig-076-20241019    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                    smp_lx200_defconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
