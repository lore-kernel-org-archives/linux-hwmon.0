Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC68433B6C7;
	Thu, 15 Jan 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480509; cv=none; b=sN6wXhoiV1AuKbbv5Whm7FO7t4hJJHR7W3nZ7ZwmPDIb5DtTLysTaByCQMYcuC4986jOpefa6KbIRw9A9EIhX/Rxl1aU2m/x99FTuzZ1w49i6SbmqMhYmmQMz1ucW8/PbBF6ekAN4JVZ1P0+ig7ruif2EPUl4huxbJSPxE6a0hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480509; c=relaxed/simple;
	bh=iQDh81qHTocbmheSpRuQOg5hT7ISRsk+bLONrdXNclI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUtzpvvQWUy5yRV72ouOYU0Xz+IC1ZttA1fg7V5TRXQ0+Y2OLiWhp8kwVGeckzI/yPit52wXURYCbLegxiU8ARhng2yGzCj8AFZXvb6cfFx6Wi6Bk4K+YPBUOoARhyOl1XEwmajJoFSuZkQFKR0hF5sPaQ1CWRuTlHjFSsfvOM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM2wWo3B; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM2wWo3B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768480507; x=1800016507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iQDh81qHTocbmheSpRuQOg5hT7ISRsk+bLONrdXNclI=;
  b=HM2wWo3BdtGz9edrAQljoRyvch9ILrpwwOk2dN3dmZ4RpqYnj/K9Yt5F
   ypVLRmDB3n/o7W66S3q3zgaEUspdROB2lqpp98csq1kfrMZEKrLxqm8OG
   guO4Es86EyPvgk14Lioc51zL53Tpg2r1BegBnwiwZQc5C5LQslzdzVQqY
   /y+zRBCtCICX0ensuYeCHhe36X05Yum3G5rgd6cvbGmRA+VUmN4wzzHFt
   5DueupgppoqTeyOsAW5WLgkNWe3iw2e18AvKtvMmrIEHgDA+3HLkcU2i3
   BcsUDxzimSQeE1hsVY0aWAEmlMPBlXBjdCuAd8Qo3PstcGtn6KyH65+KX
   g==;
X-CSE-ConnectionGUID: j0ZplWN8SISqkrVpX6lZYQ==
X-CSE-MsgGUID: m73AfHGTR3OMofxB+8KL3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69692180"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69692180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:35:06 -0800
X-CSE-ConnectionGUID: y7SbJBrSS8yjmqLFuIAqrg==
X-CSE-MsgGUID: BABOIsT/S0iCAjHcMcObrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209805656"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 04:35:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgMZ2-00000000HxI-314J;
	Thu, 15 Jan 2026 12:35:00 +0000
Date: Thu, 15 Jan 2026 20:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, linux@roeck-us.net,
	corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com, Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: Re: [PATCH v2 1/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
Message-ID: <202601152046.9FkRF3Hu-lkp@intel.com>
References: <20260115065757.35-1-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115065757.35-1-mayankmahajan.x@nxp.com>

Hi Mayank,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mayank-Mahajan/dt-bindings-hwmon-ti-tmp108-Add-P3T1035-P3T2030/20260115-145945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260115065757.35-1-mayankmahajan.x%40nxp.com
patch subject: [PATCH v2 1/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
config: arm-randconfig-r072-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152046.9FkRF3Hu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152046.9FkRF3Hu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152046.9FkRF3Hu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/tmp108.c: In function 'tmp108_common_probe':
>> drivers/hwmon/tmp108.c:457:52: error: macro "memcpy" passed 6 arguments, but takes just 3
     457 |                        sizeof(tmp108->sample_times));
         |                                                    ^
   In file included from include/linux/string.h:386,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/delay.h:13,
                    from drivers/hwmon/tmp108.c:7:
   include/linux/fortify-string.h:690: note: macro "memcpy" defined here
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         | 
>> drivers/hwmon/tmp108.c:456:17: warning: statement with no effect [-Wunused-value]
     456 |                 memcpy(tmp108->sample_times, (unsigned int[]){ 125, 250, 1000, 4000 },
         |                 ^~~~~~
   drivers/hwmon/tmp108.c:460:52: error: macro "memcpy" passed 6 arguments, but takes just 3
     460 |                        sizeof(tmp108->sample_times));
         |                                                    ^
   In file included from include/linux/string.h:386,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/delay.h:13,
                    from drivers/hwmon/tmp108.c:7:
   include/linux/fortify-string.h:690: note: macro "memcpy" defined here
     690 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         | 
   drivers/hwmon/tmp108.c:459:17: warning: statement with no effect [-Wunused-value]
     459 |                 memcpy(tmp108->sample_times, (unsigned int[]){ 63, 250, 1000, 4000 },
         |                 ^~~~~~


vim +/memcpy +457 drivers/hwmon/tmp108.c

   434	
   435	static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
   436				       enum tmp108_hw_id hw_id)
   437	{
   438		struct device *hwmon_dev;
   439		struct tmp108 *tmp108;
   440		u32 config;
   441		int err;
   442	
   443		err = devm_regulator_get_enable(dev, "vcc");
   444		if (err)
   445			return dev_err_probe(dev, err, "Failed to enable regulator\n");
   446	
   447		tmp108 = devm_kzalloc(dev, sizeof(*tmp108), GFP_KERNEL);
   448		if (!tmp108)
   449			return -ENOMEM;
   450	
   451		dev_set_drvdata(dev, tmp108);
   452		tmp108->regmap = regmap;
   453		tmp108->hw_id = hw_id;
   454		tmp108->config_reg_16bits = (hw_id == P3T1035_ID) ? false : true;
   455		if (hw_id == P3T1035_ID)
 > 456			memcpy(tmp108->sample_times, (unsigned int[]){ 125, 250, 1000, 4000 },
 > 457			       sizeof(tmp108->sample_times));
   458		else
   459			memcpy(tmp108->sample_times, (unsigned int[]){ 63, 250, 1000, 4000 },
   460			       sizeof(tmp108->sample_times));
   461	
   462		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
   463		if (err < 0) {
   464			dev_err_probe(dev, err, "Error reading config register");
   465			return err;
   466		}
   467		tmp108->orig_config = config;
   468	
   469		/* Only continuous mode is supported. */
   470		config &= ~TMP108_CONF_MODE_MASK;
   471		config |= TMP108_MODE_CONTINUOUS;
   472		/* Only comparator mode is supported. */
   473		config &= ~TMP108_CONF_TM;
   474	
   475		err = regmap_write(tmp108->regmap, TMP108_REG_CONF, config);
   476		if (err < 0) {
   477			dev_err_probe(dev, err, "Error writing config register");
   478			return err;
   479		}
   480	
   481		tmp108->ready_time = jiffies;
   482		if ((tmp108->orig_config & TMP108_CONF_MODE_MASK) ==
   483		    TMP108_MODE_SHUTDOWN)
   484			tmp108->ready_time +=
   485				msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
   486	
   487		err = devm_add_action_or_reset(dev, tmp108_restore_config, tmp108);
   488		if (err) {
   489			dev_err_probe(dev, err, "Add action or reset failed");
   490			return err;
   491		}
   492	
   493		hwmon_dev = devm_hwmon_device_register_with_info(dev, name,
   494								 tmp108,
   495								 &tmp108_chip_info,
   496								 NULL);
   497		return PTR_ERR_OR_ZERO(hwmon_dev);
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
