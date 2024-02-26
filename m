Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B777A73D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Feb 2024 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952973; cv=none; b=IUS48bdYCtLVdyUXv/gqm9D3+zafArBkuQmaRddd2vPaCMuFDP8byiGi6gw8kTc7Cun3V3eJfmF+QLFQ0K5ZvQkShRvZMsYEoHK7Sq6oD6Vms0H7UjEOyn5dfWyheARwUWj7K+t0PtptUpSZ5dCxMbmUZQy3/Ku0VtX2pz5EHG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952973; c=relaxed/simple;
	bh=Zy25gFQOkd5cog5Pqs0aiqNZW1LQH5qxkpByW/u8X4s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qkbi7DeByHLQLtAmdjpNqhyZWdVvlZkNCA3733bskwP7/EsxGxtb+SXBDcqFazADNXKOCL/mZuy8gcETf/DuLjuoGyXOZ0RHIbY1DPmeEtO73B75IdO/bOMiMIt1yte5LMXd9Ylb8B5CYPUWogsOXQlDMhhMJNkjoBHmgy7va10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOk7sSy2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOk7sSy2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708952972; x=1740488972;
  h=date:from:to:cc:subject:message-id;
  bh=Zy25gFQOkd5cog5Pqs0aiqNZW1LQH5qxkpByW/u8X4s=;
  b=UOk7sSy2yJ38QNRGyKGj/7UiAFyA79v8XBYcMYqvDcggH4rUnqEOnEJM
   Ww/ta7sHCJJRKyz6WgnognyH79Od4M8UmAcxO0TjeOoc0FmL4smtksns6
   ICDVJfrahDenbMjGF0rnYHidIWjGD1pGND7DNX+J/xjPx4AQGg5SuMZEH
   LveYgFyNjkb2VZUP8bPKlqVWP4H8+oWAVYsmLuWbwDnSKgOMiWDpjOOFF
   pH5ktGh7TsFDi2vMfI+/TCIavoItLHTjCrAyc/yvF6a7d6ZNnPw+yMC/Z
   lp7U5CxuQ1j2LU+H7Wv2u8NdKKiM1mi7ID69ljMoDUuHT4vvocf+eqFUS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3379014"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3379014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 05:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6800663"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2024 05:09:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reajL-000AJ5-0H;
	Mon, 26 Feb 2024 13:09:15 +0000
Date: Mon, 26 Feb 2024 21:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 8cb40ba0cf86094b0a524b06156e63c236ab1b8a
Message-ID: <202402262109.AcUB6cZN-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 8cb40ba0cf86094b0a524b06156e63c236ab1b8a  mean_and_variance: Drop always failing tests

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- csky-randconfig-002-20240226
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- powerpc-randconfig-002-20240226
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
|-- sh-randconfig-002-20240226
|   `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
`-- sparc-randconfig-001-20240226
    `-- lib-checksum_kunit.c:warning:expected_csum_ipv6_magic_corner-defined-but-not-used
clang_recent_errors
|-- hexagon-randconfig-r112-20240226
|   |-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-restricted-__be32-usertype
|   `-- lib-checksum_kunit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__wsum-usertype-csum-got-unsigned-int
|-- i386-buildonly-randconfig-005-20240226
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
|-- powerpc64-randconfig-003-20240226
|   `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner
`-- riscv-randconfig-001-20240226
    `-- lib-checksum_kunit.c:warning:unused-variable-expected_csum_ipv6_magic_corner

elapsed time: 760m

configs tested: 161
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
arc                   randconfig-001-20240226   gcc  
arc                   randconfig-002-20240226   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240226   clang
arm                   randconfig-002-20240226   clang
arm                   randconfig-003-20240226   clang
arm                   randconfig-004-20240226   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240226   gcc  
arm64                 randconfig-002-20240226   gcc  
arm64                 randconfig-003-20240226   gcc  
arm64                 randconfig-004-20240226   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240226   gcc  
csky                  randconfig-002-20240226   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240226   clang
hexagon               randconfig-002-20240226   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240226   clang
i386         buildonly-randconfig-002-20240226   gcc  
i386         buildonly-randconfig-003-20240226   clang
i386         buildonly-randconfig-004-20240226   clang
i386         buildonly-randconfig-005-20240226   clang
i386         buildonly-randconfig-006-20240226   clang
i386                                defconfig   clang
i386                  randconfig-001-20240226   clang
i386                  randconfig-002-20240226   gcc  
i386                  randconfig-003-20240226   clang
i386                  randconfig-004-20240226   gcc  
i386                  randconfig-005-20240226   clang
i386                  randconfig-006-20240226   clang
i386                  randconfig-011-20240226   gcc  
i386                  randconfig-012-20240226   gcc  
i386                  randconfig-013-20240226   gcc  
i386                  randconfig-014-20240226   gcc  
i386                  randconfig-015-20240226   gcc  
i386                  randconfig-016-20240226   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240226   gcc  
loongarch             randconfig-002-20240226   gcc  
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
nios2                 randconfig-001-20240226   gcc  
nios2                 randconfig-002-20240226   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240226   gcc  
parisc                randconfig-002-20240226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240226   clang
powerpc               randconfig-002-20240226   gcc  
powerpc               randconfig-003-20240226   clang
powerpc64             randconfig-001-20240226   clang
powerpc64             randconfig-002-20240226   gcc  
powerpc64             randconfig-003-20240226   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240226   clang
riscv                 randconfig-002-20240226   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240226   clang
s390                  randconfig-002-20240226   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240226   gcc  
sh                    randconfig-002-20240226   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240226   gcc  
sparc64               randconfig-002-20240226   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240226   clang
um                    randconfig-002-20240226   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240226   clang
x86_64       buildonly-randconfig-002-20240226   gcc  
x86_64       buildonly-randconfig-003-20240226   gcc  
x86_64       buildonly-randconfig-004-20240226   clang
x86_64       buildonly-randconfig-005-20240226   gcc  
x86_64       buildonly-randconfig-006-20240226   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240226   gcc  
x86_64                randconfig-002-20240226   gcc  
x86_64                randconfig-003-20240226   clang
x86_64                randconfig-004-20240226   clang
x86_64                randconfig-005-20240226   clang
x86_64                randconfig-006-20240226   gcc  
x86_64                randconfig-011-20240226   clang
x86_64                randconfig-012-20240226   clang
x86_64                randconfig-013-20240226   clang
x86_64                randconfig-014-20240226   clang
x86_64                randconfig-015-20240226   clang
x86_64                randconfig-016-20240226   clang
x86_64                randconfig-071-20240226   clang
x86_64                randconfig-072-20240226   gcc  
x86_64                randconfig-073-20240226   gcc  
x86_64                randconfig-074-20240226   clang
x86_64                randconfig-075-20240226   gcc  
x86_64                randconfig-076-20240226   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
