Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DD25EFAE;
	Wed, 19 Nov 2025 03:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763523356; cv=none; b=ELAYu3+jgc12V/cScY9XzSaytErKit6W8zJ6SHHr5MlRwywdwtMdthggWeOmIdVJGFPruiBaQpI/H45uA2g6bfaPWQDfV5IgetdwNxjw1srigZspXGZGufC4lfoQHTYTsKYqEIzemJs/sJV9xjPAnN1OSzTIlEliSvEOxkWTogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763523356; c=relaxed/simple;
	bh=lP31+o42tvR1l08niE35iumd39B7TCWWLxvzZApg3O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5/Z0bZrx5zzqHYaFZ1V2ou7wTEjMQT+EGpEyF/eB8BzJcX7Z4g04aIYmVl0txVdLsGoSf9E26ke2IohglpIgFOkyYJFP9Z/5O6gX0BLQhr4YzN7P59aDQ7LKjOoz/5HD9Rxf0IEM70QjS8WnKw3Skw4WPl1puPhERu/KMYVRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkAEgFku; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkAEgFku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763523354; x=1795059354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lP31+o42tvR1l08niE35iumd39B7TCWWLxvzZApg3O8=;
  b=jkAEgFkufoQR91fxRpxcCQXLCqUonBZAab3NvWiNFR0hwLiZ3zlZjsNF
   4PZC+MH3RYlTDiX3kknlnsyBXpQ7+oXUmsL8uVQy7bxVOoW1NcNO7RyBS
   +cj0qJJtCmodTY0PynMugQYaR7pd1zwxgDFWhu8T0BDvDTtQNnuEhU1Oq
   LDuWtlejwf1EtBaObnyXdQsIi0wpaRt4sg/ojFTD6Pma2rD3VKcymYmeV
   mIzGi7F4AUDsh/1ziI6s7CK46YY0HZxa4rsqHFQcawFF0ABBcP7lB8YEQ
   +YubDDEGiCacXQIb+3/iWRU+masz7FuiENUl6dQsDKOSOxdY9wu3ueZxM
   w==;
X-CSE-ConnectionGUID: 3V/E3Y7qTMegRsPEURksHQ==
X-CSE-MsgGUID: bg1jsAKkT9CQjO0cFrdirQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76911153"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76911153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 19:35:54 -0800
X-CSE-ConnectionGUID: /J3Fc6ljR7G09NXQZeNXRw==
X-CSE-MsgGUID: Yg/WnlmUQKONHKN7Zn3s9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190726219"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2025 19:35:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLYyy-0002PP-23;
	Wed, 19 Nov 2025 03:35:48 +0000
Date: Wed, 19 Nov 2025 11:35:34 +0800
From: kernel test robot <lkp@intel.com>
To: Wenliang Yan <wenliang202407@163.com>, linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] hwmon: (ina3221) Support for writing alert limit
 values and modify the 'ina3221_read_value' function.
Message-ID: <202511191138.FRi6Ldng-lkp@intel.com>
References: <20251118125148.95603-7-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118125148.95603-7-wenliang202407@163.com>

Hi Wenliang,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next linus/master v6.18-rc6 next-20251118]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenliang-Yan/dt-bindings-hwmon-ti-ina3221-Add-SQ52210/20251118-205717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20251118125148.95603-7-wenliang202407%40163.com
patch subject: [PATCH v2 6/8] hwmon: (ina3221) Support for writing alert limit values and modify the 'ina3221_read_value' function.
config: arm-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191138.FRi6Ldng-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191138.FRi6Ldng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191138.FRi6Ldng-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/ina3221.c:554:7: error: duplicate case value: 'hwmon_curr_lcrit' and 'hwmon_in_lcrit' both equal '4'
           case hwmon_in_lcrit:
                ^
   drivers/hwmon/ina3221.c:541:7: note: previous case defined here
           case hwmon_curr_lcrit:
                ^
   1 error generated.


vim +554 drivers/hwmon/ina3221.c

   507	
   508	static int sq52210_alert_limit_write(struct ina3221_data *ina, u32 attr, int channel, long val)
   509	{
   510		struct regmap *regmap = ina->regmap;
   511		int item = channel % INA3221_NUM_CHANNELS;
   512		u8 limit_reg;
   513		u32 alert_group, alert_mask = 0;
   514		int regval = 0;
   515		int ret;
   516	
   517		if (item >= ARRAY_SIZE(alert_groups) || val < 0)
   518			return -EINVAL;
   519	
   520		alert_group = alert_groups[item];
   521		limit_reg = limit_regs[item];
   522	
   523		/* Clear alerts for this channel group first */
   524		ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG, alert_group, 0);
   525		if (ret)
   526			return ret;
   527	
   528		/* Determine alert type and calculate register value */
   529		switch (attr) {
   530		/*
   531		 * The alert warning logic is implemented by comparing the limit register values
   532		 * with the corresponding alert source register values. Since the current register
   533		 * is a 15-bit signed register and the power register is a 16-bit unsigned
   534		 * register, but the lower 3 bits of the limit register default to 0, the lower
   535		 * 3 bits will be forced to 0 when setting SUL and POL warning values.
   536		 * Formula to convert register value:
   537		 *     bus_voltage: (regval / 8mV) << 3
   538		 *     current: (regval / current_lsb) & 0xfff8
   539		 *     power: (regval / current_lsb) & 0xfff8
   540		 */
   541		case hwmon_curr_lcrit:
   542			/* SUL: Shunt Under Limit - BIT(15), BIT(14), BIT(13) */
   543			alert_mask = BIT(15 - item);
   544			/* Current Register, signed register, result in mA */
   545			regval = DIV_ROUND_CLOSEST(val * 1000, ina->current_lsb_uA) & 0xfff8;
   546			regval = clamp_val(regval, -32760, 32760);
   547			break;
   548		case hwmon_in_crit:
   549			/* BOL: Bus Over Limit - BIT(12), BIT(11), BIT(10) */
   550			alert_mask = BIT(12 - item);
   551			/* Bus Register, signed register, result in mV */
   552			regval = clamp_val(val, -32760, 32760);
   553			break;
 > 554		case hwmon_in_lcrit:
   555			/* BUL: Bus Under Limit - BIT(9), BIT(8), BIT(7) */
   556			alert_mask = BIT(9 - item);
   557			/* Bus Register, signed register, result in mV */
   558			regval = clamp_val(val, -32760, 32760);
   559			break;
   560		case hwmon_power_crit:
   561			/* POL: Power Over Limit - BIT(6), BIT(5), BIT(4) */
   562			alert_mask = BIT(6 - item);
   563			/* Power Register, unsigned register, result in mW */
   564			regval = DIV_ROUND_CLOSEST(val * 1000, ina->power_lsb_uW) & 0xfff8;
   565			regval = clamp_val(regval, 0, 65528);
   566			break;
   567		default:
   568			/* For unsupported attributes, just clear the configuration */
   569			ina->alert_type_select &= ~alert_group;
   570			return -EOPNOTSUPP;
   571		}
   572	
   573		/* Write limit register value */
   574		ret = regmap_write(regmap, limit_reg, regval);
   575		if (ret)
   576			return ret;
   577	
   578		/* Update alert configuration if limit value is non-zero */
   579		if (regval) {
   580			ina->alert_type_select = (ina->alert_type_select & ~alert_group) | alert_mask;
   581			ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG,
   582						alert_group, alert_mask);
   583		} else {
   584			ina->alert_type_select &= ~alert_group;
   585		}
   586	
   587		return ret;
   588	}
   589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
