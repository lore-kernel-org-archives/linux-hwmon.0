Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30C57F460
	for <linux-hwmon@vger.kernel.org>; Mon, 18 Nov 2024 03:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731900550; cv=none; b=CLxSt2pqVELmuKpApQoez6LzZJUJ8CAXjmN6PCATYUprbXQuiRbsf0dfzTubtoUk9oTsk+sWc6VgtiG+aog1RHV5U5tU/sZgV8IMiexuA/Z0HOyOqyI1vRL3qiv/fz9+tfCnH2d3FcPRUzyFwqkcKKxaHGlB40zU8YE14DR+5WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731900550; c=relaxed/simple;
	bh=6f1NSIdRd6+/CpUkRF1KlNpyc2ZT9rvP8tGWDkbt/iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=URI7j75VprRmT79hzYbAP1KOZojl3Ln7ZZlVjnP6U2kTAJvhP5GPfL17HIXRZkr9OdhWR/+qz7DkST9zoh0aY3IxTiaUlL4+091UenNzq9j0VnwkaSUcfQ6Xp0cTI6ncRAAl9WvDHI/N2xJHczH/IkrHDi5N7oyeYmUmEiXIXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsR+ips3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsR+ips3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731900548; x=1763436548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6f1NSIdRd6+/CpUkRF1KlNpyc2ZT9rvP8tGWDkbt/iQ=;
  b=MsR+ips3kYci03ChBTrlUJipFBEvJnh36LkILSQiJI0TZDpVyLHqBQxp
   Uu4EnmOEO/waaDMw/68ILqyhiInlrcGj22GShPjm9wv7S35N8twVGPVje
   cM8817Sx3XUiqNq/4C5KD0555NjDchgPDZ43q51bb4TdBsTYgU7qGzATz
   AZKVevokNz1wU2AMEcDv5Tg9gGw1x/9+tfC1SWKXmw69qq1Gpl4N7XwMW
   U2rjOLFVi6vc/KSnffL75E1Qv6j5CHG+PzxgeqmIubdFLNLx7L7NSlFqx
   gEMRgT7BfC19kNHnaEaOHqGZ+/tFPUBfQZXnL2HFucEWuNQOsXBEObdle
   A==;
X-CSE-ConnectionGUID: r7CiySOSQqSCGupV9ONOyQ==
X-CSE-MsgGUID: li2+YkqlTxSZFzQuvzSeVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43225860"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="43225860"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 19:29:08 -0800
X-CSE-ConnectionGUID: FxhtnAjHQf6gmtlUUtMNwA==
X-CSE-MsgGUID: ZdO4lhc+SRuIajzlqA6lLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93173607"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Nov 2024 19:29:06 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCsRj-0002FZ-2K;
	Mon, 18 Nov 2024 03:29:03 +0000
Date: Mon, 18 Nov 2024 11:29:01 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:hwmon-staging 70/86] include/linux/i2c_spi.h:34:23:
 error: implicit declaration of function 'i2c_add_driver'
Message-ID: <202411181128.dvbT1ThQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-staging
head:   777e5239066dfc6a3e170ec937370aa35faffdb3
commit: 11f8d85dc8f0dd5d13fedcd58af9f014cd3e77db [70/86] Revert "i2c: Dummy functions for i2c_register_driver and i2c_del_driver"
config: i386-randconfig-013-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181128.dvbT1ThQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411181128.dvbT1ThQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181128.dvbT1ThQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hwmon/ltc2947.c:14:
   include/linux/i2c_spi.h: In function 'i2c_spi_driver_register':
>> include/linux/i2c_spi.h:34:23: error: implicit declaration of function 'i2c_add_driver' [-Werror=implicit-function-declaration]
      34 |                 ret = i2c_add_driver(i2cdrv);
         |                       ^~~~~~~~~~~~~~
>> include/linux/i2c_spi.h:40:17: error: implicit declaration of function 'i2c_del_driver' [-Werror=implicit-function-declaration]
      40 |                 i2c_del_driver(i2cdrv);
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i2c_add_driver +34 include/linux/i2c_spi.h

e29c31c78716c5 Guenter Roeck 2024-11-14  14  
e29c31c78716c5 Guenter Roeck 2024-11-14  15  /**
e29c31c78716c5 Guenter Roeck 2024-11-14  16   * i2c_spi_driver_register() - Register an I2C and a SPI driver
e29c31c78716c5 Guenter Roeck 2024-11-14  17   * @i2cdrv: the I2C driver to register
e29c31c78716c5 Guenter Roeck 2024-11-14  18   * @spidrv: the SPI driver to register
e29c31c78716c5 Guenter Roeck 2024-11-14  19   *
e29c31c78716c5 Guenter Roeck 2024-11-14  20   * This function registers both @i2cdev and @spidev, and fails if one of these
e29c31c78716c5 Guenter Roeck 2024-11-14  21   * registrations fails. This is mainly useful for devices that support both I2C
e29c31c78716c5 Guenter Roeck 2024-11-14  22   * and SPI modes.
e29c31c78716c5 Guenter Roeck 2024-11-14  23   * Note that the function only registers drivers for the enabled protocol(s).
e29c31c78716c5 Guenter Roeck 2024-11-14  24   * If neither I2C nor SPI are enabled, it does nothing.
e29c31c78716c5 Guenter Roeck 2024-11-14  25   *
e29c31c78716c5 Guenter Roeck 2024-11-14  26   * Return: 0 if enabled registrations succeeded, a negative error code otherwise.
e29c31c78716c5 Guenter Roeck 2024-11-14  27   */
e29c31c78716c5 Guenter Roeck 2024-11-14  28  static inline int i2c_spi_driver_register(struct i2c_driver *i2cdrv,
e29c31c78716c5 Guenter Roeck 2024-11-14  29  					  struct spi_driver *spidrv)
e29c31c78716c5 Guenter Roeck 2024-11-14  30  {
e29c31c78716c5 Guenter Roeck 2024-11-14  31  	int ret = 0;
e29c31c78716c5 Guenter Roeck 2024-11-14  32  
e29c31c78716c5 Guenter Roeck 2024-11-14  33  	if (IS_ENABLED(CONFIG_I2C))
e29c31c78716c5 Guenter Roeck 2024-11-14 @34  		ret = i2c_add_driver(i2cdrv);
e29c31c78716c5 Guenter Roeck 2024-11-14  35  	if (ret || !IS_ENABLED(CONFIG_SPI))
e29c31c78716c5 Guenter Roeck 2024-11-14  36  		return ret;
e29c31c78716c5 Guenter Roeck 2024-11-14  37  
e29c31c78716c5 Guenter Roeck 2024-11-14  38  	ret = spi_register_driver(spidrv);
e29c31c78716c5 Guenter Roeck 2024-11-14  39  	if (ret && IS_ENABLED(CONFIG_I2C))
e29c31c78716c5 Guenter Roeck 2024-11-14 @40  		i2c_del_driver(i2cdrv);
e29c31c78716c5 Guenter Roeck 2024-11-14  41  
e29c31c78716c5 Guenter Roeck 2024-11-14  42  	return ret;
e29c31c78716c5 Guenter Roeck 2024-11-14  43  }
e29c31c78716c5 Guenter Roeck 2024-11-14  44  

:::::: The code at line 34 was first introduced by commit
:::::: e29c31c78716c57e9779ad846255ff0012e058fa Add infrastructure for supporting both I2C and SPI in single driver

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
