Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13BF1D318B;
	Mon, 13 Jan 2025 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736798612; cv=none; b=N/NJsIyS8U5/n6mhw6s0HwpX80nkXKFVpi/QJX/vRx4QQ8eCa3Crar8GUPOtr8v04d0PscIocwn8xm97R5rT8PQ9ZS9pmRM4R1sLUOYctuMUSkU2F3nue/NNK3UYee0/SdyNyzltKtJuVMAYvWrd+cNnGh1V3n8y/5svgHkFMDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736798612; c=relaxed/simple;
	bh=hqdjc1GTXUq+T5Og+6kyD9Iv9P+Q+l446xb4UmX2GbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql9DXeWRS2NzwFgEOIC7NC12dPPgx3qKTTvKc7vMruZfHBwK7Oj42sPNthkMOoE8ktuN7cvgYA+mNB5YkU3bnN9GC7/FqhnkASmAb2fNqOadTjvvyVnzfSD6CGtSQQJbbvSbo4hc+K4JNgrvKm4CdjDa/SQzoUlDEF5TXudmSmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBG08m0W; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBG08m0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736798611; x=1768334611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqdjc1GTXUq+T5Og+6kyD9Iv9P+Q+l446xb4UmX2GbM=;
  b=fBG08m0WV13fcZGT3hOkKP43sEwBrlIbZ9nORFCEHjjxaU2kR8ZtqMBI
   G56Ud26JwBSg0ivrMQHMv/gBzWuRPa8Z8XUjAX1MD/XssypUEWPlmOayN
   YROGPMMXY++FbinN+RPDgg/OvwdRWd2FpErTd7/UEQwNW0EBdyP8bLscb
   vR0/5I9zpmbCdu4UuaG4DE6vVBtQ01e2atsfLwBredQc30xe8JkiA3u3h
   dGyehIrLQLCgcdRqOhN0iScD9lA0nI5Q/5x3n4a6BxWD+B8TNzOEN4+hF
   NXXRS9Mrsh5aZXx/SWGeFwwVIcGOhmmS6bYtw5x7LoY23EfikPYEb1AOV
   Q==;
X-CSE-ConnectionGUID: Xk+UoqyeRJ6GCfhSFJF+Qg==
X-CSE-MsgGUID: d0a7f1FiRjCB3ErgEwOK0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36967591"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36967591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 12:03:31 -0800
X-CSE-ConnectionGUID: iZtqQERbRXuuMVMIi2ukZA==
X-CSE-MsgGUID: cz5NYTVTRYmF4154sROGOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105090563"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2025 12:03:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXQej-000NbT-1r;
	Mon, 13 Jan 2025 20:03:25 +0000
Date: Tue, 14 Jan 2025 04:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	evepolonium@gmail.com, Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: Add T2 Mac fan control support in applesmc
 driver
Message-ID: <202501140359.tA17RgoT-lkp@intel.com>
References: <20250113084503.228037-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113084503.228037-1-evepolonium@gmail.com>

Hi Atharva,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.13-rc7 next-20250113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/hwmon-Add-T2-Mac-fan-control-support-in-applesmc-driver/20250113-164741
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250113084503.228037-1-evepolonium%40gmail.com
patch subject: [PATCH v3] hwmon: Add T2 Mac fan control support in applesmc driver
config: i386-buildonly-randconfig-002-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140359.tA17RgoT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140359.tA17RgoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140359.tA17RgoT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/applesmc.c:517:12: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     517 |         u8 sign = FIELD_GET(BIT(31), d);
         |                   ^
>> drivers/hwmon/applesmc.c:536:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     536 |         return FIELD_PREP(BIT_MASK(8) << 23, exp) |
         |                ^
   2 errors generated.


vim +/FIELD_GET +517 drivers/hwmon/applesmc.c

   514	
   515	static inline u32 applesmc_float_to_u32(u32 d)
   516	{
 > 517		u8 sign = FIELD_GET(BIT(31), d);
   518		s32 exp = FIELD_GET(BIT_MASK(8) << 23, d) - 0x7F;
   519		u32 fr = d & ((1u << 23) - 1);
   520	
   521		if (sign || exp < 0)
   522			return 0;
   523	
   524		return BIT(exp) + (fr >> (23 - exp));
   525	}
   526	
   527	static inline u32 applesmc_u32_to_float(u32 d)
   528	{
   529		u32 dc = d, bc = 0, exp;
   530	
   531		if (!d)
   532			return 0;
   533		while (dc >>= 1)
   534			++bc;
   535		exp = 0x7F + bc;
 > 536		return FIELD_PREP(BIT_MASK(8) << 23, exp) |
   537				(d << (23 - (exp - 0x7F)) & BIT_MASK(23));
   538	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
