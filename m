Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDA024C09A
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Mar 2025 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100708; cv=none; b=IZruyfNn/O+ViYQNqgCiQbB6KkjsTQj1ly50P+JaRUmf3kRjxixW1VuyWlcmOdu0jX9viDSjo7igFZOGGHB7B1vTN9KnZmU78jj9dEe8V9P+1ZUOM5Ih7FUgKrPPAQ/ezOeJr7liaIFLWhN1X2O8PjqXQWH3SucwDKQQX0/S0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100708; c=relaxed/simple;
	bh=DMKhVtYTdOj/c3UgVR2BO+THXxtuJurKGH4IoMgaGHU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kt6P4ckEKIX7d8WUYE8onD5bjGWiCVqsrla2QePlUJkqtmDBvHEBgeEtIKmrmUY5kw+/+Nmg31NMu0vKw2Hndr6UNYddfYLd/QlJYN4Kv379pBkFMqV5NC6H/5dwXPuFpdnabRADkQOBdVWW1wIv7qj1EfM/Pxxxkm+kvsujGjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJ+F82bR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJ+F82bR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741100706; x=1772636706;
  h=date:from:to:cc:subject:message-id;
  bh=DMKhVtYTdOj/c3UgVR2BO+THXxtuJurKGH4IoMgaGHU=;
  b=QJ+F82bRiX3CA5cIQGgj6zGLDlOvpIiNooHkYV+AQEB54jYZGqfQedgA
   VyWrQ+xZjWBbulTXlSIXzFvjhpGKK5Ix/KJQaWsHincQBp0vSynEqdZoz
   wAMG1qQW0KH5SOc3Fc0Ixdiq12TAnLRMeMBS6MptgpaFvqXEiKibUGQb+
   ifOXBU4KMXVamaBoTpTzigq2bGq5Sf6U4k6dpCLUoU6oZYmoqH0SwVX3L
   1XDo15r9hZ9WjF5cZaAD9/LeBXQ3m79GjCLNRN61F7dlcgAvqkc+h136t
   wqE9OZL1Vw5d5Y0NpRZv6i2E7sLDOsIocIbzWmDTqvoeWAJIdbtdaQrtB
   w==;
X-CSE-ConnectionGUID: UbZfLyP0TLWa/Nd54ZNnbA==
X-CSE-MsgGUID: tsNZRVAwQPqi8X2IvqkuSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42215320"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="42215320"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 07:05:04 -0800
X-CSE-ConnectionGUID: NGo8laLNSHOZYi8A+4QaZQ==
X-CSE-MsgGUID: s0wTYnDMTg+W5NiUpRt8nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118403059"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2025 07:05:02 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpTpM-000JvL-0J;
	Tue, 04 Mar 2025 15:05:00 +0000
Date: Tue, 04 Mar 2025 23:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 10fce7ebe888fa8c97eee7e317a47e7603e5e78d
Message-ID: <202503042311.fkzHGCg5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 10fce7ebe888fa8c97eee7e317a47e7603e5e78d  hwmon: fix a NULL vs IS_ERR_OR_NULL() check in xgene_hwmon_probe()

elapsed time: 1450m

configs tested: 117
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250304    gcc-13.2.0
arc                   randconfig-002-20250304    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         nhk8815_defconfig    clang-21
arm                   randconfig-001-20250304    clang-21
arm                   randconfig-002-20250304    gcc-14.2.0
arm                   randconfig-003-20250304    clang-21
arm                   randconfig-004-20250304    gcc-14.2.0
arm                             rpc_defconfig    clang-17
arm                       spear13xx_defconfig    gcc-14.2.0
arm                           spitz_defconfig    gcc-14.2.0
arm                           u8500_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250304    clang-21
arm64                 randconfig-002-20250304    gcc-14.2.0
arm64                 randconfig-003-20250304    gcc-14.2.0
arm64                 randconfig-004-20250304    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250304    gcc-14.2.0
csky                  randconfig-002-20250304    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250304    clang-21
hexagon               randconfig-002-20250304    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250304    clang-19
i386        buildonly-randconfig-002-20250304    clang-19
i386        buildonly-randconfig-003-20250304    gcc-12
i386        buildonly-randconfig-004-20250304    gcc-11
i386        buildonly-randconfig-005-20250304    gcc-11
i386        buildonly-randconfig-006-20250304    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250304    gcc-14.2.0
loongarch             randconfig-002-20250304    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       bvme6000_defconfig    gcc-14.2.0
m68k                        m5272c3_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250304    gcc-14.2.0
nios2                 randconfig-002-20250304    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250304    gcc-14.2.0
parisc                randconfig-002-20250304    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                      chrp32_defconfig    clang-21
powerpc                      mgcoge_defconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250304    gcc-14.2.0
powerpc               randconfig-002-20250304    gcc-14.2.0
powerpc               randconfig-003-20250304    clang-21
powerpc                    sam440ep_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250304    gcc-14.2.0
powerpc64             randconfig-002-20250304    gcc-14.2.0
powerpc64             randconfig-003-20250304    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250304    gcc-14.2.0
riscv                 randconfig-002-20250304    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250304    clang-15
s390                  randconfig-002-20250304    clang-15
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250304    gcc-14.2.0
sh                    randconfig-002-20250304    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250304    gcc-14.2.0
sparc                 randconfig-002-20250304    gcc-14.2.0
sparc64               randconfig-001-20250304    gcc-14.2.0
sparc64               randconfig-002-20250304    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250304    gcc-12
um                    randconfig-002-20250304    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250303    clang-19
x86_64      buildonly-randconfig-002-20250303    gcc-12
x86_64      buildonly-randconfig-003-20250303    clang-19
x86_64      buildonly-randconfig-004-20250303    gcc-12
x86_64      buildonly-randconfig-005-20250303    gcc-12
x86_64      buildonly-randconfig-006-20250303    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250304    gcc-14.2.0
xtensa                randconfig-002-20250304    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
