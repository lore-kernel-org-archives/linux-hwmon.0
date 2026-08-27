Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2035294E;
	Thu, 27 Aug 2026 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804211; cv=none; b=gXZvozh8ShMVGSRrEhM32L7p3UlfCIQlYezTSqiMKA/3ybQzsEdTz5Mgq23YUNln9s5eoMfkLRUgSJHoR5U14/kRinJOEorUIboHDjp3ALxUwIDuMe/kRJKqMZXcP0AUs/ygWdupeeu9kjTnzgc1k4lTsfkA7Z1f4tZSFjQcn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804211; c=relaxed/simple;
	bh=PPd9OCYVQWioAWIApaXxZnX+PdFhu/b8He2oPGx31FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ233/G6mHict9Dr0+n89EeYzVm1mdE+ZKI39p/eZ4GKNdvMvqXHckSBbpjslqWo7zoNDu06qS0wfPg1GsW4wc3uLRFk05iOgIWHXWVQ2gHKWkZy20ycaRTUvRrYnbxbSNS6ppBuGtP/uLI2+u8uX2W2gm6ObecsJ2eeLYzvHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTVlKS7+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTVlKS7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787804209; x=1819340209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=PPd9OCYVQWioAWIApaXxZnX+PdFhu/b8He2oPGx31FI=;
  b=GTVlKS7+7i8fosjvm9veKdO4nYHgqVF8FpeAT3Fv6x2AFZEScoTsMyvA
   6LV9tF7D/Am5JTWrc/iig5xzqm0yYbe3oUaMt6yuoUSyF+5e1Q9iS2ghB
   4RnODdWYx1oKCQj3o4uU32f8lquublmoWUfEZ3LQuFGeF/MvaZMkudOXd
   I+6v8KIYhnIluerF7EN48tPVlyED3b8SnlManpvbUiM2Wj5pzq3GnHBbD
   ULUMl9nRpNSuvZil1xuifkpsjKGy5/nRios3ufVkTPbQXunEgSp28WYxu
   gV/mzS5nYbgIFLG2825f+JIYeoVUT3AwBNHmGNwI5dHc99GHXbFhWWTJP
   w==;
X-CSE-ConnectionGUID: E5hVDeM3RtywSTONk1AkCw==
X-CSE-MsgGUID: 15wyR0MgRm+6NMdRXTksIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88217800"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88217800"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 21:16:48 -0700
X-CSE-ConnectionGUID: j4HmHifpRkaYKt3Spy6hAg==
X-CSE-MsgGUID: TWOqt7CuS6+Ecd21Q2PyIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="265970683"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Aug 2026 21:16:46 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzRXf-000000008tJ-38aW;
	Thu, 27 Aug 2026 04:16:43 +0000
Date: Thu, 27 Aug 2026 12:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and
 fan control
Message-ID: <202608271258.TPpO3tyX-lkp@intel.com>
References: <20260825184107.355980-2-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825184107.355980-2-speyrott@gmail.com>

Hi Sebastián,

kernel test robot noticed the following build errors:

[auto build test ERROR on 75f2c0b3690702c90863c2e138cb5520670845ea]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebasti-n-Peyrott/hwmon-Add-Minisforum-UM780-XTX-EC-monitoring-and-fan-control/20260825-154107
base:   75f2c0b3690702c90863c2e138cb5520670845ea
patch link:    https://lore.kernel.org/r/20260825184107.355980-2-speyrott%40gmail.com
patch subject: [PATCH v3 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
config: i386-randconfig-141-20260827 (https://download.01.org/0day-ci/archive/20260827/202608271258.TPpO3tyX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271258.TPpO3tyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608271258.TPpO3tyX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_oem_read':
>> drivers/hwmon/minisforum-um780xtx.c:75:(.text+0xa3): undefined reference to `ec_transaction'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_write_profile':
   drivers/hwmon/minisforum-um780xtx.c:141:(.text+0x19a): undefined reference to `ec_transaction'
>> ld: drivers/hwmon/minisforum-um780xtx.c:144:(.text+0x1ad): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_write_sys_point':
>> drivers/hwmon/minisforum-um780xtx.c:336:(.text+0x215): undefined reference to `ec_write'
   ld: drivers/hwmon/minisforum-um780xtx.c:339:(.text+0x223): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_sys_point_temp_store':
>> drivers/hwmon/minisforum-um780xtx.c:192:(.text+0x2ac): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.c:195:(.text+0x2c3): undefined reference to `ec_read'
>> ld: drivers/hwmon/minisforum-um780xtx.c:209:(.text+0x385): undefined reference to `ec_write'
   ld: drivers/hwmon/minisforum-um780xtx.c:213:(.text+0x3ae): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_sys_point_temp_show':
   drivers/hwmon/minisforum-um780xtx.c:168:(.text+0x455): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_probe':
   drivers/hwmon/minisforum-um780xtx.c:431:(.text+0x4e9): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_read_initial_state':
   drivers/hwmon/minisforum-um780xtx.c:375:(.text+0x511): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.c:382:(.text+0x53c): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o:drivers/hwmon/minisforum-um780xtx.c:385: more undefined references to `ec_read' follow
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_restore_state':
   drivers/hwmon/minisforum-um780xtx.c:403:(.text+0x6f9): undefined reference to `ec_transaction'
   ld: drivers/hwmon/minisforum-um780xtx.c:406:(.text+0x712): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.c:412:(.text+0x732): undefined reference to `ec_read'
   ld: drivers/hwmon/minisforum-um780xtx.o: in function `um780xtx_init':
>> drivers/hwmon/minisforum-um780xtx.c:473:(.init.text+0x75): undefined reference to `ec_get_handle'


vim +75 drivers/hwmon/minisforum-um780xtx.c

    72	
    73	static int um780xtx_oem_read(u8 command, u8 *value)
    74	{
  > 75		return ec_transaction(command, NULL, 0, value, 1);
    76	}
    77	
    78	static int um780xtx_read_rpm(u8 command_hi, u8 command_lo, long *rpm)
    79	{
    80		u8 hi_before;
    81		u8 hi_after;
    82		u8 lo;
    83		unsigned int value;
    84		int attempt;
    85		int ret;
    86	
    87		for (attempt = 0; attempt < UM780XTX_EC_RPM_RETRIES; attempt++) {
    88			ret = um780xtx_oem_read(command_hi, &hi_before);
    89			if (ret)
    90				return ret;
    91			ret = um780xtx_oem_read(command_lo, &lo);
    92			if (ret)
    93				return ret;
    94			ret = um780xtx_oem_read(command_hi, &hi_after);
    95			if (ret)
    96				return ret;
    97			if (hi_before != hi_after)
    98				continue;
    99	
   100			value = (hi_after << 8) | lo;
   101			if (value > UM780XTX_EC_MAX_RPM)
   102				continue;
   103	
   104			*rpm = value;
   105			return 0;
   106		}
   107	
   108		return -EIO;
   109	}
   110	
   111	static int um780xtx_read_profile(long *mode)
   112	{
   113		u8 profile;
   114		int ret;
   115	
   116		ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
   117		if (ret)
   118			return ret;
   119		if (profile == UM780XTX_EC_PROFILE_B1) {
   120			*mode = 2;
   121			return 0;
   122		}
   123		if (profile == UM780XTX_EC_PROFILE_B2) {
   124			*mode = 3;
   125			return 0;
   126		}
   127	
   128		return -ENODATA;
   129	}
   130	
   131	static int um780xtx_write_profile(struct um780xtx_data *data, long mode)
   132	{
   133		u8 expected;
   134		u8 profile;
   135		int ret;
   136	
   137		if (mode != 2 && mode != 3)
   138			return -EINVAL;
   139		expected = mode == 2 ? UM780XTX_EC_PROFILE_B1 : UM780XTX_EC_PROFILE_B2;
   140	
   141		ret = ec_transaction(expected, NULL, 0, NULL, 0);
   142		if (ret)
   143			return ret;
 > 144		ret = ec_read(UM780XTX_EC_CPU_PROFILE, &profile);
   145		if (ret)
   146			return ret;
   147		if (profile != expected)
   148			return -EIO;
   149	
   150		data->saved_profile = profile;
   151		return 0;
   152	}
   153	
   154	static const u8 um780xtx_sys_point_offsets[] = {
   155		UM780XTX_EC_SYS_POINT1,
   156		UM780XTX_EC_SYS_POINT2,
   157	};
   158	
   159	static ssize_t um780xtx_sys_point_temp_show(struct device *dev,
   160						    struct device_attribute *attr,
   161						    char *buf)
   162	{
   163		struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
   164		u8 value;
   165		int ret;
   166	
   167		guard(hwmon_lock)(dev);
   168		ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &value);
   169		if (ret)
   170			return ret;
   171	
   172		return sysfs_emit(buf, "%u\n", value * 1000);
   173	}
   174	
   175	static ssize_t um780xtx_sys_point_temp_store(struct device *dev,
   176						     struct device_attribute *attr,
   177						     const char *buf, size_t count)
   178	{
   179		struct um780xtx_data *data = dev_get_drvdata(dev);
   180		struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
   181		u8 points[2];
   182		u8 readback;
   183		long value;
   184		int ret;
   185	
   186		ret = kstrtol(buf, 10, &value);
   187		if (ret)
   188			return ret;
   189	
   190		guard(hwmon_lock)(dev);
   191		/* Validate and clamp against the live peer threshold. */
 > 192		ret = ec_read(UM780XTX_EC_SYS_POINT1, &points[0]);
   193		if (ret)
   194			return ret;
   195		ret = ec_read(UM780XTX_EC_SYS_POINT2, &points[1]);
   196		if (ret)
   197			return ret;
   198		if (points[0] >= points[1] || points[1] >= data->sys_point3)
   199			return -EIO;
   200	
   201		value = DIV_ROUND_CLOSEST(value, 1000);
   202		if (!sattr->index)
   203			value = clamp_val(value, 0, points[1] - 1);
   204		else
   205			value = clamp_val(value, points[0] + 1,
   206					  data->sys_point3 - 1);
   207		points[sattr->index] = value;
   208	
 > 209		ret = ec_write(um780xtx_sys_point_offsets[sattr->index],
   210			       points[sattr->index]);
   211		if (ret)
   212			return ret;
   213		ret = ec_read(um780xtx_sys_point_offsets[sattr->index], &readback);
   214		if (ret)
   215			return ret;
   216		if (readback != points[sattr->index])
   217			return -EIO;
   218	
   219		data->saved_sys_point1 = points[0];
   220		data->saved_sys_point2 = points[1];
   221		return count;
   222	}
   223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
