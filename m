Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACBE5FB87
	for <linux-hwmon@vger.kernel.org>; Sat,  4 May 2024 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714844206; cv=none; b=XzBEnNWPav2TsQ9xAVHcvgDleS8ZaSKlhQgt/52JS3zKx/IR0L9izygKNHHg4qETVd2ZiIh5q4ERq8NJczGb7BIeUcSVnTT/vbWwfZ7JkLFR+FMIF3ogOxGnvFq7zUuOAyL4TsNvPy/dt/ISZQlBXVSNfrXHwb4K7JkeRK6YPD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714844206; c=relaxed/simple;
	bh=HBnX87ngA8C6dtw+yoED2svQigShxH+/sRI32HSzCBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y0zgvE3zd0D6UMA2NwwUyc2OfEvY8SNnRt/5xTPJqlg8JcsM4to7jhmWGuYLpG1afylA0KKFs0zWIrKnvZSHzjQCnaXdNQb4ZaVJHH3jJ8k2LPF3+Y9L2fUO8XGvYgSH1O339U+vj9w63M27Th4gzjaU1CorGjqNcSup+jXsbyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCobJVC0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCobJVC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714844205; x=1746380205;
  h=date:from:to:cc:subject:message-id;
  bh=HBnX87ngA8C6dtw+yoED2svQigShxH+/sRI32HSzCBY=;
  b=dCobJVC0dpwoRwtxKHdXlJvwgudslGa/+joXnMc+6OaIxO9AxbkE8DoR
   KM7RvBbuFtsh8n6jfKK7BNC58Y1MjZpk0GQ569b7ln0opmYojZkxSKaly
   Kw6m/F3IY/GBOVmD+X+pDyo3eH2hYy+zNKs5ypeYZcvwbTGnoNTwL7e2t
   OuxIgMtdL83jRVUI0CLX6Wt/TTkzBC8cv9lgwPzwSSiA85aMkA2Yz1BT1
   RgIZjwlM2/mEYmblgev8YxM+H7oCyqCsfkJAYcdEcp8/n4K9YyFB7r/He
   mB6fDbOO5QOTRVfgyWXCApbrtezx3MrGmlFsuQKhEn5o7/H1+itNCWjeJ
   w==;
X-CSE-ConnectionGUID: /h6Sr7ojSTeeE/yw+TxXjQ==
X-CSE-MsgGUID: 9VKVi2vAQP2/7afeZhfWcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21790050"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="21790050"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 10:36:42 -0700
X-CSE-ConnectionGUID: NGfL+2bXTWOb9aoTT13HCQ==
X-CSE-MsgGUID: e74nEq6sQwyFPrEHWHH2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="27779306"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 May 2024 10:36:41 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3JJO-000D0l-2a;
	Sat, 04 May 2024 17:36:38 +0000
Date: Sun, 05 May 2024 01:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 45bf8305fb2ef684e53fd0dcf1cc7e7b456f3478
Message-ID: <202405050102.LBwlQtuB-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 45bf8305fb2ef684e53fd0dcf1cc7e7b456f3478  hwmon: (max6639) Use regmap

Unverified Error/Warning (likely false positive, please contact us if interested):

{standard input}:954: Error: unknown pseudo-op: `.l158'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-randconfig-r004-20220919
    `-- standard-input:Error:unknown-pseudo-op:l158

elapsed time: 1455m

configs tested: 146
configs skipped: 3

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240504   gcc  
arc                   randconfig-002-20240504   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                          ixp4xx_defconfig   gcc  
arm                            mps2_defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                   randconfig-001-20240504   clang
arm                   randconfig-002-20240504   clang
arm                   randconfig-003-20240504   clang
arm                   randconfig-004-20240504   clang
arm                           tegra_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240504   gcc  
arm64                 randconfig-002-20240504   gcc  
arm64                 randconfig-003-20240504   gcc  
arm64                 randconfig-004-20240504   clang
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240504   gcc  
csky                  randconfig-002-20240504   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240504   clang
hexagon               randconfig-002-20240504   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240504   clang
i386         buildonly-randconfig-002-20240504   gcc  
i386         buildonly-randconfig-003-20240504   gcc  
i386         buildonly-randconfig-004-20240504   clang
i386         buildonly-randconfig-005-20240504   clang
i386         buildonly-randconfig-006-20240504   clang
i386                                defconfig   clang
i386                  randconfig-001-20240504   gcc  
i386                  randconfig-002-20240504   clang
i386                  randconfig-003-20240504   gcc  
i386                  randconfig-004-20240504   clang
i386                  randconfig-005-20240504   clang
i386                  randconfig-006-20240504   gcc  
i386                  randconfig-011-20240504   gcc  
i386                  randconfig-012-20240504   clang
i386                  randconfig-013-20240504   clang
i386                  randconfig-014-20240504   gcc  
i386                  randconfig-015-20240504   gcc  
i386                  randconfig-016-20240504   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240504   gcc  
loongarch             randconfig-002-20240504   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240504   gcc  
nios2                 randconfig-002-20240504   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240504   gcc  
parisc                randconfig-002-20240504   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc               randconfig-001-20240504   gcc  
powerpc               randconfig-002-20240504   gcc  
powerpc               randconfig-003-20240504   gcc  
powerpc64             randconfig-001-20240504   clang
powerpc64             randconfig-002-20240504   clang
powerpc64             randconfig-003-20240504   clang
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                 randconfig-001-20240504   gcc  
riscv                 randconfig-002-20240504   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240504   clang
s390                  randconfig-002-20240504   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240504   gcc  
sh                    randconfig-002-20240504   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240504   gcc  
sparc64               randconfig-002-20240504   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240504   gcc  
um                    randconfig-002-20240504   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240504   gcc  
x86_64       buildonly-randconfig-002-20240504   clang
x86_64       buildonly-randconfig-003-20240504   gcc  
x86_64       buildonly-randconfig-004-20240504   gcc  
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240504   gcc  
xtensa                randconfig-002-20240504   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
