Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C046D2B9BF
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736446735; cv=none; b=Zh34TOWXhjeJkFl1/SygElv2TE9XQhYElsh//zyQdtg7w3kkcbLXdkf2rX5+K3mOlrgRj2YaxOymOU97U3WGx0XmfSPeWkykHVSwhUIuFn2U2SGfzBEJGe2jqfWZHp0nw0RzlN9R2/OU3FlfNo0eciU8i/zmpj3/XHgaVryTN0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736446735; c=relaxed/simple;
	bh=vp8EI5Q1uwQCAFK+OmvBu/nKBVnSwFoWlvSK5iz4ZiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NC3qxMVn6zvVZfN7r9AuCAdHHYb+Dkfw6GdMOc8VOO2TAjdmuUOBOxVUyewVf7bQXLu1InuO1ySuImWhBwqFYJRwvN8mnZBfoUfckoNy9HnXxffXdNDUOuLQBXyyYZ7QiT4O+2y+HoeJ9kyrUWSLFHn6aCF0DYGPNMgi8iSsVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VU7stkDs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VU7stkDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736446733; x=1767982733;
  h=date:from:to:cc:subject:message-id;
  bh=vp8EI5Q1uwQCAFK+OmvBu/nKBVnSwFoWlvSK5iz4ZiY=;
  b=VU7stkDs/18x7QtNbGl/qNZU0hwO7oYMywl46Y+aV7hY17kstKPMgphP
   c2uaptv7mt72O+o5Hd57guxC69gRFQqG7xwIg+Ozq+azEvSaT99nsFMWb
   o2Y9yW1gLMVqM1Jn/dx+mDzbplpDnoSzUxG2dUHBu9G0H8RPjExgh1OjW
   k3V+kojPOpS0EZClzA2af4Qv4Q7EvKlIwxcxsZ6zqsK7wYzdRRVP7utOG
   xx/i6DP+yplHXpE7vL1W+Fsrt9wJkjPL520WBNYBSk9DjkZfieOv8/QJ9
   jgP3yW2mfGgoQidV7cjzEFIa1WXN5GUWhzOu3AqJDNov9DYV89EZiYdHn
   g==;
X-CSE-ConnectionGUID: r2bIk+PrSe+6lre8A0lYBg==
X-CSE-MsgGUID: 2p0Nh7twT66jYBbNZ45frA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47302701"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="47302701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 10:18:53 -0800
X-CSE-ConnectionGUID: Z5EgpKl+SPCUVXhKH5O9Pw==
X-CSE-MsgGUID: koiY5P1RQ7GQS8BiDMv5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140798063"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 10:18:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVx7J-000Hz5-2H;
	Thu, 09 Jan 2025 18:18:49 +0000
Date: Fri, 10 Jan 2025 02:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 788bd792c74a3d1ddd0e49f5ddd68102dbbbe351
Message-ID: <202501100237.In7P32xS-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 788bd792c74a3d1ddd0e49f5ddd68102dbbbe351  hwmon: (pmbus/max15301) Add support for MAX15303

elapsed time: 1453m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
arc                              allnoconfig    gcc-13.2.0
arc                  randconfig-001-20250109    gcc-13.2.0
arc                  randconfig-002-20250109    gcc-13.2.0
arm                              allnoconfig    clang-17
arm                  randconfig-001-20250109    gcc-14.2.0
arm                  randconfig-002-20250109    clang-17
arm                  randconfig-003-20250109    clang-20
arm                  randconfig-004-20250109    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250109    gcc-14.2.0
arm64                randconfig-002-20250109    clang-20
arm64                randconfig-003-20250109    gcc-14.2.0
arm64                randconfig-004-20250109    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250109    gcc-14.2.0
csky                 randconfig-002-20250109    gcc-14.2.0
hexagon                          allnoconfig    clang-20
hexagon              randconfig-001-20250109    clang-14
hexagon              randconfig-002-20250109    clang-20
i386       buildonly-randconfig-001-20250109    gcc-12
i386       buildonly-randconfig-002-20250109    gcc-12
i386       buildonly-randconfig-003-20250109    clang-19
i386       buildonly-randconfig-004-20250109    clang-19
i386       buildonly-randconfig-005-20250109    clang-19
i386       buildonly-randconfig-006-20250109    gcc-12
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250109    gcc-14.2.0
loongarch            randconfig-002-20250109    gcc-14.2.0
nios2                randconfig-001-20250109    gcc-14.2.0
nios2                randconfig-002-20250109    gcc-14.2.0
openrisc                        allyesconfig    gcc-14.2.0
parisc                          allmodconfig    gcc-14.2.0
parisc                          allyesconfig    gcc-14.2.0
parisc               randconfig-001-20250109    gcc-14.2.0
parisc               randconfig-002-20250109    gcc-14.2.0
powerpc                         allmodconfig    gcc-14.2.0
powerpc                         allyesconfig    clang-16
powerpc              randconfig-001-20250109    clang-15
powerpc              randconfig-002-20250109    gcc-14.2.0
powerpc              randconfig-003-20250109    gcc-14.2.0
powerpc64            randconfig-001-20250109    gcc-14.2.0
powerpc64            randconfig-002-20250109    clang-20
powerpc64            randconfig-003-20250109    clang-17
riscv                           allyesconfig    clang-20
riscv                randconfig-001-20250109    gcc-14.2.0
riscv                randconfig-002-20250109    clang-15
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250109    gcc-14.2.0
s390                 randconfig-002-20250109    clang-16
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250109    gcc-14.2.0
sh                   randconfig-002-20250109    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250109    gcc-14.2.0
sparc                randconfig-002-20250109    gcc-14.2.0
sparc64              randconfig-001-20250109    gcc-14.2.0
sparc64              randconfig-002-20250109    gcc-14.2.0
um                   randconfig-001-20250109    gcc-12
um                   randconfig-002-20250109    gcc-12
x86_64                           allnoconfig    clang-19
x86_64     buildonly-randconfig-001-20250109    clang-19
x86_64     buildonly-randconfig-002-20250109    gcc-12
x86_64     buildonly-randconfig-003-20250109    clang-19
x86_64     buildonly-randconfig-004-20250109    clang-19
x86_64     buildonly-randconfig-005-20250109    clang-19
x86_64     buildonly-randconfig-006-20250109    gcc-12
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250109    gcc-14.2.0
xtensa               randconfig-002-20250109    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
