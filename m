Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1509419F118
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728665850; cv=none; b=izADNnaUv7rslRyrd4rTm89kUXHFCP1hjK1IMvb7t47WyeFVU79DjM+3IE+lDQFVQhDaC2lqkPTrTWGXisQ/mWR0gaTd065byev78G2Fk2daNfuCmWi9Buz8gk6wD8RBxpAdt3PR153yHLuYHkKq9Jyq/GZSzarnWnk9acJtVXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728665850; c=relaxed/simple;
	bh=6JXz3mT7oFOCS75dMt+RUH/gf6TpF5NhZp05GUz0O+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ocSy+J5emfIRuJ+J8jOrFA7chPOIyELId9sg5BC1QXuW24CsljHFQNM0umL+qvBXKccNUVL4kAtt2mxaYexOGG4FNK0RIkKu+UT/+Vr1O7nPpWwsEdubnfxsYvQK101v4n6mQoL4YvQb553CodLPoiBNx0KMlqcUzfDahnZsfJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iza+6cIR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iza+6cIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728665849; x=1760201849;
  h=date:from:to:cc:subject:message-id;
  bh=6JXz3mT7oFOCS75dMt+RUH/gf6TpF5NhZp05GUz0O+E=;
  b=Iza+6cIRq1tu24WtYM696puYJi/9boBzewsJ3F7RLbhijQIqOIgwS8Kz
   Dzpaui8fULhJ8E9nNiVD4VpzdwGxQQwKLSttkwb6k74T+y+CfMlXlKvgm
   USXAEN8VL5of6IDvPdY9AeMwD3Juu+kB/d/y+T+zzT1hQmZQuzXrC9eib
   hGM9Hwe+O/Gm2HqKVZjcKxxTMwVZiD3jW2iQBwru0Sx3gEs9Xn3QOwrfn
   +ZAgphYdbrJBBJSVeXdmAsru2eTZa0HDFIvMwu818qlK7jqobqcUNMemK
   7zMz94xd4N0tYGu5uVDm4fiABvW3rmWIOrlotwRMZaJSFg6uEKuwQKhV/
   A==;
X-CSE-ConnectionGUID: L9ZwAz05SB6O9zUqxPrPBw==
X-CSE-MsgGUID: wfJKtnTXS7mnFDRB1/TWTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31863227"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="31863227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 09:57:28 -0700
X-CSE-ConnectionGUID: 1mLmiY/TRXO9QD7i8/Y6lg==
X-CSE-MsgGUID: kXGZ7CzsT1GcNEv1tD6+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="76859019"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Oct 2024 09:57:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szIxB-000CWJ-06;
	Fri, 11 Oct 2024 16:57:25 +0000
Date: Sat, 12 Oct 2024 00:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 11fb69bb15c151f967e7fafaf68c6451c5d6359a
Message-ID: <202410120047.B3Uf1Mwr-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 11fb69bb15c151f967e7fafaf68c6451c5d6359a  hwmon: Add static visibility member to struct hwmon_ops

elapsed time: 1200m

configs tested: 65
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-14.1.0
alpha           allyesconfig    clang-20
arc             allmodconfig    clang-20
arc              allnoconfig    gcc-14.1.0
arc             allyesconfig    clang-20
arm             allmodconfig    clang-20
arm              allnoconfig    gcc-14.1.0
arm             allyesconfig    clang-20
arm64           allmodconfig    clang-20
arm64            allnoconfig    gcc-14.1.0
csky             allnoconfig    gcc-14.1.0
hexagon         allmodconfig    clang-20
hexagon          allnoconfig    gcc-14.1.0
hexagon         allyesconfig    clang-20
i386            allmodconfig    clang-18
i386             allnoconfig    clang-18
i386            allyesconfig    clang-18
i386               defconfig    clang-18
loongarch       allmodconfig    gcc-14.1.0
loongarch        allnoconfig    gcc-14.1.0
m68k            allmodconfig    gcc-14.1.0
m68k             allnoconfig    gcc-14.1.0
m68k            allyesconfig    gcc-14.1.0
microblaze      allmodconfig    gcc-14.1.0
microblaze       allnoconfig    gcc-14.1.0
microblaze      allyesconfig    gcc-14.1.0
mips             allnoconfig    gcc-14.1.0
nios2            allnoconfig    gcc-14.1.0
openrisc         allnoconfig    clang-20
openrisc        allyesconfig    gcc-14.1.0
openrisc           defconfig    gcc-12
parisc          allmodconfig    gcc-14.1.0
parisc           allnoconfig    clang-20
parisc          allyesconfig    gcc-14.1.0
parisc             defconfig    gcc-12
powerpc         allmodconfig    gcc-14.1.0
powerpc          allnoconfig    clang-20
powerpc         allyesconfig    gcc-14.1.0
riscv           allmodconfig    gcc-14.1.0
riscv            allnoconfig    clang-20
riscv           allyesconfig    gcc-14.1.0
riscv              defconfig    gcc-12
s390            allmodconfig    gcc-14.1.0
s390             allnoconfig    clang-20
s390            allyesconfig    gcc-14.1.0
s390               defconfig    gcc-12
sh              allmodconfig    gcc-14.1.0
sh               allnoconfig    gcc-14.1.0
sh              allyesconfig    gcc-14.1.0
sh                 defconfig    gcc-12
sparc           allmodconfig    gcc-14.1.0
sparc64            defconfig    gcc-12
um              allmodconfig    clang-20
um               allnoconfig    clang-20
um              allyesconfig    clang-20
um                 defconfig    gcc-12
um            i386_defconfig    gcc-12
um          x86_64_defconfig    gcc-12
x86_64           allnoconfig    clang-18
x86_64          allyesconfig    clang-18
x86_64             defconfig    clang-18
x86_64                 kexec    gcc-12
x86_64              rhel-8.3    gcc-12
x86_64         rhel-8.3-rust    clang-18
xtensa           allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
