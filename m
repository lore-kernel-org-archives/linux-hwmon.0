Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DEC824BD;
	Thu, 12 Feb 2026 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908139; cv=none; b=qhsVH/CdAzhraebKHzPo3+eX+U/o1MZS8JvZLEHLdyDf57XjDfJT6vBIXZgvGjTWZdfriSybXeVhIo/93s8jZz0Hw9Z7s5OfvjSJCW7U5CxatHXazkpPgGrB+DGwuHaU5Ap5R2LWPnF8CGNJasieMkiqHxIT0cpSfuB8tc26BLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908139; c=relaxed/simple;
	bh=4+EeQgLatoi/k2Vy6EeWadd2Qq9OeWiKpyeHSroI1u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su7PiNnL3RweOk3b0EG/3U3gPfesEXA6MYh8E+Y9PewsL18F2YqeyUpiO3lBpPTwtJzgkCf20WiC2be0u+YcDQAha1+apPzqj+PrUwtFJKdicusmqXIu7/nR9J8lJk6LzwOVQWJ7OO8yQm82STmRMBmlhsNeGFq1SSZ5G6/ILYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUZXC1nz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUZXC1nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770908137; x=1802444137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4+EeQgLatoi/k2Vy6EeWadd2Qq9OeWiKpyeHSroI1u4=;
  b=aUZXC1nzCyXbodYBDjFcV9doX5AknEeJfxE54ZeLX/WS9WolE5QHVdpz
   aOJb1tF+8POTuFGYvmBzkN3wFqnOfkA6IHVbPgVujoCco7JQEj/bIS+ph
   eAyDW4gH3mgKQBGcyw3tPfCWd3xmzyMmSHTYUq6OFoIZUvxkI+joETEKN
   fOkrX2UXahg72m+LTgib00AZ2qgM4o+LG4OEl4T89hyH4ZItkjHgf2RS7
   zHbOgzSocvKRk+D85XqlD5STf3+gNxejkJXzckjR3L+wPd2vXudfGNeeU
   I2yrlqliktJ4v60KHJs8RCynVYZIHHBmpMNGHqES7wyMovw2CyxwxH14I
   w==;
X-CSE-ConnectionGUID: L65qf0jJRU6DgWoLQUepgA==
X-CSE-MsgGUID: zKg4/UtRT/2Pqj9bmF2Xzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71281768"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71281768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:55:36 -0800
X-CSE-ConnectionGUID: 9HgJGD9ORZCobKnmbXsd1A==
X-CSE-MsgGUID: frgiFmuUQIeSuqf2hYebJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="216826311"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2026 06:55:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqY6N-00000000rFA-29A7;
	Thu, 12 Feb 2026 14:55:31 +0000
Date: Thu, 12 Feb 2026 22:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: Re: [PATCH v1 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non
 standatd direct conversion
Message-ID: <202602122220.QLj7Hqb7-lkp@intel.com>
References: <20260212084502.1795-2-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212084502.1795-2-sbogdanov@baylibre.com>

Hi Stoyan,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.19 next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stoyan-Bogdanov/hwmon-pmbus-tps25990-Rework-TPS25990-non-standatd-direct-conversion/20260212-164903
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260212084502.1795-2-sbogdanov%40baylibre.com
patch subject: [PATCH v1 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct conversion
config: powerpc64-randconfig-001-20260212 (https://download.01.org/0day-ci/archive/20260212/202602122220.QLj7Hqb7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602122220.QLj7Hqb7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602122220.QLj7Hqb7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/tps25990.c:463:11: error: use of undeclared identifier 'ENOTSUP'
     463 |                 return -ENOTSUP;
         |                         ^~~~~~~
   1 error generated.


vim +/ENOTSUP +463 drivers/hwmon/pmbus/tps25990.c

   447	
   448	static int tps25990_probe(struct i2c_client *client)
   449	{
   450		struct device *dev = &client->dev;
   451		struct tps25990_data *data;
   452		u32 rimon = TPS25990_DEFAULT_RIMON;
   453		struct pmbus_driver_info *info_get;
   454		struct local_direct_value *info_local_get;
   455		int ret;
   456	
   457		ret = device_property_read_u32(dev, "ti,rimon-micro-ohms", &rimon);
   458		if (ret < 0 && ret != -EINVAL)
   459			return dev_err_probe(dev, ret, "failed to get rimon\n");
   460	
   461		data = (struct tps25990_data *)of_device_get_match_data(dev);
   462		if (!data)
 > 463			return -ENOTSUP;
   464	
   465		info_get = data->info;
   466		/* Make copy of pmbus_info and replace it to preserve original values */
   467		data->info = devm_kmemdup(dev, info_get, sizeof(*info_get), GFP_KERNEL);
   468		if (!data->info)
   469			return -ENOMEM;
   470	
   471		info_local_get = data->info_local;
   472		/* Make copy of pmbus_info and replace it to preserve original values */
   473		data->info_local = devm_kmemdup(dev, info_local_get, sizeof(*info_local_get), GFP_KERNEL);
   474		if (!data->info_local)
   475			return -ENOMEM;
   476	
   477		/* Adapt the current and power scale for each instance */
   478		tps25990_set_m(&data->info->m[PSC_CURRENT_IN], rimon);
   479		tps25990_set_m(&data->info->m[PSC_POWER], rimon);
   480	
   481		return pmbus_do_probe(client, data->info);
   482	}
   483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
