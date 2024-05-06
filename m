Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B8D81ACA
	for <linux-hwmon@vger.kernel.org>; Mon,  6 May 2024 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715004150; cv=none; b=Gbriixow/yKEpBHiMWQ9DPhv1zD+75rvPXxsLShAjfv8tRGusuCobf+4bAsUQTmzr0XyAWQ337D+zoKGQfNSIufvWjjcR2r7L/opjkTzsMBjMMtBnj7FvUOQm/5VjSTU3ydKyfrlj6dDXrJrOCUVgVnyv9JL6qwznfBUVo1q9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715004150; c=relaxed/simple;
	bh=gCHV9+P76VJZZ44GQSUekROGE0+JZf4kmYA1euQLXsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hkjm8zj71PDK+NMk81asRNr4LGDyGWwEosQ+1Rh1nZgjtuMMcqmf9R4zyKRqAndySAyacDSsi1DvdQX1ji5T5WZzrSmYKdtxvzn9AXtGRzLoi68eenip8tdY0712QteEgwZ0dCBaA848yiboaAjUHSMRe8X8jG90pDCgiY9tCjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZ4T+jFI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ4T+jFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715004148; x=1746540148;
  h=date:from:to:cc:subject:message-id;
  bh=gCHV9+P76VJZZ44GQSUekROGE0+JZf4kmYA1euQLXsE=;
  b=gZ4T+jFI3BGR/I42liKMg2nFfUdVuM3xZeNXKQwbPSTtWYWoz825OOAk
   P4JpuIt2ud03pZikj6dPDdrohrN1TXvC8/k5w9KIj0MPIb2ZoQagzxAl9
   Jz7NwVuf3STVcxWyLcV14wWv2OSy5yhvkg5CbIRPU6DcrF14W2flXP2bj
   8cQc+jxpSBgZ7+Vi9pBmjJnTfZp8eLPyGcgLMscNi3W3OZKbLF1TLDG4m
   FBk6dUNJwetRtzFrknRrvJRBuj77oH5VNRCbt7GpeMqpPBvJBxPjY1bZp
   q0sP5PLfzU/IgfQwjvgtUZbrNveRE239NP/V4XSQXFl4IdRXBMUzDyW9m
   w==;
X-CSE-ConnectionGUID: XpxUEyiBSJKqhS/4zkKhgA==
X-CSE-MsgGUID: hsK9NXaKR3698B2Y9x7wuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21426474"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="21426474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:02:28 -0700
X-CSE-ConnectionGUID: iaSohf/jSha5tn2WyJ9v0w==
X-CSE-MsgGUID: 3U5ihPd3RaiCTTtessgq8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28263864"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 May 2024 07:02:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3yvA-0000hd-1o;
	Mon, 06 May 2024 14:02:24 +0000
Date: Mon, 06 May 2024 22:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 4524842997db0c7e6a87fb959162e57ea4355345
Message-ID: <202405062230.NicRZ5Up-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 4524842997db0c7e6a87fb959162e57ea4355345  Merge branch 'kunit-v4' into testing

elapsed time: 727m

configs tested: 179
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
arc                   randconfig-001-20240506   gcc  
arc                   randconfig-002-20240506   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                   randconfig-001-20240506   clang
arm                   randconfig-002-20240506   clang
arm                   randconfig-003-20240506   gcc  
arm                   randconfig-004-20240506   clang
arm                         s5pv210_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240506   gcc  
arm64                 randconfig-002-20240506   gcc  
arm64                 randconfig-003-20240506   clang
arm64                 randconfig-004-20240506   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240506   gcc  
csky                  randconfig-002-20240506   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240506   clang
hexagon               randconfig-002-20240506   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240506   gcc  
i386         buildonly-randconfig-002-20240506   clang
i386         buildonly-randconfig-003-20240506   gcc  
i386         buildonly-randconfig-004-20240506   gcc  
i386         buildonly-randconfig-005-20240506   gcc  
i386         buildonly-randconfig-006-20240506   clang
i386                                defconfig   clang
i386                  randconfig-001-20240506   gcc  
i386                  randconfig-002-20240506   clang
i386                  randconfig-003-20240506   gcc  
i386                  randconfig-004-20240506   clang
i386                  randconfig-005-20240506   clang
i386                  randconfig-006-20240506   gcc  
i386                  randconfig-011-20240506   gcc  
i386                  randconfig-012-20240506   gcc  
i386                  randconfig-013-20240506   gcc  
i386                  randconfig-014-20240506   clang
i386                  randconfig-015-20240506   clang
i386                  randconfig-016-20240506   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240506   gcc  
loongarch             randconfig-002-20240506   gcc  
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
mips                     loongson1b_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240506   gcc  
nios2                 randconfig-002-20240506   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc                randconfig-001-20240506   gcc  
parisc                randconfig-002-20240506   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     kilauea_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc               randconfig-001-20240506   gcc  
powerpc               randconfig-002-20240506   clang
powerpc               randconfig-003-20240506   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240506   clang
powerpc64             randconfig-002-20240506   clang
powerpc64             randconfig-003-20240506   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240506   clang
riscv                 randconfig-002-20240506   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240506   gcc  
s390                  randconfig-002-20240506   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                    randconfig-001-20240506   gcc  
sh                    randconfig-002-20240506   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240506   gcc  
sparc64               randconfig-002-20240506   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240506   clang
um                    randconfig-002-20240506   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240506   gcc  
x86_64       buildonly-randconfig-002-20240506   gcc  
x86_64       buildonly-randconfig-003-20240506   gcc  
x86_64       buildonly-randconfig-004-20240506   clang
x86_64       buildonly-randconfig-005-20240506   clang
x86_64       buildonly-randconfig-006-20240506   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240506   clang
x86_64                randconfig-002-20240506   clang
x86_64                randconfig-003-20240506   clang
x86_64                randconfig-004-20240506   clang
x86_64                randconfig-005-20240506   clang
x86_64                randconfig-006-20240506   clang
x86_64                randconfig-011-20240506   gcc  
x86_64                randconfig-012-20240506   gcc  
x86_64                randconfig-013-20240506   gcc  
x86_64                randconfig-014-20240506   gcc  
x86_64                randconfig-015-20240506   gcc  
x86_64                randconfig-016-20240506   gcc  
x86_64                randconfig-071-20240506   gcc  
x86_64                randconfig-072-20240506   clang
x86_64                randconfig-073-20240506   gcc  
x86_64                randconfig-074-20240506   clang
x86_64                randconfig-075-20240506   gcc  
x86_64                randconfig-076-20240506   clang
x86_64                          rhel-8.3-rust   clang
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240506   gcc  
xtensa                randconfig-002-20240506   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
