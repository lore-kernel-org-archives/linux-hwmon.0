Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E161E528
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jul 2024 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721149034; cv=none; b=pWCH94ZGINxiQxfQRuGuAPsAiJpWEJWvwHNL0jSUFgY8LWCCiTmtRIpqQ0cP7n0ketG6ET657lvmuO3u5/d0yjYl7cmBkuh5GPTRNUsiNDDrkjHf3qMG7A2/iPgSrhQkl9z9+U8j3t4xstX2myHGctUwpsrARJvvdpGu3t4MDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721149034; c=relaxed/simple;
	bh=FTYLozzIDBa35YXReDeWMi9G1WCwjiMTE0Nja9t2vVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PvZVJrEU+DrtBef74gZEg4SRSR1Io26kEwPKJGIXyrqhe/NYyZSfKUJXJ4nuTvkmclSrPcnl6PSDZfpB99FiIqVA18VBUo8su+n1ZaAgAzOQ5uSVaUiayBaFCGYASkMc8G8MYdN0sqnm29ZBT7iDrTOH3aS+BX+fbCl6M49n9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dHVbiVdq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dHVbiVdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721149033; x=1752685033;
  h=date:from:to:cc:subject:message-id;
  bh=FTYLozzIDBa35YXReDeWMi9G1WCwjiMTE0Nja9t2vVI=;
  b=dHVbiVdq5Dh5u1qe/ZV+xmqx8J8j6GtfKy3Yc1zV6GDMQsotX4MmCdVZ
   gr9mhlGLhtQSzqbDjmaMsrjUOVIGwazUemgCIkv1utIOH21iK9vENJSC5
   N4ahbza+2e0TeCBvD4836nJXPmrOHUWiV4rzfPeXZgIrnOotoipkFO9Nz
   t2fM24iWC7BJNlKoJ9CAEBfutqB2F4OlDMdkTQ/6QPWn7O36H7Lu+Owvr
   T2JrTrNmkvtVf6kLghtS2f0qHpBazbkEAww4EwB+VeXVz8T9KMpm5YeZW
   CP7Ju2BIyXcxEqWDGUEx5pj1zVwPBReoPFLLpPzVxR21HIxCwTqdtQOnP
   w==;
X-CSE-ConnectionGUID: hcISzMmwSLm9u4qGZabllg==
X-CSE-MsgGUID: V1oCbaLERsCZXWZFPklnag==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18451218"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="18451218"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 09:57:10 -0700
X-CSE-ConnectionGUID: +ZD5Q0VGThKCF7wtV3PzUQ==
X-CSE-MsgGUID: V9yIIw9cQmC/xtZq3IGZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="50004699"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Jul 2024 09:57:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTlUA-000fTG-1C;
	Tue, 16 Jul 2024 16:57:06 +0000
Date: Wed, 17 Jul 2024 00:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 5aea0981492ebc4dfb59b4eb7f2c092e2c48cf1b
Message-ID: <202407170027.yJ0fxQHc-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 5aea0981492ebc4dfb59b4eb7f2c092e2c48cf1b  Merge branch 'kunit-improvements' into testing

elapsed time: 828m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                   randconfig-001-20240716   gcc-13.2.0
arc                   randconfig-002-20240716   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-19
arm                              allyesconfig   gcc-14.1.0
arm                   randconfig-001-20240716   gcc-14.1.0
arm                   randconfig-002-20240716   clang-19
arm                   randconfig-003-20240716   gcc-14.1.0
arm                   randconfig-004-20240716   gcc-14.1.0
arm64                            allmodconfig   clang-19
arm64                             allnoconfig   gcc-14.1.0
arm64                 randconfig-001-20240716   gcc-14.1.0
arm64                 randconfig-002-20240716   clang-19
arm64                 randconfig-003-20240716   gcc-14.1.0
arm64                 randconfig-004-20240716   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                  randconfig-001-20240716   gcc-14.1.0
csky                  randconfig-002-20240716   gcc-14.1.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon               randconfig-001-20240716   clang-19
hexagon               randconfig-002-20240716   clang-19
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240716   clang-18
i386         buildonly-randconfig-002-20240716   clang-18
i386         buildonly-randconfig-003-20240716   clang-18
i386         buildonly-randconfig-004-20240716   clang-18
i386         buildonly-randconfig-005-20240716   clang-18
i386         buildonly-randconfig-006-20240716   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240716   clang-18
i386                  randconfig-002-20240716   clang-18
i386                  randconfig-003-20240716   gcc-9
i386                  randconfig-004-20240716   gcc-7
i386                  randconfig-005-20240716   clang-18
i386                  randconfig-006-20240716   gcc-9
i386                  randconfig-011-20240716   gcc-8
i386                  randconfig-012-20240716   clang-18
i386                  randconfig-013-20240716   gcc-8
i386                  randconfig-014-20240716   clang-18
i386                  randconfig-015-20240716   clang-18
i386                  randconfig-016-20240716   gcc-10
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch             randconfig-001-20240716   gcc-14.1.0
loongarch             randconfig-002-20240716   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                 randconfig-001-20240716   gcc-14.1.0
nios2                 randconfig-002-20240716   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240716   gcc-14.1.0
parisc                randconfig-002-20240716   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-19
powerpc               randconfig-001-20240716   clang-19
powerpc               randconfig-002-20240716   clang-19
powerpc               randconfig-003-20240716   clang-19
powerpc64             randconfig-001-20240716   clang-19
powerpc64             randconfig-002-20240716   clang-19
powerpc64             randconfig-003-20240716   gcc-14.1.0
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-19
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240716   gcc-13
x86_64       buildonly-randconfig-002-20240716   clang-18
x86_64       buildonly-randconfig-003-20240716   clang-18
x86_64       buildonly-randconfig-004-20240716   clang-18
x86_64       buildonly-randconfig-005-20240716   clang-18
x86_64       buildonly-randconfig-006-20240716   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240716   gcc-13
x86_64                randconfig-002-20240716   gcc-8
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
