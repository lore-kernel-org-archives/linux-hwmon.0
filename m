Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0297C1B940
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Feb 2024 17:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708882432; cv=none; b=Kvl+C115UipVrZJmF/LG3N+1hAN8zO3fmchRdsYa9qYb68Wsv/xOSQe2s7TY4rRl4JVNW27VYcosOcBq0W8+SVYSV/TAKR6OUevVpjIj0dhQvfIppwvGhSVvWurE3Ajw2mI80CJxRJmxCDg0UsOrIwHYBEillx0zDkPBBVGqPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708882432; c=relaxed/simple;
	bh=4oMFKIZP8c5SWTj2VWtmTZF5YFdBlKy/aX2TUoK4l9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/lhOOljBv6/XbW3hQRR13AsP2uROKedLbJTzhylaDAHyX0e2MjyVshYVTB8iysWidiBwq7wtgsFw+AE1JnpdcADvmeCbA23TGA4ERNdkAfftv/vIOWTjBSo2YKSjZ4PQG7rYNP15bv7AwmR4J+3ZzhHDl6inzRC66y/R7HTlew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJlrXWeS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJlrXWeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708882430; x=1740418430;
  h=date:from:to:cc:subject:message-id;
  bh=4oMFKIZP8c5SWTj2VWtmTZF5YFdBlKy/aX2TUoK4l9U=;
  b=SJlrXWeS9sa8LkdZO14CnQaMu0C85zaKqSm2hFaB2wpH8iVoA8jkMi62
   7Ij9RhqMbVMInA7lA+9gJTEsVoM+Y2m45c/ymccXXgWuJqtEekcCLsQOW
   +3jGbZ0NdAIUlkcENQ+swVw/SHD6XHszlYfs2/Lo3gyhLKBkn1/EXTPi3
   +VsoPV2g7J3IYuv3ZpaKzqpEIjJTgus74LCokBPySqFdPTAxKmipx76oj
   dwjNI7ekoSQaaGmEGElByazoqQU849eKY770CUMwvebFL+rXvp/mmc7jq
   S8h5vV68PmYg71H5lWBOo057v2IgvfqR9lm0uMJCsLGa362k//ORAbpN2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="20706892"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="20706892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 09:33:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="37418069"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Feb 2024 09:33:48 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reINb-0009he-0h;
	Sun, 25 Feb 2024 17:33:37 +0000
Date: Mon, 26 Feb 2024 01:33:20 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 b40410c0849c99d71edec1d90b3b6a71a8926fc2
Message-ID: <202402260117.H3eLijfI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b40410c0849c99d71edec1d90b3b6a71a8926fc2  dt-bindings: hwmon: reference common hwmon schema

elapsed time: 1294m

configs tested: 180
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
arc                   randconfig-001-20240225   gcc  
arc                   randconfig-002-20240225   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                           imxrt_defconfig   clang
arm                         nhk8815_defconfig   clang
arm                   randconfig-001-20240225   clang
arm                   randconfig-002-20240225   gcc  
arm                   randconfig-003-20240225   clang
arm                   randconfig-004-20240225   clang
arm                           sama5_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240225   gcc  
arm64                 randconfig-002-20240225   clang
arm64                 randconfig-003-20240225   gcc  
arm64                 randconfig-004-20240225   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240225   gcc  
csky                  randconfig-002-20240225   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240225   clang
hexagon               randconfig-002-20240225   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240225   gcc  
i386         buildonly-randconfig-002-20240225   gcc  
i386         buildonly-randconfig-003-20240225   clang
i386         buildonly-randconfig-004-20240225   gcc  
i386         buildonly-randconfig-005-20240225   clang
i386         buildonly-randconfig-006-20240225   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240225   gcc  
i386                  randconfig-002-20240225   clang
i386                  randconfig-003-20240225   clang
i386                  randconfig-004-20240225   gcc  
i386                  randconfig-005-20240225   gcc  
i386                  randconfig-006-20240225   gcc  
i386                  randconfig-011-20240225   clang
i386                  randconfig-012-20240225   gcc  
i386                  randconfig-013-20240225   gcc  
i386                  randconfig-014-20240225   clang
i386                  randconfig-015-20240225   gcc  
i386                  randconfig-016-20240225   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240225   gcc  
loongarch             randconfig-002-20240225   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            q40_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240225   gcc  
nios2                 randconfig-002-20240225   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240225   gcc  
parisc                randconfig-002-20240225   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc               randconfig-001-20240225   clang
powerpc               randconfig-002-20240225   clang
powerpc               randconfig-003-20240225   clang
powerpc                     sequoia_defconfig   clang
powerpc64             randconfig-001-20240225   gcc  
powerpc64             randconfig-002-20240225   clang
powerpc64             randconfig-003-20240225   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240225   gcc  
riscv                 randconfig-002-20240225   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240225   gcc  
s390                  randconfig-002-20240225   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240225   gcc  
sh                    randconfig-002-20240225   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240225   gcc  
sparc64               randconfig-002-20240225   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240225   clang
um                    randconfig-002-20240225   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240225   clang
x86_64       buildonly-randconfig-002-20240225   clang
x86_64       buildonly-randconfig-003-20240225   clang
x86_64       buildonly-randconfig-004-20240225   gcc  
x86_64       buildonly-randconfig-005-20240225   clang
x86_64       buildonly-randconfig-006-20240225   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240225   gcc  
x86_64                randconfig-002-20240225   clang
x86_64                randconfig-003-20240225   gcc  
x86_64                randconfig-004-20240225   clang
x86_64                randconfig-005-20240225   clang
x86_64                randconfig-006-20240225   gcc  
x86_64                randconfig-011-20240225   clang
x86_64                randconfig-012-20240225   clang
x86_64                randconfig-013-20240225   gcc  
x86_64                randconfig-014-20240225   gcc  
x86_64                randconfig-015-20240225   clang
x86_64                randconfig-016-20240225   gcc  
x86_64                randconfig-071-20240225   gcc  
x86_64                randconfig-072-20240225   gcc  
x86_64                randconfig-073-20240225   clang
x86_64                randconfig-074-20240225   gcc  
x86_64                randconfig-075-20240225   clang
x86_64                randconfig-076-20240225   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240225   gcc  
xtensa                randconfig-002-20240225   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
