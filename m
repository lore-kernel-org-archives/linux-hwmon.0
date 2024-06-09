Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C841F932
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Jun 2024 23:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717975305; cv=none; b=Mi77FoPI0O7GOeNvZSahmJuCELILJ1eNy8YTV+oyCaFtZ2Cg7uUhLad9zAdwd7UQ2y7+NsclNY3FuVlavtOTTfWzUIfOhNUKKrE6G8tUN8g4zR6XbfXFQH7BY38JlgyVvDPB9947U7t7WznsjB0orLdPg0oLPIlMe1c0U0PHuzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717975305; c=relaxed/simple;
	bh=ZmOB5QPKr0dTJB1owR0nHIS3HZ8ZRjSklguBDK5jOJM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CAsM07SiX815Mi+GvOErIg1+dokHU8P8VlJlBCVIzIqbeaFr34wUxvui/m1wxLPL5XU8gqYpAqtIC6xJdERnYKZARYxZ78tOBNEhhN1yJx+JRfWTlOPxwsLfJiElyYPrkiTqgKAb/x2pUklA/VWNy4kBXjP3IVnYgucR77RRD10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpmyg8pM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpmyg8pM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717975303; x=1749511303;
  h=date:from:to:cc:subject:message-id;
  bh=ZmOB5QPKr0dTJB1owR0nHIS3HZ8ZRjSklguBDK5jOJM=;
  b=fpmyg8pMIDhmO5CmX6maPDHMfAQWP3jZMSL9k8MvVq8OjMdOQ9aipa+9
   hFw0lDTiruKx5pA/Br3xjFN6WcWn991Ya/KPEqgrUGy4ocnLR4Pac3fgs
   H9WdEOKsSQHi8W5sDfd8Y8UZ+XHynErDeoCf2EAjZQ6K/JmJCIcsvPIfg
   A2z/+ecAPQwOG8AqCn9vcBoGoOBOr4sL/SVEuEKAqewcVvIkp3AtBbqAs
   QtGSau6iDObzdGzR9kA/fAYRWIRpmGRiONo8HdOoglLznJgYNkJ3V30tl
   jwqnaH9oCQQEU6A+jrVC5PBqOvt6LiGh7Thq+KOPo8oo0DJZhU8/FN0yL
   w==;
X-CSE-ConnectionGUID: xXwj99vuSN27/bBNeUQGjQ==
X-CSE-MsgGUID: CELBdjAVQ6CZusfFiB9hww==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25734165"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="25734165"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 16:21:43 -0700
X-CSE-ConnectionGUID: Bgi3kyQBRZK0IMqrVczdtQ==
X-CSE-MsgGUID: +u6eZLgIR82HvKlEPll9xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="39437729"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2024 16:21:42 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGRr1-0001fN-1e;
	Sun, 09 Jun 2024 23:21:39 +0000
Date: Mon, 10 Jun 2024 07:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing] BUILD SUCCESS
 ef81ab182938eb1337b92c691cd6433be60b6578
Message-ID: <202406100729.DVVyaPZ1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
branch HEAD: ef81ab182938eb1337b92c691cd6433be60b6578  Merge branch 'hwmon-i2c-fixup' into testing

elapsed time: 1444m

configs tested: 148
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20240609   gcc  
arc                   randconfig-001-20240610   gcc  
arc                   randconfig-002-20240609   gcc  
arc                   randconfig-002-20240610   gcc  
arc                           tb10x_defconfig   gcc  
arm                               allnoconfig   clang
arm                         assabet_defconfig   clang
arm                         bcm2835_defconfig   clang
arm                        clps711x_defconfig   clang
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            mmp2_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20240609   clang
arm                   randconfig-001-20240610   gcc  
arm                   randconfig-002-20240609   gcc  
arm                   randconfig-002-20240610   gcc  
arm                   randconfig-003-20240609   gcc  
arm                   randconfig-003-20240610   clang
arm                   randconfig-004-20240609   gcc  
arm                   randconfig-004-20240610   gcc  
arm                         s5pv210_defconfig   gcc  
arm                          sp7021_defconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240609   gcc  
arm64                 randconfig-001-20240610   gcc  
arm64                 randconfig-002-20240610   gcc  
arm64                 randconfig-003-20240610   gcc  
arm64                 randconfig-004-20240610   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240610   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
i386         buildonly-randconfig-001-20240609   gcc  
i386         buildonly-randconfig-001-20240610   clang
i386         buildonly-randconfig-002-20240609   gcc  
i386         buildonly-randconfig-003-20240609   gcc  
i386         buildonly-randconfig-004-20240609   gcc  
i386         buildonly-randconfig-004-20240610   clang
i386         buildonly-randconfig-005-20240609   clang
i386         buildonly-randconfig-006-20240609   gcc  
i386         buildonly-randconfig-006-20240610   clang
i386                                defconfig   clang
i386                  randconfig-001-20240609   clang
i386                  randconfig-002-20240609   clang
i386                  randconfig-003-20240609   gcc  
i386                  randconfig-004-20240609   gcc  
i386                  randconfig-005-20240609   clang
i386                  randconfig-005-20240610   clang
i386                  randconfig-006-20240609   clang
i386                  randconfig-011-20240609   clang
i386                  randconfig-011-20240610   clang
i386                  randconfig-012-20240609   clang
i386                  randconfig-012-20240610   clang
i386                  randconfig-013-20240609   clang
i386                  randconfig-013-20240610   clang
i386                  randconfig-014-20240609   clang
i386                  randconfig-014-20240610   clang
i386                  randconfig-015-20240609   gcc  
i386                  randconfig-015-20240610   clang
i386                  randconfig-016-20240609   clang
i386                  randconfig-016-20240610   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     kmeter1_defconfig   gcc  
powerpc                     tqm8560_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sh                          urquell_defconfig   gcc  
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
x86_64       buildonly-randconfig-002-20240610   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-003-20240610   clang
x86_64                randconfig-006-20240610   clang
x86_64                randconfig-011-20240610   clang
x86_64                randconfig-015-20240610   clang
x86_64                randconfig-016-20240610   clang
x86_64                randconfig-072-20240610   clang
x86_64                randconfig-073-20240610   clang
x86_64                randconfig-075-20240610   clang
x86_64                randconfig-076-20240610   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
