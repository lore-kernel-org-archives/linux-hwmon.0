Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84021B1BF;
	Thu,  9 Jan 2025 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434755; cv=none; b=bnmcedMDhyvciu2lZ89/HrDBllbrmij4E+Sz8qrlLkzWoqttb2u6kt+gGa8hUefDvDgVqGsWQZiBEGlj6YSVU8y3mHa9yNam9utrV/YhBUkDitLg7/9gq8mU8D/ymV0kvbgRwtV9wP1LfSFee4GeBRG5HYi3aBLB2HiHzATOs9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434755; c=relaxed/simple;
	bh=QCz/F6D39yrq5YHjo8W2G2CPuj8D7Rf/NYf0VnAbVMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8GES7q5tTYMlAkklXm9rbM65Agys8mcNeDbCsBXW9C09ROuh98uvG7Ba6OXZ9BWgogrSYdYC6zgcFjtiE9fFcisl4yd/QoLbYppVT1OUzzg24U4TfYDhcgGaCzXg6UuXbm+9p5qhAO4fPP0VsiF+bTJ1f4L0QXlvoWUfYDXqbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YoAYw1Uq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YoAYw1Uq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736434753; x=1767970753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCz/F6D39yrq5YHjo8W2G2CPuj8D7Rf/NYf0VnAbVMk=;
  b=YoAYw1Uq0z0oXfV6MJSdketpvbObca+iah4U1C9m9sLV4HERvxHCmRRf
   /CVn1DCl3N2OpTr9xbOjmFMyrZDk1sLMc4RwE7ssTUa+yU7Fn81ptKcFP
   9wXDm8zGKBkTrLTl/NzweF/GG3hkS9gOnGS31w0riczfV3vc5Vw1+Z4fY
   EUA3+rc006LlZyGhz8k0W1koyNRBdFJ0bl72fCoSrCJzfeZp3gQNMEHA6
   wXM2L4kWjO1UiYh8qca2JbdYi0W5ysKz9wqO31oAc65N5Amr+dJ/aVC/A
   UV0RkThgf+uaX9aYl+rZTi5ZIcWepOyeMhPj9PaCfN06YICZVmGejsjVt
   Q==;
X-CSE-ConnectionGUID: hsmGbBJCRBaSNIuMAXw+tA==
X-CSE-MsgGUID: kDEh+enqQw68krG9HezC9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40642630"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40642630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:59:10 -0800
X-CSE-ConnectionGUID: NgsS1z6RSWytKefcAdP0NQ==
X-CSE-MsgGUID: JLgDTiHwRtuWSBtyVqWD2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="103950378"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2025 06:59:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVu01-000HhL-0W;
	Thu, 09 Jan 2025 14:59:05 +0000
Date: Thu, 9 Jan 2025 22:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
Message-ID: <202501092213.X9mbPW5Q-lkp@intel.com>
References: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106071337.3017926-3-Leo-Yang@quantatw.com>

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yang/dt-bindings-Add-INA233-device/20250106-151934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250106071337.3017926-3-Leo-Yang%40quantatw.com
patch subject: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
config: i386-randconfig-r072-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092213.X9mbPW5Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092213.X9mbPW5Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092213.X9mbPW5Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/pmbus/ina233.o: in function `calculate_coef':
>> drivers/hwmon/pmbus/ina233.c:59: undefined reference to `__divdi3'


vim +59 drivers/hwmon/pmbus/ina233.c

    23	
    24	static int calculate_coef(int *m, int *R, bool power)
    25	{
    26		s64 scaled_m;
    27		int scale_factor = 0;
    28		int scale_coef = 1;
    29		int power_coef = 1;
    30		bool is_integer = false;
    31	
    32		if (*m == 0) {
    33			*R = 0;
    34			return -1;
    35		}
    36	
    37		if (power)
    38			power_coef = 25;
    39	
    40		if (1000000 % *m) {
    41			/* Default value, Scaling to keep integer precision,
    42			 * Change it if you need
    43			 */
    44			scale_factor = -3;
    45			scale_coef = 1000;
    46		} else {
    47			is_integer = true;
    48		}
    49	
    50		/*
    51		 * Unit Conversion (Current_LSB A->uA) and use scaling(scale_factor)
    52		 * to keep integer precision.
    53		 * Formulae referenced from spec.
    54		 */
    55		scaled_m = div_s64(1000000 * scale_coef, *m * power_coef);
    56	
    57		/* Maximize while keeping it bounded.*/
    58		while (scaled_m > MAX_M_VAL || scaled_m < MIN_M_VAL) {
  > 59			scaled_m /= 10;
    60			scale_factor++;
    61		}
    62		/* Scale up only if fractional part exists. */
    63		while (scaled_m * 10 < MAX_M_VAL && scaled_m * 10 > MIN_M_VAL && !is_integer) {
    64			scaled_m *= 10;
    65			scale_factor--;
    66		}
    67	
    68		*m = scaled_m;
    69		*R = scale_factor;
    70		return 0;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
