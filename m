Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3AEAF6
	for <linux-hwmon@vger.kernel.org>; Fri, 10 May 2024 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715360668; cv=none; b=rha4/5m5CVLYW1NCwy+J563sALLu/7iEuiwsOD6BopkpX/62I32N8YtrlX+qp95FFF8tKnp8bpuSKGC/ZkpDhbFswGihGTUvIJPkpWj40DoFafoA6MdizinjT9tDl06tPVnoh4tGRKiZcqrAPNGWMyxXphq2afEmoxVwQ9GcJIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715360668; c=relaxed/simple;
	bh=se/TDd00obTA9P6Z62oUgyCR/6dVlvy1+6NJc4V7rwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fwBN/MxKPVHtmruzHvVE9qP+E18H7fowdc0WWfHw6cSk9fbTi/LMVi6g4gK9txl44pskGB+K1k/V3kl6A54mpQaN9IkXRfvbIJsLKFjyfmGouE0wPNMPq5I0Es8TQHGjMELafQqKXnNgbCOq2Q3bzYNjs0l0UqqIdCGFoLJdVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hm/6FfoC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hm/6FfoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715360664; x=1746896664;
  h=date:from:to:cc:subject:message-id;
  bh=se/TDd00obTA9P6Z62oUgyCR/6dVlvy1+6NJc4V7rwg=;
  b=Hm/6FfoCCS0XntEQf4NLGC59eoPJz0XWokg2/ZWTkTswh2DN3CHbXRC4
   YTZwYcoO8FrkmQntJetyIHbZbriaej7rRgAJzioZKMAY7+VzaLz3Fvnuc
   B5J6F0J2JA0sU4ClpYMx8muk6+iRObj9OGLs/ePxbvEBv1a2qSf3K1PS4
   YgZQmNGVvi0Rh7IqElRBSozo8tZs4CZ9pNbtUDmuQaJKez5TwGi5A6Hb2
   ZWLDjrujt8JZIaH2U1peHu/q563Wd2cMJDqJb8hPkry/sJ4096LfnnVpv
   wDWXmcMOgjrrrE9+OSImig+mZzSe3TvuUqBWZxdC62j6PA1YXxMRI0qk4
   g==;
X-CSE-ConnectionGUID: f/Qmmj3FRKq+gyfY+PZMWw==
X-CSE-MsgGUID: v3vfFHfVQgaKMovpPJ3Xuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11485576"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11485576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:04:24 -0700
X-CSE-ConnectionGUID: bgfV9O+WRUyetXH3jGQtEg==
X-CSE-MsgGUID: y5+jvEL8T8u9HQahMj6kZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="60521532"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 May 2024 10:04:23 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5TfQ-0006Nh-0L;
	Fri, 10 May 2024 17:04:20 +0000
Date: Sat, 11 May 2024 01:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 2fa365974c3eb97f29ff2dbeff3e9011170e492c
Message-ID: <202405110113.DAFW8Ph7-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 2fa365974c3eb97f29ff2dbeff3e9011170e492c  hwmon: Drop explicit initialization of struct i2c_device_id::driver_data to 0 (part 2)

elapsed time: 1239m

configs tested: 152
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240510   gcc  
arc                   randconfig-002-20240510   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240510   gcc  
arm                   randconfig-002-20240510   clang
arm                   randconfig-003-20240510   gcc  
arm                   randconfig-004-20240510   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240510   clang
arm64                 randconfig-002-20240510   gcc  
arm64                 randconfig-003-20240510   clang
arm64                 randconfig-004-20240510   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240510   gcc  
csky                  randconfig-002-20240510   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240510   clang
hexagon               randconfig-002-20240510   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240510   clang
i386         buildonly-randconfig-002-20240510   gcc  
i386         buildonly-randconfig-003-20240510   clang
i386         buildonly-randconfig-004-20240510   clang
i386         buildonly-randconfig-005-20240510   clang
i386         buildonly-randconfig-006-20240510   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240510   clang
i386                  randconfig-002-20240510   clang
i386                  randconfig-003-20240510   gcc  
i386                  randconfig-004-20240510   gcc  
i386                  randconfig-005-20240510   clang
i386                  randconfig-006-20240510   clang
i386                  randconfig-011-20240510   clang
i386                  randconfig-012-20240510   clang
i386                  randconfig-013-20240510   gcc  
i386                  randconfig-014-20240510   clang
i386                  randconfig-015-20240510   gcc  
i386                  randconfig-016-20240510   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240510   gcc  
loongarch             randconfig-002-20240510   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240510   gcc  
nios2                 randconfig-002-20240510   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240510   gcc  
parisc                randconfig-002-20240510   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240510   gcc  
powerpc               randconfig-002-20240510   gcc  
powerpc               randconfig-003-20240510   clang
powerpc64             randconfig-001-20240510   clang
powerpc64             randconfig-002-20240510   clang
powerpc64             randconfig-003-20240510   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240510   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240510   gcc  
x86_64       buildonly-randconfig-002-20240510   clang
x86_64       buildonly-randconfig-003-20240510   gcc  
x86_64       buildonly-randconfig-004-20240510   clang
x86_64       buildonly-randconfig-005-20240510   gcc  
x86_64       buildonly-randconfig-006-20240510   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240510   gcc  
x86_64                randconfig-002-20240510   clang
x86_64                randconfig-003-20240510   clang
x86_64                randconfig-004-20240510   gcc  
x86_64                randconfig-005-20240510   gcc  
x86_64                randconfig-006-20240510   gcc  
x86_64                randconfig-011-20240510   clang
x86_64                randconfig-012-20240510   clang
x86_64                randconfig-013-20240510   clang
x86_64                randconfig-014-20240510   clang
x86_64                randconfig-015-20240510   clang
x86_64                randconfig-016-20240510   gcc  
x86_64                randconfig-071-20240510   clang
x86_64                randconfig-072-20240510   clang
x86_64                randconfig-073-20240510   clang
x86_64                randconfig-074-20240510   gcc  
x86_64                randconfig-075-20240510   clang
x86_64                randconfig-076-20240510   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
