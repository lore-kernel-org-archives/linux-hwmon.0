Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B553D126BF7
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Nov 2025 20:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762201029; cv=none; b=DZ5pVn3pdgKiKw3l0zrIBgF7n8ElWfLUALE50HG4E/aj/cMdbIDT3f7HZyXQN1ZkaB79cJy/LK90UcUbf+SDs9fFMHunZUJBqfbEL0Zm8SC+waoQr7bNo9t3sBbtII1SqaBxtaIxHXAJfN5vE+WpUnJ7SdDphPskUsQywm9vyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762201029; c=relaxed/simple;
	bh=AA116PJu+BFYywjSTRCpfM9dP4/s9y90ztyjxLZO3Us=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tKx/6ELkVBta0pWzDkGWkdlWp984LxHTbOmjcr3B9N+2v0qgtv7SAgu4qsvDUv+TCO76wRsIeeWCdKjHU0EPMQC8cHA5h2IMW6nmFaKD0sezY8HtynhFTcWJxNTdA784E3MlOjoJww1N2ET9ULpvivqiMRJkALsp+72hUldBIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtGDDRl9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtGDDRl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762201028; x=1793737028;
  h=date:from:to:cc:subject:message-id;
  bh=AA116PJu+BFYywjSTRCpfM9dP4/s9y90ztyjxLZO3Us=;
  b=JtGDDRl9kWye/IQVxktxdmTYC4SdwcxxAFGSqyeGsuLhgov6qcai3DK5
   iUpS7zN8x//PD4hbBfJBqGaKdXcKYXFi5bo1Yl2tPrM9rYDkL15pCieDe
   fMAwEfHiBua3eaXSlXv3T37w7SL+yR3f5DesrKHwrryZco0nlXX4s+SIw
   8sXhrpUYcueLPc6BrTqFVCnNk4OnTVBQPsaKfAZP2Y7XgRu/cVDESdUu1
   NGJfobzXb8Xvo3uswVGYhdZcfKw+t3szXEBQP8Jcz/t8GLdpqpJAQvMvz
   GCO8IudGEwafDcCm+i6+AJyG1Em3/q0nyZU/6KuYGb7zNIGN9Jqln7elb
   g==;
X-CSE-ConnectionGUID: LrhWYcKuSHGGPIGPofGn3g==
X-CSE-MsgGUID: jWAURWUNSemSPKWKeA672Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64439029"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="64439029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 12:17:07 -0800
X-CSE-ConnectionGUID: 0uaTlRo9QBya+SyzbrC1iQ==
X-CSE-MsgGUID: 0qRJ+0mITOqz7MnPt1IylQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; 
   d="scan'208";a="187683393"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2025 12:17:06 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vG0zA-000QWm-0a;
	Mon, 03 Nov 2025 20:17:04 +0000
Date: Tue, 04 Nov 2025 04:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 68c2a8b59d231b83284cfda6c3c2147f4e0fa4cf
Message-ID: <202511040443.PICZYVdz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 68c2a8b59d231b83284cfda6c3c2147f4e0fa4cf  hwmon: (sy7636a) Fix sensor description

elapsed time: 1454m

configs tested: 122
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20251103    gcc-9.5.0
arc                   randconfig-002-20251103    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20251103    clang-22
arm                   randconfig-002-20251103    clang-16
arm                   randconfig-003-20251103    gcc-14.3.0
arm                   randconfig-004-20251103    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                            allyesconfig    clang-22
arm64                            allyesconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                             allyesconfig    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon               randconfig-001-20251103    clang-22
hexagon               randconfig-001-20251103    gcc-14.3.0
hexagon               randconfig-002-20251103    clang-22
hexagon               randconfig-002-20251103    gcc-14.3.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251103    gcc-14
i386        buildonly-randconfig-002-20251103    clang-20
i386        buildonly-randconfig-003-20251103    clang-20
i386        buildonly-randconfig-004-20251103    gcc-14
i386        buildonly-randconfig-005-20251103    gcc-14
i386        buildonly-randconfig-006-20251103    gcc-13
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                        allyesconfig    clang-22
loongarch                        allyesconfig    gcc-15.1.0
loongarch             randconfig-001-20251103    gcc-12.5.0
loongarch             randconfig-001-20251103    gcc-14.3.0
loongarch             randconfig-002-20251103    gcc-14.3.0
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                            allyesconfig    clang-22
nios2                            allyesconfig    gcc-11.5.0
nios2                 randconfig-001-20251103    gcc-11.5.0
nios2                 randconfig-001-20251103    gcc-14.3.0
nios2                 randconfig-002-20251103    gcc-11.5.0
nios2                 randconfig-002-20251103    gcc-14.3.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                randconfig-001-20251103    clang-20
parisc                randconfig-001-20251103    gcc-14.3.0
parisc                randconfig-002-20251103    clang-20
parisc                randconfig-002-20251103    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc               randconfig-001-20251103    clang-20
powerpc               randconfig-001-20251103    gcc-8.5.0
powerpc               randconfig-002-20251103    clang-20
powerpc64             randconfig-001-20251103    clang-20
powerpc64             randconfig-001-20251103    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    gcc-15.1.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                            allyesconfig    clang-22
sparc                            allyesconfig    gcc-15.1.0
sparc                 randconfig-001-20251103    clang-19
sparc                 randconfig-002-20251103    clang-19
sparc64                          allmodconfig    clang-22
sparc64                          allyesconfig    clang-22
sparc64                          allyesconfig    gcc-15.1.0
sparc64               randconfig-001-20251103    clang-19
sparc64               randconfig-002-20251103    clang-19
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                    randconfig-001-20251103    clang-19
um                    randconfig-002-20251103    clang-19
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251103    clang-19
xtensa                randconfig-002-20251103    clang-19

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
