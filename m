Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A5248176
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Mar 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179394; cv=none; b=NdVwQwq9yihsDGbWM/YRthZ4nViFWxQG5JAWxZ+P5O8ZbJXRksRr7u6fGecXYaWxEF+gIIarPWLwR6w/PEr6R6LveoVXCOUKACwWiQ4JHR4tBk935ncSVwHFeHNNQk5n0RtaXIWzmAmJLNuqizL9zM1wQGuUj9gh6y+PQvTDLeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179394; c=relaxed/simple;
	bh=K7da3MzKEd0nn3HnPv23O+9gl/O5zjWRK3Tr/V1LzYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a89+UeCCF+bWCmFcn/NCYkjMKumWI+Kv6sJjD69xj5C4rjnvGg0kyopxItsv48xgSqxhdC/2O6MuANMynwS9rRQyDI05UdxDLeKCNRsVFdzmiTUgfkbhsUV0Ce+Zi26S2FeTVy9rxbQ6U3fs9HxIyx6zJ5TWq8oF407NkMKKPmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IvE8+bBi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IvE8+bBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741179392; x=1772715392;
  h=date:from:to:cc:subject:message-id;
  bh=K7da3MzKEd0nn3HnPv23O+9gl/O5zjWRK3Tr/V1LzYU=;
  b=IvE8+bBi/mKPdNyEanQTdtpthedxdl+Pcd6X9wD7MI7+RwbEOflTPrEf
   gofyMZEvXc7mVOkRc5zrzmmb2bgPKoWXHMYYHF957l41LQcOjhVGn0vHS
   NWWaYcGnnZfdy3KhDxmScA0W7RMEdHwG7NEzF9j0D64fbfoSMOvqNRfq6
   qC4rtaayNAnO3cRIb5fxbjYndtEFUILwYgwWil6J8VrORwskdYImMKCtn
   Pr1sN/7QsDtSdp/QAdALfx4Qn1Y1sNN12Fy4Nm4LQPKKKERLR0BsV+GPW
   YS1qfW0fpw7nltDo5rMQBTTT1NG8nO9DITDWmoXgyYDvvjZAEyvBCQsXz
   w==;
X-CSE-ConnectionGUID: 1CW8b8iMT2qhWAJCRDvKWA==
X-CSE-MsgGUID: 7XwPbWLQSdCcHucDLp41Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42340506"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="42340506"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 04:56:32 -0800
X-CSE-ConnectionGUID: aS8lZqLoTg2yfjOL7EAUOg==
X-CSE-MsgGUID: JA0k9J+iR2eFIUMzQh75Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="141928654"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 05 Mar 2025 04:56:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpoIW-000Kxy-2s;
	Wed, 05 Mar 2025 12:56:28 +0000
Date: Wed, 05 Mar 2025 20:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 232427772fc123942d110c18269cfbdf40edae18
Message-ID: <202503052009.bLWrcCU7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 232427772fc123942d110c18269cfbdf40edae18  hwmon: Fix the missing of 'average' word in hwmon_power_attr_templates

elapsed time: 1449m

configs tested: 143
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250305    gcc-13.2.0
arc                   randconfig-002-20250305    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250305    gcc-14.2.0
arm                   randconfig-002-20250305    clang-19
arm                   randconfig-003-20250305    gcc-14.2.0
arm                   randconfig-004-20250305    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250305    clang-15
arm64                 randconfig-002-20250305    gcc-14.2.0
arm64                 randconfig-003-20250305    clang-21
arm64                 randconfig-004-20250305    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250305    gcc-14.2.0
csky                  randconfig-002-20250305    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250305    clang-21
hexagon               randconfig-002-20250305    clang-18
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250304    clang-19
i386        buildonly-randconfig-001-20250305    clang-19
i386        buildonly-randconfig-002-20250304    clang-19
i386        buildonly-randconfig-002-20250305    clang-19
i386        buildonly-randconfig-003-20250304    gcc-12
i386        buildonly-randconfig-003-20250305    clang-19
i386        buildonly-randconfig-004-20250304    gcc-11
i386        buildonly-randconfig-004-20250305    clang-19
i386        buildonly-randconfig-005-20250304    gcc-11
i386        buildonly-randconfig-005-20250305    clang-19
i386        buildonly-randconfig-006-20250304    gcc-12
i386        buildonly-randconfig-006-20250305    clang-19
i386                                defconfig    clang-19
i386                  randconfig-011-20250305    gcc-11
i386                  randconfig-012-20250305    gcc-11
i386                  randconfig-013-20250305    gcc-11
i386                  randconfig-014-20250305    gcc-11
i386                  randconfig-015-20250305    gcc-11
i386                  randconfig-016-20250305    gcc-11
i386                  randconfig-017-20250305    gcc-11
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250305    gcc-14.2.0
loongarch             randconfig-002-20250305    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250305    gcc-14.2.0
nios2                 randconfig-002-20250305    gcc-14.2.0
openrisc                          allnoconfig    clang-15
openrisc                          allnoconfig    gcc-14.2.0
parisc                            allnoconfig    clang-15
parisc                            allnoconfig    gcc-14.2.0
parisc                randconfig-001-20250305    gcc-14.2.0
parisc                randconfig-002-20250305    gcc-14.2.0
powerpc                           allnoconfig    clang-15
powerpc                           allnoconfig    gcc-14.2.0
powerpc               randconfig-001-20250305    clang-17
powerpc               randconfig-002-20250305    gcc-14.2.0
powerpc               randconfig-003-20250305    gcc-14.2.0
powerpc64             randconfig-001-20250305    clang-19
powerpc64             randconfig-002-20250305    clang-17
powerpc64             randconfig-003-20250305    clang-19
riscv                             allnoconfig    clang-15
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250305    clang-19
riscv                 randconfig-002-20250305    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-15
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250305    gcc-14.2.0
s390                  randconfig-002-20250305    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250305    gcc-14.2.0
sh                    randconfig-002-20250305    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250305    gcc-14.2.0
sparc                 randconfig-002-20250305    gcc-14.2.0
sparc64               randconfig-001-20250305    gcc-14.2.0
sparc64               randconfig-002-20250305    gcc-14.2.0
um                               allmodconfig    clang-21
um                                allnoconfig    clang-15
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250305    clang-19
um                    randconfig-002-20250305    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250304    clang-19
x86_64      buildonly-randconfig-001-20250305    clang-19
x86_64      buildonly-randconfig-002-20250304    gcc-12
x86_64      buildonly-randconfig-002-20250305    clang-19
x86_64      buildonly-randconfig-003-20250304    gcc-12
x86_64      buildonly-randconfig-003-20250305    clang-19
x86_64      buildonly-randconfig-004-20250304    gcc-12
x86_64      buildonly-randconfig-004-20250305    clang-19
x86_64      buildonly-randconfig-005-20250304    gcc-12
x86_64      buildonly-randconfig-005-20250305    clang-19
x86_64      buildonly-randconfig-006-20250304    gcc-12
x86_64      buildonly-randconfig-006-20250305    clang-19
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20250305    gcc-12
x86_64                randconfig-002-20250305    gcc-12
x86_64                randconfig-003-20250305    gcc-12
x86_64                randconfig-004-20250305    gcc-12
x86_64                randconfig-005-20250305    gcc-12
x86_64                randconfig-006-20250305    gcc-12
x86_64                randconfig-007-20250305    gcc-12
x86_64                randconfig-008-20250305    gcc-12
x86_64                randconfig-071-20250305    clang-19
x86_64                randconfig-072-20250305    clang-19
x86_64                randconfig-073-20250305    clang-19
x86_64                randconfig-074-20250305    clang-19
x86_64                randconfig-075-20250305    clang-19
x86_64                randconfig-076-20250305    clang-19
x86_64                randconfig-077-20250305    clang-19
x86_64                randconfig-078-20250305    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250305    gcc-14.2.0
xtensa                randconfig-002-20250305    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
