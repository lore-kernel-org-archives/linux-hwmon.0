Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A22F1C174A;
	Mon, 13 Jan 2025 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736799334; cv=none; b=NX6c8A8cvz3D41FwPO2mcPw9DF6QWcuaV7LUt8sRi5i4mWy3qwzZLe9UhoEHgV/ygh7SDOg33BK2QnAW9PYrqJi5N4ETZ8f/CFtRJTSvcIojyHy6FfjXtprxilJB2QCHZov72S5DmT2TteOadj+NXhxCY0KgJi++fic3+4M+Zqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736799334; c=relaxed/simple;
	bh=aSkEwsb0LjKobyX1dEpG7AHFTf6HXfi+JPgCPAvLXZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uRkctMl0mwlm3c6anKHxmI09TJwM5585V8I9RBZVZI2odyIOs+cBvViIy/D5aclheErm0U5as1uRkmoW3Yxg73imJTEkg7Ubl1HdyrQLqvsu6/MYF3w7u90i7pP7P1HzGVR5gCB75vN9i/k9xzpskmjTdrHdMIv2Aab4eIb19Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmqUf4Qc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmqUf4Qc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736799332; x=1768335332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aSkEwsb0LjKobyX1dEpG7AHFTf6HXfi+JPgCPAvLXZg=;
  b=KmqUf4QchpU4bZD4hndmLdG3AsqZlgkqHrctIicRLfGgDf+dpk/8rgq1
   xeFYAss4BXQfAoK1Ndf1KyQEKUZCF9gQcTtBjA1ZZjSmV/kol5TDY08IQ
   QAVew4gxD3tsHWaJG9J2rtoD0kOAZkaqSsIlPqpwbmwUJ2Jwbv2P1S3Fu
   s7d61bi5fsn/J99Y5yJvWgZahynacg7PJs5r1iDFWY+C9WObqA0A8tvCC
   lA/WykLu7xqa8jNW4ufhgibz4HWFl2uNYlF7GziBkVYNoHPOS/nWqTe1e
   j1OAFKfDtFKXkfE0a9HhYWoAt82aBdApNfElr6Oo1oWVHkY0CQ1AEAzdX
   A==;
X-CSE-ConnectionGUID: 6K48QpoRQ4WG4AXETOEtTA==
X-CSE-MsgGUID: BLSzWNRnQcKnvg3Vb6VTcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36968660"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36968660"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 12:15:31 -0800
X-CSE-ConnectionGUID: 7tZjwW+BSbuF+nQ3YdoibA==
X-CSE-MsgGUID: Ky+XdMNrSd2YvS+iBdvfrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105092784"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jan 2025 12:15:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXQqM-000Nc7-2s;
	Mon, 13 Jan 2025 20:15:26 +0000
Date: Tue, 14 Jan 2025 04:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, evepolonium@gmail.com,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: Add T2 Mac fan control support in applesmc
 driver
Message-ID: <202501140453.bPb2q7KC-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140453.bPb2q7KC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140453.bPb2q7KC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140453.bPb2q7KC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/applesmc.c: In function 'applesmc_float_to_u32':
>> drivers/hwmon/applesmc.c:517:19: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     517 |         u8 sign = FIELD_GET(BIT(31), d);
         |                   ^~~~~~~~~
   drivers/hwmon/applesmc.c: In function 'applesmc_u32_to_float':
>> drivers/hwmon/applesmc.c:536:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     536 |         return FIELD_PREP(BIT_MASK(8) << 23, exp) |
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


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
