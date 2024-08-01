Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F37714A603
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Aug 2024 20:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722545638; cv=none; b=bg5PxNVdfDRd+yYm9spFZFEj9XcbSfmKs30ghbc68YS32Aze2Kdqhcvn8h4vR48lxuP8r++TY2N6DAMs6IJaDIJpJnQCujv6a+HejfivmxYkM8rrE2GI4EyR3QoIgv5J/dbznR6HO/DnvZEKn1//s8XH6Y2PvgQwoSzHz1hPtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722545638; c=relaxed/simple;
	bh=O5ux0Waz7XK8heRnPKB0WFjrV9fX2g1kfm04uuJfLPY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VV3gr3IQWby30V1nig6tjuu9Xt2bVu3wl7dJmYrBrK/UuKE0KZyhvcdKmgx0bVjeJhaqmfeCMi3OzkOZKriPuAqhtaiHu+GnEfWQ2CVZJTc4vL/AvQzRW0B1cGegCBL6OypFd4stU5bWaeCxxr7a0m+m1Lh+PKXeBNnDp6M1qYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SY4a8dE1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SY4a8dE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722545636; x=1754081636;
  h=date:from:to:cc:subject:message-id;
  bh=O5ux0Waz7XK8heRnPKB0WFjrV9fX2g1kfm04uuJfLPY=;
  b=SY4a8dE1Kbom0e3NK94ElLOTbz+p7Z6CJ4TQ+o/6HNYUM8qsHtcfFnY5
   xKDZbYO6Mm6iNM3J9ikWGo2tGcXmNPXwd7FyF0wGsW7NSfd3gJdboeSvX
   5PkYVzrASO70DAKE9nROlCti1NZIN89Nui7Kkb0uDq01m2J17JrLIho8K
   wrXprEqxFIjPodQD/gaIxUVBnRLH9gzS4JY7OCv4XV0cT1PHD6p5aUAtM
   5CqVBszJ9zvx2VmAXoRhnx9awsFeooZwWjn2obIihSJdW8lMiuTUGrysC
   gEPt9tKdsddcIZvTNxzWb3jpYkQvsPc5f5b5MqcenzPhtATQ2Rf5gjnCI
   Q==;
X-CSE-ConnectionGUID: k9yryVtcRrm41sCTf3u/+g==
X-CSE-MsgGUID: kyNQMW5xTVWonouN76Xlzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="43054770"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="43054770"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 13:53:52 -0700
X-CSE-ConnectionGUID: v6oMiPUtQmGUVNLunXQjcQ==
X-CSE-MsgGUID: I4+LVa2cS/WSoQRdd2khzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; 
   d="scan'208";a="54839814"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Aug 2024 13:53:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZco0-000w1u-0a;
	Thu, 01 Aug 2024 20:53:48 +0000
Date: Fri, 02 Aug 2024 04:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 ee12fb26a5eb499f2193a70ed231031f0443ed79
Message-ID: <202408020400.qDEZPTZK-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: ee12fb26a5eb499f2193a70ed231031f0443ed79  hwmon: vexpress: Use of_property_present()

elapsed time: 1453m

configs tested: 168
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                             allnoconfig   gcc-13.3.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240801   gcc-13.2.0
arc                   randconfig-002-20240801   gcc-13.2.0
arc                        vdk_hs38_defconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   clang-14
arm                      integrator_defconfig   clang-20
arm                   randconfig-001-20240801   gcc-14.1.0
arm                   randconfig-002-20240801   gcc-14.1.0
arm                   randconfig-003-20240801   clang-20
arm                   randconfig-004-20240801   clang-15
arm                         s3c6400_defconfig   gcc-14.1.0
arm                           sunxi_defconfig   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240801   clang-20
arm64                 randconfig-002-20240801   clang-20
arm64                 randconfig-003-20240801   gcc-14.1.0
arm64                 randconfig-004-20240801   gcc-14.1.0
csky                              allnoconfig   gcc-13.2.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240801   gcc-14.1.0
csky                  randconfig-002-20240801   gcc-14.1.0
hexagon                           allnoconfig   clang-20
hexagon                             defconfig   clang-20
hexagon               randconfig-001-20240801   clang-20
hexagon               randconfig-002-20240801   clang-20
i386                             allmodconfig   gcc-13
i386                              allnoconfig   gcc-13
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240801   gcc-9
i386         buildonly-randconfig-002-20240801   clang-18
i386         buildonly-randconfig-003-20240801   gcc-7
i386         buildonly-randconfig-004-20240801   clang-18
i386         buildonly-randconfig-005-20240801   clang-18
i386         buildonly-randconfig-006-20240801   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240801   gcc-13
i386                  randconfig-002-20240801   clang-18
i386                  randconfig-003-20240801   clang-18
i386                  randconfig-004-20240801   clang-18
i386                  randconfig-005-20240801   gcc-13
i386                  randconfig-006-20240801   gcc-13
i386                  randconfig-011-20240801   gcc-13
i386                  randconfig-012-20240801   clang-18
i386                  randconfig-013-20240801   gcc-13
i386                  randconfig-014-20240801   gcc-13
i386                  randconfig-015-20240801   gcc-12
i386                  randconfig-016-20240801   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240801   gcc-14.1.0
loongarch             randconfig-002-20240801   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                           virt_defconfig   gcc-14.1.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-13.2.0
mips                              allnoconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240801   gcc-14.1.0
nios2                 randconfig-002-20240801   gcc-14.1.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240801   gcc-14.1.0
parisc                randconfig-002-20240801   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                       maple_defconfig   clang-20
powerpc                     rainier_defconfig   gcc-14.1.0
powerpc               randconfig-001-20240801   gcc-14.1.0
powerpc               randconfig-002-20240801   clang-20
powerpc               randconfig-003-20240801   gcc-14.1.0
powerpc64             randconfig-001-20240801   clang-20
powerpc64             randconfig-002-20240801   gcc-14.1.0
powerpc64             randconfig-003-20240801   clang-15
riscv                            allmodconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv                 randconfig-001-20240801   clang-20
riscv                 randconfig-002-20240801   clang-20
s390                             allmodconfig   clang-20
s390                              allnoconfig   clang-20
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240801   clang-15
s390                  randconfig-002-20240801   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                    randconfig-001-20240801   gcc-14.1.0
sh                    randconfig-002-20240801   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240801   gcc-14.1.0
sparc64               randconfig-002-20240801   gcc-14.1.0
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-13
um                    randconfig-001-20240801   clang-20
um                    randconfig-002-20240801   gcc-7
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240801   clang-18
x86_64       buildonly-randconfig-002-20240801   clang-18
x86_64       buildonly-randconfig-003-20240801   clang-18
x86_64       buildonly-randconfig-004-20240801   gcc-11
x86_64       buildonly-randconfig-005-20240801   clang-18
x86_64       buildonly-randconfig-006-20240801   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240801   gcc-13
x86_64                randconfig-002-20240801   gcc-8
x86_64                randconfig-003-20240801   clang-18
x86_64                randconfig-004-20240801   gcc-8
x86_64                randconfig-005-20240801   gcc-13
x86_64                randconfig-006-20240801   gcc-13
x86_64                randconfig-011-20240801   clang-18
x86_64                randconfig-012-20240801   gcc-13
x86_64                randconfig-013-20240801   clang-18
x86_64                randconfig-014-20240801   clang-18
x86_64                randconfig-015-20240801   clang-18
x86_64                randconfig-016-20240801   gcc-13
x86_64                randconfig-071-20240801   clang-18
x86_64                randconfig-072-20240801   clang-18
x86_64                randconfig-073-20240801   clang-18
x86_64                randconfig-074-20240801   clang-18
x86_64                randconfig-075-20240801   gcc-13
x86_64                randconfig-076-20240801   gcc-11
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                            allnoconfig   gcc-14.1.0
xtensa                randconfig-002-20240801   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
