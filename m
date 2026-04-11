Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89251299923
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 06:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775888414; cv=none; b=SMQMtufP6lAEoDceu55Huee33PiKwKco7YqnTsbHrrtEBrqeg4HB8UUbsKmeRz5C0CA7JUYdve1aOKuTBCGwVYQ6QaSbxmTmz8uVsfzN5cWm2ptmjlGm27Dk4sIb8iHz9qnbfjNXd0AXPWpQ01wQVtVbdb56XV+b2Rnd8nb8Xws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775888414; c=relaxed/simple;
	bh=Lb1qCQHUxqZc2PkrrX50cOiJz/n3TrCChaayco2+nIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZMbu72E686q3miiCqITovyXFaVHGfG+TzFKRGha3CHnmstdMT/3DyUtXk9DxcebRDGMAR3Q26fMDaiizkrKdJTtXb4QHgjm33YMh9xo48tol6w65qAnXgf3WfiJ/INDwt7lHU/+7lpi+jg3gnZDt1XTRXj7RvvMuJxDbeus4ur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCDaTYmH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCDaTYmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775888412; x=1807424412;
  h=date:from:to:cc:subject:message-id;
  bh=Lb1qCQHUxqZc2PkrrX50cOiJz/n3TrCChaayco2+nIQ=;
  b=eCDaTYmHOd8Iwfhhr5MzwmD8dgEdrjkmQ32BLtCB+twRQad7HxWmnZGt
   JsPBffxsQAfqjoqE6mbaMdZNyLl2+/svlIMfcDQ4Xlq3VHnEKCaY0Cd71
   QeHYsss+AOUwq80c222pIjEVJEVYXLNqthrQp+Nxf36Q/cHVhsegcMBny
   VjEPeNFwrY7UCIAIspB75zit8eOhbEXQAa+Oxwb/qmnPAy35Hn4MhRrHG
   ElSBb+ZfKDnNp6SgqNvaa+x02ypIT27NbO+P8FIP719DQ30bjFKrkIpkB
   DIiiB8qWNGEFTW3p8Yo+JlBspmo2rWZhD3r6HkHeLOUEMVJb8eIY3fXXo
   w==;
X-CSE-ConnectionGUID: qqWK6EXjSd6WClejtZoBQQ==
X-CSE-MsgGUID: en5OPRjlQ9Gz0UtsZi4mug==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76973666"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76973666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 23:20:12 -0700
X-CSE-ConnectionGUID: KO68HZX/S4y6lnXt0nxwCg==
X-CSE-MsgGUID: GXCC5fjHQdG23PJKvGuzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="259755973"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 23:20:10 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBRhP-000000000th-1OBp;
	Sat, 11 Apr 2026 06:20:07 +0000
Date: Sat, 11 Apr 2026 14:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Duicu <victor.duicu@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 76/78]
 drivers/hwmon/mcp9982.c:398:3: warning: unannotated fall-through between
 switch labels
Message-ID: <202604111428.6XvpEPLI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   3d6b94a0d05d28ff23750b68aba54598aa232832
commit: 324fac7ae52b31dc67770b133389c7aba3fb058e [76/78] hwmon: add support for MCP998X
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111428.6XvpEPLI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111428.6XvpEPLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111428.6XvpEPLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/mcp9982.c:398:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     398 |                 default:
         |                 ^
   drivers/hwmon/mcp9982.c:398:3: note: insert 'break;' to avoid fall-through
     398 |                 default:
         |                 ^
         |                 break; 
   1 warning generated.


vim +398 drivers/hwmon/mcp9982.c

   361	
   362	static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
   363				long *val)
   364	{
   365		struct mcp9982_priv *priv = dev_get_drvdata(dev);
   366		unsigned int reg_high, reg_low, hyst, reg_status;
   367		int ret;
   368		u8 addr;
   369	
   370		/*
   371		 * In Standby State the conversion cycle must be initated manually in
   372		 * order to read fresh temperature values and the status of the alarms.
   373		 */
   374		if (!priv->run_state) {
   375			switch (type) {
   376			case hwmon_temp:
   377				switch (attr) {
   378				case hwmon_temp_input:
   379				case hwmon_temp_max_alarm:
   380				case hwmon_temp_min_alarm:
   381				case hwmon_temp_crit_alarm:
   382					ret = regmap_write(priv->regmap, MCP9982_ONE_SHOT_ADDR, 1);
   383					if (ret)
   384						return ret;
   385					/*
   386					 * When the device is in Standby mode, 125 ms need
   387					 * to pass from writing in One Shot register before
   388					 * the conversion cycle begins.
   389					 */
   390					usleep_range(MCP9982_WAKE_UP_TIME_US, MCP9982_WAKE_UP_TIME_MAX_US);
   391					ret = regmap_read_poll_timeout
   392						       (priv->regmap, MCP9982_STATUS_ADDR,
   393						       reg_status, !(reg_status & MCP9982_STATUS_BUSY),
   394						       MCP9982_WAKE_UP_TIME_US,
   395						       MCP9982_WAKE_UP_TIME_US * 10);
   396					break;
   397				}
 > 398			default:
   399				break;
   400			}
   401		}
   402	
   403		switch (type) {
   404		case hwmon_temp:
   405			switch (attr) {
   406			case hwmon_temp_input:
   407				/*
   408				 * The only areas of memory that support SMBus block read are 80h->89h
   409				 * (temperature memory block) and 90h->97h(status memory block).
   410				 * In this context the read operation uses SMBus protocol and the first
   411				 * value returned will be the number of addresses that can be read.
   412				 * Temperature memory block is 10 bytes long and status memory block is 8
   413				 * bytes long.
   414				 *
   415				 * Depending on the read instruction used, the chip behaves differently:
   416				 * - regmap_bulk_read() when applied to the temperature memory block
   417				 * (80h->89h), the chip replies with SMBus block read, including count,
   418				 * additionally to the high and the low bytes. This function cannot be
   419				 * applied on the memory region 00h->09h(memory area which does not support
   420				 * block reads, returns wrong data) unless use_single_read is set in
   421				 * regmap_config.
   422				 *
   423				 * - regmap_multi_reg_read() when applied to the 00h->09h area uses I2C
   424				 * and returns only the high and low temperature bytes. When applied to
   425				 * the temperature memory block (80h->89h) returns the count till the end of
   426				 * the temperature memory block(aka SMBus count).
   427				 *
   428				 * - i2c_smbus_read_block_data() is not supported by all drivers.
   429				 *
   430				 * In order to keep consistency with reading limit memory region we will
   431				 * use single byte I2C read.
   432				 *
   433				 * Low register is latched when high temperature register is read.
   434				 */
   435				ret = regmap_read(priv->regmap, MCP9982_HIGH_BYTE_ADDR(channel), &reg_high);
   436				if (ret)
   437					return ret;
   438	
   439				ret = regmap_read(priv->regmap, MCP9982_HIGH_BYTE_ADDR(channel) + 1,
   440						  &reg_low);
   441				if (ret)
   442					return ret;
   443	
   444				*val = ((reg_high << 8) + reg_low) >> 5;
   445				*val = (*val - (MCP9982_OFFSET << 3)) * 125;
   446	
   447				return 0;
   448			case hwmon_temp_max:
   449				if (channel)
   450					addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
   451				else
   452					addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
   453	
   454				return mcp9982_read_limit(priv, addr, val);
   455			case hwmon_temp_max_alarm:
   456				*val = regmap_test_bits(priv->regmap, MCP9982_HIGH_LIMIT_STATUS_ADDR,
   457							BIT(channel));
   458				if (*val < 0)
   459					return *val;
   460	
   461				return 0;
   462			case hwmon_temp_max_hyst:
   463				if (channel)
   464					addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
   465				else
   466					addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
   467				ret = mcp9982_read_limit(priv, addr, val);
   468				if (ret)
   469					return ret;
   470	
   471				ret = regmap_read(priv->regmap, MCP9982_HYS_ADDR, &hyst);
   472				if (ret)
   473					return ret;
   474	
   475				*val -= hyst * 1000;
   476	
   477				return 0;
   478			case hwmon_temp_min:
   479				if (channel)
   480					addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
   481				else
   482					addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
   483	
   484				return mcp9982_read_limit(priv, addr, val);
   485			case hwmon_temp_min_alarm:
   486				*val = regmap_test_bits(priv->regmap, MCP9982_LOW_LIMIT_STATUS_ADDR,
   487							BIT(channel));
   488				if (*val < 0)
   489					return *val;
   490	
   491				return 0;
   492			case hwmon_temp_crit:
   493				return mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
   494			case hwmon_temp_crit_alarm:
   495				*val = regmap_test_bits(priv->regmap, MCP9982_THERM_LIMIT_STATUS_ADDR,
   496							BIT(channel));
   497				if (*val < 0)
   498					return *val;
   499	
   500				return 0;
   501			case hwmon_temp_crit_hyst:
   502				ret = mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
   503				if (ret)
   504					return ret;
   505	
   506				ret = regmap_read(priv->regmap, MCP9982_HYS_ADDR, &hyst);
   507				if (ret)
   508					return ret;
   509	
   510				*val -= hyst * 1000;
   511	
   512				return 0;
   513			default:
   514				return -EINVAL;
   515			}
   516		case hwmon_chip:
   517			switch (attr) {
   518			case hwmon_chip_update_interval:
   519				*val = mcp9982_update_interval[priv->interval_idx];
   520				return 0;
   521			default:
   522				return -EINVAL;
   523			}
   524		default:
   525			return -EINVAL;
   526		}
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
