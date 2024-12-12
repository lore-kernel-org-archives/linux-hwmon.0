Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DFD25948B
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Dec 2024 19:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734033436; cv=none; b=im9QNiwynyXFMmVeBaOn9+yOmPjEl7t2hxbDlogf94/A+++oJJfyBXgJ/RQySrcFgn5pqmHLLa4OM7fseQat3j6gO3AZ6Z6KJuqZE3ovItC9cJ05EL5qOsFiLHtjwVoPwiAUZaHeVcudU5gYQh3CF14fq0U4ACAG1+SaPUDpHEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734033436; c=relaxed/simple;
	bh=B0vxr/CLSQlFnuePs0bJgo44dgvz6gyg8b25VaLl7J4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f69zkHKPyZ/rMMoi+lsZGfLzkD1+30RqnDmwLYNAlyTKUsS+e1bNQIFHHaJ1mubxaJ+S1hslvmLiWrF9+zZK21hIAEQoFAE6yBdOjefpPDKMzbYGE1p5yU9FPaRb8ZbZKvm3QCbRpDb38eHvM1tqbbbVHf3U+JNxI29x0prraa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XrIkcSqC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XrIkcSqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734033431; x=1765569431;
  h=date:from:to:cc:subject:message-id;
  bh=B0vxr/CLSQlFnuePs0bJgo44dgvz6gyg8b25VaLl7J4=;
  b=XrIkcSqCPDb1GQyTQvZztEF8lP2dEwjathDB9wZEf0jaTEVZdAUyV/7z
   1THJTR+vAGWmMBaIvTlUQDuRB6VkXoN4ZQIFxReHfXxZ6nwUiwz4+VQn4
   MkDKCoxAKGsSDB8X2rk0B5BHctedLIhVFUbeAzBP89Mgd5EeAnfLNU9ot
   iAeZtqMZF1edbM4CsG0uEMwu26QlIQoYwr1hWUe+yRinuaIjdTkmsWD11
   X5vG4VccIXPwsr6Yw8+Up/865ZPo4Z86p1gZeXmYJ/H5UA35cqyG7TF0T
   L0fUqsI3u6GZf78tmXRY3oFWVCJ1XabyVko/DSEH1B8Zf2PPsocPf0Zrz
   A==;
X-CSE-ConnectionGUID: iguyUYeXRqegDlOqjaQTYA==
X-CSE-MsgGUID: w7A/QI40Qi+zUHpx+OQPUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45480585"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45480585"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:57:09 -0800
X-CSE-ConnectionGUID: j9Gaq17wRtSsq4HNnNmJ3g==
X-CSE-MsgGUID: 0ohnhHrZT76kO+ayAv9SpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100487488"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2024 11:57:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLpJ4-000BHD-2c;
	Thu, 12 Dec 2024 19:57:06 +0000
Date: Fri, 13 Dec 2024 03:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 025c7b0657825d4441946323a9bfea596635ebd9
Message-ID: <202412130311.4Rq46ipo-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: 025c7b0657825d4441946323a9bfea596635ebd9  staging: gpib: Fix i386 build issue

elapsed time: 1449m

configs tested: 52
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241212    gcc-13.2.0
arc                  randconfig-002-20241212    gcc-13.2.0
arm                  randconfig-001-20241212    gcc-14.2.0
arm                  randconfig-002-20241212    clang-20
arm                  randconfig-003-20241212    clang-19
arm                  randconfig-004-20241212    clang-20
arm64                randconfig-001-20241212    clang-20
arm64                randconfig-002-20241212    clang-15
arm64                randconfig-003-20241212    clang-20
arm64                randconfig-004-20241212    gcc-14.2.0
csky                 randconfig-001-20241212    gcc-14.2.0
csky                 randconfig-002-20241212    gcc-14.2.0
hexagon              randconfig-001-20241212    clang-14
hexagon              randconfig-002-20241212    clang-16
i386       buildonly-randconfig-001-20241212    clang-19
i386       buildonly-randconfig-002-20241212    clang-19
i386       buildonly-randconfig-003-20241212    clang-19
i386       buildonly-randconfig-004-20241212    clang-19
i386       buildonly-randconfig-005-20241212    clang-19
i386       buildonly-randconfig-006-20241212    gcc-12
loongarch            randconfig-001-20241212    gcc-14.2.0
loongarch            randconfig-002-20241212    gcc-14.2.0
nios2                randconfig-001-20241212    gcc-14.2.0
nios2                randconfig-002-20241212    gcc-14.2.0
parisc               randconfig-001-20241212    gcc-14.2.0
parisc               randconfig-002-20241212    gcc-14.2.0
powerpc              randconfig-001-20241212    gcc-14.2.0
riscv                randconfig-001-20241212    clang-17
riscv                randconfig-002-20241212    clang-20
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241212    clang-18
s390                 randconfig-002-20241212    clang-20
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241212    gcc-14.2.0
sh                   randconfig-002-20241212    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241212    gcc-14.2.0
sparc                randconfig-002-20241212    gcc-14.2.0
sparc64              randconfig-001-20241212    gcc-14.2.0
sparc64              randconfig-002-20241212    gcc-14.2.0
um                   randconfig-001-20241212    gcc-12
um                   randconfig-002-20241212    clang-20
x86_64     buildonly-randconfig-001-20241212    clang-19
x86_64     buildonly-randconfig-002-20241212    gcc-12
x86_64     buildonly-randconfig-003-20241212    clang-19
x86_64     buildonly-randconfig-004-20241212    clang-19
x86_64     buildonly-randconfig-005-20241212    gcc-11
x86_64     buildonly-randconfig-006-20241212    clang-19
xtensa               randconfig-001-20241212    gcc-14.2.0
xtensa               randconfig-002-20241212    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
