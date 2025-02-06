Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF2622FF59
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Feb 2025 22:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882169; cv=none; b=OecZwVUg5h4OcHf4E8QbbQMmsVEGB48WHDiwqLSVl8tMW+ryWiymK+l2SAEhxO4BxNCUKQaGuwBFQlPkJIpHNMJERa8rrt49QPAtV4FGHAijEc4xEGBcZWqxe1C07NuTbzQxsT88u2IRzc1DR9vC1bGTJwnVzEIHA1/OmiQoqnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882169; c=relaxed/simple;
	bh=cuNaw3oEr1MvV8IhtVY3ta0zHeunYi8737QghSINQNc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A7TpnQzfPssyblNNOc5nY2UmnyhMDlpOdistsQa0x5P9FuKoHSJI5PoBpg0HHPi2oK7n85B2tKb95/RtTXDS3u0/0d7vnMYeO5KMX2j44lOTz6NFzP9y9smxx8GEQ2tpy8sB5YULRo6jifEchUqYuOVV6JcSRHHwXu+ADS2On7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGQamVwy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGQamVwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738882167; x=1770418167;
  h=date:from:to:cc:subject:message-id;
  bh=cuNaw3oEr1MvV8IhtVY3ta0zHeunYi8737QghSINQNc=;
  b=PGQamVwy/WMZK551CWpoVden8oZg0D0M0GdAkJZpxIeHFfP8903478fp
   jgpJCNJYcLxp0VnLNAEUypTB5YsXNiTYdTfHMEObuQzW7xpG0oad3Rqr2
   4fUg5Bl30fn35SgQi4pKMw8sm1LsJPoAhdaqv0sQ5KLsVW6C2f0ohywRB
   c44Xp4e71ewkDa0Ql/9O78UgyLgt7UE4nm+obk6yszWNL7MhHgdwaIGl2
   M0f+Mv4zVzoVa/i585cKm6W3ZBL+bvRTW/Z2BkQB/7DQuKirDse9ktmA+
   zx9XTShAfce/GwCt/bH4h5tfcUmLFnsFKJTKrRtm9y+YOZAdjRvtYBKk8
   w==;
X-CSE-ConnectionGUID: U4B8rPSuSZmSMuEscGrg0w==
X-CSE-MsgGUID: 1cbXR3HsTN63D4E+N7p7Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39207989"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="39207989"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 14:49:27 -0800
X-CSE-ConnectionGUID: OSxgroauQqWgP7AqkAG4pQ==
X-CSE-MsgGUID: G3fGOTn5RP6XBWMcSNkKAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115972115"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 14:49:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgAgU-000xTz-3C;
	Thu, 06 Feb 2025 22:49:22 +0000
Date: Fri, 07 Feb 2025 06:49:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 2918b78cd4e6b909bd7e81a5e292ff820adc8f65
Message-ID: <202502070659.AfPvSKuj-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 2918b78cd4e6b909bd7e81a5e292ff820adc8f65  Merge branch 'fixes-v6.14' into testing

elapsed time: 1447m

configs tested: 95
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250206    clang-21
arm                   randconfig-002-20250206    clang-19
arm                   randconfig-003-20250206    clang-21
arm                   randconfig-004-20250206    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250206    clang-21
arm64                 randconfig-002-20250206    clang-21
arm64                 randconfig-003-20250206    clang-15
arm64                 randconfig-004-20250206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250206    clang-21
hexagon               randconfig-002-20250206    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250206    clang-19
i386        buildonly-randconfig-002-20250206    gcc-12
i386        buildonly-randconfig-003-20250206    clang-19
i386        buildonly-randconfig-004-20250206    clang-19
i386        buildonly-randconfig-005-20250206    clang-19
i386        buildonly-randconfig-006-20250206    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250206    clang-21
powerpc               randconfig-002-20250206    clang-19
powerpc               randconfig-003-20250206    clang-21
powerpc64             randconfig-001-20250206    clang-15
powerpc64             randconfig-002-20250206    clang-17
powerpc64             randconfig-003-20250206    clang-19
riscv                            allmodconfig    clang-21
riscv                            allyesconfig    clang-21
riscv                 randconfig-001-20250206    clang-19
riscv                 randconfig-002-20250206    clang-17
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250206    clang-21
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250206    clang-15
um                    randconfig-002-20250206    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250206    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
