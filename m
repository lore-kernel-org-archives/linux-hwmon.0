Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668815C6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jan 2024 03:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705982364; cv=none; b=LucTBCmuaARmbAl+6atnU6xTAvqHAi7yXNkUT35bxSJt8EnZuNELN2+3k0BHJgKhajYKRoLEJdRaaFrQtsSWwowo4RArPEhZuh9BMMZo8HhclxbU2dNOz3vqwZFD/H3BEP9x3BWnkygsVMLFFZYISM7kmuBACP+pYQitDnH4asA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705982364; c=relaxed/simple;
	bh=4SIcIUJhqVJOTtzQpFiJTdPv5EO+H7bXz4QdieOHf9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P8yncWlesxVHUALPVb3IKqoK56LiJYG7RqjvDORaY5FPMTFAziKr0hBt9qJSAxIDNZJz4ZZVzjRBxZ8uGzzshjrIK7vTkPlZZDy2+hDx+bZvyFOZ5pMpsXwXkID76pPoM4ViduJ+aB4w8Z19tk00fkBY8YNFkauHjzssY1o2Owo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivIyN2SH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivIyN2SH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705982362; x=1737518362;
  h=date:from:to:cc:subject:message-id;
  bh=4SIcIUJhqVJOTtzQpFiJTdPv5EO+H7bXz4QdieOHf9M=;
  b=ivIyN2SHZ0zJzK4e1sMHzUx9W1FyVzTEaiW+QHJHuepQxABJG6cHuRpj
   hoPZW25hazQ8uZcqO4oYUMo5Mu7PHwomr5t2dRs+Ef0WPBx5zqcpPQ3tU
   pZf21TO6IQbR/5TLHbRuBdD/vggQMXTTmhEyorxBYXLyumUSdsJLtAM9h
   w0GHuIQcalLXfRUvEruQQbPkjuYStPAoGn3YeXaNHQfPmqgOMqIDqYINS
   K+VcwfgbPr2LAj8uhkYaQEw3afDto4nKXWWLcGA75vmU2KFJK/KpT1d0y
   oofU3qcD6zW8ejfh6V3w83kd4tzH60g+XveqtKgD03S8mC134Ex6vcIev
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1262713"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1262713"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 19:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="27873630"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2024 19:59:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS7wU-00079Y-1e;
	Tue, 23 Jan 2024 03:59:18 +0000
Date: Tue, 23 Jan 2024 11:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 cc85a2f966361054d32dd79a432b2fb6b54b3db8
Message-ID: <202401231111.BsXPWTGm-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: cc85a2f966361054d32dd79a432b2fb6b54b3db8  dt-bindings: hwmon: ina2xx: Describe ina260 chip

elapsed time: 1602m

configs tested: 98
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240123   gcc  
arc                   randconfig-002-20240123   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                   randconfig-001-20240123   gcc  
arm                   randconfig-002-20240123   gcc  
arm                   randconfig-003-20240123   gcc  
arm                   randconfig-004-20240123   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240123   gcc  
arm64                 randconfig-002-20240123   gcc  
arm64                 randconfig-003-20240123   gcc  
arm64                 randconfig-004-20240123   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240123   gcc  
csky                  randconfig-002-20240123   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240123   clang
hexagon               randconfig-002-20240123   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240122   clang
i386         buildonly-randconfig-002-20240122   clang
i386         buildonly-randconfig-003-20240122   clang
i386         buildonly-randconfig-004-20240122   clang
i386         buildonly-randconfig-005-20240122   clang
i386         buildonly-randconfig-006-20240122   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240122   clang
i386                  randconfig-002-20240122   clang
i386                  randconfig-003-20240122   clang
i386                  randconfig-004-20240122   clang
i386                  randconfig-005-20240122   clang
i386                  randconfig-006-20240122   clang
i386                  randconfig-011-20240122   gcc  
i386                  randconfig-012-20240122   gcc  
i386                  randconfig-013-20240122   gcc  
i386                  randconfig-014-20240122   gcc  
i386                  randconfig-015-20240122   gcc  
i386                  randconfig-016-20240122   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240123   gcc  
loongarch             randconfig-002-20240123   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240123   gcc  
nios2                 randconfig-002-20240123   gcc  
openrisc                         allyesconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                randconfig-001-20240123   gcc  
parisc                randconfig-002-20240123   gcc  
powerpc                          allmodconfig   clang
powerpc                          allyesconfig   clang
powerpc               randconfig-001-20240123   gcc  
powerpc               randconfig-002-20240123   gcc  
powerpc               randconfig-003-20240123   gcc  
powerpc64             randconfig-001-20240123   gcc  
powerpc64             randconfig-002-20240123   gcc  
powerpc64             randconfig-003-20240123   gcc  
riscv                 randconfig-001-20240123   gcc  
riscv                 randconfig-002-20240123   gcc  
s390                  randconfig-001-20240123   clang
s390                  randconfig-002-20240123   clang
sh                    randconfig-001-20240123   gcc  
sh                    randconfig-002-20240123   gcc  
sparc64               randconfig-001-20240123   gcc  
sparc64               randconfig-002-20240123   gcc  
um                    randconfig-001-20240123   gcc  
um                    randconfig-002-20240123   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                randconfig-001-20240123   gcc  
xtensa                randconfig-002-20240123   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
