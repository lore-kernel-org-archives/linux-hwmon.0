Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96297184D
	for <linux-hwmon@vger.kernel.org>; Sun,  5 May 2024 06:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714890592; cv=none; b=SithDW7JsmQXtz6A7i0V3CT9wGfesSE7ZesNb37lYQVGkUinsMEs8Xl6jrYh1Fjkby2fV8jGYGUGfIsLciiLDMBd5iiz0Tlm7pN1jNfLvxE+5U6LVwaEuNIFGUH+t6ybNlf7SZ3Mxtm5FrIfk2GDhyVE9vkFFVbzVsbCkqIk4CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714890592; c=relaxed/simple;
	bh=mt7vyPrjljMIcq/YvWkw37HyGPjB8M6lqskBOcVg1gU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WxXAcBEo/x6BL+JIWbbKPO7VyHyYLiXhCFaVSqkCIeLXf6EEVhsl2gKzpuvbO7DkA/w26zmxxE9ZIamt1FuYeTMJph0EC+kRiTQsj2iYmWTDBgqpHHafnvqxSWnlBguCY12S1YFKv/Kj1h2Vi6TQUrZileXA1bDLMur+leDXaug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpu/02Na; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpu/02Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714890590; x=1746426590;
  h=date:from:to:cc:subject:message-id;
  bh=mt7vyPrjljMIcq/YvWkw37HyGPjB8M6lqskBOcVg1gU=;
  b=cpu/02NaUKh2O6rfMUK/5GJpbxCOr6eL8kO5d9r22agEfBjtVHs6n8w6
   DdFKYu60aaAms/q1LprN+DNHr9JyV+6aL4HNZiX16fNKhsDtnH4gEJ4nX
   1tzTANyPtD/7ANzhKXwqtSxLttOwBtSQRKNA0YIdmjL9YT4+AJZgnxCWh
   noCpd8spz9apeW5PudoSegej02EhdekJg8a0JMQJ0iLELhX41BjKbkYrF
   Bi+AZ4xuo0Kr4zGq3UIBzpiaf3NtuGiNrHMSbBtf81NgIrKokFgKekksU
   2Q2rIiHnApiW0Y1uNg00VEny+TYTK3a+KF/KScnm+JYSS0u3eD1NHzuRR
   w==;
X-CSE-ConnectionGUID: 1ybZ5QCWSC6wqv0m0kNlOw==
X-CSE-MsgGUID: mBCVEB/LRxCUoRIyHxXDww==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="11188693"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="11188693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 23:29:50 -0700
X-CSE-ConnectionGUID: zJwp4GgrSjCJkZPERokUkw==
X-CSE-MsgGUID: GHBR6Y8UQFOLKWmWHSSkzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="32327471"
Received: from lkp-server01.sh.intel.com (HELO 123fad1cf874) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 May 2024 23:29:49 -0700
Received: from kbuild by 123fad1cf874 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3VNa-00001m-37;
	Sun, 05 May 2024 06:29:46 +0000
Date: Sun, 05 May 2024 14:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 d02abd57e79469a026213f7f5827a98d909f236a
Message-ID: <202405051405.nfPwCddU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: d02abd57e79469a026213f7f5827a98d909f236a  hwmon: (corsair-cpro) Protect ccp->wait_input_report with a spinlock

elapsed time: 997m

configs tested: 154
configs skipped: 3

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
arc                   randconfig-001-20240505   gcc  
arc                   randconfig-002-20240505   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240505   clang
arm                   randconfig-002-20240505   gcc  
arm                   randconfig-003-20240505   gcc  
arm                   randconfig-004-20240505   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240505   clang
arm64                 randconfig-002-20240505   clang
arm64                 randconfig-003-20240505   clang
arm64                 randconfig-004-20240505   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240505   gcc  
csky                  randconfig-002-20240505   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240505   clang
hexagon               randconfig-002-20240505   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240505   clang
i386         buildonly-randconfig-002-20240505   clang
i386         buildonly-randconfig-003-20240505   clang
i386         buildonly-randconfig-004-20240505   gcc  
i386         buildonly-randconfig-005-20240505   clang
i386         buildonly-randconfig-006-20240505   clang
i386                                defconfig   clang
i386                  randconfig-001-20240505   clang
i386                  randconfig-002-20240505   clang
i386                  randconfig-003-20240505   gcc  
i386                  randconfig-004-20240505   clang
i386                  randconfig-005-20240505   gcc  
i386                  randconfig-006-20240505   gcc  
i386                  randconfig-011-20240505   gcc  
i386                  randconfig-012-20240505   gcc  
i386                  randconfig-013-20240505   clang
i386                  randconfig-014-20240505   gcc  
i386                  randconfig-015-20240505   gcc  
i386                  randconfig-016-20240505   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20240505   gcc  
loongarch             randconfig-002-20240505   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip27_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240505   gcc  
nios2                 randconfig-002-20240505   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240505   gcc  
parisc                randconfig-002-20240505   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240505   gcc  
powerpc               randconfig-002-20240505   clang
powerpc               randconfig-003-20240505   clang
powerpc                    socrates_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240505   gcc  
powerpc64             randconfig-002-20240505   clang
powerpc64             randconfig-003-20240505   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240505   clang
riscv                 randconfig-002-20240505   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240505   gcc  
s390                  randconfig-002-20240505   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                    randconfig-001-20240505   gcc  
sh                    randconfig-002-20240505   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240505   gcc  
sparc64               randconfig-002-20240505   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240505   gcc  
um                    randconfig-002-20240505   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240505   gcc  
xtensa                randconfig-002-20240505   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
