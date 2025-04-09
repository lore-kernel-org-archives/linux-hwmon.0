Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBB8282FA
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Apr 2025 02:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744164695; cv=none; b=PEql0yqFyr2o1OpQw7BH2tFw4EYU9vWjRkpfPc40AqBIDdcW/lo2MtSWtdPa9TXbKIaOA/nBNkYOHqbY4brNrD5/HrEH6o/6QSJNRtbawkulKDzQhoIMoyPXKicsxTyjPeBirKcKnM2BgpbpHuGE+00fMRp71IYbEMwSJQzs4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744164695; c=relaxed/simple;
	bh=L2eVHkfCLc1/A4tul3Dfz6ru9KwKZpj+eTP/WKi8yYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vEzEYqfbLkTKfxy7KjKZeB7SrXWDJy5blFnFFTOfx1uH1SVGIXFvNQKFjm5XsPYw06B8cQLFF/H2QGgi5iue4aY8601c3rlvsaJqoFhKpaBagRn97lifwaTj+mw1/X3s6iwEDU0VY22eT2zkAuSqDbnG2oQdg/S0gA9Of0DYI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HljgzyEy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HljgzyEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744164693; x=1775700693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2eVHkfCLc1/A4tul3Dfz6ru9KwKZpj+eTP/WKi8yYM=;
  b=HljgzyEyEelUA/wA1S0NObtW2N1Zrm02rYXf4TeuUeULv08ZVBrPogUe
   V+V1iohYnoEACikTTSCLgvsml5xxL0wBPUw28y0Mao9WjlzX4OPqmVEda
   yFmJYp8T5BuNZc02Za+YlsRjMXiku/zKdYesEZba4LJ9LI+0nb1RAht+1
   DhbGx7t1icCYl6vND+McmQzuPFUx8lozqTFFeDRD4EEUOgjXbu/1IRqVf
   m4qOhQVNHtZuWj5MZfUDYqAT3hC3/6ht26Cs5cU/WMUydHrcftfRQK98J
   ml8MLhvFMH/IpdCMI/rX4s2H3krNb0b1vScZEesQHarx8ssbjbYw3RUUC
   A==;
X-CSE-ConnectionGUID: NNR4hzKhRp+XgCzKJ4x+GA==
X-CSE-MsgGUID: o8XejGTBRj+zqXoZwbU20Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56992183"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="56992183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 19:11:33 -0700
X-CSE-ConnectionGUID: ZHjEc6voQ16MhtrZxIMSBQ==
X-CSE-MsgGUID: Zx/82DlzRN+WaYtWREC4Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128298423"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 19:11:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2KuX-0008BG-04;
	Wed, 09 Apr 2025 02:11:29 +0000
Date: Wed, 9 Apr 2025 10:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 13/13] drivers/hwmon/gpio-fan.c:250:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202504091047.biuX8Kl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   d6b1492c9c2e7f2659b63a165ea45ab556c0df0c
commit: d6b1492c9c2e7f2659b63a165ea45ab556c0df0c [13/13] hwmon: (gpio-fan) Add regulator support
config: riscv-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091047.biuX8Kl2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091047.biuX8Kl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091047.biuX8Kl2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     250 |         if (val == 0)
         |             ^~~~~~~~
   drivers/hwmon/gpio-fan.c:255:9: note: uninitialized use occurs here
     255 |         return ret ? ret : count;
         |                ^~~
   drivers/hwmon/gpio-fan.c:250:2: note: remove the 'if' if its condition is always true
     250 |         if (val == 0)
         |         ^~~~~~~~~~~~~
     251 |                 ret = set_fan_speed(fan_data, fan_data->num_speed - 1);
   drivers/hwmon/gpio-fan.c:237:9: note: initialize the variable 'ret' to silence this warning
     237 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +250 drivers/hwmon/gpio-fan.c

d6fe1360f42e86 Simon Guinot       2010-10-22  230  
c490c63e9505a3 Julia Lawall       2016-12-22  231  static ssize_t pwm1_enable_store(struct device *dev,
c490c63e9505a3 Julia Lawall       2016-12-22  232  				 struct device_attribute *attr,
d6fe1360f42e86 Simon Guinot       2010-10-22  233  				 const char *buf, size_t count)
d6fe1360f42e86 Simon Guinot       2010-10-22  234  {
d6fe1360f42e86 Simon Guinot       2010-10-22  235  	struct gpio_fan_data *fan_data = dev_get_drvdata(dev);
d6fe1360f42e86 Simon Guinot       2010-10-22  236  	unsigned long val;
d6b1492c9c2e7f Alexander Stein    2025-04-08  237  	int ret;
d6fe1360f42e86 Simon Guinot       2010-10-22  238  
179c4fdb565dd2 Frans Meulenbroeks 2012-01-04  239  	if (kstrtoul(buf, 10, &val) || val > 1)
d6fe1360f42e86 Simon Guinot       2010-10-22  240  		return -EINVAL;
d6fe1360f42e86 Simon Guinot       2010-10-22  241  
d6fe1360f42e86 Simon Guinot       2010-10-22  242  	if (fan_data->pwm_enable == val)
d6fe1360f42e86 Simon Guinot       2010-10-22  243  		return count;
d6fe1360f42e86 Simon Guinot       2010-10-22  244  
d6fe1360f42e86 Simon Guinot       2010-10-22  245  	mutex_lock(&fan_data->lock);
d6fe1360f42e86 Simon Guinot       2010-10-22  246  
d6fe1360f42e86 Simon Guinot       2010-10-22  247  	fan_data->pwm_enable = val;
d6fe1360f42e86 Simon Guinot       2010-10-22  248  
d6fe1360f42e86 Simon Guinot       2010-10-22  249  	/* Disable manual control mode: set fan at full speed. */
d6fe1360f42e86 Simon Guinot       2010-10-22 @250  	if (val == 0)
d6b1492c9c2e7f Alexander Stein    2025-04-08  251  		ret = set_fan_speed(fan_data, fan_data->num_speed - 1);
d6fe1360f42e86 Simon Guinot       2010-10-22  252  
d6fe1360f42e86 Simon Guinot       2010-10-22  253  	mutex_unlock(&fan_data->lock);
d6fe1360f42e86 Simon Guinot       2010-10-22  254  
d6b1492c9c2e7f Alexander Stein    2025-04-08  255  	return ret ? ret : count;
d6fe1360f42e86 Simon Guinot       2010-10-22  256  }
d6fe1360f42e86 Simon Guinot       2010-10-22  257  

:::::: The code at line 250 was first introduced by commit
:::::: d6fe1360f42e86262153927986dea6502daff703 hwmon: add generic GPIO fan driver

:::::: TO: Simon Guinot <sguinot@lacie.com>
:::::: CC: Guenter Roeck <guenter.roeck@ericsson.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
