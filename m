Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC515533B
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Apr 2024 23:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714089025; cv=none; b=ruTnf+6eW65U9wAM3Zs3g6j2b3bLgn2i29noAhhgCJoKz28srxao9rWKGbkUyvIkMJ9Zs0VN0Vcc8fREp3fGS/vXN3N44Zg6D1uiQipOtnGT5LxKrvCeBb6ejCrZLYUF0cUqUAwfg1ej+ORFQO4aBhDV/ZDcQtOKpyf6gNy/2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714089025; c=relaxed/simple;
	bh=WIf/SkdqKgTtLBg9Jc4TcpMVvzoWKJhi1H8TLB5MEpc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YBC+78ErEE974OqaMRlRbV4bdeI5VyOgxwflZhN3g9YmtdgXmMbLHdCsZKmtHxjwfHIRCcCQ6jvUWjfuJxOCj83DcRKs+8ZcFAFss9tYcIIjGNb4iVkEuaQ7e26CNZdOlk09gdZ6jsPXgJY5KhrVDB0S0UzKNe5H9NheMAFJmx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eI9N7MGM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eI9N7MGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714089024; x=1745625024;
  h=date:from:to:cc:subject:message-id;
  bh=WIf/SkdqKgTtLBg9Jc4TcpMVvzoWKJhi1H8TLB5MEpc=;
  b=eI9N7MGMAJjbEoIgS6Jls4XDuf4WYEly31rcGhIsuMJyaI3WkrlAiYiO
   ANnjOUAvMzzDGWsWUWoGnhFOwea0C0PmkySpRjBGRD97eqtw7987XScd7
   uNwDz6O/Ep5t3qAULAFeFVMmm82o8sZaoYtDtdyGgzOlVzIoKJE54svmj
   uGJy5QCRLDWhm40uI1kiZicQ2f0/5Eu4aYKAZVbEMi4UCdcL/6n4JM9wd
   InEa+QB+Jr6Q+Ak3Af2zvQbV7laVGXDqN/SnnrkJ51LPvz/qvhIXeYfTm
   rzG9WtIhyE59gbZffTc4x4IT72DVtPoeIOxWybnn4ptGd0UivxPOYZ98X
   A==;
X-CSE-ConnectionGUID: G+MZsrHoQwOA7GgsH1bdQQ==
X-CSE-MsgGUID: 745EhzIKSsa55p4kUn+T6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20964329"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="20964329"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 16:50:24 -0700
X-CSE-ConnectionGUID: ev8TSIoERIOg5YGJpuqZ7A==
X-CSE-MsgGUID: k02k4EkuRJGT1PHWNoPQHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="62714423"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 25 Apr 2024 16:50:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s08r6-00032Q-0H;
	Thu, 25 Apr 2024 23:50:20 +0000
Date: Fri, 26 Apr 2024 07:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 3429701e0c423142b911545a01a7c8680f758a58
Message-ID: <202404260739.euACWDui-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 3429701e0c423142b911545a01a7c8680f758a58  Merge branch 'kunit-v4' into testing

elapsed time: 1469m

configs tested: 141
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240426   gcc  
arc                   randconfig-002-20240426   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm                       imx_v6_v7_defconfig   clang
arm                           omap1_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240426   clang
arm                   randconfig-002-20240426   gcc  
arm                   randconfig-003-20240426   gcc  
arm                   randconfig-004-20240426   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240426   gcc  
arm64                 randconfig-002-20240426   gcc  
arm64                 randconfig-003-20240426   clang
arm64                 randconfig-004-20240426   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240426   gcc  
csky                  randconfig-002-20240426   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240426   clang
hexagon               randconfig-002-20240426   clang
i386         buildonly-randconfig-001-20240425   gcc  
i386         buildonly-randconfig-002-20240425   clang
i386         buildonly-randconfig-003-20240425   gcc  
i386         buildonly-randconfig-004-20240425   clang
i386         buildonly-randconfig-005-20240425   clang
i386         buildonly-randconfig-006-20240425   gcc  
i386                  randconfig-001-20240425   clang
i386                  randconfig-002-20240425   clang
i386                  randconfig-003-20240425   clang
i386                  randconfig-004-20240425   gcc  
i386                  randconfig-005-20240425   clang
i386                  randconfig-006-20240425   clang
i386                  randconfig-011-20240425   clang
i386                  randconfig-012-20240425   clang
i386                  randconfig-013-20240425   gcc  
i386                  randconfig-014-20240425   gcc  
i386                  randconfig-015-20240425   gcc  
i386                  randconfig-016-20240425   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240426   gcc  
loongarch             randconfig-002-20240426   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                     decstation_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                       rbtx49xx_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240426   gcc  
nios2                 randconfig-002-20240426   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240426   gcc  
parisc                randconfig-002-20240426   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                   bluestone_defconfig   clang
powerpc                       maple_defconfig   clang
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20240426   clang
powerpc               randconfig-002-20240426   gcc  
powerpc               randconfig-003-20240426   clang
powerpc64             randconfig-001-20240426   gcc  
powerpc64             randconfig-002-20240426   gcc  
powerpc64             randconfig-003-20240426   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240426   clang
riscv                 randconfig-002-20240426   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240426   clang
s390                  randconfig-002-20240426   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240426   gcc  
sh                    randconfig-002-20240426   gcc  
sh                             sh03_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240426   gcc  
sparc64               randconfig-002-20240426   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240426   gcc  
um                    randconfig-002-20240426   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240426   gcc  
xtensa                randconfig-002-20240426   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
