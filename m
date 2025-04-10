Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5191EB9F9
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744323638; cv=none; b=fEJUKL9yF97dJNwdPcwrseQm3qTTJhhthhJfAxVdsvgU4pAcxxW8dCiTWGA+p0dRKX258zTK7qQJ4lrmPaC0wJwYL5JsM4F2bD+moKnCSAfetIp66fwaQtyi0DeuxJFlkYKPoqP682CgE6INuD1Qox8S5Xa+xWGa5u6VkZiCB0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744323638; c=relaxed/simple;
	bh=BqQxQYlOc4D9cifE9VfsUNrdIB9E2TwTe4IDGxk5vm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdQgmINYayYVd3HGwKzjsppedJc0bmZfzlTGtrX+nyNXhToA+4nkRO/b6UlfMA7GxtAFKETpsp8a/rC0d2veqW4HcdR/ex43ZzkfdlyWcZEoavxB9QT51lyjx4b50Qs2kAf2nPKqovp9PQKpPOGKF+020dDtvz3dfZTn7yxlK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6N0DC4P; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6N0DC4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744323636; x=1775859636;
  h=date:from:to:cc:subject:message-id;
  bh=BqQxQYlOc4D9cifE9VfsUNrdIB9E2TwTe4IDGxk5vm4=;
  b=I6N0DC4P07cWVsCvmj6UGSdvJubp1LTcYU6LShDQ+5jnmvRBeJkdDUWf
   hoYZfh856oiGYpKlYcG0SWuk68azxkBtoAhaVZR3qPhxMky6hGD7hKiS4
   FErwUSTWHHS9h2WH4cJBxJ28NrMLg9+j3/bNBqeuso4RsaHhURLL0D+0z
   ODdarLW6R9WCmUQ5qGPGBBj9mpCpxVCH6HSyCPTV0f7bl1C97xevnBJ/0
   SSE1qdfnX6o5EXRttWBAyj6OY/vmqkUAfspk/OzWQO5Sub4j5akvoTWvl
   2eDc7eRU4uQFjav5P1NJ+a+o6hQxk9SerHpNGJck9JkkVP+Q8iBLIiW+g
   g==;
X-CSE-ConnectionGUID: oBfj9Z5DTVOme83wU2tS7g==
X-CSE-MsgGUID: YO6yNT0DQvenHLPH+SjwPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45878742"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="45878742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 15:20:36 -0700
X-CSE-ConnectionGUID: /hpJ2cmFSE2+wkgF3ip50Q==
X-CSE-MsgGUID: InCztdSQTVqrMFS2ySdx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133127030"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Apr 2025 15:20:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u30G8-000Aal-30;
	Thu, 10 Apr 2025 22:20:32 +0000
Date: Fri, 11 Apr 2025 06:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 0e2920a312ee8cfd81104bcf98d287da4d318ac2
Message-ID: <202504110604.1ZDaJORI-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 0e2920a312ee8cfd81104bcf98d287da4d318ac2  Merge branch 'fixes-v6.15' into testing

elapsed time: 1462m

configs tested: 98
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250410    gcc-14.2.0
arc                   randconfig-002-20250410    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                           h3600_defconfig    gcc-14.2.0
arm                   randconfig-001-20250410    clang-21
arm                   randconfig-002-20250410    clang-18
arm                   randconfig-003-20250410    gcc-7.5.0
arm                   randconfig-004-20250410    gcc-8.5.0
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250410    clang-21
arm64                 randconfig-002-20250410    clang-21
arm64                 randconfig-003-20250410    gcc-6.5.0
arm64                 randconfig-004-20250410    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250410    gcc-14.2.0
csky                  randconfig-002-20250410    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250410    clang-21
hexagon               randconfig-002-20250410    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250410    clang-20
i386        buildonly-randconfig-002-20250410    clang-20
i386        buildonly-randconfig-003-20250410    clang-20
i386        buildonly-randconfig-004-20250410    gcc-11
i386        buildonly-randconfig-005-20250410    clang-20
i386        buildonly-randconfig-006-20250410    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250410    gcc-12.4.0
loongarch             randconfig-002-20250410    gcc-12.4.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250410    gcc-14.2.0
nios2                 randconfig-002-20250410    gcc-10.5.0
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250410    gcc-5.5.0
parisc                randconfig-002-20250410    gcc-11.5.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250410    gcc-6.5.0
powerpc               randconfig-002-20250410    gcc-6.5.0
powerpc               randconfig-003-20250410    clang-21
powerpc64             randconfig-001-20250410    clang-21
powerpc64             randconfig-002-20250410    clang-21
powerpc64             randconfig-003-20250410    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250410    clang-21
riscv                 randconfig-002-20250410    gcc-8.5.0
s390                             allmodconfig    clang-21
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250410    clang-17
s390                  randconfig-002-20250410    gcc-6.5.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250410    gcc-12.4.0
sh                    randconfig-002-20250410    gcc-10.5.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250410    gcc-10.3.0
sparc                 randconfig-002-20250410    gcc-7.5.0
sparc64               randconfig-001-20250410    gcc-7.5.0
sparc64               randconfig-002-20250410    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250410    clang-21
um                    randconfig-002-20250410    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250410    clang-20
x86_64      buildonly-randconfig-002-20250410    gcc-12
x86_64      buildonly-randconfig-003-20250410    clang-20
x86_64      buildonly-randconfig-004-20250410    clang-20
x86_64      buildonly-randconfig-005-20250410    clang-20
x86_64      buildonly-randconfig-006-20250410    clang-20
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250410    gcc-14.2.0
xtensa                randconfig-002-20250410    gcc-7.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
