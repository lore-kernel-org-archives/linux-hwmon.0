Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESm/FWjn"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B0CCE;
	Mon, 27 Nov 2023 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701080513; x=1732616513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ys8XwLQh3l2KF6BGHrQz531VXoPnwLZjyOw4eVo+Sg=;
  b=ESm/FWjnF6tlzhGZrBKAcFjUKDpr/ECj5BLdjIz3ljti1WJfVxs5Xwyb
   reUe+y03oVDBp7FBNQR3Lf0V5ow9ySHqNj5poiMbNifhX3YzyuQpGNgGr
   FLCdsJRZpkqcfYiwe+duSp737CJXeu2WtK67IeBM6fZFCGP97gxucCfE9
   EXaVgTUkZVGGb/cQmy9brGtgFWy9kvjMkf6CptRDrIvDaxRKbts1qj7o0
   MtYH6Dx2mlnxXfi1BHQVA9TuMHIOGB+S6Cm8PbTe/2v4m2bPUC/hQdJ6z
   g9nElOKG6bEz/bnLZnKQKFSu0NowQjJCecEAivnZngEVacKymFptMzBvR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372835270"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="372835270"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="912058091"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="912058091"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2023 02:21:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7YkN-00069M-2v;
	Mon, 27 Nov 2023 10:21:47 +0000
Date: Mon, 27 Nov 2023 18:20:22 +0800
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
Message-ID: <202311271611.huVhrU16-lkp@intel.com>
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
[also build test WARNING on linus/master v6.7-rc3 next-20231127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/hwmon-ltc4282-add-support-for-the-LTC4282-chip/20231124-231842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231124-ltc4282-support-v2-2-952bf926f83c%40analog.com
patch subject: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
config: nios2-randconfig-r111-20231127 (https://download.01.org/0day-ci/archive/20231127/202311271611.huVhrU16-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311271611.huVhrU16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311271611.huVhrU16-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/ltc4282.c:347:6: sparse: sparse: symbol 'ltc4282_round_rate' was not declared. Should it be static?
>> drivers/hwmon/ltc4282.c:356:15: sparse: sparse: symbol 'ltc4282_recalc_rate' was not declared. Should it be static?
>> drivers/hwmon/ltc4282.c:967:34: sparse: sparse: dubious: x & !y
   drivers/hwmon/ltc4282.c:1057:34: sparse: sparse: dubious: x & !y
   drivers/hwmon/ltc4282.c: note: in included file (through include/uapi/linux/swab.h, include/linux/swab.h, include/uapi/linux/byteorder/little_endian.h, ...):
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:31:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini
   arch/nios2/include/uapi/asm/swab.h:25:24: sparse: sparse: too many arguments for function __builtin_custom_ini

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
