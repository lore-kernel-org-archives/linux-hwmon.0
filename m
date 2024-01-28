Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDEF2E859
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jan 2024 20:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706474506; cv=none; b=FGt2Cl9JEw49gII+9Xd7I+TgjZGXVs6zQuk0BCcmJ9BgDKcFewoe5ObpcWAEhO0Y7b0Yg0wXy3hqY5BoSNa4KrqfkvIaXAvgwlVPqdPrYpYCbkl/fO6UNz8j/LMcC87WOFaIGP6IbDWFxybfY/pK0E6/kVwcczEoOmmwT02MHkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706474506; c=relaxed/simple;
	bh=+c0N6+fvh+U87pJ0PedFUVZKXx5hJbFRoD5GKw/fQQY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SILiSCxdrZcwAbEuyQVZ2cbLANkQpeVGdOCQy/mcMvC8UArVKwG7AHCGtPHX8iWtq6whPoID7ap+7wQgfMVj9Tu/7hLTMsT89ZdN9QrfzX865S/+8eEWRzRNl+xZDi/UTba6aqXOc/k8DDSoQMQWcUu7pFh01vsIH36om7eeLJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lW+snBZh; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lW+snBZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706474504; x=1738010504;
  h=date:from:to:cc:subject:message-id;
  bh=+c0N6+fvh+U87pJ0PedFUVZKXx5hJbFRoD5GKw/fQQY=;
  b=lW+snBZhNoyX7dmpTyZcyOMBG6EU4QFpeKQ8AYAQxg7ReYZ4OJcsmerL
   G+NEeLBODzkVX/37PpkUzgrf3RXGSu+vAc8ewXURQyqmmg426BsaPBC/3
   GH9PF3oWj4Xdy7KgxEFeKIzTuBi1aqMYDGwi/vMzsp5vK5fZ1/izZyK97
   lZp3ebiF3HN2zhFjRkrJbrhL+qaktg6i/+lwjgt4gfjK/OWdzFkhc7U+N
   KtGxrfylAIvMHDIoS2pvKZKk6Key8Ihc0U28p3bmqSqxteK7tgLHc7n4P
   0iv1jxrHGJL5dhKFkZ4ZokB8Y5ucdRhkRfm4/yEGL23BJBeI77WPhLC6p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393236437"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393236437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 12:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="960712683"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="960712683"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2024 12:41:42 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUByF-0003ke-3C;
	Sun, 28 Jan 2024 20:41:39 +0000
Date: Mon, 29 Jan 2024 04:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD SUCCESS
 10e70ab10802e50ff6432964dc289d2bf93c2693
Message-ID: <202401290418.b49dd2gq-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: 10e70ab10802e50ff6432964dc289d2bf93c2693  MAINTAINERS: Drop entries for hwmon devices with unreachable maintainers

elapsed time: 1663m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240129   gcc  
arc                   randconfig-002-20240129   gcc  
arm                               allnoconfig   gcc  
arm                                 defconfig   clang
arm                        keystone_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20240129   gcc  
arm                   randconfig-002-20240129   gcc  
arm                   randconfig-003-20240129   gcc  
arm                   randconfig-004-20240129   gcc  
arm                           spitz_defconfig   clang
arm                        vexpress_defconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
hexagon                             defconfig   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20240128   clang
i386         buildonly-randconfig-002-20240128   clang
i386         buildonly-randconfig-003-20240128   clang
i386         buildonly-randconfig-004-20240128   clang
i386         buildonly-randconfig-005-20240128   clang
i386         buildonly-randconfig-006-20240128   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20240128   clang
i386                  randconfig-002-20240128   clang
i386                  randconfig-003-20240128   clang
i386                  randconfig-004-20240128   clang
i386                  randconfig-005-20240128   clang
i386                  randconfig-006-20240128   clang
i386                  randconfig-011-20240128   gcc  
i386                  randconfig-012-20240128   gcc  
i386                  randconfig-013-20240128   gcc  
i386                  randconfig-014-20240128   gcc  
i386                  randconfig-015-20240128   gcc  
i386                  randconfig-016-20240128   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
microblaze                       alldefconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
nios2                             allnoconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                    adder875_defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      ep88xc_defconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240129   gcc  
x86_64       buildonly-randconfig-002-20240129   gcc  
x86_64       buildonly-randconfig-003-20240129   gcc  
x86_64       buildonly-randconfig-004-20240129   gcc  
x86_64       buildonly-randconfig-005-20240129   gcc  
x86_64       buildonly-randconfig-006-20240129   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240129   clang
x86_64                randconfig-002-20240129   clang
x86_64                randconfig-003-20240129   clang
x86_64                randconfig-004-20240129   clang
x86_64                randconfig-005-20240129   clang
x86_64                randconfig-011-20240129   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
