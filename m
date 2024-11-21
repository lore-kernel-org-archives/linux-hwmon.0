Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C11D0E11
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732191777; cv=none; b=YbAlhRBxJUhH+QGaJlX0JOyz9K4XQc+aybmg92xmLQibNZZ7N8EjSWkNDZ6LKKZlSWeSonsbtIL12e/dYY7RCuDhCk9SbrWu1//8ET1QstARjXA6rRDbFxu2CRDvCFcL20W29y6AcJwLupCyZt5Jr5FVftjMU3VujCykvBQX3YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732191777; c=relaxed/simple;
	bh=actMK6DFw01vWPIz59e4lkZSbx45mYCouqbDhLkeUAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdI1yrwc2CKaaRzKVAY2HCbUO/8cbOfyLA9+sUljBiiXBpjVJV1VyldFDjlFwWFMJ++VOopQQIcDfPYCXZKuZVwCjwi7tSQ6seUGgGGg1XH65NtZv+m4Bdq7677ifAZnP87QY81nwprAzzYn4EW37OawCpRAL26fQxFTT3YQb0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ou21jecH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ou21jecH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732191775; x=1763727775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=actMK6DFw01vWPIz59e4lkZSbx45mYCouqbDhLkeUAE=;
  b=Ou21jecHLmNPgmHrLaQYXZpOYWztrRENpW1p+K47tCwbWzV0fIuNlBAw
   I8pPoNzEI2Cn6yyLPqAOkF7DnstA5+deZb9VkteeI5tDAtzL7sRFMkOJA
   3g84SzDNh3RhF5SE+t5pwe15npbnIRY3tWZlAqm/key/bkVagBFKDptk4
   8GO/bGwJKWBun2wCFHC4Qi/DTcGjRk+BZW8q8A4queSc8tyO9lAf8ocf/
   zlfO++2JB3lxXfmv6KbcCgdaGKsQCbKZBHtqHlmXyVdTPtWviubIYGGR1
   G5cp5qqEfgpUT21CFiUOJpIrTSKEX27di+43Eob0GjihKf6xyzUdM0U6w
   w==;
X-CSE-ConnectionGUID: oYQ41fkZQ7GS6BsML7cMSA==
X-CSE-MsgGUID: Ww8caDpvQAaGqx5mNxYjSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="49825710"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="49825710"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 04:22:54 -0800
X-CSE-ConnectionGUID: qsYENnK6RZmjwzTuKa+hAQ==
X-CSE-MsgGUID: yHibpBhESVOKeQSNlwLUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="94689576"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2024 04:22:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE6Cw-0002xX-2Q;
	Thu, 21 Nov 2024 12:22:50 +0000
Date: Thu, 21 Nov 2024 20:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 1/42] drivers/hwmon/hwmon.c:432:84: error:
 pointer type mismatch in conditional expression
Message-ID: <202411212020.XoC2kJ47-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   b731b2c24d88f6782fdf6e1c19d735cd5aadeb3b
commit: 2c67fcdff546bc261761a3d66aa165a627b71458 [1/42] hwmon: Introduce 64-bit energy attribute support
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241121/202411212020.XoC2kJ47-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411212020.XoC2kJ47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411212020.XoC2kJ47-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/hwmon.c: In function 'hwmon_attr_show':
>> drivers/hwmon/hwmon.c:432:84: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
     432 |                                hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
         |                                                                                    ^
   drivers/hwmon/hwmon.c:432:64: note: first expression has type 'long long int *'
     432 |                                hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
         |                                                                ^~~~~~~~~~~~~~~~~~~
   drivers/hwmon/hwmon.c:432:86: note: second expression has type 'long int *'
     432 |                                hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
         |                                                                                      ^~~~


vim +432 drivers/hwmon/hwmon.c

   422	
   423	static ssize_t hwmon_attr_show(struct device *dev,
   424				       struct device_attribute *devattr, char *buf)
   425	{
   426		struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
   427		s64 val64;
   428		long val;
   429		int ret;
   430	
   431		ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
 > 432				       hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
   433		if (ret < 0)
   434			return ret;
   435	
   436		if (hattr->type != hwmon_energy64)
   437			val64 = val;
   438	
   439		trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
   440				      hattr->name, val64);
   441	
   442		return sprintf(buf, "%lld\n", val64);
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
