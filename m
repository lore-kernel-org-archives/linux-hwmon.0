Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ED620A5EA
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635109; cv=none; b=OeyNJjr5iVsR8LoeB/35nMVHjVyXF6ICA7NpSmd4jlYP940gzU4U5CtFk5Et2mLrLttWcSQ9dfXem6Jgfc7aCB08OZKRugxbeuu7YYtCSWD2Vfhz2T5/ECdmjIf4WghnpoRNSh+HgIZ7d3HDQwc/0huOKW2FK4ufDeGRtzk2TCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635109; c=relaxed/simple;
	bh=oZeNVNoSWqqeus3M3PbuZxx+TKUVagp4LPb9Lfyg5po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=alIxJPh8hu9CZC8MLplntpTJX+7aHFSjPGL+a8rl8dcpH0r1nMoTIZ1Zi/pdkRV0mxCiKqsbASy6GT/cjm0jMZ6EoV7XcWQ1ZSxq2E+9XYl8wO0bgKPW0At+Qdmymp0mF6elbaPPRHvBxbOeoU436+kOPXIn5js30EkV9QJ1V9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeYue9O4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeYue9O4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728635107; x=1760171107;
  h=date:from:to:cc:subject:message-id;
  bh=oZeNVNoSWqqeus3M3PbuZxx+TKUVagp4LPb9Lfyg5po=;
  b=FeYue9O4uKrEzXz/LxqEC1QhOFQCFgMKXnnnlikffrttcXJ0i/RfgylI
   fr29MhDvojg83osbdgt4gyvZkW7KaS7JycA4gRoj0/cri6+qrKtMIbWjY
   u74HcxwtOlId2zbmtosZJJM8DtFVuvH+NnvlVwrAotZs5CaRvUq5H5sbM
   z//ycEtfb0bpZ+8NnTMVHGx7JauTd5xjv5umCfBtDolniRtu5US4/fVZG
   tjimTYAY1i4jovAenhkePxsuMOaRxtQb8wxJGKuw7WKvGqwVFg2+nBMvv
   vOTGgZqxeMWF23mO2LeXjLn/XrZPElBYsKLQdAuIh3cWx1KK2PJJi6Fd2
   A==;
X-CSE-ConnectionGUID: VvoKir9GQ+qckxrBfHu9aA==
X-CSE-MsgGUID: Mf6GQxgbQi6ZCrENx4ChUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30904363"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="30904363"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 01:25:06 -0700
X-CSE-ConnectionGUID: 8lou+KTSSc+ZIqEzP7PJYQ==
X-CSE-MsgGUID: zOrFo9/4TFuz96iws4QP9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="77047176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Oct 2024 01:25:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szAxL-000C4H-0i;
	Fri, 11 Oct 2024 08:25:03 +0000
Date: Fri, 11 Oct 2024 16:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 269e1735e3a39053e72bec1eac569c8556bd59af
Message-ID: <202410111638.MckU24pP-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 269e1735e3a39053e72bec1eac569c8556bd59af  Merge branch 'fixes-v6.12' into testing

elapsed time: 1048m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386                                defconfig    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20241011    gcc-12
x86_64      buildonly-randconfig-002-20241011    gcc-12
x86_64      buildonly-randconfig-003-20241011    gcc-12
x86_64      buildonly-randconfig-004-20241011    gcc-12
x86_64      buildonly-randconfig-005-20241011    gcc-12
x86_64      buildonly-randconfig-006-20241011    gcc-12
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241011    gcc-12
x86_64                randconfig-002-20241011    gcc-12
x86_64                randconfig-003-20241011    gcc-12
x86_64                randconfig-004-20241011    gcc-12
x86_64                randconfig-005-20241011    gcc-12
x86_64                randconfig-006-20241011    gcc-12
x86_64                randconfig-011-20241011    gcc-12
x86_64                randconfig-012-20241011    gcc-12
x86_64                randconfig-013-20241011    gcc-12
x86_64                randconfig-014-20241011    gcc-12
x86_64                randconfig-015-20241011    gcc-12
x86_64                randconfig-016-20241011    gcc-12
x86_64                randconfig-071-20241011    gcc-12
x86_64                randconfig-072-20241011    gcc-12
x86_64                randconfig-073-20241011    gcc-12
x86_64                randconfig-074-20241011    gcc-12
x86_64                randconfig-075-20241011    gcc-12
x86_64                randconfig-076-20241011    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
