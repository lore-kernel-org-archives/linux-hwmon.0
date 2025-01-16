Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D3318FC8F
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jan 2025 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737064868; cv=none; b=WJqOFmVS1cBHBXq5vtzTUTZaQ9twIOekAnL0V0YKtr/4cWSYc9tfGNGQ7T+p6XLLwFwr34KfLyVifcSBhr1YDEhBT4avNiSQgTzgk7APb4J+3VKCYkWTYw0uCrHqX0U8nUeTrRAVR6DQ5dCXD89WtzdJ9MbLcoj4ZW9IIDMv1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737064868; c=relaxed/simple;
	bh=07vKCz6cxzgkbnHmA8Hj6p65hsYI4brg6oPy2cv3WWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UyKd0huUVGnkYCDpLpidyYqyCKTO5qHxqErygKxDJ4Q2EvyDomXu+jvq1PCdim2fGwscRr/6HuHx9rO8R85QHRjlKh8U4cQ64OyVNzoiPOQESEmDsMu5eC0wc92GWkx07XafM+gH2Chlce7F2oNfHtwPcSFsI69/BhfwNgcztWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgJIBLGp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgJIBLGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737064867; x=1768600867;
  h=date:from:to:cc:subject:message-id;
  bh=07vKCz6cxzgkbnHmA8Hj6p65hsYI4brg6oPy2cv3WWo=;
  b=lgJIBLGpVB23stiIkc4jdK2F6gF+nMGpBTN7jr4j2/Vlmi2Mpx153Jnm
   U5no9gSreojwgK4rR7e4LHCYlxqfkNO+fkcDkYqOoO4hVA4iElCZ+WkQ1
   7aJ/q9Fxmahnf7gufrE4eyibS4IPkEFZWbTSFK+vKiQHyp4+/+kU8VPnZ
   rAYys5IJT9pLWBLV1XN30TH/ec+ulPp4zaLcw2+MOOwmkeqP5urvIyEXV
   OIqGUGJ77jKNhByk0zQ4hbjBDtyGd+Ms7aF6nGpWFuF3HWNjn1zvqTHzP
   8h8Tb8HoknySF7PITGDthdfGgr3UYG3GfsKYeDDgsC+m7wT5NRfsGbnhO
   w==;
X-CSE-ConnectionGUID: gejw5S7FR6a/u+6PPGv0EA==
X-CSE-MsgGUID: R8+AdweES1mgc34RNYdmtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37392859"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="37392859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 14:01:04 -0800
X-CSE-ConnectionGUID: Z2rXgBk9Q9CGjjtmKvi3bw==
X-CSE-MsgGUID: ScVGtkacTHibLG9EbHDttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105465427"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2025 14:01:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYXvB-000SQv-00;
	Thu, 16 Jan 2025 22:01:01 +0000
Date: Fri, 17 Jan 2025 06:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e9b24deb84863c5a77dda5be57b6cb5bf4127b85
Message-ID: <202501170643.LA1wWrW4-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e9b24deb84863c5a77dda5be57b6cb5bf4127b85  hwmon: (ltc2991) Fix mixed signed/unsigned in DIV_ROUND_CLOSEST

elapsed time: 1445m

configs tested: 63
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250116    gcc-13.2.0
arc                  randconfig-002-20250116    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250116    gcc-14.2.0
arm                  randconfig-002-20250116    clang-15
arm                  randconfig-003-20250116    gcc-14.2.0
arm                  randconfig-004-20250116    gcc-14.2.0
arm64                randconfig-001-20250116    gcc-14.2.0
arm64                randconfig-002-20250116    gcc-14.2.0
arm64                randconfig-003-20250116    clang-15
arm64                randconfig-004-20250116    clang-20
csky                 randconfig-001-20250116    gcc-14.2.0
csky                 randconfig-002-20250116    gcc-14.2.0
hexagon              randconfig-001-20250116    clang-20
hexagon              randconfig-002-20250116    clang-20
i386       buildonly-randconfig-001-20250116    clang-19
i386       buildonly-randconfig-002-20250116    clang-19
i386       buildonly-randconfig-003-20250116    clang-19
i386       buildonly-randconfig-004-20250116    clang-19
i386       buildonly-randconfig-005-20250116    clang-19
i386       buildonly-randconfig-006-20250116    clang-19
loongarch            randconfig-001-20250116    gcc-14.2.0
loongarch            randconfig-002-20250116    gcc-14.2.0
nios2                randconfig-001-20250116    gcc-14.2.0
nios2                randconfig-002-20250116    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250116    gcc-14.2.0
parisc               randconfig-002-20250116    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250116    clang-20
powerpc              randconfig-002-20250116    gcc-14.2.0
powerpc              randconfig-003-20250116    clang-20
powerpc64            randconfig-001-20250116    clang-19
powerpc64            randconfig-002-20250116    clang-20
powerpc64            randconfig-003-20250116    clang-15
riscv                randconfig-001-20250116    gcc-14.2.0
riscv                randconfig-002-20250116    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250116    gcc-14.2.0
s390                 randconfig-002-20250116    clang-18
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250116    gcc-14.2.0
sh                   randconfig-002-20250116    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250116    gcc-14.2.0
sparc                randconfig-002-20250116    gcc-14.2.0
sparc64              randconfig-001-20250116    gcc-14.2.0
sparc64              randconfig-002-20250116    gcc-14.2.0
um                   randconfig-001-20250116    clang-19
um                   randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-001-20250116    gcc-12
x86_64     buildonly-randconfig-002-20250116    gcc-12
x86_64     buildonly-randconfig-003-20250116    gcc-12
x86_64     buildonly-randconfig-004-20250116    clang-19
x86_64     buildonly-randconfig-005-20250116    clang-19
x86_64     buildonly-randconfig-006-20250116    clang-19
xtensa               randconfig-001-20250116    gcc-14.2.0
xtensa               randconfig-002-20250116    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
