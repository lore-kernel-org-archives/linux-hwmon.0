Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A87C1E51EE;
	Fri, 16 Jan 2026 21:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599448; cv=none; b=t+0ixVo50Jo9f4FeolWtnvIK7EpaPenEyRleEmTADT4ZvwEc1iwZlJZf/Z/0vJrHnY08+bxqU20rLw3DW1skATNcvAQ93hAXi9lwT1sSckfoKSR+hBfCSmACbzddhahvQa8N+LnpJnd3d6JBl7NqPOh2wxXVYKPz5lMbplLkQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599448; c=relaxed/simple;
	bh=euHakU3Cm3tzvjW7BAytl4uh1jyOgYlbifHaTarnt5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8dW0NJrHYql3fkQXH2yt6iJdA1hBOTK6sfq1O/TZhJh1pwRd5SkfirUHqtx7mm+03Mbbw2TC1KycCYGpfM6Pu8SqXDmkFdzqfE/zLwC/rmxU400eiHrLzbbqz7em0B1Meit6Wz2v9+awQBtHh7j8Ofa5vliZxQ4Zf6Cwkrf0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOgIKhsF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOgIKhsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768599447; x=1800135447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euHakU3Cm3tzvjW7BAytl4uh1jyOgYlbifHaTarnt5I=;
  b=cOgIKhsFGIbY75rBAhMLo68AfECXs32Ezf7V2XPZmyJISOfBaDTJ0ye2
   uLzI7qXuZ73VwTdMAb+qrwRtWf0sQuvwgN9Eoj7d4PafAbJp/K1vavvUX
   T2uDto/KQuKL79tJj91PPw55w0QIeMfTCbKwUARrl/U6BpIhezRAnObc9
   uwU8b6dXxr0zMRPGDDtq8euM6aC9XaWVV3N51CNHA/yV9pcWr2XPDEvXP
   q0brF3GmkhykZvHBM+/uJvobR8160dStWSsC4jELP4lj7cA/ZhXVgYExB
   8KKg0gAysCcNP18TKMcb+sac9X/oKql3G7Gohe8QdN84UagJFjB+NUvZm
   g==;
X-CSE-ConnectionGUID: FiukX5ZOQLej8tZv9sbBsQ==
X-CSE-MsgGUID: qBOQvsIvSHaz2O7ZQ5M18g==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="92583843"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="92583843"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:37:25 -0800
X-CSE-ConnectionGUID: XSVjO9CwTziruvACI+9evQ==
X-CSE-MsgGUID: bjY3thmeRmSmMYbPzk1y/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205401657"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jan 2026 13:37:21 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgrVO-00000000LGW-3A9T;
	Fri, 16 Jan 2026 21:37:18 +0000
Date: Sat, 17 Jan 2026 05:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, linux@roeck-us.net,
	corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	priyanka.jain@nxp.com, vikash.bansal@nxp.com,
	Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: Re: [PATCH v4 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
Message-ID: <202601170516.uQw9DKHB-lkp@intel.com>
References: <20260116113554.986-2-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113554.986-2-mayankmahajan.x@nxp.com>

Hi Mayank,

kernel test robot noticed the following build errors:

[auto build test ERROR on 983d014aafb14ee5e4915465bf8948e8f3a723b5]

url:    https://github.com/intel-lab-lkp/linux/commits/Mayank-Mahajan/hwmon-tmp108-Add-support-for-P3T1035-and-P3T2030/20260116-193800
base:   983d014aafb14ee5e4915465bf8948e8f3a723b5
patch link:    https://lore.kernel.org/r/20260116113554.986-2-mayankmahajan.x%40nxp.com
patch subject: [PATCH v4 2/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
config: i386-buildonly-randconfig-004-20260117 (https://download.01.org/0day-ci/archive/20260117/202601170516.uQw9DKHB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170516.uQw9DKHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170516.uQw9DKHB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwmon/tmp108.c:123:33: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     123 |                         *temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD, regval)];
         |                                                      ^
>> drivers/hwmon/tmp108.c:210:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |                                                   FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
         |                                                   ^
   2 errors generated.


vim +/FIELD_GET +123 drivers/hwmon/tmp108.c

   109	
   110	static int tmp108_read(struct device *dev, enum hwmon_sensor_types type,
   111			       u32 attr, int channel, long *temp)
   112	{
   113		struct tmp108 *tmp108 = dev_get_drvdata(dev);
   114		unsigned int regval;
   115		int err, hyst;
   116	
   117		if (type == hwmon_chip) {
   118			if (attr == hwmon_chip_update_interval) {
   119				err = regmap_read(tmp108->regmap, TMP108_REG_CONF,
   120						  &regval);
   121				if (err < 0)
   122					return err;
 > 123				*temp = tmp108->sample_times[FIELD_GET(TMP108_CONF_CONVRATE_FLD, regval)];
   124				return 0;
   125			}
   126			return -EOPNOTSUPP;
   127		}
   128	
   129		switch (attr) {
   130		case hwmon_temp_input:
   131			/* Is it too early to return a conversion ? */
   132			if (time_before(jiffies, tmp108->ready_time)) {
   133				dev_dbg(dev, "%s: Conversion not ready yet..\n",
   134					__func__);
   135				return -EAGAIN;
   136			}
   137			err = regmap_read(tmp108->regmap, TMP108_REG_TEMP, &regval);
   138			if (err < 0)
   139				return err;
   140			*temp = tmp108_temp_reg_to_mC(regval);
   141			break;
   142		case hwmon_temp_min:
   143		case hwmon_temp_max:
   144			err = regmap_read(tmp108->regmap, attr == hwmon_temp_min ?
   145					  TMP108_REG_TLOW : TMP108_REG_THIGH, &regval);
   146			if (err < 0)
   147				return err;
   148			*temp = tmp108_temp_reg_to_mC(regval);
   149			break;
   150		case hwmon_temp_min_alarm:
   151		case hwmon_temp_max_alarm:
   152			err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
   153			if (err < 0)
   154				return err;
   155			*temp = !!(regval & (attr == hwmon_temp_min_alarm ?
   156					     TMP108_CONF_FL : TMP108_CONF_FH));
   157			break;
   158		case hwmon_temp_min_hyst:
   159		case hwmon_temp_max_hyst:
   160			err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &regval);
   161			if (err < 0)
   162				return err;
   163			switch (regval & TMP108_CONF_HYSTERESIS_MASK) {
   164			case TMP108_HYSTERESIS_0C:
   165			default:
   166				hyst = 0;
   167				break;
   168			case TMP108_HYSTERESIS_1C:
   169				hyst = 1000;
   170				break;
   171			case TMP108_HYSTERESIS_2C:
   172				hyst = 2000;
   173				break;
   174			case TMP108_HYSTERESIS_4C:
   175				hyst = 4000;
   176				break;
   177			}
   178			err = regmap_read(tmp108->regmap, attr == hwmon_temp_min_hyst ?
   179					  TMP108_REG_TLOW : TMP108_REG_THIGH, &regval);
   180			if (err < 0)
   181				return err;
   182			*temp = tmp108_temp_reg_to_mC(regval);
   183			if (attr == hwmon_temp_min_hyst)
   184				*temp += hyst;
   185			else
   186				*temp -= hyst;
   187			break;
   188		default:
   189			return -EOPNOTSUPP;
   190		}
   191	
   192		return 0;
   193	}
   194	
   195	static int tmp108_write(struct device *dev, enum hwmon_sensor_types type,
   196				u32 attr, int channel, long temp)
   197	{
   198		struct tmp108 *tmp108 = dev_get_drvdata(dev);
   199		u32 regval, mask;
   200		u8 index;
   201		int err;
   202	
   203		if (type == hwmon_chip) {
   204			if (attr == hwmon_chip_update_interval) {
   205				index = find_closest_descending(temp, tmp108->sample_times,
   206								tmp108->n_sample_times);
   207				return regmap_update_bits(tmp108->regmap,
   208							  TMP108_REG_CONF,
   209							  TMP108_CONF_CONVRATE_MASK,
 > 210							  FIELD_PREP(TMP108_CONF_CONVRATE_FLD, index));
   211			}
   212			return -EOPNOTSUPP;
   213		}
   214	
   215		switch (attr) {
   216		case hwmon_temp_min:
   217		case hwmon_temp_max:
   218			temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
   219			return regmap_write(tmp108->regmap,
   220					    attr == hwmon_temp_min ?
   221						TMP108_REG_TLOW : TMP108_REG_THIGH,
   222					    tmp108_mC_to_temp_reg(temp));
   223		case hwmon_temp_min_hyst:
   224		case hwmon_temp_max_hyst:
   225			temp = clamp_val(temp, TMP108_TEMP_MIN_MC, TMP108_TEMP_MAX_MC);
   226			err = regmap_read(tmp108->regmap,
   227					  attr == hwmon_temp_min_hyst ?
   228						TMP108_REG_TLOW : TMP108_REG_THIGH,
   229					  &regval);
   230			if (err < 0)
   231				return err;
   232			if (attr == hwmon_temp_min_hyst)
   233				temp -= tmp108_temp_reg_to_mC(regval);
   234			else
   235				temp = tmp108_temp_reg_to_mC(regval) - temp;
   236			if (temp < 500)
   237				mask = TMP108_HYSTERESIS_0C;
   238			else if (temp < 1500)
   239				mask = TMP108_HYSTERESIS_1C;
   240			else if (temp < 3000)
   241				mask = TMP108_HYSTERESIS_2C;
   242			else
   243				mask = TMP108_HYSTERESIS_4C;
   244			return regmap_update_bits(tmp108->regmap, TMP108_REG_CONF,
   245						  TMP108_CONF_HYSTERESIS_MASK, mask);
   246		default:
   247			return -EOPNOTSUPP;
   248		}
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
