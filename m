Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A41325726;
	Fri, 16 Jan 2026 04:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768537962; cv=none; b=DlB5jMCadRifsDRtBN9JI+93nkjQEon3PtT4vjIh5Xi2J85gsDsasGdb1y8DB9Jau4i0T1xowReeCTuPl0w6Fm3S/ZNj1cYDKKzdguVk3UR9aFWNNFGKJsjiAk0v6PZl9oXq8+W6tmIsYfe+hVeE2eXjFXxofJRvBCSt99dtIyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768537962; c=relaxed/simple;
	bh=HYJeI/KE4cb37CNedopnLR7mxbK43Vfo+OtGvtj3+4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xbsver0NXSsCoMfq8rOM0i2IlYrGwg2iyLF/jNTRgP9w7Auk6oZcLhA9jCTXFtJwuwU1aewrWM2qmc0k4tyMId4v+IFpf2he5uE1uMmDN5rH2QMTiUz+bX0z4qWbCSff0M7YwcsI18QVH/J7C3IeoVHGJfqhAIbj5N9Ap1jGD+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jikYR22v; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jikYR22v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768537960; x=1800073960;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HYJeI/KE4cb37CNedopnLR7mxbK43Vfo+OtGvtj3+4c=;
  b=jikYR22vkPWbjcYLBg37huaPKHrIeJgYcvPnTgcZzx6Ywb+HWsYrEveb
   PZZAJz0jWKlupn5BD67vSbyz/4jWbOMAEg5ntv+eITa5LvySPtN1ZUQsx
   bDViEHt1ipDBqYU8eqNyTkf+U0cVjtspplz6gjMI2m2m/iVZoTabdZmdI
   RDx+fmk9bp0PbcizSpnYzNOUqP2rqT3QvvqvI0WD/VezXOepxRkA2MVrL
   WWCYcAI859L+XW51pOo5KYwnBWbZ8BZlGqIdxCga4NyeLg2tgETSs4FP3
   bttm+ROj1mjQqXGlXPp7SP3G4nP5X0VZuhu0ZOG2pGByXHWf/TLt49ZbL
   Q==;
X-CSE-ConnectionGUID: u93+nWVnR7K99Vz8HoQttA==
X-CSE-MsgGUID: aiGeA01cReCdF3YHVYW5+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="57406642"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="57406642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 20:32:39 -0800
X-CSE-ConnectionGUID: 8n6O9xDFQGSRte+jIzmVuQ==
X-CSE-MsgGUID: cTq3sywKS7Gpq6EmBlmhoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="228179458"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jan 2026 20:32:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgbVi-00000000KNE-2pKY;
	Fri, 16 Jan 2026 04:32:34 +0000
Date: Fri, 16 Jan 2026 12:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>, linux@roeck-us.net,
	corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com, Mayank Mahajan <mayankmahajan.x@nxp.com>
Subject: Re: [PATCH v3 2/3] hwmon: (tmp108) Add support for P3T1035 and
 P3T2030
Message-ID: <202601161234.jWOgBbs8-lkp@intel.com>
References: <20260115111418.1851-2-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115111418.1851-2-mayankmahajan.x@nxp.com>

Hi Mayank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.19-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mayank-Mahajan/hwmon-tmp108-Add-support-for-P3T1035-and-P3T2030/20260115-191549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260115111418.1851-2-mayankmahajan.x%40nxp.com
patch subject: [PATCH v3 2/3] hwmon: (tmp108) Add support for P3T1035 and P3T2030
config: xtensa-randconfig-r122-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161234.jWOgBbs8-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161234.jWOgBbs8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161234.jWOgBbs8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hwmon/tmp108.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>> drivers/hwmon/tmp108.c:455:17: sparse: sparse: macro "memcpy" passed 6 arguments, but takes just 3
   drivers/hwmon/tmp108.c:458:17: sparse: sparse: macro "memcpy" passed 6 arguments, but takes just 3
   drivers/hwmon/tmp108.c:618:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/tmp108.c:618:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/tmp108.c:619:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/tmp108.c:619:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/tmp108.c:620:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/tmp108.c:620:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +/memcpy +455 drivers/hwmon/tmp108.c

   433	
   434	static int tmp108_common_probe(struct device *dev, struct regmap *regmap, char *name,
   435				       enum tmp108_hw_id hw_id)
   436	{
   437		struct device *hwmon_dev;
   438		struct tmp108 *tmp108;
   439		u32 config;
   440		int err;
   441	
   442		err = devm_regulator_get_enable(dev, "vcc");
   443		if (err)
   444			return dev_err_probe(dev, err, "Failed to enable regulator\n");
   445	
   446		tmp108 = devm_kzalloc(dev, sizeof(*tmp108), GFP_KERNEL);
   447		if (!tmp108)
   448			return -ENOMEM;
   449	
   450		dev_set_drvdata(dev, tmp108);
   451		tmp108->regmap = regmap;
   452		tmp108->hw_id = hw_id;
   453		tmp108->config_reg_16bits = (hw_id == P3T1035_ID) ? false : true;
   454		if (hw_id == P3T1035_ID)
 > 455			memcpy(tmp108->sample_times, (unsigned int[]){ 125, 250, 1000, 4000 },
   456			       sizeof(tmp108->sample_times));
   457		else
   458			memcpy(tmp108->sample_times, (unsigned int[]){ 63, 250, 1000, 4000 },
   459			       sizeof(tmp108->sample_times));
   460	
   461		err = regmap_read(tmp108->regmap, TMP108_REG_CONF, &config);
   462		if (err < 0) {
   463			dev_err(dev, "error reading config register: %d", err);
   464			return err;
   465		}
   466		tmp108->orig_config = config;
   467	
   468		/* Only continuous mode is supported. */
   469		config &= ~TMP108_CONF_MODE_MASK;
   470		config |= TMP108_MODE_CONTINUOUS;
   471		/* Only comparator mode is supported. */
   472		config &= ~TMP108_CONF_TM;
   473	
   474		err = regmap_write(tmp108->regmap, TMP108_REG_CONF, config);
   475		if (err < 0) {
   476			dev_err(dev, "error writing config register: %d", err);
   477			return err;
   478		}
   479	
   480		tmp108->ready_time = jiffies;
   481		if ((tmp108->orig_config & TMP108_CONF_MODE_MASK) ==
   482		    TMP108_MODE_SHUTDOWN)
   483			tmp108->ready_time +=
   484				msecs_to_jiffies(TMP108_CONVERSION_TIME_MS);
   485	
   486		err = devm_add_action_or_reset(dev, tmp108_restore_config, tmp108);
   487		if (err) {
   488			dev_err(dev, "add action or reset failed: %d", err);
   489			return err;
   490		}
   491	
   492		hwmon_dev = devm_hwmon_device_register_with_info(dev, name,
   493								 tmp108,
   494								 &tmp108_chip_info,
   495								 NULL);
   496		return PTR_ERR_OR_ZERO(hwmon_dev);
   497	}
   498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
