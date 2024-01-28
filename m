Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D53E20B29
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jan 2024 17:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706462438; cv=none; b=YNVHiItIVmxyC8VSWAOAbeBmh/4YAC0XGi3ELicN00nTB6XmKGlLFfRW3yphvAQxJCQEi8Ih0ub+7x+9nS+kumRYspgT82qbrfSfIpvTYKRZPdqEZBO4dsbBv5oGMrLRW4+VjwHXJ8oCGrkOWQ2BEiOjHALQ/bCyGi/3GzgEgbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706462438; c=relaxed/simple;
	bh=Z0jxu9kEYF0oXtvo3jsh/SEq+4EEZPrwUSCakWvBAaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SDRgYt9hEKwDDfBRNTH1apxUMtvcnvHRzMX02oyNeEKij/Fs2hmmnB3MwWOZWXyiLNRLNQX8MkCHuCJ8N1nkeBUTuCqY6VJlb99aS5Go2ZqRwC3TiTxLVvmwpUFXbn7x38W2QYoUPMGkhkebPr1nsQXq/bvoPdWb+An6h+awso4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fi1FM73E; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fi1FM73E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706462437; x=1737998437;
  h=date:from:to:cc:subject:message-id;
  bh=Z0jxu9kEYF0oXtvo3jsh/SEq+4EEZPrwUSCakWvBAaM=;
  b=Fi1FM73EipOpR+Rd3MrOeK7xadG7YFytcxS9qp2auh8uNEsBusSV4Ecp
   WoBub3QtkIjuyHTZHlwbZ2E7SY+WaAU11mSeQu2R43fiVdwmfq9HiVMar
   wGry1VeDfyq6IRQM//HFHUUN+aAx93QU5ikiKRuLzMKCSZI/CSzkZ0v4E
   wkI5OCy3oB3LzxvIUws7lMmEIEVCNills8DVbuczdPQAv0MY9AjKkm1P5
   +KRyax4MQATmD/J8zw/EOhH0GsV4g0VapzqGnZKX9hA1trbfJfo9o2vxI
   acCVzX529egqeF7Uwl5dhb4qvHq3UpcfknEtmhZWD0sPIDhr18Fq8rZtz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="2656130"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2656130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 09:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1118723241"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="1118723241"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2024 09:20:34 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU8pc-0003bK-2F;
	Sun, 28 Jan 2024 17:20:32 +0000
Date: Mon, 29 Jan 2024 01:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon] BUILD SUCCESS
 915644189c22d9c93e9fee7c7c993b58e745bef7
Message-ID: <202401290141.wkqdv9z8-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
branch HEAD: 915644189c22d9c93e9fee7c7c993b58e745bef7  hwmon: (pmbus/mp2975) Correct comment inside 'mp2975_read_byte_data'

Unverified Warning (likely false positive, please contact us if interested):

{standard input}:516: Warning: overflow in branch to .L75; converted into longer instruction sequence

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- sh-randconfig-001-20240127
    `-- standard-input:Warning:overflow-in-branch-to-.L75-converted-into-longer-instruction-sequence

elapsed time: 1461m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arm                               allnoconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386         buildonly-randconfig-001-20240128   clang
i386         buildonly-randconfig-002-20240128   clang
i386         buildonly-randconfig-003-20240128   clang
i386         buildonly-randconfig-004-20240128   clang
i386         buildonly-randconfig-005-20240128   clang
i386         buildonly-randconfig-006-20240128   clang
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
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   clang
riscv                               defconfig   gcc  
s390                              allnoconfig   gcc  
s390                                defconfig   gcc  
sh                                allnoconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           alldefconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
