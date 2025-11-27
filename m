Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E5F2F0689
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Nov 2025 18:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764266665; cv=none; b=BGKGC8Y4kBOSRzdMd7/srRgGoJd0Ddz8vfWI8XFPQ7/LZhUfs4FcIm1DF8dQmsx76pAZ0F9Hs0WKV0NG0pL3WS+Mo7KDg8BW3oc8ZDWPKehKrD2+UGTmlt4YRUjDOzmawQnxkhYG/9tpGa8mjfm7okZmKBGOnl6bSr9Co7BeshI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764266665; c=relaxed/simple;
	bh=K5tx26RTTMo3SawDbjLpfV2fqCWvz4CkRN6nYdpby8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sOdJmrvTWLk+KicV+IyD2D+EvcqwmSdAJEzVCfubvsUKgtwimvwEwjpWKoYM+RjOle7tlB6GL3n8J6RfSfhI69jS6dDObga7dIhBJQAQzYXEeVWARO818D1BqhTANvc0welU7UPexsdLpSgpUFQlwIrC2MYmPXhsca8UH+TFeZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BaSVWIwi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BaSVWIwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764266663; x=1795802663;
  h=date:from:to:cc:subject:message-id;
  bh=K5tx26RTTMo3SawDbjLpfV2fqCWvz4CkRN6nYdpby8k=;
  b=BaSVWIwiAtcBE5Jz/ic/OWIZf6/rJZ+J9+gdZOHqcD/YCmIlnKM0Z7gb
   Lnp7vRyZAmli8ovD+qZQr4ZhNRZ5PpnoiuDlb2z2QQMEYfhNgqn3IPkVm
   X/XUwhg5gPbfiDaXEqIXDoiLtoovPi2BqWyBdQu2hB2LdNoKgMyA/rIo2
   J2FFM/j14Pj2U0vLME4QIxuhzdbL0LaUZF9mbKwcyvTlMNxevZ9D4Xi3f
   wZKeTEGJSVP3ePPOPyoTUGOrNAsJbiq3OurjM+EW1sJPmZDJ9DCUQ5DrD
   etOwo3PycPTGD6ewNg5M8NBVeys5omW88Yy5OsSm/6wmoYqcsuHMtrbDs
   g==;
X-CSE-ConnectionGUID: 4coM9wglR4K7qAPxQyr5Sw==
X-CSE-MsgGUID: vYdYOkj/Sq+fT950OiZ4DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66210035"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66210035"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:04:22 -0800
X-CSE-ConnectionGUID: aC1taL/ZRI6fPQtu6njcwA==
X-CSE-MsgGUID: PXvZlXJsS5yx2XC8Cb0rzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="192541334"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 10:04:20 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOgLq-000000005UV-2nld;
	Thu, 27 Nov 2025 18:04:18 +0000
Date: Fri, 28 Nov 2025 02:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 21d0537510583449302e6daa9523910e3c95cef1
Message-ID: <202511280238.nu05yRld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: 21d0537510583449302e6daa9523910e3c95cef1  Merge branch 'fixes-v6.18' into testing

elapsed time: 7289m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251123    gcc-15.1.0
arc         randconfig-002-20251123    gcc-12.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251123    clang-22
arm         randconfig-002-20251123    clang-22
arm         randconfig-003-20251123    gcc-10.5.0
arm         randconfig-004-20251123    clang-22
arm64                   allnoconfig    gcc-15.1.0
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251123    clang-22
hexagon     randconfig-002-20251123    clang-19
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251123    gcc-15.1.0
loongarch   randconfig-002-20251123    clang-18
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
microblaze             allyesconfig    gcc-15.1.0
mips                   allmodconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
mips                   allyesconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251123    gcc-8.5.0
nios2       randconfig-002-20251123    gcc-11.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
parisc                 allyesconfig    gcc-15.1.0
powerpc                allmodconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251123    clang-20
riscv       randconfig-002-20251123    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251123    gcc-8.5.0
s390        randconfig-002-20251123    clang-22
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251123    gcc-12.5.0
sh          randconfig-002-20251123    gcc-14.3.0
sparc                   allnoconfig    gcc-15.1.0
um                     allmodconfig    clang-19
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
