Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9F800
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Dec 2025 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766350215; cv=none; b=WWl+wKhlKtBiAnPISmzSgYvMmJjo4RBI4Tl3mAJ+yVoUFjZFjGH+bXyFfC50ST5cr9DqVjkSy7yLJ/XmsgtGQ+q1nehg4Xil8aPsvJnJRhqJAzVBQkEbbcV/MdPcJgyUhlLKCsUCKK0cJ8+46HxLDehK2GSt4Rqj0lLWLymUk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766350215; c=relaxed/simple;
	bh=N0JC8TNdQ+LKkH/T+tJ67unWgLdKDt+UDKSDx2YRRog=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TnlmusYb3ey2kcZZrIfq3y1/ucKaY/E6Jxg7dq5KSwvMSSzCC7NfV3j/NAiRexmrAeo+1RPCJl1asgt3JwyxHUhWMiJKQpMdJ4X5mx0n176TG9BllU76FBmbqdeHH5DyH+guq0o4qy6iVxbbcq6uLi0474r11GJ9ok4zYigrP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGZvlJcw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGZvlJcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766350214; x=1797886214;
  h=date:from:to:cc:subject:message-id;
  bh=N0JC8TNdQ+LKkH/T+tJ67unWgLdKDt+UDKSDx2YRRog=;
  b=IGZvlJcw+93wDKO+vYd/RDcsQSGdOAaYH2J6cK8iyOS0Hf0ihyu/F7kK
   Fbo01BPO1ZCEWnw4jka3c4FURyNg5VhxVG7tT1U0M0PrGuUAbpe2c/Gx9
   7Kargkv6B1Q24oIozfbirGS0lqMUS5XvvMZUWIpWzrbBlq2UzG5EUhNNP
   zUgfju5Yb5BCIbBzrUB9JTyF6R5vYRZvGuGntAyBVhhCSzgwZVp489DYL
   qnAOd0U1BBk77e2VdUgevEWl8cwdq+e8WefyETmmSDsUGT6P1HmuAr6i+
   tOWgU5mmOOvz6RKEhsl4KomqNkmTkdPdvoBRlXlSDhFrLHW6sSc83hwA3
   A==;
X-CSE-ConnectionGUID: FKPnjkuJQgSohgJaBd077A==
X-CSE-MsgGUID: WMOFz8VaTa+scDmNtyuUIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79584489"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="79584489"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 12:50:13 -0800
X-CSE-ConnectionGUID: 6OYSzUw/RAympK2mpsaZ5g==
X-CSE-MsgGUID: 9gXgh/lsSlOdeaqVeKmuzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204302374"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2025 12:50:12 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXQNW-000000000AL-19me;
	Sun, 21 Dec 2025 20:50:10 +0000
Date: Mon, 22 Dec 2025 04:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 c6c80820ac5d845c19c4de2e6054e7c246017044
Message-ID: <202512220421.rQsLkAks-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: c6c80820ac5d845c19c4de2e6054e7c246017044  hwmon: (pmbus) Add mp5926 driver

elapsed time: 3083m

configs tested: 66
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251222    gcc-15.1.0
arc                   randconfig-002-20251222    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                                 defconfig    clang-22
arm                   randconfig-001-20251222    gcc-11.5.0
arm                   randconfig-002-20251222    gcc-11.5.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-002-20251222    gcc-15.1.0
arm64                 randconfig-003-20251222    gcc-11.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251221    gcc-14
i386        buildonly-randconfig-002-20251221    clang-20
i386        buildonly-randconfig-003-20251221    gcc-14
i386        buildonly-randconfig-004-20251221    gcc-14
i386        buildonly-randconfig-005-20251221    clang-20
i386        buildonly-randconfig-006-20251221    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251222    gcc-12
i386                  randconfig-002-20251222    gcc-14
i386                  randconfig-003-20251222    gcc-12
i386                  randconfig-004-20251222    clang-20
loongarch                         allnoconfig    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-002-20251222    gcc-8.5.0
riscv                             allnoconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                  randconfig-002-20251222    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251222    gcc-8.5.0
sparc                 randconfig-002-20251222    gcc-15.1.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
