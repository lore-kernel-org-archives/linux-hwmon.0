Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA032E73E
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538489; cv=none; b=aALM96a5xJACozH/+ACayAlk3Hdf81tiXf9nVgsIDSfIcbIJwvvuUNk8ADZX9c9cM5/ltS3ZFvzARNygGmtRq9KfBOg3oVt1/siJnlsECKUsS78DnyDZ6G/Zrxdbr+Bz3N52+ykjQR89p8rll5jg8T2rM5HNrUC6Un/PrW4GC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538489; c=relaxed/simple;
	bh=EVmZY7JHKD0bO5OwtkcnvtiZd2A0o/JTQR24pgMujw0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A8VB0WiLHuO+pj6CEaeqzLWnuhFXEagi00gDd5P9c7jJXd+gdvpr98o1fcZ2Iodz9TYxt8rDKGkJf1zSc6nX7e8PNTYOgzq/MoJqqfHTsiEIHq4APZz9yO6Zr9VG6586Av2/x8j2AklSKHdGQifBV7AmJ27kgiYTKpBNoGsoU+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEhgG5UY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEhgG5UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772538488; x=1804074488;
  h=date:from:to:cc:subject:message-id;
  bh=EVmZY7JHKD0bO5OwtkcnvtiZd2A0o/JTQR24pgMujw0=;
  b=oEhgG5UYE+oprBl8+GGRXxHD2aEWkS7pNd3knBrOchWyC3/7DlV/IcAb
   Da/jxhDwRMpXwnBPm9B+bs4gU2OxJr0ar9sB7EOXzqWXoU4g6i41F4c98
   Nj8Ur8/njK6JuB7A1GPOI7jsol28OGpxuYj0u4OsbOfY1pBWPDcGvBUQO
   UMv0daPTwmJBYXWkFvX+5QDuUjQzP/pBHb8v6PQ0LLTwpb9/MYTO3KJUG
   CeDA49ogz8w8XbOVNxxz0RC6jjGWdBqLFK9U92rQakBwNyndynTHo6Hed
   Wvrh87LlPGCy5xgtVjYR8GWVe7NAez7kXvszYD0Zl/a45nuyE8OkYCqPB
   w==;
X-CSE-ConnectionGUID: cboYtSG5QIuzaiNTgUNHeQ==
X-CSE-MsgGUID: f157psn1TXu1s6EKjmdblA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73766094"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73766094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 03:48:08 -0800
X-CSE-ConnectionGUID: ZSfKS1ZATA2H1EWaN6fiTw==
X-CSE-MsgGUID: +j0LOvl1R5OgCkRAYY65pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="215498325"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2026 03:48:07 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxOEO-000000002AD-1mhJ;
	Tue, 03 Mar 2026 11:48:04 +0000
Date: Tue, 03 Mar 2026 19:48:01 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 e176ad7b57a1a15ece213251b7f3103bd929e26c
Message-ID: <202603031953.KzwoLW5I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: e176ad7b57a1a15ece213251b7f3103bd929e26c  dt-bindings: hwmon: sl28cpld: Drop sa67mcu compatible

elapsed time: 1220m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-15.2.0
alpha        allyesconfig    gcc-15.2.0
arc          allmodconfig    gcc-15.2.0
arc           allnoconfig    gcc-15.2.0
arc          allyesconfig    gcc-15.2.0
arm           allnoconfig    clang-23
arm          allyesconfig    gcc-15.2.0
arm64        allmodconfig    clang-19
arm64         allnoconfig    gcc-15.2.0
csky         allmodconfig    gcc-15.2.0
csky          allnoconfig    gcc-15.2.0
hexagon      allmodconfig    clang-17
hexagon       allnoconfig    clang-23
i386         allmodconfig    gcc-14
i386          allnoconfig    gcc-14
i386         allyesconfig    gcc-14
loongarch    allmodconfig    clang-19
loongarch     allnoconfig    clang-23
m68k         allmodconfig    gcc-15.2.0
m68k          allnoconfig    gcc-15.2.0
m68k         allyesconfig    gcc-15.2.0
microblaze    allnoconfig    gcc-15.2.0
microblaze   allyesconfig    gcc-15.2.0
mips         allmodconfig    gcc-15.2.0
mips          allnoconfig    gcc-15.2.0
mips         allyesconfig    gcc-15.2.0
nios2        allmodconfig    gcc-11.5.0
nios2         allnoconfig    gcc-11.5.0
openrisc     allmodconfig    gcc-15.2.0
openrisc      allnoconfig    gcc-15.2.0
parisc       allmodconfig    gcc-15.2.0
parisc        allnoconfig    gcc-15.2.0
parisc       allyesconfig    gcc-15.2.0
powerpc      allmodconfig    gcc-15.2.0
powerpc       allnoconfig    gcc-15.2.0
riscv        allmodconfig    clang-23
riscv         allnoconfig    gcc-15.2.0
riscv        allyesconfig    clang-16
s390         allmodconfig    clang-18
s390          allnoconfig    clang-23
s390         allyesconfig    gcc-15.2.0
sh           allmodconfig    gcc-15.2.0
sh            allnoconfig    gcc-15.2.0
sh           allyesconfig    gcc-15.2.0
sparc         allnoconfig    gcc-15.2.0
sparc64      allmodconfig    clang-23
um           allmodconfig    clang-19
um            allnoconfig    clang-23
um           allyesconfig    gcc-14
x86_64       allmodconfig    clang-20
x86_64        allnoconfig    clang-20
x86_64       allyesconfig    clang-20
x86_64      rhel-9.4-rust    clang-20
xtensa        allnoconfig    gcc-15.2.0
xtensa       allyesconfig    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
