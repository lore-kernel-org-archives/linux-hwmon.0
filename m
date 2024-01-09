Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122DF3A1A1
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jan 2024 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kw9C8cPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704816282; x=1736352282;
  h=date:from:to:cc:subject:message-id;
  bh=28hOtgHw2s9s7HQOAH575/V3AqnUdpIIgXXqJADqsSA=;
  b=kw9C8cPzJep64W+br4MFLQIE2tHrV1HRQRggFvl0wjE/pguUEarjnf3B
   ioGVbp1RCs/5VxzTV7dnQzU4CTo9mQ/fNt015JKSVz4HCXlVPc1QCvCmO
   f7Kan3qAZfp4sUjsXPnJhLK88PO0mqHY6mc6XT+CYJnICEd1XnbIEJyIh
   /e/Qfd4JnvDuWfUsThqdUv0BlIEDkPI6jVwW89RHXqR4OdgpZX3ot/ndg
   wzRJgDC3E8PlUGyQhu7k6U2MOMCEX7tT6M+mHKmSsrOvncegNOgVMAw2l
   95d4KLRB1a8hWHx1KVGABVvUngwX3rAGMLN9r2S5D5ROtkPorWfwoEuFg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="388682503"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="388682503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2024 08:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731531924"
X-IronPort-AV: E=Sophos;i="6.04,183,1695711600"; 
   d="scan'208";a="731531924"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Jan 2024 08:04:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNEaj-000619-3D;
	Tue, 09 Jan 2024 16:04:37 +0000
Date: Wed, 10 Jan 2024 00:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 41c71105a845ec1458680f01644d032a5fbbe0d9
Message-ID: <202401100043.Kyp5iUm5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 41c71105a845ec1458680f01644d032a5fbbe0d9  hwmon: (gigabyte_waterforce) Mark status report as received under a spinlock

elapsed time: 1456m

configs tested: 126
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
arc                              allmodconfig   gcc  
arc                              allyesconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240109   gcc  
arc                   randconfig-002-20240109   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                   randconfig-001-20240109   clang
arm                   randconfig-002-20240109   clang
arm                   randconfig-003-20240109   clang
arm                   randconfig-004-20240109   clang
arm64                            allmodconfig   clang
arm64                 randconfig-001-20240109   clang
arm64                 randconfig-002-20240109   clang
arm64                 randconfig-003-20240109   clang
arm64                 randconfig-004-20240109   clang
csky                             allmodconfig   gcc  
csky                             allyesconfig   gcc  
csky                  randconfig-001-20240109   gcc  
csky                  randconfig-002-20240109   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
hexagon               randconfig-001-20240109   clang
hexagon               randconfig-002-20240109   clang
i386                             alldefconfig   gcc  
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240109   clang
i386         buildonly-randconfig-002-20240109   clang
i386         buildonly-randconfig-003-20240109   clang
i386         buildonly-randconfig-004-20240109   clang
i386         buildonly-randconfig-005-20240109   clang
i386         buildonly-randconfig-006-20240109   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240109   clang
i386                  randconfig-002-20240109   clang
i386                  randconfig-003-20240109   clang
i386                  randconfig-004-20240109   clang
i386                  randconfig-005-20240109   clang
i386                  randconfig-006-20240109   clang
i386                  randconfig-011-20240109   gcc  
i386                  randconfig-012-20240109   gcc  
i386                  randconfig-013-20240109   gcc  
i386                  randconfig-014-20240109   gcc  
i386                  randconfig-015-20240109   gcc  
i386                  randconfig-016-20240109   gcc  
loongarch                        allmodconfig   gcc  
loongarch             randconfig-001-20240109   gcc  
loongarch             randconfig-002-20240109   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                 randconfig-001-20240109   gcc  
nios2                 randconfig-002-20240109   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240109   gcc  
parisc                randconfig-002-20240109   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240109   clang
powerpc               randconfig-002-20240109   clang
powerpc               randconfig-003-20240109   clang
powerpc64             randconfig-001-20240109   clang
powerpc64             randconfig-002-20240109   clang
powerpc64             randconfig-003-20240109   clang
riscv                            allmodconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                 randconfig-001-20240109   clang
riscv                 randconfig-002-20240109   clang
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                  randconfig-001-20240109   gcc  
s390                  randconfig-002-20240109   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                    randconfig-001-20240109   gcc  
sh                    randconfig-002-20240109   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64               randconfig-001-20240109   gcc  
sparc64               randconfig-002-20240109   gcc  
um                               allmodconfig   clang
um                               allyesconfig   clang
um                    randconfig-001-20240109   clang
um                    randconfig-002-20240109   clang
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240109   clang
x86_64       buildonly-randconfig-002-20240109   clang
x86_64       buildonly-randconfig-003-20240109   clang
x86_64       buildonly-randconfig-004-20240109   clang
x86_64       buildonly-randconfig-005-20240109   clang
x86_64       buildonly-randconfig-006-20240109   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240109   gcc  
x86_64                randconfig-002-20240109   gcc  
x86_64                randconfig-003-20240109   gcc  
x86_64                randconfig-004-20240109   gcc  
x86_64                randconfig-005-20240109   gcc  
x86_64                randconfig-006-20240109   gcc  
x86_64                randconfig-011-20240109   clang
x86_64                randconfig-012-20240109   clang
x86_64                randconfig-013-20240109   clang
x86_64                randconfig-014-20240109   clang
x86_64                randconfig-015-20240109   clang
x86_64                randconfig-016-20240109   clang
x86_64                randconfig-071-20240109   clang
x86_64                randconfig-072-20240109   clang
x86_64                randconfig-073-20240109   clang
x86_64                randconfig-074-20240109   clang
x86_64                randconfig-075-20240109   clang
x86_64                randconfig-076-20240109   clang
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240109   gcc  
xtensa                randconfig-002-20240109   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
