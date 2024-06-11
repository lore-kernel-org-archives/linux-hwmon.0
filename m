Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E32386
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Jun 2024 19:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718134625; cv=none; b=NZZKVW34P5RDEiFp2jO92WeJVSRUrFNheWNPCTVYNhIu5IjhBkuqY/pd5VJhZvliX2zgYu7b4sIk/F0xi6r+0Q8ZP2iihmK+c3Rr7qlisrZvrljFMeYnoNSFsNqtFkKIxo3a5Dj0bpKFgOjasYTpHDR3p/nQJxG2yLeqq38PiyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718134625; c=relaxed/simple;
	bh=sI6t5NyCgae4aAFJLK3p2roXpaICjQhCpKfAL9lIccI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=diZuvF0lOd24fv5+6fi9UxJsRuH69aRUqa/v/McgEYxEszQkzgUdorKcp0RW9I51/5itDeTG0pYW5dvLkr692LBS0NIqegcj8ifbHf/HXLxBRYN9fPGnV+LUuQU/wtbcmqXkJvVTOvguIeKCTkdQLR/Tl+lD6xiT+4brxsdBhps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fimfJ03p; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fimfJ03p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718134624; x=1749670624;
  h=date:from:to:cc:subject:message-id;
  bh=sI6t5NyCgae4aAFJLK3p2roXpaICjQhCpKfAL9lIccI=;
  b=fimfJ03pZrsyG2NFqH+gFLyFQKyaPD9XCNeXRVGdNLSFtlkp5SwpYQUs
   //Id0Z+Mgv93rGKit4cDoHAmd3sHH1SpjwM1hGB6EYyGw7tQwkoLoos0p
   7j8lG2Tc6utopik01XEOH5xMgvqj2DEMzTJPyb+p7yyJs2knMRFDlY6PH
   ZpfVJCCZ+BmfRjYA+Lu9FzGPdnz3Jq9hfbxonPornIc/FUAud2ugTU+ls
   HEQ6kbmMuhCG7nco2nAlZr8R5obR9r9T2FxCsA8P852uoBw+H8cY8uYd0
   tJWJhB/uRspx5DYq+lG7lhiSm5DMukbTvCzPwyXvO3UB2Ft1GdoYUX1tz
   g==;
X-CSE-ConnectionGUID: PrGYBJ1fQ1eJYwmIt+370w==
X-CSE-MsgGUID: DaxCtl7zQQ+ERCfb0T3FnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="32407833"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="32407833"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 12:37:03 -0700
X-CSE-ConnectionGUID: kLtwCtppS1idmQbQNpW+Rg==
X-CSE-MsgGUID: i6e0Xs7AR/yHeaL+SgSxug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="39604659"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2024 12:37:03 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH7Ii-0000qK-1h;
	Tue, 11 Jun 2024 19:37:00 +0000
Date: Wed, 12 Jun 2024 03:36:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 732fe3305a57c3cae2df8830681366cc2a1d8bd5
Message-ID: <202406120339.tsNHUoyp-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 732fe3305a57c3cae2df8830681366cc2a1d8bd5  hwmon: (pmbus/lm25066) Let enum chips start with index 0

elapsed time: 1467m

configs tested: 86
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc  
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc  
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc  
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc  
arc                                 defconfig   gcc-13.2.0
arm                               allnoconfig   clang
arm                                 defconfig   clang
arm64                             allnoconfig   gcc  
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc  
arm64                               defconfig   gcc-13.2.0
csky                              allnoconfig   gcc  
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc  
csky                                defconfig   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang
i386                              allnoconfig   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc  
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc  
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc-13.2.0
nios2                            allmodconfig   gcc-13.2.0
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc-13.2.0
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                          allnoconfig   gcc-13.2.0
openrisc                            defconfig   gcc  
openrisc                            defconfig   gcc-13.2.0
parisc                            allnoconfig   gcc  
parisc                            allnoconfig   gcc-13.2.0
parisc                              defconfig   gcc  
parisc                              defconfig   gcc-13.2.0
parisc64                            defconfig   gcc  
parisc64                            defconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc  
powerpc                           allnoconfig   gcc-13.2.0
riscv                             allnoconfig   gcc  
riscv                             allnoconfig   gcc-13.2.0
riscv                               defconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc-13.2.0
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc-13.2.0
sparc64                          allyesconfig   gcc-13.2.0
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                               allyesconfig   gcc-13
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
