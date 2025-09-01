Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE92773F5
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Sep 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756734126; cv=none; b=FWDzZNSkGXWxV3u0GiTLVvw8s2MgMLTfKVmuxP52ioisa5AcMyNytbIKpkJLEfO/33PHLo8jaZ4YACsti2+F5LVZTTVFQsJYgM9KPVPvkO2q5sPd9ZmlwAMBpBwup8K7LyrHMyvc8v+jrLXeUr+GUYnL6izXuMoDZ/2ghF0TsG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756734126; c=relaxed/simple;
	bh=NPjhDFonmqAEItf3xg0UQTK44CBJ5Ur0yWJKywmsPxs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqQ3nGeUSnoLT82y5eyraP0eIionC0LvLq/1whpLFN7ZU1r4OSdK3ZjjlcvjLdh5XgKSYd3dMvW9hpkJ+hVerWw6w0FdooIS6LWXIr80npngsGMVhuVz6Tfq6+B0anZaqM/TlieIwNo92Si6ZaK6Lre8WRxI4Hn5s8EU6v1HhOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btAHcjcI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btAHcjcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756734124; x=1788270124;
  h=date:from:to:cc:subject:message-id;
  bh=NPjhDFonmqAEItf3xg0UQTK44CBJ5Ur0yWJKywmsPxs=;
  b=btAHcjcIYiVai1QDkGeJWUORoHyPhctTQE+CIGjAw2uXUq7L6tiof7EN
   F8ff4n6C5L/c5u+e1Y+R5HmVF7eGDYdnJp3KGwRwPMZBUIyLqOOBO1tbc
   xwY/WjAeRfN1Wr9E9PxeSHzfGRC4T0G7ZRqoNBmSBfH/kUi80omwfXuMr
   Bv2N/yUaLJx2tTYvqKfjZBHscQme3DxlqaOM8Ecl3ZyvU/I5j9ZlAlMVY
   F8TB2yJijYvWuvywrp9Lj57O5hG6FUl7z9oRBiPHP6J+XpL7ymg8OSPJO
   vMuKIpPfP6lKAstEv7COyQYl/3lNiB5zFhZLnvVCaiBvoiJ0nM0LndNAs
   Q==;
X-CSE-ConnectionGUID: jO5XyTr3Qqqvbcm7lHR2KA==
X-CSE-MsgGUID: vgruvVDyQUSNxd5YqAcchA==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59098967"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="59098967"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 06:42:04 -0700
X-CSE-ConnectionGUID: DnNaFJ3wRDerA29dM7JdDw==
X-CSE-MsgGUID: pRMn7pk1TB+n5DB50gifCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201973745"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Sep 2025 06:42:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut4mn-0000fT-0Y;
	Mon, 01 Sep 2025 13:41:40 +0000
Date: Mon, 01 Sep 2025 21:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 98fd069dd87386d87eaf439e3c7b5767618926d2
Message-ID: <202509012109.xl0EjOCt-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 98fd069dd87386d87eaf439e3c7b5767618926d2  hwmon: (ina238) Correctly clamp temperature

elapsed time: 903m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250901    gcc-8.5.0
arc                   randconfig-002-20250901    gcc-11.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-22
arm                   randconfig-001-20250901    clang-22
arm                   randconfig-002-20250901    clang-22
arm                   randconfig-003-20250901    clang-22
arm                   randconfig-004-20250901    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250901    clang-16
arm64                 randconfig-002-20250901    gcc-13.4.0
arm64                 randconfig-003-20250901    clang-22
arm64                 randconfig-004-20250901    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250901    gcc-12.5.0
csky                  randconfig-002-20250901    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-22
hexagon               randconfig-001-20250901    clang-17
hexagon               randconfig-002-20250901    clang-17
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250901    clang-20
i386        buildonly-randconfig-002-20250901    clang-20
i386        buildonly-randconfig-003-20250901    gcc-12
i386        buildonly-randconfig-004-20250901    clang-20
i386        buildonly-randconfig-005-20250901    gcc-12
i386        buildonly-randconfig-006-20250901    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250901    gcc-15.1.0
loongarch             randconfig-002-20250901    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250901    gcc-11.5.0
nios2                 randconfig-002-20250901    gcc-9.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250901    gcc-11.5.0
parisc                randconfig-002-20250901    gcc-11.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                        icon_defconfig    gcc-15.1.0
powerpc                     mpc83xx_defconfig    clang-22
powerpc               randconfig-001-20250901    clang-22
powerpc               randconfig-002-20250901    clang-22
powerpc               randconfig-003-20250901    gcc-13.4.0
powerpc                     redwood_defconfig    clang-22
powerpc64             randconfig-001-20250901    clang-16
powerpc64             randconfig-002-20250901    gcc-13.4.0
powerpc64             randconfig-003-20250901    gcc-12.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250901    clang-22
riscv                 randconfig-002-20250901    clang-20
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250901    gcc-13.4.0
s390                  randconfig-002-20250901    gcc-13.4.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                          r7785rp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250901    gcc-15.1.0
sh                    randconfig-002-20250901    gcc-15.1.0
sh                          rsk7201_defconfig    gcc-15.1.0
sh                           se7705_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250901    gcc-8.5.0
sparc                 randconfig-002-20250901    gcc-15.1.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250901    clang-20
sparc64               randconfig-002-20250901    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250901    gcc-12
um                    randconfig-002-20250901    gcc-12
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250901    clang-20
x86_64      buildonly-randconfig-002-20250901    clang-20
x86_64      buildonly-randconfig-003-20250901    gcc-12
x86_64      buildonly-randconfig-004-20250901    clang-20
x86_64      buildonly-randconfig-005-20250901    gcc-12
x86_64      buildonly-randconfig-006-20250901    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                           alldefconfig    gcc-15.1.0
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250901    gcc-8.5.0
xtensa                randconfig-002-20250901    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
