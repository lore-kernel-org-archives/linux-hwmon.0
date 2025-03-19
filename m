Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858261361
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Mar 2025 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742401585; cv=none; b=PYy6g92IAEU7ubPVQRitQvWVbv2FsEyKtQTHsplFO+zo6HVUfyK9gJaIVmB441ijZ2nbESYpC7S6CazBXhEgxhVpldrmcxgmvkAT7D7vmWVZj0IDn1WCRByv+WVsjBag2diHcoleK8OViFhHHHdgWznp9QIZB8TnHqUTS0sHius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742401585; c=relaxed/simple;
	bh=bB7Z3D3pAJ9FqICDOfEOiaiZStKwUFsJysVaG4wtJLM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bdukm+pmRMqPaKQo0N0aUo/fialTEaVIh2y//r/NvO3/BQ4vCvkTUaG22wh8YyLNljC+6LrotCZHytZriae+xBocKVMMjVxeg5/ojiJNaBHvki+8Gu7WG61WRhfzFOVTba1c3WDcCqSPcfEwKOHAVmTj7CShEVL9T0rwjyd61VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dl3UU7G0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dl3UU7G0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742401584; x=1773937584;
  h=date:from:to:cc:subject:message-id;
  bh=bB7Z3D3pAJ9FqICDOfEOiaiZStKwUFsJysVaG4wtJLM=;
  b=Dl3UU7G0VZw08n+Gb86qocu/n9rEMfNAiUhNTQ5Pel1ZdMz+dxiikQyF
   0ZJbcZxMkZKuPBLhgNMi1ZcqV8vUUOdywX2DVTi1WaMc3/XdfOxh7MRmG
   UpctFesWHIWL6mRXop500E+RrsJIJqh0q1s9UNTgRZajKrutS8NYxj8lK
   Z7MM07mCDOBO4EwcZ+K/iWK1wgipZvP9vVvltb+olG0od8Z01vZbItG7/
   /kPFZG6PtmLAgL73hUTqi5IuIFBJaeJLElJHTtU0B/GT13VRFFt+ZfJ+e
   928BDLi9o6IuhaCMFtHLJCMPF2a/L1aGuSNKviOhw0AwuLQp3NAlbKMCr
   w==;
X-CSE-ConnectionGUID: GTXdwm2NS4iy7ldlSq8ECw==
X-CSE-MsgGUID: /bLBDNC3Qv6gaWqHuxxw7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43619276"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43619276"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 09:26:23 -0700
X-CSE-ConnectionGUID: zMbG/uVORGi5ajJbALfn2A==
X-CSE-MsgGUID: qSyerHWlRKSFshf3xj7Dfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="145884601"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2025 09:26:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuwFH-000FVl-2P;
	Wed, 19 Mar 2025 16:26:19 +0000
Date: Thu, 20 Mar 2025 00:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 bf1bb26f23f10f835e596337604d32d34ab798a6
Message-ID: <202503200021.ApNeZHYs-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: bf1bb26f23f10f835e596337604d32d34ab798a6  hwmon: add driver for HTU31

elapsed time: 1453m

configs tested: 100
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-6.5.0
alpha                            allyesconfig    gcc-9.3.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-8.5.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250319    gcc-14.2.0
arc                   randconfig-002-20250319    gcc-14.2.0
arm                              allmodconfig    gcc-8.5.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-6.5.0
arm                   randconfig-001-20250319    clang-18
arm                   randconfig-002-20250319    clang-21
arm                   randconfig-003-20250319    clang-20
arm                   randconfig-004-20250319    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-8.5.0
arm64                 randconfig-001-20250319    gcc-14.2.0
arm64                 randconfig-002-20250319    gcc-7.5.0
arm64                 randconfig-003-20250319    gcc-12.3.0
arm64                 randconfig-004-20250319    gcc-7.5.0
csky                              allnoconfig    gcc-9.3.0
csky                  randconfig-001-20250319    gcc-14.2.0
csky                  randconfig-002-20250319    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250319    clang-21
hexagon               randconfig-002-20250319    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250319    gcc-12
i386        buildonly-randconfig-002-20250319    gcc-12
i386        buildonly-randconfig-003-20250319    gcc-12
i386        buildonly-randconfig-004-20250319    clang-20
i386        buildonly-randconfig-005-20250319    gcc-12
i386        buildonly-randconfig-006-20250319    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-13.3.0
loongarch             randconfig-001-20250319    gcc-14.2.0
loongarch             randconfig-002-20250319    gcc-14.2.0
m68k                             allmodconfig    gcc-8.5.0
m68k                              allnoconfig    gcc-5.5.0
m68k                             allyesconfig    gcc-6.5.0
microblaze                       allmodconfig    gcc-9.3.0
microblaze                        allnoconfig    gcc-11.5.0
microblaze                       allyesconfig    gcc-9.3.0
mips                              allnoconfig    gcc-10.5.0
nios2                             allnoconfig    gcc-8.5.0
nios2                 randconfig-001-20250319    gcc-14.2.0
nios2                 randconfig-002-20250319    gcc-10.5.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-5.5.0
parisc                           allyesconfig    gcc-9.3.0
parisc                randconfig-001-20250319    gcc-10.5.0
parisc                randconfig-002-20250319    gcc-5.5.0
powerpc                          allmodconfig    gcc-10.5.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250319    gcc-9.3.0
powerpc               randconfig-002-20250319    clang-21
powerpc               randconfig-003-20250319    clang-21
powerpc64             randconfig-001-20250319    clang-20
powerpc64             randconfig-002-20250319    gcc-5.5.0
powerpc64             randconfig-003-20250319    clang-21
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250319    clang-20
riscv                 randconfig-002-20250319    clang-17
s390                             allmodconfig    clang-18
s390                             allyesconfig    gcc-13.2.0
s390                  randconfig-001-20250319    gcc-11.5.0
s390                  randconfig-002-20250319    gcc-8.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-10.5.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250319    gcc-11.5.0
sh                    randconfig-002-20250319    gcc-14.2.0
sparc                            allmodconfig    gcc-6.5.0
sparc                             allnoconfig    gcc-6.5.0
sparc                 randconfig-001-20250319    gcc-6.5.0
sparc                 randconfig-002-20250319    gcc-13.3.0
sparc64               randconfig-001-20250319    gcc-14.2.0
sparc64               randconfig-002-20250319    gcc-14.2.0
um                               allmodconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250319    gcc-12
um                    randconfig-002-20250319    gcc-11
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250319    clang-20
x86_64      buildonly-randconfig-002-20250319    clang-20
x86_64      buildonly-randconfig-003-20250319    gcc-12
x86_64      buildonly-randconfig-004-20250319    gcc-11
x86_64      buildonly-randconfig-005-20250319    clang-20
x86_64      buildonly-randconfig-006-20250319    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250319    gcc-10.5.0
xtensa                randconfig-002-20250319    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
