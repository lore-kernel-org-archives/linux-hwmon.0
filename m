Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319CC348896
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548893; cv=none; b=Vfdm1LVc5osM98f+OaHIxEO41OtR+RCEGiIJqco4ZygsZYIEJrxQ+W7dwfCmueH7PJ5/xaXo7pY1E7ub91AtBJrThoP7o6NuiAVFS7MxNs4roTlFsOqUluIRff4xyNPIexRVI6R8wVHfcMpxsVw/mAgO69YHTayDFKt1fmdhW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548893; c=relaxed/simple;
	bh=dWaeaNpR9dpS3nIEUtvFHh5nDRda3hIQ/Ktt0daLk7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h4AyTjJ9qo7uoGU/vGpl0YRPdqHcZ/2RFrFLXCVWTv3V4cZh/WIQa9/4I3KsCvjy2rtRpxu8yiWDUlLd3bSlotWylG47o5JD8OQk/51SrjIRvSKHudbMopyTbS8jFxBMbLXHqLMt/ctGDsncD7oAJoPXA+8gtFvfFeLqtwp4eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LttS1/bC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LttS1/bC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774548892; x=1806084892;
  h=date:from:to:cc:subject:message-id;
  bh=dWaeaNpR9dpS3nIEUtvFHh5nDRda3hIQ/Ktt0daLk7c=;
  b=LttS1/bCcX3G0/ySvo2W0Kjy0iaqbzzTsuBg8LJLMtQ/3o3BK7tP2dWW
   AN1VwfUdjhjbLDQxDLIfXP1FQ7qPtrZeRrB9VVVPypQDAuBuJ4VBWboBy
   a2ONYuFprMHY3omYkIXiHQ7bhHnTeX+rgL9mK3uAWf+NU+lacpU7uzQG7
   3B51HikrQdxVNbUwgogx04DTNfPNgS50EIr1Sl8ejSnPQoKxw9P/hp/4y
   NF5KdIWWyw872ZiiGr8YjNjtFkk9YpVt34nGr2uDxwdnCFYUUjF2QMlFB
   aR+uQuI5+ukMlPWW+PomjWPESS44v3oVB6r3meuesiuPXJyT8P/gW7/ql
   w==;
X-CSE-ConnectionGUID: eOFSN8Q8R360Y88YhBE8WQ==
X-CSE-MsgGUID: cavKDJR2Tvua5II6kUV3uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101076361"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="101076361"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 11:14:51 -0700
X-CSE-ConnectionGUID: KV8ZCWXuRlO9kNMXDcOU1A==
X-CSE-MsgGUID: XSZGjR3iR3iPdrf8rqSqHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="220675986"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Mar 2026 11:14:50 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5pEF-000000009BV-3cml;
	Thu, 26 Mar 2026 18:14:47 +0000
Date: Fri, 27 Mar 2026 02:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 7bc196f28299e7bb5d9018cb4ffbe3f00adc4813
Message-ID: <202603270205.JbjmJ4nw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 7bc196f28299e7bb5d9018cb4ffbe3f00adc4813  hwmon: (pmbus_core) Use guard() for mutex protection

elapsed time: 1280m

configs tested: 173
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.2.0
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-15.2.0
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260326    gcc-8.5.0
arc                   randconfig-002-20260326    gcc-8.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.2.0
arm                                 defconfig    gcc-15.2.0
arm                        keystone_defconfig    gcc-15.2.0
arm                   randconfig-001-20260326    gcc-8.5.0
arm                   randconfig-002-20260326    gcc-8.5.0
arm                   randconfig-003-20260326    gcc-8.5.0
arm                   randconfig-004-20260326    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260326    clang-19
arm64                 randconfig-002-20260326    clang-19
arm64                 randconfig-003-20260326    clang-19
arm64                 randconfig-004-20260326    clang-19
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260326    clang-19
csky                  randconfig-002-20260326    clang-19
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260326    gcc-8.5.0
hexagon               randconfig-002-20260326    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260326    gcc-14
i386        buildonly-randconfig-002-20260326    gcc-14
i386        buildonly-randconfig-003-20260326    gcc-14
i386        buildonly-randconfig-004-20260326    gcc-14
i386        buildonly-randconfig-005-20260326    gcc-14
i386        buildonly-randconfig-006-20260326    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-011-20260326    clang-20
i386                  randconfig-012-20260326    clang-20
i386                  randconfig-013-20260326    clang-20
i386                  randconfig-014-20260326    clang-20
i386                  randconfig-015-20260326    clang-20
i386                  randconfig-016-20260326    clang-20
i386                  randconfig-017-20260326    clang-20
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260326    gcc-8.5.0
loongarch             randconfig-002-20260326    gcc-8.5.0
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.2.0
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260326    gcc-8.5.0
nios2                 randconfig-002-20260326    gcc-8.5.0
openrisc                         allmodconfig    clang-23
openrisc                         allmodconfig    gcc-15.2.0
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260326    clang-19
parisc                randconfig-002-20260326    clang-19
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc               randconfig-001-20260326    clang-19
powerpc               randconfig-002-20260326    clang-19
powerpc64             randconfig-001-20260326    clang-19
powerpc64             randconfig-002-20260326    clang-19
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260326    clang-23
riscv                 randconfig-002-20260326    clang-23
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260326    clang-23
s390                  randconfig-002-20260326    clang-23
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260326    clang-23
sh                    randconfig-002-20260326    clang-23
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260326    gcc-14
sparc                 randconfig-002-20260326    gcc-14
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260326    gcc-14
sparc64               randconfig-002-20260326    gcc-14
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260326    gcc-14
um                    randconfig-002-20260326    gcc-14
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260326    clang-20
x86_64      buildonly-randconfig-002-20260326    clang-20
x86_64      buildonly-randconfig-003-20260326    clang-20
x86_64      buildonly-randconfig-004-20260326    clang-20
x86_64      buildonly-randconfig-005-20260326    clang-20
x86_64      buildonly-randconfig-006-20260326    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260326    clang-20
x86_64                randconfig-002-20260326    clang-20
x86_64                randconfig-003-20260326    clang-20
x86_64                randconfig-004-20260326    clang-20
x86_64                randconfig-005-20260326    clang-20
x86_64                randconfig-006-20260326    clang-20
x86_64                randconfig-011-20260326    gcc-14
x86_64                randconfig-012-20260326    gcc-14
x86_64                randconfig-013-20260326    gcc-14
x86_64                randconfig-014-20260326    gcc-14
x86_64                randconfig-015-20260326    gcc-14
x86_64                randconfig-016-20260326    gcc-14
x86_64                randconfig-071-20260326    gcc-14
x86_64                randconfig-072-20260326    gcc-14
x86_64                randconfig-073-20260326    gcc-14
x86_64                randconfig-074-20260326    gcc-14
x86_64                randconfig-075-20260326    gcc-14
x86_64                randconfig-076-20260326    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                           allyesconfig    gcc-15.2.0
xtensa                randconfig-001-20260326    gcc-14
xtensa                randconfig-002-20260326    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
