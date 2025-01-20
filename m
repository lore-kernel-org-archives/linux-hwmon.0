Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43C183CCA;
	Mon, 20 Jan 2025 21:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737406907; cv=none; b=ZV9p8mIqruFicKhAOXGPIOot1oJzWEhfCVAjnBBechYqPGC5Nrb7a052GQHDJ+twio7exDPxW/Fx2YKpUwRYRcR0jOt1GFLtM9OfhzsfTdBgFMobF0uSQEhNyDjYE1gLqWCTq2rBiIlQ4V0p6dGgoYXnmnEmysR0tYot4ca6HYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737406907; c=relaxed/simple;
	bh=mYx9PowizUe6AUc9WkWGGBPPogF5dyCKAVEcWaen7ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b43YUuZXvB4tdPGCJcV3R0Qn6TswY06db9NHoMq4hz3bo7wAcXtG0N3JIvnbWINgXNGWYydYtBF7Ltyb3OTrjCJBF7MQZRhiIVmHAP5GW174FTX1BQQXPOTWEXa1FUzgvCKqw/v6aY0uuwmwfPk5URO6DZIGjFm/QFH+pm2/tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZGYYvM0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZGYYvM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737406905; x=1768942905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mYx9PowizUe6AUc9WkWGGBPPogF5dyCKAVEcWaen7ow=;
  b=AZGYYvM01I0VxlfDiZg0RkSZ1DF3cbDMrwL7HYRxncUuTg+gZwq2bHXu
   amLIM2HrB9UaiMzaoxX7bC80T/cZ/YTc4FCx4d8NRoAoFOtSSOjHpYl64
   ime/AiJ1dpOg84bXLYcAUC1riQcvXfDT7SFFuugnSR9+T7oGVEhNF0eOo
   DdKFEifqouRvOrH2UhcKzv3hFP5iKv1QIk62TUGt4fJLTgnQjEI8F4n5Z
   /iGasI1YhyqPbUvH3V+5YZ2lUaB4IY8fDr8wJAUIGk5tijHV3j6jr6fiN
   VsZIjsRbnbYn6QvdwegQRRPP/TFsx7ERpM7octn1qx8iF3jRtVo6w9ZDl
   g==;
X-CSE-ConnectionGUID: QeEeD9ByRDSNxGz7+DYiQg==
X-CSE-MsgGUID: r0YeLVuySQWo281CApBnsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="60281785"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="60281785"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 13:01:45 -0800
X-CSE-ConnectionGUID: 2njZeAm/Se+IMzv369sJjw==
X-CSE-MsgGUID: xHlAzPl8Q7WTXhEMsEB0Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106637988"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jan 2025 13:01:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZytw-000Wy3-12;
	Mon, 20 Jan 2025 21:01:40 +0000
Date: Tue, 21 Jan 2025 05:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Potin Lai <potin.lai.pt@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Patrick Williams <patrick@stwcx.xyz>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
Message-ID: <202501210454.YUnMEUaA-lkp@intel.com>
References: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>

Hi Potin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fc033cf25e612e840e545f8d5ad2edd6ba613ed5]

url:    https://github.com/intel-lab-lkp/linux/commits/Potin-Lai/hwmon-ina238-Add-support-for-shunt-voltage-scaling/20250121-002826
base:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
patch link:    https://lore.kernel.org/r/20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5%40gmail.com
patch subject: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
config: i386-buildonly-randconfig-004-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210454.YUnMEUaA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501210454.YUnMEUaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210454.YUnMEUaA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/ina238.c: In function 'shunt_volt_scale_show':
>> drivers/hwmon/ina238.c:120:31: warning: format '%d' expects argument of type 'int', but argument 3 has type 'long int' [-Wformat=]
     120 |         return sprintf(buf, "%d\n", data->shunt_volt_scale);
         |                              ~^     ~~~~~~~~~~~~~~~~~~~~~~
         |                               |         |
         |                               int       long int
         |                              %ld


vim +120 drivers/hwmon/ina238.c

   114	
   115	static ssize_t shunt_volt_scale_show(struct device *dev,
   116					     struct device_attribute *attr, char *buf)
   117	{
   118		struct ina238_data *data = dev_get_drvdata(dev);
   119	
 > 120		return sprintf(buf, "%d\n", data->shunt_volt_scale);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
