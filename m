Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3B71CF7C9
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Oct 2024 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729844693; cv=none; b=Ddpd7DUVCw/Rm6bv0hIoiuJS6q3Nc8jRQRCI+uKWw/vu+27gWVXkN1gIJ75sHOFf+H2LSk5ebWX83NubiQXYbkcBSjMbJLa5rwCJReiWYriPYzL1v0/Gexbsxq38/izSjH0LXGknYVgwwDqM0uWsFuYZ0gNm/pdtutMblotlOo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729844693; c=relaxed/simple;
	bh=R9znE4/7ZuxT6tzv5tsxC2/m/7JNfqGKK+4fp28e1RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ePO12+ZG4WAC7vN8LwplRspy3ThHqxMGyrLI/gC5FiiD36yXUnouid8UB4BF1x2380E/YDZxrRV9XQ6u8SzMrFz+NlRpnojB9zqpVEcKvq2e92Dnuuj6Xsp/jFc7Px6B4yFUk85qrdsofQZYU8nrGftROoL6XDgDLEFJ8EFhICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b54lbkCM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b54lbkCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729844691; x=1761380691;
  h=date:from:to:cc:subject:message-id;
  bh=R9znE4/7ZuxT6tzv5tsxC2/m/7JNfqGKK+4fp28e1RY=;
  b=b54lbkCMqglyV+3k+PByKIABVw+WBabsFNfQswHFgUD6926ALHBN52xj
   gqZiBX3ay9dE+2sLLoBjLkdJ8JEjRG6IONjs6ghQ+IDBAxeYWF2u1RG6z
   lH56+lEN6AyMcusECckSByJAttXgtx/MKjosBW2+7VOJhIfg50z7UlArl
   n4Z+gPI8rYGfiwIBazOrlUM8mBaspPbDqe4F9U1S54zmvLjNxHqBpu2SR
   NhERShpiFfsWdongl4INHm0tYxjdpQEVQa7Z2j0Lg/6yZKK3DJJa1cjfS
   5Sp5G3aralbi/gGesi3oV9NxA6JUfQwr3Rxi1T0Ow5xA9vSDSQ2J5ALbR
   A==;
X-CSE-ConnectionGUID: TJdkuh+yS+iK4q6wxorZag==
X-CSE-MsgGUID: B4PHHQb6Q3ih06FA86jMvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33417474"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="33417474"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 01:24:50 -0700
X-CSE-ConnectionGUID: Q/NfcqZEQAaFD50URoWytA==
X-CSE-MsgGUID: u304LeESRrmDEYXphCZi5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="84811894"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Oct 2024 01:24:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4Fcl-000Xqe-1b;
	Fri, 25 Oct 2024 08:24:47 +0000
Date: Fri, 25 Oct 2024 16:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 893acae4cdaf34fdde0e7285d5922af70775e5f7
Message-ID: <202410251617.R76c0g1e-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 893acae4cdaf34fdde0e7285d5922af70775e5f7  MAINTAINERS: Remove Aleksandr Mezin as NZXT-SMART2 driver maintainer

elapsed time: 903m

configs tested: 82
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-14.1.0
alpha                 allyesconfig    clang-20
alpha                    defconfig    gcc-14.1.0
arc                   allmodconfig    clang-20
arc                    allnoconfig    gcc-14.1.0
arc                   allyesconfig    clang-20
arm                   allmodconfig    clang-20
arm                    allnoconfig    gcc-14.1.0
arm                   allyesconfig    clang-20
arm              lpc32xx_defconfig    gcc-14.1.0
arm              s3c6400_defconfig    gcc-14.1.0
arm               sp7021_defconfig    gcc-14.1.0
arm         vt8500_v6_v7_defconfig    gcc-14.1.0
arm64                 allmodconfig    clang-20
arm64                  allnoconfig    gcc-14.1.0
csky                   allnoconfig    gcc-14.1.0
hexagon               allmodconfig    clang-20
hexagon                allnoconfig    gcc-14.1.0
hexagon               allyesconfig    clang-20
i386                  alldefconfig    gcc-14.1.0
i386                  allmodconfig    clang-19
i386                   allnoconfig    clang-19
i386                  allyesconfig    clang-19
i386                     defconfig    clang-19
loongarch             allmodconfig    gcc-14.1.0
loongarch              allnoconfig    gcc-14.1.0
m68k                  allmodconfig    gcc-14.1.0
m68k                   allnoconfig    gcc-14.1.0
m68k                  allyesconfig    gcc-14.1.0
microblaze            allmodconfig    gcc-14.1.0
microblaze             allnoconfig    gcc-14.1.0
microblaze            allyesconfig    gcc-14.1.0
mips                   allnoconfig    gcc-14.1.0
mips                 gpr_defconfig    gcc-14.1.0
mips                jazz_defconfig    gcc-14.1.0
nios2                  allnoconfig    gcc-14.1.0
openrisc               allnoconfig    clang-20
openrisc              allyesconfig    gcc-14.1.0
openrisc                 defconfig    gcc-12
parisc                allmodconfig    gcc-14.1.0
parisc                 allnoconfig    clang-20
parisc                allyesconfig    gcc-14.1.0
parisc                   defconfig    gcc-12
powerpc               allmodconfig    gcc-14.1.0
powerpc                allnoconfig    clang-20
powerpc               allyesconfig    gcc-14.1.0
powerpc          sequoia_defconfig    gcc-14.1.0
powerpc           tqm8xx_defconfig    gcc-14.1.0
powerpc             warp_defconfig    gcc-14.1.0
riscv                 allmodconfig    gcc-14.1.0
riscv                  allnoconfig    clang-20
riscv                 allyesconfig    gcc-14.1.0
riscv                    defconfig    gcc-12
s390                  allmodconfig    gcc-14.1.0
s390                   allnoconfig    clang-20
s390                  allyesconfig    gcc-14.1.0
s390                     defconfig    gcc-12
sh                    allmodconfig    gcc-14.1.0
sh                     allnoconfig    gcc-14.1.0
sh                    allyesconfig    gcc-14.1.0
sh                       defconfig    gcc-12
sh              ecovec24_defconfig    gcc-14.1.0
sh             edosk7705_defconfig    gcc-14.1.0
sh               kfr2r09_defconfig    gcc-14.1.0
sh          magicpanelr2_defconfig    gcc-14.1.0
sh                se7619_defconfig    gcc-14.1.0
sh                se7705_defconfig    gcc-14.1.0
sparc                 allmodconfig    gcc-14.1.0
sparc64                  defconfig    gcc-12
um                    allmodconfig    clang-20
um                     allnoconfig    clang-20
um                    allyesconfig    clang-20
um                       defconfig    gcc-12
um                  i386_defconfig    gcc-12
um                x86_64_defconfig    gcc-12
x86_64                 allnoconfig    clang-19
x86_64                allyesconfig    clang-19
x86_64                   defconfig    clang-19
x86_64                       kexec    clang-19
x86_64                       kexec    gcc-12
x86_64                    rhel-8.3    gcc-12
xtensa                 allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
