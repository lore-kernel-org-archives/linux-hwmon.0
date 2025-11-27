Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D979C8
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Nov 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764274892; cv=none; b=kiWxAgspkmzoFLJBCQXX7CJeE+Ki+Ug0BrlMpoZbCl5Y/5JUbpfmgxJRLcZ5cyrM5KbfOkvEv5A8MCfuNe+w/R0LgIrYYGHLTl+pyi9+CxOB3HIatsadYrAscZzWfkWdW20WuaDU0hwhSGtLtSyVAZexdxy+CxWMOgmjAsWcTSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764274892; c=relaxed/simple;
	bh=Rz+uCGHxZnsb4rMGu7Xm7hWCV2c76iSaiCC2XcVdz3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rvFz2CqYm34sLmmvoTYsY7OYXLj9nKpcIfVVr0esuer+/LBsTcn12sslEK2fz7ufWz4zoGRbXMRTvWUYIrwfPOyufjW9L1epxiCaz7OcZnDVtBscafdfaKMJmMdgmBz8Khswdo/FxXzBTsGS7XYq5GDUtuLe6HLfoKFJsoMl3zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnpRZq0L; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnpRZq0L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764274890; x=1795810890;
  h=date:from:to:cc:subject:message-id;
  bh=Rz+uCGHxZnsb4rMGu7Xm7hWCV2c76iSaiCC2XcVdz3Y=;
  b=GnpRZq0LaK+fPBV34rdH1PI6yoyaq6WGr0FrmE4720VNzsXlF+NR/nas
   n3wggBY+5sykHJIsh++XqPqlT+/QfGKb1pscqsV8qISPbtsWPXlZCdjw3
   HeEkDPrspSgD3e9rHBeuK7pfI2IWHE/J6imQPdBM6tiAwHnAIix1PqJjh
   ujmDPhtF1AZHqQh85h79qKPruKu7V8xgz1606IYvVDa95F6Lcsjb0rtKX
   cyAJfY3BhkdO+guwHp48uFtFzWpEXKSfweq00zayMXUTB1/gj6u1X0RS9
   Sqw8O33ZDJEpyxoj25hmmBPFqxdR9l/enMGyPSsvDAEHRbwr87XYrs7tn
   A==;
X-CSE-ConnectionGUID: JD7h9Xo9RN6q30wfvWJWgQ==
X-CSE-MsgGUID: Tq/IzmcYS4qJ1KPw8WE5Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66211601"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66211601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 12:21:30 -0800
X-CSE-ConnectionGUID: K/WI8DwfQQadyXLc87Lv1A==
X-CSE-MsgGUID: qv7LKN6sREaf/DuW0v8u8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="193101628"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 12:21:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOiUY-000000005cz-3vKb;
	Thu, 27 Nov 2025 20:21:26 +0000
Date: Fri, 28 Nov 2025 04:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging] BUILD SUCCESS
 1222e1b531227d82a38579d10d9c616bd09fbb54
Message-ID: <202511280420.PQYuNBUv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
branch HEAD: 1222e1b531227d82a38579d10d9c616bd09fbb54  Merge branch 'hwmon-lock' into hwmon-staging

elapsed time: 7427m

configs tested: 61
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251123    gcc-15.1.0
arc         randconfig-002-20251123    gcc-12.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251123    clang-22
arm         randconfig-002-20251123    clang-22
arm         randconfig-003-20251123    gcc-10.5.0
arm         randconfig-004-20251123    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251123    clang-22
hexagon     randconfig-002-20251123    clang-19
i386                   allmodconfig    gcc-14
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251123    gcc-15.1.0
loongarch   randconfig-002-20251123    clang-18
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                  allmodconfig    gcc-11.5.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251123    gcc-8.5.0
nios2       randconfig-002-20251123    gcc-11.5.0
openrisc               allmodconfig    gcc-15.1.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
riscv                  allyesconfig    clang-16
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251123    gcc-8.5.0
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sparc                   allnoconfig    gcc-15.1.0
sparc64                allmodconfig    clang-22
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
x86_64                rhel-9.4-rust    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
