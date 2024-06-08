Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C51D53C
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Jun 2024 23:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717887631; cv=none; b=NNeJPDOKZwHpqeuLgUjcqmcndRfPLOGwQ8mSMYFjNrCcyrBoXmtyQvbktDUDkQWCoOgVTRe9gbHv8Fs3kV/Wkd+lNjzgJvsRb9ohF8LEZthbXbcNKexK3J4SkWBse8ANxYWShFs0P915jJcBXJRtbpHTmH8zxzh2NpoEqCw3LxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717887631; c=relaxed/simple;
	bh=QCRRV83U/T6Vqdz8mqvNYR70ulxPjCn9d+ws6j1pWnE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PsrI6WY5i1c4WkHpf0IcIZX1q4SY0qXcAc+3csVna2f27oqzJjtQyoTzimwflQF+NqzhR6atKWxE56i0lHqQAU/whojXUwNApTXu3vBLjNjWpyWlEpvmTGhkvmTQGVa9tzVMnqAgtLICls/dDtLbW9H7L3gRiF+kgtdL+/tl6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ie7Cdp7e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ie7Cdp7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717887630; x=1749423630;
  h=date:from:to:cc:subject:message-id;
  bh=QCRRV83U/T6Vqdz8mqvNYR70ulxPjCn9d+ws6j1pWnE=;
  b=Ie7Cdp7eFUDDZRvN9oRn5dEKayDi7vpbpeagm6P/3nwOF8A39Q4fft2o
   D7+TEZOrKHKm+ui0U8MQlRVjzEyCtheg/MWUeTqio0fshFCvom9Ui5TWR
   d3VZtZwD6V4lF5dF19j4vMKAgbu0MyCcqaCTG1ZtfeAQb+KjrBe7Inh0f
   m/pC/C6S6d0lJZxEyUE7k/WO2E+9mdZfs6zvf3SfocwO76ubfuHmqwP0c
   2ewHX7K1Ul1CsUwiICq1Rl/XT+oTC/rfOYy3V5y1CknKakM6lD+zk4H6/
   OoBvxmDQme7/i85pHTqIHkfPckH+70S1cjKHZRRpXgdjf73Snv6BdGWxZ
   g==;
X-CSE-ConnectionGUID: 0dZwrOSLSnWBnH45Hqe6UQ==
X-CSE-MsgGUID: wnEAmBnDQxiOKXxdrrbSmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14414597"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14414597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 16:00:30 -0700
X-CSE-ConnectionGUID: yANmIQEvQ1uIGbDIPs2niA==
X-CSE-MsgGUID: ExLGrlmzTgu2xYf1csmdcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="38672260"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jun 2024 16:00:28 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG52w-0000az-1h;
	Sat, 08 Jun 2024 23:00:26 +0000
Date: Sun, 09 Jun 2024 06:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-next] BUILD REGRESSION
 b51114a3570081b85aecb89a207b57bf346e868d
Message-ID: <202406090640.2aMitUf3-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
branch HEAD: b51114a3570081b85aecb89a207b57bf346e868d  hwmon: add missing MODULE_DESCRIPTION() macros

Unverified Error/Warning (likely false positive, please contact us if interested):

{standard input}:1025: Warning: overflow in branch to .L126; converted into longer instruction sequence
{standard input}:1070: Warning: overflow in branch to .L130; converted into longer instruction sequence
{standard input}:1189: Warning: overflow in branch to .L121; converted into longer instruction sequence
{standard input}:1273: Error: expected comma after name `mp29' in .size directive
{standard input}:1564: Error: unknown pseudo-op: `.lvl184'
{standard input}:692: Error: expected comma after name `mp2973_write_word' in .size directive

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- sh-allyesconfig
|   `-- standard-input:Error:expected-comma-after-name-mp29-in-.size-directive
|-- sh-buildonly-randconfig-r002-20220212
|   |-- standard-input:Warning:overflow-in-branch-to-.L121-converted-into-longer-instruction-sequence
|   |-- standard-input:Warning:overflow-in-branch-to-.L126-converted-into-longer-instruction-sequence
|   `-- standard-input:Warning:overflow-in-branch-to-.L130-converted-into-longer-instruction-sequence
|-- sh-randconfig-r003-20220606
|   `-- standard-input:Error:expected-comma-after-name-mp2973_write_word-in-.size-directive
`-- sh-randconfig-r035-20230912
    `-- standard-input:Error:unknown-pseudo-op:lvl184

elapsed time: 1450m

configs tested: 35
configs skipped: 1

tested configs:
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                            defconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                           allnoconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
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
um                                allnoconfig   clang
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
