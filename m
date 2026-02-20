Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807723AB8D;
	Fri, 20 Feb 2026 01:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771552493; cv=none; b=kuZTiWHWyLvb9czkvnMFvhHC4bjqlJXrWS3ubjBGjRbcMcikCosemsPT0tSMQVK5RfAQCzKKL/7eLltLarapONxIOg1j4uROQx6AJek7NpfiWzSVVY2as6MksxxeWNze8FLfHT6XJgmTsWde+yNOzMy/+Nr8SamhFfg9NfnbwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771552493; c=relaxed/simple;
	bh=amj2/r37tEQ+KwUHgqjeGVevgv1Vv4eiGifbH6nzByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJGoY4k1/W232FsHigT7focKZ0qMLUQ5qW7OBtscyvdAODPT2h4MghXl1ikKI5es0aMqy+ofUyngRV1ssPX89pENRDjEqMsOuH8hruEebqxTge/tg5qIcJjYaEZ1QNtCYUT6O6b4UWwVoL9G+gQtVXIg2vbHMBAE3CHKFhgjNlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc8KHx1O; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc8KHx1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771552490; x=1803088490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=amj2/r37tEQ+KwUHgqjeGVevgv1Vv4eiGifbH6nzByA=;
  b=Hc8KHx1O1ylYpvwGaO3ZfOt/UE9Hiapi+7YYHoGTHsAxtySyXGWjOwhu
   zr1eASdwvbObXsjAPJSqnic41OJxImACuw0fqsO5yI4yXl2xZpgIhE5NE
   1K+W1Uw4un+ilO2690sPMugktNMzBkGjN12xMm0ASJcV9t8cRqePhNrLN
   N+nAgwZuJZ8qxK2ETRdWHGiji6SU0Q5U/IaRZxN7Lb0g2I/QBRoz2hfMJ
   n1HGjnip/7Y5U1Ty6XzIRv/JHvjQ84Q/fNfZfIbh2fh+sxofrAAy12kYy
   iu1ae2oDVmm1WNNEztKi5cJeQuw7+NakPAilQnVotzmsn1YS2fUQlxUUD
   w==;
X-CSE-ConnectionGUID: lli2rmFcSHCDHUOr5YdYiA==
X-CSE-MsgGUID: C5UhKLkqTR2ybGbJ9PGyCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72826484"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="72826484"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 17:54:49 -0800
X-CSE-ConnectionGUID: IlQDyiYzS32viGzyeTeczg==
X-CSE-MsgGUID: n7RmtbGaQ4+m1lzx+4SGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="214733473"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 19 Feb 2026 17:54:47 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtFj9-0000000046z-2yB1;
	Fri, 20 Feb 2026 01:54:43 +0000
Date: Fri, 20 Feb 2026 02:54:42 +0100
From: kernel test robot <lkp@intel.com>
To: Ian Ray <ian.ray@gehealthcare.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ian Ray <ian.ray@gehealthcare.com>,
	Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
	=?utf-8?B?VG9tYcW+?= Zaman <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V2 2/3] hwmon: (ina2xx) Make it easier to add more devices
Message-ID: <202602200201.hafkm9wo-lkp@intel.com>
References: <20260219130127.87901-3-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219130127.87901-3-ian.ray@gehealthcare.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next linus/master v6.19 next-20260219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Ray/dt-bindings-hwmon-ti-ina2xx-Add-INA234-device/20260219-210940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260219130127.87901-3-ian.ray%40gehealthcare.com
patch subject: [PATCH V2 2/3] hwmon: (ina2xx) Make it easier to add more devices
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260220/202602200201.hafkm9wo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200201.hafkm9wo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200201.hafkm9wo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/ina2xx.c: In function 'ina2xx_is_visible':
>> drivers/hwmon/ina2xx.c:722:25: warning: unused variable 'chip' [-Wunused-variable]
     722 |         enum ina2xx_ids chip = data->chip;
         |                         ^~~~


vim +/chip +722 drivers/hwmon/ina2xx.c

5a56a39be7ffb4 Alex Qiu      2020-05-04  714  
814db9f1b8ec1c Guenter Roeck 2024-07-24  715  static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type,
814db9f1b8ec1c Guenter Roeck 2024-07-24  716  				 u32 attr, int channel)
814db9f1b8ec1c Guenter Roeck 2024-07-24  717  {
814db9f1b8ec1c Guenter Roeck 2024-07-24  718  	const struct ina2xx_data *data = _data;
de0da6ae1908b4 Guenter Roeck 2024-08-27  719  	bool has_alerts = data->config->has_alerts;
52172ad87a22ed Wenliang Yan  2024-11-06  720  	bool has_power_average = data->config->has_power_average;
0337abb760db03 Ian Ray       2026-02-19  721  	bool has_update_interval = data->config->has_update_interval;
814db9f1b8ec1c Guenter Roeck 2024-07-24 @722  	enum ina2xx_ids chip = data->chip;
814db9f1b8ec1c Guenter Roeck 2024-07-24  723  
814db9f1b8ec1c Guenter Roeck 2024-07-24  724  	switch (type) {
814db9f1b8ec1c Guenter Roeck 2024-07-24  725  	case hwmon_in:
814db9f1b8ec1c Guenter Roeck 2024-07-24  726  		switch (attr) {
814db9f1b8ec1c Guenter Roeck 2024-07-24  727  		case hwmon_in_input:
814db9f1b8ec1c Guenter Roeck 2024-07-24  728  			return 0444;
814db9f1b8ec1c Guenter Roeck 2024-07-24  729  		case hwmon_in_lcrit:
814db9f1b8ec1c Guenter Roeck 2024-07-24  730  		case hwmon_in_crit:
de0da6ae1908b4 Guenter Roeck 2024-08-27  731  			if (has_alerts)
814db9f1b8ec1c Guenter Roeck 2024-07-24  732  				return 0644;
814db9f1b8ec1c Guenter Roeck 2024-07-24  733  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  734  		case hwmon_in_lcrit_alarm:
814db9f1b8ec1c Guenter Roeck 2024-07-24  735  		case hwmon_in_crit_alarm:
de0da6ae1908b4 Guenter Roeck 2024-08-27  736  			if (has_alerts)
814db9f1b8ec1c Guenter Roeck 2024-07-24  737  				return 0444;
814db9f1b8ec1c Guenter Roeck 2024-07-24  738  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  739  		default:
814db9f1b8ec1c Guenter Roeck 2024-07-24  740  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  741  		}
814db9f1b8ec1c Guenter Roeck 2024-07-24  742  		break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  743  	case hwmon_curr:
814db9f1b8ec1c Guenter Roeck 2024-07-24  744  		switch (attr) {
814db9f1b8ec1c Guenter Roeck 2024-07-24  745  		case hwmon_curr_input:
814db9f1b8ec1c Guenter Roeck 2024-07-24  746  			return 0444;
4d5c2d986757e4 Guenter Roeck 2024-08-28  747  		case hwmon_curr_lcrit:
4d5c2d986757e4 Guenter Roeck 2024-08-28  748  		case hwmon_curr_crit:
de0da6ae1908b4 Guenter Roeck 2024-08-27  749  			if (has_alerts)
4d5c2d986757e4 Guenter Roeck 2024-08-28  750  				return 0644;
4d5c2d986757e4 Guenter Roeck 2024-08-28  751  			break;
4d5c2d986757e4 Guenter Roeck 2024-08-28  752  		case hwmon_curr_lcrit_alarm:
4d5c2d986757e4 Guenter Roeck 2024-08-28  753  		case hwmon_curr_crit_alarm:
de0da6ae1908b4 Guenter Roeck 2024-08-27  754  			if (has_alerts)
4d5c2d986757e4 Guenter Roeck 2024-08-28  755  				return 0444;
4d5c2d986757e4 Guenter Roeck 2024-08-28  756  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  757  		default:
814db9f1b8ec1c Guenter Roeck 2024-07-24  758  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  759  		}
814db9f1b8ec1c Guenter Roeck 2024-07-24  760  		break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  761  	case hwmon_power:
814db9f1b8ec1c Guenter Roeck 2024-07-24  762  		switch (attr) {
814db9f1b8ec1c Guenter Roeck 2024-07-24  763  		case hwmon_power_input:
814db9f1b8ec1c Guenter Roeck 2024-07-24  764  			return 0444;
814db9f1b8ec1c Guenter Roeck 2024-07-24  765  		case hwmon_power_crit:
de0da6ae1908b4 Guenter Roeck 2024-08-27  766  			if (has_alerts)
814db9f1b8ec1c Guenter Roeck 2024-07-24  767  				return 0644;
814db9f1b8ec1c Guenter Roeck 2024-07-24  768  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  769  		case hwmon_power_crit_alarm:
de0da6ae1908b4 Guenter Roeck 2024-08-27  770  			if (has_alerts)
814db9f1b8ec1c Guenter Roeck 2024-07-24  771  				return 0444;
814db9f1b8ec1c Guenter Roeck 2024-07-24  772  			break;
52172ad87a22ed Wenliang Yan  2024-11-06  773  		case hwmon_power_average:
52172ad87a22ed Wenliang Yan  2024-11-06  774  			if (has_power_average)
52172ad87a22ed Wenliang Yan  2024-11-06  775  				return 0444;
52172ad87a22ed Wenliang Yan  2024-11-06  776  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  777  		default:
814db9f1b8ec1c Guenter Roeck 2024-07-24  778  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  779  		}
814db9f1b8ec1c Guenter Roeck 2024-07-24  780  		break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  781  	case hwmon_chip:
814db9f1b8ec1c Guenter Roeck 2024-07-24  782  		switch (attr) {
814db9f1b8ec1c Guenter Roeck 2024-07-24  783  		case hwmon_chip_update_interval:
0337abb760db03 Ian Ray       2026-02-19  784  			if (has_update_interval)
814db9f1b8ec1c Guenter Roeck 2024-07-24  785  				return 0644;
814db9f1b8ec1c Guenter Roeck 2024-07-24  786  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  787  		default:
814db9f1b8ec1c Guenter Roeck 2024-07-24  788  			break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  789  		}
814db9f1b8ec1c Guenter Roeck 2024-07-24  790  		break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  791  	default:
814db9f1b8ec1c Guenter Roeck 2024-07-24  792  		break;
814db9f1b8ec1c Guenter Roeck 2024-07-24  793  	}
814db9f1b8ec1c Guenter Roeck 2024-07-24  794  	return 0;
814db9f1b8ec1c Guenter Roeck 2024-07-24  795  }
814db9f1b8ec1c Guenter Roeck 2024-07-24  796  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
