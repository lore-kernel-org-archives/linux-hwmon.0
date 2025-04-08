Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E961DE3AC
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Apr 2025 03:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744083681; cv=none; b=KlRbjnzoLXk/8tKKVNOgAYpLv5fNdS5saKk+fKwNJDQoDk/Wb5/c+pZabbh9IFQnjbG0B+8CHhrWNnxIpRR0gcHw7nHcE24LL50JruKfMMvAPzbE8JQZRpVwOC83N2PeU2+ZF4DgRy96AIi92/mgfDks/oYy8qlnDtfbC+boMC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744083681; c=relaxed/simple;
	bh=q0A5FAqFUZk/e3ucz6fYlYBVhYFVn8RU/c/fcNaAcMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pk8XMYXzG4iLbshhqzRHdsLbhmJQoRuU65uPTCDRp72syRaAlzwJShEhFQS3G51XzP7y46lq0G8IPWqMV1zCQzk+Clc7i3O/g36Bztf0V3nLpkoVDYGV3IPyZ7fwm4VQqavu6u2ibi9UoC8KK1rYRcVJcO/wOs1VJOLhbIpmzGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1KlRbF/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1KlRbF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744083680; x=1775619680;
  h=date:from:to:cc:subject:message-id;
  bh=q0A5FAqFUZk/e3ucz6fYlYBVhYFVn8RU/c/fcNaAcMA=;
  b=d1KlRbF/o+NEcTNRUEnYDw1htJmsXsolUGQLwpGOQoyBsu4nNf0Xan00
   RY9dJDaCobiEV7hjASqndXcYG/MpT1h7k5ep53+vH2luVt+vvTpOw8G+l
   UsGYEB9R+34KcXLeLZD3OPS40HaEafxmlVPxRUuAliJr+xZZA01lUrDlZ
   20y5R8Ktq9qZLkZ1Mm6xtaXRq2ZHGTxs67AugECO83W10BxyuQDvs+xaD
   Xum5qwT82gqegHlRJBV9gY92kz9ENNLnMbswB5sHbFIqUfTndK31iSOcR
   PN54EHJaUZarGXo/2rfrgFUm8RzG+ocZ668PTVSMoxshUogVq0SA1fIhE
   Q==;
X-CSE-ConnectionGUID: Bj+W9VNJRWmsK83dGExmJA==
X-CSE-MsgGUID: ACbr6ctVQHm000I9A1+kWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45396123"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45396123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:41:19 -0700
X-CSE-ConnectionGUID: 17oh2jUESZSrYxDW6eIDuA==
X-CSE-MsgGUID: 9h1/1D2lTHymoLdsVPwuOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="159135952"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Apr 2025 20:41:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1zps-00045X-0g;
	Tue, 08 Apr 2025 03:41:16 +0000
Date: Tue, 08 Apr 2025 11:40:30 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 409c4e26cf268a11b758fd4cf41ee447445f5df0
Message-ID: <202504081119.rBKuMu2o-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 409c4e26cf268a11b758fd4cf41ee447445f5df0  Merge branch 'fixes-v6.15' into testing

elapsed time: 1451m

configs tested: 127
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              alldefconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250407    gcc-12.4.0
arc                   randconfig-002-20250407    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                            dove_defconfig    gcc-14.2.0
arm                   randconfig-001-20250407    gcc-8.5.0
arm                   randconfig-002-20250407    clang-21
arm                   randconfig-003-20250407    gcc-8.5.0
arm                   randconfig-004-20250407    gcc-8.5.0
arm                           stm32_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250407    clang-21
arm64                 randconfig-002-20250407    gcc-6.5.0
arm64                 randconfig-003-20250407    gcc-8.5.0
arm64                 randconfig-004-20250407    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250407    gcc-14.2.0
csky                  randconfig-002-20250407    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250407    clang-21
hexagon               randconfig-002-20250407    clang-15
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250407    gcc-12
i386        buildonly-randconfig-002-20250407    gcc-12
i386        buildonly-randconfig-003-20250407    gcc-12
i386        buildonly-randconfig-004-20250407    clang-20
i386        buildonly-randconfig-005-20250407    gcc-12
i386        buildonly-randconfig-006-20250407    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250407    gcc-14.2.0
loongarch             randconfig-002-20250407    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath25_defconfig    clang-21
mips                           gcw0_defconfig    clang-14
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250407    gcc-6.5.0
nios2                 randconfig-002-20250407    gcc-8.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250407    gcc-7.5.0
parisc                randconfig-002-20250407    gcc-7.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-14.2.0
powerpc                        fsp2_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250407    clang-21
powerpc               randconfig-002-20250407    clang-21
powerpc               randconfig-003-20250407    gcc-6.5.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250407    clang-21
powerpc64             randconfig-002-20250407    clang-17
powerpc64             randconfig-003-20250407    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250407    gcc-8.5.0
riscv                 randconfig-002-20250407    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20250407    gcc-9.3.0
s390                  randconfig-002-20250407    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                               j2_defconfig    gcc-14.2.0
sh                 kfr2r09-romimage_defconfig    gcc-14.2.0
sh                    randconfig-001-20250407    gcc-12.4.0
sh                    randconfig-002-20250407    gcc-10.5.0
sh                           sh2007_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250407    gcc-13.3.0
sparc                 randconfig-002-20250407    gcc-10.3.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250407    gcc-7.5.0
sparc64               randconfig-002-20250407    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250407    clang-18
um                    randconfig-002-20250407    clang-21
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250407    gcc-11
x86_64      buildonly-randconfig-002-20250407    clang-20
x86_64      buildonly-randconfig-003-20250407    clang-20
x86_64      buildonly-randconfig-004-20250407    clang-20
x86_64      buildonly-randconfig-005-20250407    clang-20
x86_64      buildonly-randconfig-006-20250407    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250407    gcc-9.3.0
xtensa                randconfig-002-20250407    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
