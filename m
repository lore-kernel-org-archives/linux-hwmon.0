Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8814EC47
	for <linux-hwmon@vger.kernel.org>; Thu, 14 Nov 2024 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731578001; cv=none; b=oqDGpokDGx4gM2d1TPcawPgcBXSZGztiMo86nTGB+A+Dy+LWQLj+ZobBXx+wgPORZ1O8cJ14YHYa1JfgsmHi7oItTL3f51S8VganOJVb6gERB+LBBfXOx5mcGGFjq0tlIdqc2Pj0fzfN6sMu/oDMWdedLPbsb7GLWe+WqOT2auE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731578001; c=relaxed/simple;
	bh=xSOf03MawRYQ2Jt5bMZ/BL9E0a9vJXfietHbqAOaR5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PeOSONHt6Av3OT6JlCjETAPmbUWrb2Nb2JDtOI0yQP2AJtwfKJSKwaYyOCZ8IkUpFk9ejr72o4H8dVzIIF9fgGkurojCVnCCZN8Cy+lhbGWsaUX5pn1bRqb5XYoT5YsFezsuIGHO7o7P8bAAgeHGNgOlSeZg+csi1HOAL7xgh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn3zXCJM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn3zXCJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731578000; x=1763114000;
  h=date:from:to:cc:subject:message-id;
  bh=xSOf03MawRYQ2Jt5bMZ/BL9E0a9vJXfietHbqAOaR5c=;
  b=Vn3zXCJMtbGkBJi8ivP4Kz/4z4+nY75AkahIW9Gmnpc04SU+GEriJDMV
   Lr1DvyhhMK3YN7+nenIFDvY2+NGfTpsaNpSQwWvHJYbj3AdFgAMicOhCl
   ojDuM76/MNcyc360/vkRNxES7ap82kWLX8+bxTUXdgN2FtPPz/ljl8yMn
   uBBUzijtBkYOOg8xL4pVOCuAfq5LUdgJkcEGUqyG2ZkqMyhBfLOCoT+OU
   ENFtQtAmk0XOjmlnSkmGG2XEnerVkZB/yWIDsMlIM56Sn3XiGRQqx8Z4x
   rp0J2Zoi1+GtWTHd2GybQ+4jrbFHPtK952CpxHs5Y1kT8AVFabs4SItqD
   A==;
X-CSE-ConnectionGUID: WMHHmFCWS5unwpd80JxM0A==
X-CSE-MsgGUID: n9Th/kKPSUud/aYqrZv/Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30916574"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="30916574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 01:53:19 -0800
X-CSE-ConnectionGUID: JEoBBVi5Q6SYqS8xjwKeDA==
X-CSE-MsgGUID: /gHe2epqRwy9yXHP+DlRUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="119083437"
Received: from lkp-server01.sh.intel.com (HELO cf353f978a24) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2024 01:53:18 -0800
Received: from kbuild by cf353f978a24 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBWXM-00002L-0a;
	Thu, 14 Nov 2024 09:53:16 +0000
Date: Thu, 14 Nov 2024 17:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 3996187f80a0e24bff1959609065d49041cf648d
Message-ID: <202411141745.XTolJjoz-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 3996187f80a0e24bff1959609065d49041cf648d  hwmon: (pmbus/isl68137) add support for voltage divider on Vout

elapsed time: 733m

configs tested: 71
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241114    gcc-13.2.0
arc                   randconfig-002-20241114    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20241114    gcc-14.2.0
arm                   randconfig-002-20241114    gcc-14.2.0
arm                   randconfig-003-20241114    gcc-14.2.0
arm                   randconfig-004-20241114    clang-14
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241114    clang-20
arm64                 randconfig-002-20241114    gcc-14.2.0
arm64                 randconfig-003-20241114    gcc-14.2.0
arm64                 randconfig-004-20241114    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241114    gcc-14.2.0
csky                  randconfig-002-20241114    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241114    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241114    clang-19
i386        buildonly-randconfig-002-20241114    gcc-11
i386        buildonly-randconfig-003-20241114    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-20
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
