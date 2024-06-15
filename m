Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3E1CA6B
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Jun 2024 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718470052; cv=none; b=fV7FOf7AJSUBokHb1+8OuqrF4/wckEubh768mrOYgsXiUnEtrWzUNUKj82+gnAVuNKis0cEijm2VfSSk9sR5RnkLLtM7qy7Xfmn3+mk4K9/AXP+621zSX3T6oZ55L8uienmirLss6yv1+rcXeT+QZT/HRPW9YHow+vFjnUXCQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718470052; c=relaxed/simple;
	bh=tCkfo4zknHrD9k0hx3Na/P4yMqDrR87QZpbaGiEK394=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijHJzkwVtGNqiiKm5Xot7ouIgN1MZ0wtaEVZRSqa+zr/oVZE98zYoQ8RQLlo6dcVRd2bM699soj1fpfJdqoE/zJa5fMdzs+ooINFFvAP/GYbtpHbBxRuBgAq16Auj31X5l9QwMzRfIv7P5CWPOLrFcXl/XbIqpvD2R5Og/d9zzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL+VqjXL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL+VqjXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718470050; x=1750006050;
  h=date:from:to:cc:subject:message-id;
  bh=tCkfo4zknHrD9k0hx3Na/P4yMqDrR87QZpbaGiEK394=;
  b=nL+VqjXL4xSsolX+7h5J6ggzx1LSWKi2+mQcpXHWZsbhM1GbHPqIJZGm
   tiaUcX7lZXIP5s5AiJ/iS3nyE0yRoq/PfffPg2cTeAPzyJpnycXj4N+Ug
   Neg/KfaZJda03+U/XP6vQgq2rUMflAiUJXVju8GiPEZhBiOm3wHmHMQ7j
   MRDdwvRjw7v3pRcvZNFFzCJBJidCgOgdSSn9ppuEdfeJKrSHrnbB4HR2l
   TUBsMo/hcWz1qW/f26mssy7kyElbLLX8NzoTvgLw/gzlUYPZv7LI0kU+1
   nNsiAbPPNgE/SiF4mnRNy2lPspKJtZq3KHOBs2xXifKbHyPIoW1u7wU3p
   g==;
X-CSE-ConnectionGUID: GghUeGjXStGUa7zLbdBIjQ==
X-CSE-MsgGUID: JeT5Dbd2QfGlzvNGuN4PDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15506848"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15506848"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 09:47:30 -0700
X-CSE-ConnectionGUID: NkpsgohIRumtOThAY1gFfw==
X-CSE-MsgGUID: 4kIVavQySDSMWZDjKaXaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41470374"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 09:47:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIWYo-0000G8-0t;
	Sat, 15 Jun 2024 16:47:26 +0000
Date: Sun, 16 Jun 2024 00:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 842b4d98ae338522babab38347297f0932fa7afd
Message-ID: <202406160000.z2H9MSp3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 842b4d98ae338522babab38347297f0932fa7afd  hwmon: (max6639) : Add additional hwmon attributes for fan and pwm

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-allmodconfig
    `-- standard-input:Error:unknown-pseudo-op:alig

elapsed time: 1615m

configs tested: 76
configs skipped: 1

tested configs:
arc                   randconfig-001-20240615   gcc-13.2.0
arc                   randconfig-002-20240615   gcc-13.2.0
arm                   randconfig-001-20240615   clang-19
arm                   randconfig-002-20240615   clang-19
arm                   randconfig-003-20240615   gcc-13.2.0
arm                   randconfig-004-20240615   gcc-13.2.0
arm64                 randconfig-001-20240615   clang-19
arm64                 randconfig-002-20240615   gcc-13.2.0
arm64                 randconfig-003-20240615   clang-17
arm64                 randconfig-004-20240615   gcc-13.2.0
csky                  randconfig-001-20240615   gcc-13.2.0
csky                  randconfig-002-20240615   gcc-13.2.0
hexagon               randconfig-001-20240615   clang-19
hexagon               randconfig-002-20240615   clang-19
i386         buildonly-randconfig-001-20240615   clang-18
i386         buildonly-randconfig-002-20240615   gcc-9
i386         buildonly-randconfig-003-20240615   gcc-7
i386         buildonly-randconfig-004-20240615   clang-18
i386         buildonly-randconfig-005-20240615   clang-18
i386         buildonly-randconfig-006-20240615   gcc-13
i386                  randconfig-001-20240615   clang-18
i386                  randconfig-002-20240615   gcc-13
i386                  randconfig-003-20240615   clang-18
i386                  randconfig-004-20240615   clang-18
i386                  randconfig-005-20240615   clang-18
i386                  randconfig-006-20240615   clang-18
i386                  randconfig-011-20240615   clang-18
i386                  randconfig-012-20240615   gcc-12
i386                  randconfig-013-20240615   gcc-13
i386                  randconfig-014-20240615   clang-18
i386                  randconfig-015-20240615   clang-18
i386                  randconfig-016-20240615   gcc-13
loongarch             randconfig-001-20240615   gcc-13.2.0
loongarch             randconfig-002-20240615   gcc-13.2.0
nios2                 randconfig-001-20240615   gcc-13.2.0
nios2                 randconfig-002-20240615   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                randconfig-001-20240615   gcc-13.2.0
parisc                randconfig-002-20240615   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc               randconfig-001-20240615   clang-19
powerpc               randconfig-002-20240615   clang-19
powerpc               randconfig-003-20240615   clang-19
powerpc64             randconfig-001-20240615   clang-19
powerpc64             randconfig-002-20240615   clang-19
powerpc64             randconfig-003-20240615   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang-19
riscv                 randconfig-001-20240615   clang-19
riscv                 randconfig-002-20240615   gcc-13.2.0
s390                              allnoconfig   clang-19
s390                                defconfig   clang-19
s390                  randconfig-001-20240615   clang-16
s390                  randconfig-002-20240615   clang-19
sh                                allnoconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                    randconfig-001-20240615   gcc-13.2.0
sh                    randconfig-002-20240615   gcc-13.2.0
sparc                             allnoconfig   gcc-13.2.0
sparc                               defconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240615   gcc-13.2.0
sparc64               randconfig-002-20240615   gcc-13.2.0
um                                allnoconfig   clang-17
um                                  defconfig   clang-19
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240615   gcc-7
um                    randconfig-002-20240615   gcc-11
um                           x86_64_defconfig   clang-15
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240615   gcc-13.2.0
xtensa                randconfig-002-20240615   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
