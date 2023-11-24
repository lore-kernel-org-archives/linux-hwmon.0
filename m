Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJk7n/+f"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA68D1990;
	Fri, 24 Nov 2023 15:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700869203; x=1732405203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BBPN3UdJMvFNoexMmj/RYUS6v8k8qPrmPLFVGwaOepI=;
  b=UJk7n/+f5b+UTAUf2I/XlwEN2dUoBSinbIEBrxCI2e/cxO3wPuvk2Erx
   arhXGtMQ0s9sXKbuFEGtp/bmX9khVPuuado/PC6/WqoEmS3w5IOTBzOG1
   B9Psm0XgNeilbLhhOuBVgJ4Wsc6UFzonLp6GDMgx/Nf1+7U72WBXLLrww
   FQnOSKG+vYQS1gLxcBC6hCipkzLaNrZU5LR5HyUE9p5UzznHKf+iESkxZ
   ZReLv4X60bIn3vJ5zuzjrzDFHi+0w8Gzzh9kDMrIQx6R2LLOH5MelmLkN
   /UPKijKvkgcY/9KEhimaQ1AExec3Y2Y9UBJyjQYrkLza4howUxI4by6hw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="396383137"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="396383137"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 15:40:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1015007948"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1015007948"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 15:39:59 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6fm9-0003OE-10;
	Fri, 24 Nov 2023 23:39:57 +0000
Date: Sat, 25 Nov 2023 07:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <202311250548.lUn3bm1A-lkp@intel.com>
References: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/hwmon-ltc4282-add-support-for-the-LTC4282-chip/20231124-231842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231124-ltc4282-support-v2-2-952bf926f83c%40analog.com
patch subject: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
config: x86_64-randconfig-161-20231125 (https://download.01.org/0day-ci/archive/20231125/202311250548.lUn3bm1A-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311250548.lUn3bm1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250548.lUn3bm1A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/ltc4282.c:347:6: warning: no previous prototype for 'ltc4282_round_rate' [-Wmissing-prototypes]
     347 | long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
         |      ^~~~~~~~~~~~~~~~~~
>> drivers/hwmon/ltc4282.c:356:15: warning: no previous prototype for 'ltc4282_recalc_rate' [-Wmissing-prototypes]
     356 | unsigned long ltc4282_recalc_rate(struct clk_hw *hw, unsigned long parent)
         |               ^~~~~~~~~~~~~~~~~~~


vim +/ltc4282_round_rate +347 drivers/hwmon/ltc4282.c

   346	
 > 347	long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
   348				unsigned long *parent_rate)
   349	{
   350		int idx = find_closest(rate, ltc4282_out_rates,
   351				       ARRAY_SIZE(ltc4282_out_rates));
   352	
   353		return ltc4282_out_rates[idx];
   354	}
   355	
 > 356	unsigned long ltc4282_recalc_rate(struct clk_hw *hw, unsigned long parent)
   357	{
   358		struct ltc4282_state *st = container_of(hw, struct ltc4282_state,
   359							clk_hw);
   360		u32 clkdiv;
   361		int ret;
   362	
   363		ret = regmap_read(st->map, LTC4282_CLK_DIV, &clkdiv);
   364		if (ret)
   365			return 0;
   366	
   367		clkdiv = FIELD_GET(LTC4282_CLKOUT_MASK, clkdiv);
   368		if (!clkdiv)
   369			return 0;
   370		if (clkdiv == LTC4282_CLKOUT_INT)
   371			return LTC4282_CLKOUT_SYSTEM;
   372	
   373		return LTC4282_CLKOUT_CNV;
   374	}
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
