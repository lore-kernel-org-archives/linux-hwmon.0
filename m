Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB31A9F8D;
	Fri, 20 Feb 2026 01:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771550039; cv=none; b=JnYlADoW7oARvdOkjn676ku4Ccgy+nvgZcj46leuRR9BxlRpi2buN83dookCeToPD+j90Qb1mhOSYdA0QH2OwJQuKTzXwjL70QOkpov0NAlTpNCp2SnAWO1YgQXjqUFLgLQRxHqbpZWWCztdDKKZta4QOU4CFdifOn0Ohs7hkmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771550039; c=relaxed/simple;
	bh=Uq4XQS8dU09FtCJ8bnNQfMf26F15Ik2f8EpY3Wa09Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaVx8OozlTLBZ3qMOBTy1FmVX2Rrh+vmqFVmH7o7ZD3WXcZ7doP8nPQPH88uEWarVew6U0SWvoYka0fJ7D40vpgBPbiGcKNI+/M2k//8d4GoF5N40myG7mjWElWQdyMgX+Ad3h3PRI1JLLou4OeEP5xzCFFhnuDa7UWSUl7o2kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKxlCoqP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKxlCoqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771550037; x=1803086037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uq4XQS8dU09FtCJ8bnNQfMf26F15Ik2f8EpY3Wa09Z4=;
  b=aKxlCoqPGXf/3phYGN1QPCuPTw6ruL25fb8JK+MAVQxk/FkED4B0ZJrs
   m5zujorxP4BPTTNdzALj05FwSv/i87c6glQAHpC7D1LmiBvqIOwr3adq2
   h/CtoHT8LKPoNqpMWyqVdDOoLsneXyKshC4d+K2D4p28Sgm0Nv2JZ/iCa
   RDYmbMYHbOwdRy9hLC37hDZhTahl/T8/IvrnY0Qj2sEAGATdfXUBEuCJR
   ocXpjjyvawINBVs2VL5mTZvYgmZOpFVdW9tv8ancLcUQHC47hHGXh6qfC
   MJMU1NyKJKwG048XbyeApcm5S+7ZWeimmXdBKcvPCFHV5ZNmh0PuA4TVB
   w==;
X-CSE-ConnectionGUID: ruhqB8fiTUix7SjLiwD/qw==
X-CSE-MsgGUID: EubmqbdgS2mJGgauFF8fTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="90232786"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="90232786"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 17:13:57 -0800
X-CSE-ConnectionGUID: Hh94V0sQRrSdFC5OGfN1hA==
X-CSE-MsgGUID: HZApc8IJQdqIOVtNmEtqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; 
   d="scan'208";a="213939680"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Feb 2026 17:13:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtF5b-000000013gW-1zU3;
	Fri, 20 Feb 2026 01:13:51 +0000
Date: Fri, 20 Feb 2026 09:13:12 +0800
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
Message-ID: <202602200951.bP8YVa4Y-lkp@intel.com>
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
config: x86_64-randconfig-014-20260219 (https://download.01.org/0day-ci/archive/20260220/202602200951.bP8YVa4Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200951.bP8YVa4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200951.bP8YVa4Y-lkp@intel.com/

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
