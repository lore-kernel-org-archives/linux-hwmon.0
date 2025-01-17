Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51201D8DFE;
	Fri, 17 Jan 2025 23:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737155273; cv=none; b=Jqp9vIaCeF7zcLLYOoGHqSA5/4m8V1vA0/dYcx9+iWLagp+9G6M6Qj+oClNJ4KUfOg/Rb5DboBvKyNel3GRxdingYyyAHK0DsApZd8R8idPaNMdCYKlWCqfniRBRxKpEzF8irOj0hrC8R31MhJY8b24/pA5mMBYKmj6y+wTDh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737155273; c=relaxed/simple;
	bh=ZSC1mkGXnt6s6z6IiVGuAN4/We6rPMRT7Oe1ciDb+hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5pabpIZZq+++iiOrXMJq7gJQjVzDsB0Gxla2+BmBenX9tdy0Fp/EGjmVrBDc5o3SZdqSvkpNdNjFrM2m36aDtsWdPoQ7fx7r7vuXgGV+6SFAYeqvnAXot1AqrXRdkTiy9to53JA0YcB/7F2i4VeMqPBRt1RlWWYRiK2wGWi0Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vi/eBf+z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vi/eBf+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737155271; x=1768691271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZSC1mkGXnt6s6z6IiVGuAN4/We6rPMRT7Oe1ciDb+hk=;
  b=Vi/eBf+z+N675Y2r8yxroohF8TJlrSIKULi3+le+0Nk7bk03lPNy8MH2
   hJcbEZ0dsb4vwOiX+FaCdzvZbpL+UyDnK2R2SBq3dB8olzPgtM7V0Jwq0
   weyPucA2Xgfb9ObKK4G2B/9UAGG6UPmclIwY/8Qgai11ng1CJQBYQG2lQ
   Tj1b2J5txQqfPIZJf/gnUg4E8X1VuWh3OMoyfX8vYXIdtXYx98qIReLhS
   G6AyVzWp9Fr+75JN0GVAOuHvbTs1HhHVhlcAOZGmO7AghX/wsPyLTjpYX
   Nrviw9RMowbqz/3Q9m8r/27VXPC8PaSPxqSQeFNLSklmp2Xa46JTtkYqY
   Q==;
X-CSE-ConnectionGUID: qDlw+XlmR1+J6Cqwgol7vQ==
X-CSE-MsgGUID: 2aHiGTRWT6+fMJjxMEKPUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37296339"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37296339"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 15:07:51 -0800
X-CSE-ConnectionGUID: PkYA1xqxRfOWyuB+92QB6g==
X-CSE-MsgGUID: 3Xr87cIPRbuQ+GtNfl7iTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="105966793"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2025 15:07:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYvRI-000ToF-1Q;
	Fri, 17 Jan 2025 23:07:44 +0000
Date: Sat, 18 Jan 2025 07:07:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leo Yang <leo.yang.sy0@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
Message-ID: <202501180656.96daAp3W-lkp@intel.com>
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250118/202501180656.96daAp3W-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180656.96daAp3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180656.96daAp3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/hwmon/pmbus/ina233.c:9:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hwmon/pmbus/ina233.c:147:10: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     146 |                                      "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
         |                                                                  ~~~
         |                                                                  %u
     147 |                                      current_lsb, rshunt);
         |                                      ^~~~~~~~~~~
   drivers/hwmon/pmbus/ina233.c:147:23: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     146 |                                      "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
         |                                                                                         ~~~
         |                                                                                         %u
     147 |                                      current_lsb, rshunt);
         |                                                   ^~~~~~
   drivers/hwmon/pmbus/ina233.c:153:17: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |                                                  ~~~
         |                                                  %u
     153 |                 client->name, rshunt, current_lsb);
         |                               ^~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/hwmon/pmbus/ina233.c:153:25: warning: format specifies type 'unsigned long' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     152 |         dev_dbg(dev, "power monitor %s (Rshunt = %lu uOhm, Current_LSB = %lu uA/bit)\n",
         |                                                                          ~~~
         |                                                                          %u
     153 |                 client->name, rshunt, current_lsb);
         |                                       ^~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   8 warnings generated.


vim +147 drivers/hwmon/pmbus/ina233.c

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
   146					     "The product of Current_LSB %lu and shunt resistor %lu exceed MFR_CALIBRATION register limit.\n",
 > 147					     current_lsb, rshunt);
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
