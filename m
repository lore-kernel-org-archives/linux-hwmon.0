Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76219F40A
	for <linux-hwmon@vger.kernel.org>; Sun, 21 Dec 2025 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766276813; cv=none; b=pPSQwIVCJC/s9j4+zAdjPpNR5k73y6RjBQn6ssLr+k9kM9nuaghXpsa5+KRktfMxk6VAeJ43WBtYKhOZZ/IR4FaYCKEXvUZiQ11nICayFgQafGF8J3GhCNRTHgJEuVh6FnmFt+UODX9AQnrZYVtEpmL6HaBOAmVXtSzeTmhLZwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766276813; c=relaxed/simple;
	bh=Hy1PigmjXx0Pbym2md7bYlRDexLUSv750pwOkZ9VeII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B11w77vJuV/dX7d8mu4u5PHXovatsevJHqK7IZftx0em3xnEteMIsTRXrs4qQ+0f/mPSodYNXUcuo+LfeoqJbnqM7v6RYezybBKzzJoS602cgnWHxk7msaBi8wqbL1X12W336iQSfaXbBr9IH7OCi4DGlBU7W9KtvF7iW6xX4zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZIdOcNv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZIdOcNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766276812; x=1797812812;
  h=date:from:to:cc:subject:message-id;
  bh=Hy1PigmjXx0Pbym2md7bYlRDexLUSv750pwOkZ9VeII=;
  b=TZIdOcNv9JH/dUkB0FZeLpdNGG9NHrxVmX/3hoh8zl3TiOi3r6DdghAZ
   mpaD54jXb3nIU+d96rNgQt7ThASiGo1Kja2LdE+MMCKkhVjc1h1Oskmdt
   +ZlS1pLMdAYi/+bv4vxBv8jnXzO1x6yY1zx9ogVTM5S75+JxYjx0B89PP
   o3fPPpoG2Y/oI9Amhlw7J67MbiBtXdFmqPxj88qplPYC409tCd/SbN630
   a7LNFEjI5hhgXUYln4nfXyGghlG+g5S6trCjVQRq6OSveuXl588iPaUU8
   k+RnPbTvsbg1xodY8Aw1KNt3iJ2mww7eoHc9HMExppsuyjHCjqeIScZgU
   w==;
X-CSE-ConnectionGUID: KClShZMnRxCiBMVcRg9GCw==
X-CSE-MsgGUID: zo9OAYjxTTm95CYRCOqgeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68167900"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68167900"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 16:26:51 -0800
X-CSE-ConnectionGUID: //gsyJ6uSYWIVNbspo5H2g==
X-CSE-MsgGUID: ig22TcBfRvyXjtBel0KYpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203713509"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 16:26:50 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX7Hb-000000005Dg-3sik;
	Sun, 21 Dec 2025 00:26:47 +0000
Date: Sun, 21 Dec 2025 08:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 b3db91c3bfea69a6c6258fea508f25a59c0feb1a
Message-ID: <202512210805.OnCLkfEV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: b3db91c3bfea69a6c6258fea508f25a59c0feb1a  hwmon: (ltc4282): Fix reset_history file permissions

elapsed time: 1890m

configs tested: 76
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
hexagon                          allmodconfig    gcc-15.1.0
hexagon                           allnoconfig    clang-22
hexagon                           allnoconfig    gcc-15.1.0
hexagon                             defconfig    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-15.1.0
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251220    gcc-14
i386        buildonly-randconfig-002-20251220    gcc-14
i386        buildonly-randconfig-003-20251220    gcc-14
i386        buildonly-randconfig-004-20251220    gcc-14
i386        buildonly-randconfig-005-20251220    gcc-14
i386        buildonly-randconfig-006-20251220    gcc-14
i386                                defconfig    gcc-15.1.0
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch                         allnoconfig    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc64                          allmodconfig    clang-22
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.1.0
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
