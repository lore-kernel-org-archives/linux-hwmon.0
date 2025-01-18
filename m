Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F223C17BA6;
	Sat, 18 Jan 2025 01:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737164168; cv=none; b=i7J9Zk29EGPnVh0ntBURHjKjOytyABcskSO8vEOVLGsd9xhduDO4Yvq5zDhjgiPdYtzQe5GyJeHiJsP2eDoKyoBlkvnPXm9a/davfpNKZ0C6g2GdRo7MciMXBiDUei0naPsjo8OZLdfw5exTzcIauTvBxmqhcWSfBvx/s7phVDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737164168; c=relaxed/simple;
	bh=101AoZKQI1f/KtXhFyS5EL4kx5eW9wsrOkNKz+OGQOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ87tO+QmYB3LTJovdVL+GdLDicoDd3ePGxZ3SwNxaIxeW8M0kgDnU+EgLYUpGnKkfkhmUkPxXqz47p5PFgfctnl4QqYXX+1vfL3f79ZuaQx79cXFxdJ5g5L+ntRxyjVXn3nemGwje3jujLHaQIskqh/J040fXFUAn4dftVi+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZICjk52; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZICjk52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737164166; x=1768700166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=101AoZKQI1f/KtXhFyS5EL4kx5eW9wsrOkNKz+OGQOw=;
  b=ZZICjk52HRmpfLckuP2qBsFmMwmWwUN1VRpzEmLQEzCMGhykc7I18uUZ
   gBAQZXOJpDfx1nAPE1M5KAODUsAumlBT2fYGFzTjIutfLylTOVmdnG7yE
   NJsGUZR2LI5ivZ196e366FzGWNSBINyX3eIX85f6cLnIPmQnNVCeIA6vh
   3LWO2EB+6zyKwSwwI+peqntk/kXi/AbXg6YKktCdbPm3Uyt5t3iQiOt+m
   LrDvN6JKaJWDNwykVIs5vvphNSkkarJSGi9GHRmb4CfN0cf20D9nyhKuN
   bhTv7ONnKqgHUbNQjqFFz7igDj8QkG8gtwjDcSv23FWVphWNApTR2kMSY
   A==;
X-CSE-ConnectionGUID: WrVn1OvKTjmSMD3u8VwDUA==
X-CSE-MsgGUID: kEjxIQU9RC6OrZGAbVOQPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48282119"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48282119"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 17:36:05 -0800
X-CSE-ConnectionGUID: YfA0MJvQR62cbexFYO/p8w==
X-CSE-MsgGUID: yxCgnLPCRoGXHPklYhsHOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106853722"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jan 2025 17:36:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYxkl-000TvL-1Z;
	Sat, 18 Jan 2025 01:35:59 +0000
Date: Sat, 18 Jan 2025 09:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Leo Yang <leo.yang.sy0@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
Message-ID: <202501180929.0qqEOh4l-lkp@intel.com>
References: <20250115015519.950795-3-leo.yang.sy0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115015519.950795-3-leo.yang.sy0@gmail.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yang/dt-bindings-hwmon-ti-ina2xx-Add-INA233-device/20250115-095801
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250115015519.950795-3-leo.yang.sy0%40gmail.com
patch subject: [PATCH v3 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501180929.0qqEOh4l-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180929.0qqEOh4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180929.0qqEOh4l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/pmbus/ina233.c: In function 'ina233_probe':
>> drivers/hwmon/pmbus/ina233.c:146:68: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     146 |                                      "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
         |                                                                  ~~^
         |                                                                    |
         |                                                                    long unsigned int
         |                                                                  %u
     147 |                                      current_lsb, rshunt);
         |                                      ~~~~~~~~~~~                    
         |                                      |
         |                                      u32 {aka unsigned int}
   drivers/hwmon/pmbus/ina233.c:146:91: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     146 |                                      "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
         |                                                                                         ~~^
         |                                                                                           |
         |                                                                                           long unsigned int
         |                                                                                         %u
     147 |                                      current_lsb, rshunt);
         |                                                   ~~~~~~                                   
         |                                                   |
         |                                                   u32 {aka unsigned int}
   In file included from include/linux/printk.h:610,
                    from include/asm-generic/bug.h:22,
                    from arch/sh/include/asm/bug.h:112,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/hwmon/pmbus/ina233.c:9:
   drivers/hwmon/pmbus/ina233.c:152:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/hwmon/pmbus/ina233.c:152:9: note: in expansion of macro 'dev_dbg'
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |         ^~~~~~~
   drivers/hwmon/pmbus/ina233.c:152:52: note: format string is defined here
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |                                                  ~~^
         |                                                    |
         |                                                    long unsigned int
         |                                                  %u
   drivers/hwmon/pmbus/ina233.c:152:22: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'u32' {aka 'unsigned int'} [-Wformat=]
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:30: note: in expansion of macro 'dev_fmt'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                              ^~~~~~~
   drivers/hwmon/pmbus/ina233.c:152:9: note: in expansion of macro 'dev_dbg'
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |         ^~~~~~~
   drivers/hwmon/pmbus/ina233.c:152:76: note: format string is defined here
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |                                                                          ~~^
         |                                                                            |
         |                                                                            long unsigned int
         |                                                                          %u


vim +146 drivers/hwmon/pmbus/ina233.c

    81	
    82	static int ina233_probe(struct i2c_client *client)
    83	{
    84		struct device *dev = &client->dev;
    85		int ret, m, R;
    86		u32 rshunt;
    87		u32 current_lsb;
    88		u16 calibration;
    89		struct pmbus_driver_info *info;
    90	
    91		info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info),
    92				    GFP_KERNEL);
    93		if (!info)
    94			return -ENOMEM;
    95	
    96		info->pages = 1;
    97		info->format[PSC_VOLTAGE_IN] = direct;
    98		info->format[PSC_VOLTAGE_OUT] = direct;
    99		info->format[PSC_CURRENT_OUT] = direct;
   100		info->format[PSC_POWER] = direct;
   101		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
   102			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
   103			| PMBUS_HAVE_POUT
   104			| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON;
   105		info->m[PSC_VOLTAGE_IN] = 8;
   106		info->R[PSC_VOLTAGE_IN] = 2;
   107		info->m[PSC_VOLTAGE_OUT] = 8;
   108		info->R[PSC_VOLTAGE_OUT] = 2;
   109		info->read_word_data = ina233_read_word_data;
   110	
   111		/* If INA233 skips current/power, shunt-resistor and current-lsb aren't needed.	*/
   112		/* read rshunt value (uOhm) */
   113		ret = device_property_read_u32(dev, "shunt-resistor", &rshunt);
   114		if (ret) {
   115			if (ret != -EINVAL)
   116				return dev_err_probe(dev, ret, "Shunt resistor property read fail.\n");
   117			rshunt = INA233_RSHUNT_DEFAULT;
   118		}
   119	
   120		/* read current_lsb value (uA) */
   121		ret = device_property_read_u32(dev, "ti,current-lsb-microamp", &current_lsb);
   122		if (ret) {
   123			if (ret != -EINVAL)
   124				return dev_err_probe(dev, ret, "Current_LSB property read fail.\n");
   125			current_lsb = INA233_CURRENT_LSB_DEFAULT;
   126		}
   127	
   128		if (!rshunt || !current_lsb)
   129			return dev_err_probe(dev, -EINVAL,
   130					     "Shunt resistor and Current_LSB cannot be zero.\n");
   131	
   132		/* calculate current coefficient */
   133		calculate_coef(&m, &R, current_lsb, 1);
   134		info->m[PSC_CURRENT_OUT] = m;
   135		info->R[PSC_CURRENT_OUT] = R;
   136	
   137		/* calculate power coefficient */
   138		calculate_coef(&m, &R, current_lsb, 25);
   139		info->m[PSC_POWER] = m;
   140		info->R[PSC_POWER] = R;
   141	
   142		/* write MFR_CALIBRATION register, Apply formula from spec with unit scaling. */
   143		calibration = div64_u64(5120000000ULL, (u64)rshunt * current_lsb);
   144		if (calibration > 0x7FFF)
   145			return dev_err_probe(dev, -EINVAL,
 > 146					     "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
   147					     current_lsb, rshunt);
   148		ret = i2c_smbus_write_word_data(client, MFR_CALIBRATION, calibration);
   149		if (ret < 0)
   150			return dev_err_probe(dev, ret, "Unable to write calibration.\n");
   151	
   152		dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
   153			client->name, rshunt, current_lsb);
   154	
   155		return pmbus_do_probe(client, info);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
