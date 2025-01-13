Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1671BEF98;
	Mon, 13 Jan 2025 06:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736751202; cv=none; b=lL07IOevKHAKS68RFqQP/aglxjxggehqy+hikG215UCzXpCcWG/Zy2h2sJgVWy1WvVlxtkMAUpFXZ82EQWabdXMUoB7C3AxCGlViqtRSIYkzerlBFnR6aLILkzy+xsVMtkzUufT02MwFs6NXjTPIuBaC+6oARzxaN7HpeGtVpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736751202; c=relaxed/simple;
	bh=ElOFKS/oFvpY9RMb8FNc82vYKk4BTq/9KyQTg2M/45o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mETzEq1wboEaIWuJndfA/ixHeKBzzIOzLkvpRjSlG65ghDI6p0wZHEpqfwXrO5jhUw0RnAQQe5BlfjXUqPjp/RyKwn3Bbxmo43/NAt2Y3Y1tu7eW1k+9Axo1Jz5LS5PxhS0eFIiwenqhP5NUqo3Ewx8K5cpS28YTkE96R+hf4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRKVWuN/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRKVWuN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736751200; x=1768287200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ElOFKS/oFvpY9RMb8FNc82vYKk4BTq/9KyQTg2M/45o=;
  b=jRKVWuN/6byds76xJIWSeow4Oi9hQBaOVjWCw6LTSbWtU0d7MPQe/I+m
   8Ri+7LOdQJbtIyFvt2tsLK960hAdeFw2ZD9C2obNYPAR+lIh1UBdBQJyc
   t/0MYym1lPa1hLbWEgWqRwmniqaqcNlxIHvCs/3uNtn4yhM4S637WcSOo
   O1YxH5T4Y9bawZCIhL7QuIShwhV2WlCO0F3RmdrFtUjSaZoDZeruRo6QC
   k8H1SChgl+Xqv5PU85TbXf3Uz7I+76fZPzl6+Z/ybPoN1pNTc5lGzf0pE
   8vSz5EC6f2uLPR3+BaJTcU8FQSmjr7BZcrypP68F8NL/YRak3jJFt5YgJ
   g==;
X-CSE-ConnectionGUID: 1k2NXAgzSCaCHumnZ+sO4g==
X-CSE-MsgGUID: 3wHFZhT0SmmmH/Nk/04TZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36278961"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36278961"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:53:19 -0800
X-CSE-ConnectionGUID: S09VXZZlQym3XWivhV2RiQ==
X-CSE-MsgGUID: sW9YO4M8Q0mRFxY5PIpqSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="109364775"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2025 22:53:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXEK2-000MpH-04;
	Mon, 13 Jan 2025 06:53:14 +0000
Date: Mon, 13 Jan 2025 14:52:18 +0800
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
Subject: Re: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
Message-ID: <202501131420.UQWnurXD-lkp@intel.com>
References: <20250113035023.365697-3-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113035023.365697-3-wenliang202407@163.com>

Hi Wenliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenliang-Yan/dt-bindings-Add-SQ52206-to-ina2xx-devicetree-bindings/20250113-115457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250113035023.365697-3-wenliang202407%40163.com
patch subject: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
config: i386-buildonly-randconfig-004-20250113 (https://download.01.org/0day-ci/archive/20250113/202501131420.UQWnurXD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501131420.UQWnurXD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501131420.UQWnurXD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/ina238.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/hwmon/ina238.c:594:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     594 |         case hwmon_temp:
         |         ^
   drivers/hwmon/ina238.c:594:2: note: insert '__attribute__((fallthrough));' to silence this warning
     594 |         case hwmon_temp:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/hwmon/ina238.c:594:2: note: insert 'break;' to avoid fall-through
     594 |         case hwmon_temp:
         |         ^
         |         break; 
>> drivers/hwmon/ina238.c:702:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     702 |                 else if (data->gain == 2)
         |                 ^
   3 warnings generated.


vim +594 drivers/hwmon/ina238.c

eacb52f010a807 Nathan Rossi        2021-11-02  552  
eacb52f010a807 Nathan Rossi        2021-11-02  553  static umode_t ina238_is_visible(const void *drvdata,
eacb52f010a807 Nathan Rossi        2021-11-02  554  				 enum hwmon_sensor_types type,
eacb52f010a807 Nathan Rossi        2021-11-02  555  				 u32 attr, int channel)
eacb52f010a807 Nathan Rossi        2021-11-02  556  {
f08436905922ae Wenliang Yan        2025-01-13  557  	const struct ina238_data *data = drvdata;
f08436905922ae Wenliang Yan        2025-01-13  558  	bool has_power_highest = data->config->has_power_highest;
f08436905922ae Wenliang Yan        2025-01-13  559  
eacb52f010a807 Nathan Rossi        2021-11-02  560  	switch (type) {
eacb52f010a807 Nathan Rossi        2021-11-02  561  	case hwmon_in:
eacb52f010a807 Nathan Rossi        2021-11-02  562  		switch (attr) {
eacb52f010a807 Nathan Rossi        2021-11-02  563  		case hwmon_in_input:
eacb52f010a807 Nathan Rossi        2021-11-02  564  		case hwmon_in_max_alarm:
eacb52f010a807 Nathan Rossi        2021-11-02  565  		case hwmon_in_min_alarm:
eacb52f010a807 Nathan Rossi        2021-11-02  566  			return 0444;
eacb52f010a807 Nathan Rossi        2021-11-02  567  		case hwmon_in_max:
eacb52f010a807 Nathan Rossi        2021-11-02  568  		case hwmon_in_min:
eacb52f010a807 Nathan Rossi        2021-11-02  569  			return 0644;
eacb52f010a807 Nathan Rossi        2021-11-02  570  		default:
eacb52f010a807 Nathan Rossi        2021-11-02  571  			return 0;
eacb52f010a807 Nathan Rossi        2021-11-02  572  		}
eacb52f010a807 Nathan Rossi        2021-11-02  573  	case hwmon_curr:
eacb52f010a807 Nathan Rossi        2021-11-02  574  		switch (attr) {
eacb52f010a807 Nathan Rossi        2021-11-02  575  		case hwmon_curr_input:
eacb52f010a807 Nathan Rossi        2021-11-02  576  			return 0444;
eacb52f010a807 Nathan Rossi        2021-11-02  577  		default:
eacb52f010a807 Nathan Rossi        2021-11-02  578  			return 0;
eacb52f010a807 Nathan Rossi        2021-11-02  579  		}
eacb52f010a807 Nathan Rossi        2021-11-02  580  	case hwmon_power:
eacb52f010a807 Nathan Rossi        2021-11-02  581  		switch (attr) {
eacb52f010a807 Nathan Rossi        2021-11-02  582  		case hwmon_power_input:
eacb52f010a807 Nathan Rossi        2021-11-02  583  		case hwmon_power_max_alarm:
eacb52f010a807 Nathan Rossi        2021-11-02  584  			return 0444;
eacb52f010a807 Nathan Rossi        2021-11-02  585  		case hwmon_power_max:
eacb52f010a807 Nathan Rossi        2021-11-02  586  			return 0644;
f08436905922ae Wenliang Yan        2025-01-13  587  		case hwmon_power_input_highest:
f08436905922ae Wenliang Yan        2025-01-13  588  			if (has_power_highest)
f08436905922ae Wenliang Yan        2025-01-13  589  				return 0444;
f08436905922ae Wenliang Yan        2025-01-13  590  			break;
eacb52f010a807 Nathan Rossi        2021-11-02  591  		default:
eacb52f010a807 Nathan Rossi        2021-11-02  592  			return 0;
eacb52f010a807 Nathan Rossi        2021-11-02  593  		}
eacb52f010a807 Nathan Rossi        2021-11-02 @594  	case hwmon_temp:
eacb52f010a807 Nathan Rossi        2021-11-02  595  		switch (attr) {
eacb52f010a807 Nathan Rossi        2021-11-02  596  		case hwmon_temp_input:
eacb52f010a807 Nathan Rossi        2021-11-02  597  		case hwmon_temp_max_alarm:
eacb52f010a807 Nathan Rossi        2021-11-02  598  			return 0444;
eacb52f010a807 Nathan Rossi        2021-11-02  599  		case hwmon_temp_max:
eacb52f010a807 Nathan Rossi        2021-11-02  600  			return 0644;
eacb52f010a807 Nathan Rossi        2021-11-02  601  		default:
eacb52f010a807 Nathan Rossi        2021-11-02  602  			return 0;
eacb52f010a807 Nathan Rossi        2021-11-02  603  		}
eacb52f010a807 Nathan Rossi        2021-11-02  604  	default:
eacb52f010a807 Nathan Rossi        2021-11-02  605  		return 0;
eacb52f010a807 Nathan Rossi        2021-11-02  606  	}
eacb52f010a807 Nathan Rossi        2021-11-02  607  }
eacb52f010a807 Nathan Rossi        2021-11-02  608  
eacb52f010a807 Nathan Rossi        2021-11-02  609  #define INA238_HWMON_IN_CONFIG (HWMON_I_INPUT | \
eacb52f010a807 Nathan Rossi        2021-11-02  610  				HWMON_I_MAX | HWMON_I_MAX_ALARM | \
eacb52f010a807 Nathan Rossi        2021-11-02  611  				HWMON_I_MIN | HWMON_I_MIN_ALARM)
eacb52f010a807 Nathan Rossi        2021-11-02  612  
bf9b7f92df7376 Krzysztof Kozlowski 2023-04-06  613  static const struct hwmon_channel_info * const ina238_info[] = {
eacb52f010a807 Nathan Rossi        2021-11-02  614  	HWMON_CHANNEL_INFO(in,
eacb52f010a807 Nathan Rossi        2021-11-02  615  			   /* 0: shunt voltage */
eacb52f010a807 Nathan Rossi        2021-11-02  616  			   INA238_HWMON_IN_CONFIG,
eacb52f010a807 Nathan Rossi        2021-11-02  617  			   /* 1: bus voltage */
eacb52f010a807 Nathan Rossi        2021-11-02  618  			   INA238_HWMON_IN_CONFIG),
eacb52f010a807 Nathan Rossi        2021-11-02  619  	HWMON_CHANNEL_INFO(curr,
eacb52f010a807 Nathan Rossi        2021-11-02  620  			   /* 0: current through shunt */
eacb52f010a807 Nathan Rossi        2021-11-02  621  			   HWMON_C_INPUT),
eacb52f010a807 Nathan Rossi        2021-11-02  622  	HWMON_CHANNEL_INFO(power,
eacb52f010a807 Nathan Rossi        2021-11-02  623  			   /* 0: power */
f08436905922ae Wenliang Yan        2025-01-13  624  			   HWMON_P_INPUT | HWMON_P_MAX |
f08436905922ae Wenliang Yan        2025-01-13  625  			   HWMON_P_MAX_ALARM | HWMON_P_INPUT_HIGHEST),
eacb52f010a807 Nathan Rossi        2021-11-02  626  	HWMON_CHANNEL_INFO(temp,
eacb52f010a807 Nathan Rossi        2021-11-02  627  			   /* 0: die temperature */
eacb52f010a807 Nathan Rossi        2021-11-02  628  			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_ALARM),
eacb52f010a807 Nathan Rossi        2021-11-02  629  	NULL
eacb52f010a807 Nathan Rossi        2021-11-02  630  };
eacb52f010a807 Nathan Rossi        2021-11-02  631  
eacb52f010a807 Nathan Rossi        2021-11-02  632  static const struct hwmon_ops ina238_hwmon_ops = {
eacb52f010a807 Nathan Rossi        2021-11-02  633  	.is_visible = ina238_is_visible,
eacb52f010a807 Nathan Rossi        2021-11-02  634  	.read = ina238_read,
eacb52f010a807 Nathan Rossi        2021-11-02  635  	.write = ina238_write,
eacb52f010a807 Nathan Rossi        2021-11-02  636  };
eacb52f010a807 Nathan Rossi        2021-11-02  637  
eacb52f010a807 Nathan Rossi        2021-11-02  638  static const struct hwmon_chip_info ina238_chip_info = {
eacb52f010a807 Nathan Rossi        2021-11-02  639  	.ops = &ina238_hwmon_ops,
eacb52f010a807 Nathan Rossi        2021-11-02  640  	.info = ina238_info,
eacb52f010a807 Nathan Rossi        2021-11-02  641  };
eacb52f010a807 Nathan Rossi        2021-11-02  642  
f08436905922ae Wenliang Yan        2025-01-13  643  /* energy attributes are 5bytes wide so we need u64 */
f08436905922ae Wenliang Yan        2025-01-13  644  static DEVICE_ATTR_RO(energy1_input);
f08436905922ae Wenliang Yan        2025-01-13  645  
f08436905922ae Wenliang Yan        2025-01-13  646  static struct attribute *ina238_attrs[] = {
f08436905922ae Wenliang Yan        2025-01-13  647  	&dev_attr_energy1_input.attr,
f08436905922ae Wenliang Yan        2025-01-13  648  	NULL,
f08436905922ae Wenliang Yan        2025-01-13  649  };
f08436905922ae Wenliang Yan        2025-01-13  650  ATTRIBUTE_GROUPS(ina238);
f08436905922ae Wenliang Yan        2025-01-13  651  
eacb52f010a807 Nathan Rossi        2021-11-02  652  static int ina238_probe(struct i2c_client *client)
eacb52f010a807 Nathan Rossi        2021-11-02  653  {
eacb52f010a807 Nathan Rossi        2021-11-02  654  	struct ina2xx_platform_data *pdata = dev_get_platdata(&client->dev);
eacb52f010a807 Nathan Rossi        2021-11-02  655  	struct device *dev = &client->dev;
eacb52f010a807 Nathan Rossi        2021-11-02  656  	struct device *hwmon_dev;
eacb52f010a807 Nathan Rossi        2021-11-02  657  	struct ina238_data *data;
eacb52f010a807 Nathan Rossi        2021-11-02  658  	int config;
f08436905922ae Wenliang Yan        2025-01-13  659  	enum ina238_ids chip;
eacb52f010a807 Nathan Rossi        2021-11-02  660  	int ret;
eacb52f010a807 Nathan Rossi        2021-11-02  661  
f08436905922ae Wenliang Yan        2025-01-13  662  	chip = (uintptr_t)i2c_get_match_data(client);
f08436905922ae Wenliang Yan        2025-01-13  663  
eacb52f010a807 Nathan Rossi        2021-11-02  664  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
eacb52f010a807 Nathan Rossi        2021-11-02  665  	if (!data)
eacb52f010a807 Nathan Rossi        2021-11-02  666  		return -ENOMEM;
eacb52f010a807 Nathan Rossi        2021-11-02  667  
eacb52f010a807 Nathan Rossi        2021-11-02  668  	data->client = client;
f08436905922ae Wenliang Yan        2025-01-13  669  	/* set the device type */
f08436905922ae Wenliang Yan        2025-01-13  670  	data->config = &ina238_config[chip];
f08436905922ae Wenliang Yan        2025-01-13  671  
eacb52f010a807 Nathan Rossi        2021-11-02  672  	mutex_init(&data->config_lock);
eacb52f010a807 Nathan Rossi        2021-11-02  673  
eacb52f010a807 Nathan Rossi        2021-11-02  674  	data->regmap = devm_regmap_init_i2c(client, &ina238_regmap_config);
eacb52f010a807 Nathan Rossi        2021-11-02  675  	if (IS_ERR(data->regmap)) {
eacb52f010a807 Nathan Rossi        2021-11-02  676  		dev_err(dev, "failed to allocate register map\n");
eacb52f010a807 Nathan Rossi        2021-11-02  677  		return PTR_ERR(data->regmap);
eacb52f010a807 Nathan Rossi        2021-11-02  678  	}
eacb52f010a807 Nathan Rossi        2021-11-02  679  
eacb52f010a807 Nathan Rossi        2021-11-02  680  	/* load shunt value */
eacb52f010a807 Nathan Rossi        2021-11-02  681  	data->rshunt = INA238_RSHUNT_DEFAULT;
eacb52f010a807 Nathan Rossi        2021-11-02  682  	if (device_property_read_u32(dev, "shunt-resistor", &data->rshunt) < 0 && pdata)
eacb52f010a807 Nathan Rossi        2021-11-02  683  		data->rshunt = pdata->shunt_uohms;
eacb52f010a807 Nathan Rossi        2021-11-02  684  	if (data->rshunt == 0) {
eacb52f010a807 Nathan Rossi        2021-11-02  685  		dev_err(dev, "invalid shunt resister value %u\n", data->rshunt);
eacb52f010a807 Nathan Rossi        2021-11-02  686  		return -EINVAL;
eacb52f010a807 Nathan Rossi        2021-11-02  687  	}
eacb52f010a807 Nathan Rossi        2021-11-02  688  
eacb52f010a807 Nathan Rossi        2021-11-02  689  	/* load shunt gain value */
eacb52f010a807 Nathan Rossi        2021-11-02  690  	if (device_property_read_u32(dev, "ti,shunt-gain", &data->gain) < 0)
eacb52f010a807 Nathan Rossi        2021-11-02  691  		data->gain = 4; /* Default of ADCRANGE = 0 */
f08436905922ae Wenliang Yan        2025-01-13  692  	if (data->gain != 1 && data->gain != 2 && data->gain != 4) {
eacb52f010a807 Nathan Rossi        2021-11-02  693  		dev_err(dev, "invalid shunt gain value %u\n", data->gain);
eacb52f010a807 Nathan Rossi        2021-11-02  694  		return -EINVAL;
eacb52f010a807 Nathan Rossi        2021-11-02  695  	}
eacb52f010a807 Nathan Rossi        2021-11-02  696  
eacb52f010a807 Nathan Rossi        2021-11-02  697  	/* Setup CONFIG register */
f08436905922ae Wenliang Yan        2025-01-13  698  	config = data->config->config_default;
f08436905922ae Wenliang Yan        2025-01-13  699  	if (chip == sq52206)
eacb52f010a807 Nathan Rossi        2021-11-02  700  		if (data->gain == 1)
f08436905922ae Wenliang Yan        2025-01-13  701  			config |= SQ52206_CONFIG_ADCRANGE_HIGH; /* ADCRANGE = 10/11 is /1 */
f08436905922ae Wenliang Yan        2025-01-13 @702  		else if (data->gain == 2)
f08436905922ae Wenliang Yan        2025-01-13  703  			config |= SQ52206_CONFIG_ADCRANGE_LOW; /* ADCRANGE = 01 is /2 */
f08436905922ae Wenliang Yan        2025-01-13  704  	else if (data->gain == 1)
eacb52f010a807 Nathan Rossi        2021-11-02  705  		config |= INA238_CONFIG_ADCRANGE; /* ADCRANGE = 1 is /1 */
eacb52f010a807 Nathan Rossi        2021-11-02  706  	ret = regmap_write(data->regmap, INA238_CONFIG, config);
eacb52f010a807 Nathan Rossi        2021-11-02  707  	if (ret < 0) {
eacb52f010a807 Nathan Rossi        2021-11-02  708  		dev_err(dev, "error configuring the device: %d\n", ret);
eacb52f010a807 Nathan Rossi        2021-11-02  709  		return -ENODEV;
eacb52f010a807 Nathan Rossi        2021-11-02  710  	}
eacb52f010a807 Nathan Rossi        2021-11-02  711  
eacb52f010a807 Nathan Rossi        2021-11-02  712  	/* Setup ADC_CONFIG register */
eacb52f010a807 Nathan Rossi        2021-11-02  713  	ret = regmap_write(data->regmap, INA238_ADC_CONFIG,
eacb52f010a807 Nathan Rossi        2021-11-02  714  			   INA238_ADC_CONFIG_DEFAULT);
eacb52f010a807 Nathan Rossi        2021-11-02  715  	if (ret < 0) {
eacb52f010a807 Nathan Rossi        2021-11-02  716  		dev_err(dev, "error configuring the device: %d\n", ret);
eacb52f010a807 Nathan Rossi        2021-11-02  717  		return -ENODEV;
eacb52f010a807 Nathan Rossi        2021-11-02  718  	}
eacb52f010a807 Nathan Rossi        2021-11-02  719  
eacb52f010a807 Nathan Rossi        2021-11-02  720  	/* Setup SHUNT_CALIBRATION register with fixed value */
eacb52f010a807 Nathan Rossi        2021-11-02  721  	ret = regmap_write(data->regmap, INA238_SHUNT_CALIBRATION,
eacb52f010a807 Nathan Rossi        2021-11-02  722  			   INA238_CALIBRATION_VALUE);
eacb52f010a807 Nathan Rossi        2021-11-02  723  	if (ret < 0) {
eacb52f010a807 Nathan Rossi        2021-11-02  724  		dev_err(dev, "error configuring the device: %d\n", ret);
eacb52f010a807 Nathan Rossi        2021-11-02  725  		return -ENODEV;
eacb52f010a807 Nathan Rossi        2021-11-02  726  	}
eacb52f010a807 Nathan Rossi        2021-11-02  727  
eacb52f010a807 Nathan Rossi        2021-11-02  728  	/* Setup alert/alarm configuration */
eacb52f010a807 Nathan Rossi        2021-11-02  729  	ret = regmap_write(data->regmap, INA238_DIAG_ALERT,
eacb52f010a807 Nathan Rossi        2021-11-02  730  			   INA238_DIAG_ALERT_DEFAULT);
eacb52f010a807 Nathan Rossi        2021-11-02  731  	if (ret < 0) {
eacb52f010a807 Nathan Rossi        2021-11-02  732  		dev_err(dev, "error configuring the device: %d\n", ret);
eacb52f010a807 Nathan Rossi        2021-11-02  733  		return -ENODEV;
eacb52f010a807 Nathan Rossi        2021-11-02  734  	}
eacb52f010a807 Nathan Rossi        2021-11-02  735  
eacb52f010a807 Nathan Rossi        2021-11-02  736  	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name, data,
eacb52f010a807 Nathan Rossi        2021-11-02  737  							 &ina238_chip_info,
f08436905922ae Wenliang Yan        2025-01-13  738  							 data->config->has_energy ?
f08436905922ae Wenliang Yan        2025-01-13  739  								NULL : ina238_groups);
eacb52f010a807 Nathan Rossi        2021-11-02  740  	if (IS_ERR(hwmon_dev))
eacb52f010a807 Nathan Rossi        2021-11-02  741  		return PTR_ERR(hwmon_dev);
eacb52f010a807 Nathan Rossi        2021-11-02  742  
eacb52f010a807 Nathan Rossi        2021-11-02  743  	dev_info(dev, "power monitor %s (Rshunt = %u uOhm, gain = %u)\n",
eacb52f010a807 Nathan Rossi        2021-11-02  744  		 client->name, data->rshunt, data->gain);
eacb52f010a807 Nathan Rossi        2021-11-02  745  
eacb52f010a807 Nathan Rossi        2021-11-02  746  	return 0;
eacb52f010a807 Nathan Rossi        2021-11-02  747  }
eacb52f010a807 Nathan Rossi        2021-11-02  748  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
