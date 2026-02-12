Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D51A2C234A;
	Thu, 12 Feb 2026 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905017; cv=none; b=W5D8nM4cl9udt/WwSBQZc1xClATZuy3ny+Z4m5E35re+hCNh7aU2kA1djrbxrJqANA2dvG/ZKB6VlHip+475m8tJ5Yxh5a+OJCiVtYn5KWIhESazYgXWKindnE6D9AFhvB69/kGovMPAIxFm9ghUGeh4IVsbb4HhDpiJj0V1BgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905017; c=relaxed/simple;
	bh=EyQunCWi4Z1DGhSr1/8zGP7hAM9s1Yj4u4pyQcPZisY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzmLkyEI7WAkGZABzb39aOAVHkHFD92asZvxo4gHFy2UwPLD4Z8ltADvcWB80waIf73bUzGpDmbMhTi7W1JDcC28CnLMl743AA3OcdYQUyr/3xqTF+AijmOXBB7Q9El4HIM5qZqcnWsoUmuFBMDobYfCyLGNgDoD/gLodozeSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIbQ4AtR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIbQ4AtR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770905016; x=1802441016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EyQunCWi4Z1DGhSr1/8zGP7hAM9s1Yj4u4pyQcPZisY=;
  b=HIbQ4AtRUazPzYsqClhfkLVAmx8EVct7RfdCdSbkFOjbFgAjuBsErXkn
   oCsGdh43kHYGNwWAMqD4Hi4ix1yQ5JgqRre09iY6eyK4e/SYNiSdYHQNs
   rlhv6ANt2uTPTlDjbFJ67WdwdDA1OZUl2RQXBBTjO5MhHw+DtRHLQ20jO
   inUW39mlEcGy0TQriSRZDNZqYI1BklKMbKTpUR1cvBJahJVVKybCHSOxa
   CECCg/97mBffOLqAIpJccTtLkhZ3j4YnrQqrzfqg3Ys3AhskMqVuQU30J
   c54b3hrvN4AkGUAh8nvWqZ+K0X+XNTK8Bg9Zvme70j/CKZwpOXZoSO1Ek
   g==;
X-CSE-ConnectionGUID: jhujUUZsS4eErCSq89rb+Q==
X-CSE-MsgGUID: y8KGPU/xRgmHZeEkLCT09A==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71976922"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="71976922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 06:03:35 -0800
X-CSE-ConnectionGUID: b9UPKEm5RXKY0a9hXxjt7A==
X-CSE-MsgGUID: sIgKH/6ER8+H6qHzV4ooXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211861087"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2026 06:03:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqXI1-00000000rDE-3YFM;
	Thu, 12 Feb 2026 14:03:29 +0000
Date: Thu, 12 Feb 2026 22:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: Re: [PATCH v1 1/3] hwmon: (pmbus/tps25990): Rework TPS25990 non
 standatd direct conversion
Message-ID: <202602122114.dKAeIkiK-lkp@intel.com>
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
config: parisc-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260212/202602122114.dKAeIkiK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602122114.dKAeIkiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602122114.dKAeIkiK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/tps25990.c: In function 'tps25990_probe':
>> drivers/hwmon/pmbus/tps25990.c:463:11: error: 'ENOTSUP' undeclared (first use in this function); did you mean 'ENOTSUPP'?
      return -ENOTSUP;
              ^~~~~~~
              ENOTSUPP
   drivers/hwmon/pmbus/tps25990.c:463:11: note: each undeclared identifier is reported only once for each function it appears in


vim +463 drivers/hwmon/pmbus/tps25990.c

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
