Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657D5214203
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Feb 2025 02:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740538500; cv=none; b=CB8CYa1ZoBlxpeyd6WoYxREfzOHnSOe70xUfFGctBO5vLU0Kh1FeWfIOIn7JV9SUy2mf1/fGzCc9UcufHZOimPwxmsGigUpVQom1pqtpOmfnkx9m2nnkawMzIBQ50BVxDfoJuERXNk78DypXsC9qsnCOFnn2k0lhvlfvKYnIMEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740538500; c=relaxed/simple;
	bh=cUnQoboU9GSvfxoFC0r6rezVvRLjfA0Ia0YHCsIE9tk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S6xJpZhvAsMWIyksjPwL3nfPDn5+PgYZIAaEgMLgnfEzCW4i1MJkUyFHQQW1sttW2MdoJA/sgmEWSt8iY3EPKKHdEjCzZYFLOH7DY/ABHeZakWpMSFiYKR3iyCt4yccka0Axrx/YnKT9oRbIzfRCmUg6csk2+GLbtDI7xwC3jlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXTOSgGE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXTOSgGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740538498; x=1772074498;
  h=date:from:to:cc:subject:message-id;
  bh=cUnQoboU9GSvfxoFC0r6rezVvRLjfA0Ia0YHCsIE9tk=;
  b=RXTOSgGEeE/NH+Uc/ZUEoNxiBJy8g3H8wQHrkUHkO8is3arpCHCUs4LS
   Y4apw4dU/Rf46tf9gy4UARNXl/WKAeBX7D6gDxiH5ZT3zrv7KTgLH+DGb
   ap89w8rf2ixmJMCnoerYkldtNekKhINN+0TQiQbldFIJrAYYTfDc8yW2K
   Iu9jGxVaQQ1mY58tO2PJmQ9dTypjYw3jOVxCOoMnAdvnZLrr1mxJlzOZM
   pEUrv26SjcP4M+0bWudnujMWulIsz89UwKQKaV6WrfA4t3kAPjwA/0RMs
   vr/fcIgARX5QAGRc5Uve+L7AC9645brt4NLZuxnE7zEw+kSOEPaL5VrG5
   g==;
X-CSE-ConnectionGUID: 5xVHvGKtRbGkZoMqIodqvQ==
X-CSE-MsgGUID: B6lcJbpXQAug50Tmj39vKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52369172"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52369172"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 18:54:57 -0800
X-CSE-ConnectionGUID: WtMBH55bRbO0Iq5hqSeMTA==
X-CSE-MsgGUID: 0rVZYE+eSe+IKr5Xt7CYIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="116583139"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Feb 2025 18:54:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn7ZW-000B2n-27;
	Wed, 26 Feb 2025 02:54:54 +0000
Date: Wed, 26 Feb 2025 10:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:fixes] BUILD SUCCESS
 b364dd4ed21996873456701b5b0f963460ed7cd3
Message-ID: <202502261007.2C7klF72-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git fixes
branch HEAD: b364dd4ed21996873456701b5b0f963460ed7cd3  possible circular locking dependency backtrace seen when enabling PREEMPT_RT

elapsed time: 1451m

configs tested: 72
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                           allyesconfig    gcc-14.2.0
arc                             allmodconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250225    gcc-13.2.0
arc                  randconfig-002-20250225    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250225    gcc-14.2.0
arm                  randconfig-002-20250225    gcc-14.2.0
arm                  randconfig-003-20250225    gcc-14.2.0
arm                  randconfig-004-20250225    clang-15
arm64                           allmodconfig    clang-18
arm64                randconfig-001-20250225    clang-19
arm64                randconfig-002-20250225    clang-17
arm64                randconfig-003-20250225    clang-15
arm64                randconfig-004-20250225    clang-21
csky                 randconfig-001-20250225    gcc-14.2.0
csky                 randconfig-002-20250225    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250225    clang-21
hexagon              randconfig-002-20250225    clang-21
i386                             allnoconfig    gcc-12
i386                            allyesconfig    gcc-12
i386       buildonly-randconfig-001-20250225    clang-19
i386       buildonly-randconfig-002-20250225    gcc-11
i386       buildonly-randconfig-003-20250225    clang-19
i386       buildonly-randconfig-004-20250225    clang-19
i386       buildonly-randconfig-005-20250225    gcc-12
i386       buildonly-randconfig-006-20250225    clang-19
loongarch            randconfig-001-20250225    gcc-14.2.0
loongarch            randconfig-002-20250225    gcc-14.2.0
nios2                randconfig-001-20250225    gcc-14.2.0
nios2                randconfig-002-20250225    gcc-14.2.0
parisc               randconfig-001-20250225    gcc-14.2.0
parisc               randconfig-002-20250225    gcc-14.2.0
powerpc              randconfig-001-20250225    gcc-14.2.0
powerpc              randconfig-002-20250225    clang-19
powerpc              randconfig-003-20250225    clang-21
powerpc64            randconfig-001-20250225    gcc-14.2.0
powerpc64            randconfig-002-20250225    gcc-14.2.0
powerpc64            randconfig-003-20250225    gcc-14.2.0
riscv                randconfig-001-20250225    clang-15
riscv                randconfig-002-20250225    clang-21
s390                            allmodconfig    clang-19
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250225    clang-15
s390                 randconfig-002-20250225    gcc-14.2.0
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250225    gcc-14.2.0
sh                   randconfig-002-20250225    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250225    gcc-14.2.0
sparc                randconfig-002-20250225    gcc-14.2.0
sparc64              randconfig-001-20250225    gcc-14.2.0
sparc64              randconfig-002-20250225    gcc-14.2.0
um                              allmodconfig    clang-21
um                              allyesconfig    gcc-12
um                   randconfig-001-20250225    clang-21
um                   randconfig-002-20250225    gcc-12
x86_64                           allnoconfig    clang-19
x86_64                          allyesconfig    clang-19
x86_64     buildonly-randconfig-001-20250225    gcc-12
x86_64     buildonly-randconfig-002-20250225    clang-19
x86_64     buildonly-randconfig-003-20250225    clang-19
x86_64     buildonly-randconfig-004-20250225    gcc-11
x86_64     buildonly-randconfig-005-20250225    gcc-12
x86_64     buildonly-randconfig-006-20250225    clang-19
x86_64                             defconfig    gcc-11
xtensa               randconfig-001-20250225    gcc-14.2.0
xtensa               randconfig-002-20250225    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
