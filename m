Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BD57C6D2
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Feb 2024 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708185705; cv=none; b=eTfA/IXl92EtZM38alGqj3ARiVzFW0EDZJIupEUr5yLqxTX258udIPcGvnybU/kU+l4wzU60Sxy98TxOGNaIKIGvVLQrAdi+ffQUT8fuDnaNBMgpYQckeGt8+eLvtvwFDQtxYCKXGg8KIBy3nGU5KAGEiZasELH6dfSZFwtNHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708185705; c=relaxed/simple;
	bh=S63Rx09Pu6FHc8j+gIXmau30uTOABolbfA0Je6m9jnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OGw+JUcUK/dN/tjifzPhyv/LAAJrPS6XOmJRis41hhoyV5eIdcG/30XSMzLcilpfmLIa55UF3xTTrkOTgXM0bYSJwUpXu6dXuSTA3xCbXRKPrV4RwI/BnVc/LYQaomKQZv6VTqf+q1iXZvFtMf++AvMnygCdaQoysuevfKe6wLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IffR4qWH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IffR4qWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708185703; x=1739721703;
  h=date:from:to:cc:subject:message-id;
  bh=S63Rx09Pu6FHc8j+gIXmau30uTOABolbfA0Je6m9jnk=;
  b=IffR4qWHUzQl4MkQyAQ0FSzTXU3wALLoV02Jyby4Ge7/mXUWXk8tGZuv
   2XZaNSRLLKY8ghtukjlhHFmZqgndNbEViw7BaWtHMCNkr3qXuh1+edoc3
   UpSLSIPInQiktbcyBVtWBVcdq8B9apQQ+C9FClRaoJhuUOREJTNxtQ6Vl
   +ucQdFhPpPcwEUCnN7AY1XX5LO7u6ja0xwWn/uaANDeXbgpdVW51oMMZ+
   Pq2ZhgXZq93nwv5Xlk41eVLfhbUTFhJ13vlobswRadN9xKEDotjt0ZjV+
   lA8Snd+guZrIf8I5hAzcuPhCddvLxFFjMZhgtLdaX4obMsO42J2ZA6zQ8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="6110055"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="6110055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 08:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="41589083"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Feb 2024 08:01:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbN8E-0002EH-18;
	Sat, 17 Feb 2024 16:01:38 +0000
Date: Sun, 18 Feb 2024 00:00:28 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 bd107d86bb292a25feca32a8115152608172ff98
Message-ID: <202402180026.3U5xmw6U-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: bd107d86bb292a25feca32a8115152608172ff98  hwmon: (max6620) Update broken Datasheet URL in driver documentation

elapsed time: 1461m

configs tested: 160
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
arc                   randconfig-001-20240217   gcc  
arc                   randconfig-002-20240217   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240217   clang
arm                   randconfig-002-20240217   gcc  
arm                   randconfig-003-20240217   gcc  
arm                   randconfig-004-20240217   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240217   clang
arm64                 randconfig-002-20240217   gcc  
arm64                 randconfig-003-20240217   gcc  
arm64                 randconfig-004-20240217   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240217   gcc  
csky                  randconfig-002-20240217   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240217   clang
hexagon               randconfig-002-20240217   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240217   gcc  
i386         buildonly-randconfig-002-20240217   clang
i386         buildonly-randconfig-003-20240217   gcc  
i386         buildonly-randconfig-004-20240217   gcc  
i386         buildonly-randconfig-005-20240217   gcc  
i386         buildonly-randconfig-006-20240217   clang
i386                                defconfig   clang
i386                  randconfig-001-20240217   gcc  
i386                  randconfig-002-20240217   gcc  
i386                  randconfig-003-20240217   clang
i386                  randconfig-004-20240217   gcc  
i386                  randconfig-005-20240217   gcc  
i386                  randconfig-006-20240217   clang
i386                  randconfig-011-20240217   gcc  
i386                  randconfig-012-20240217   gcc  
i386                  randconfig-013-20240217   clang
i386                  randconfig-014-20240217   clang
i386                  randconfig-015-20240217   clang
i386                  randconfig-016-20240217   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240217   gcc  
loongarch             randconfig-002-20240217   gcc  
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
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240217   gcc  
nios2                 randconfig-002-20240217   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240217   gcc  
parisc                randconfig-002-20240217   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240217   gcc  
powerpc               randconfig-002-20240217   gcc  
powerpc               randconfig-003-20240217   gcc  
powerpc64             randconfig-001-20240217   clang
powerpc64             randconfig-002-20240217   gcc  
powerpc64             randconfig-003-20240217   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240217   gcc  
riscv                 randconfig-002-20240217   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240217   clang
s390                  randconfig-002-20240217   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240217   gcc  
sh                    randconfig-002-20240217   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240217   gcc  
sparc64               randconfig-002-20240217   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240217   clang
um                    randconfig-002-20240217   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240217   gcc  
x86_64       buildonly-randconfig-002-20240217   clang
x86_64       buildonly-randconfig-003-20240217   gcc  
x86_64       buildonly-randconfig-004-20240217   gcc  
x86_64       buildonly-randconfig-005-20240217   clang
x86_64       buildonly-randconfig-006-20240217   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240217   gcc  
x86_64                randconfig-002-20240217   clang
x86_64                randconfig-003-20240217   clang
x86_64                randconfig-004-20240217   clang
x86_64                randconfig-005-20240217   clang
x86_64                randconfig-006-20240217   clang
x86_64                randconfig-011-20240217   gcc  
x86_64                randconfig-012-20240217   gcc  
x86_64                randconfig-013-20240217   clang
x86_64                randconfig-014-20240217   gcc  
x86_64                randconfig-015-20240217   gcc  
x86_64                randconfig-016-20240217   clang
x86_64                randconfig-071-20240217   gcc  
x86_64                randconfig-072-20240217   gcc  
x86_64                randconfig-073-20240217   gcc  
x86_64                randconfig-074-20240217   clang
x86_64                randconfig-075-20240217   gcc  
x86_64                randconfig-076-20240217   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-002-20240217   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
