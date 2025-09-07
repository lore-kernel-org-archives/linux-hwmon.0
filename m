Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476321E487;
	Sun,  7 Sep 2025 01:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757209999; cv=none; b=fTiizydaf9xMTjZeTR5Uwkk/jOKGHa0pRoLgElrV/llgQL2J6Vr4a0QU1Pqn/EAbxb0w841PEGs9sH8GmCC7YnUrZXeJ27icFF0oAtR/7vbxhUPPfpiV0FeMKRBDWecMHBEIUy+r2yxOiCIYWePGuWsuCC1+N/RLSqaC0IwAwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757209999; c=relaxed/simple;
	bh=onua4uGiY8b06S0kaHxtedAho1jMgBQC9N7wPI006h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZikD6STHLiGM0uJiEMCwk6TtiD/j8fg6XXV5lwGx/TSHK56gU2bvbm9uPaezTC+SoPezRRfmj4kQYWSxIK1eQr7Dqyq/wwKEdQ48ieyK9UiwBWnOqygPpXg2+7uLPL/CKtvBpX1gghSq5EMWbiA9wGru94EBEHv2lgYHXStUE18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcLdwkvJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcLdwkvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757209997; x=1788745997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=onua4uGiY8b06S0kaHxtedAho1jMgBQC9N7wPI006h0=;
  b=mcLdwkvJHhAWD13/xShlualwSIvozY/qtIDi1tOuzdbK2qTQAq/dqzzx
   SnM+wW6AHh8odeb82a4Z9slqZKAxGw7ZkB/RIyOdLfz6cIL3QN7/byRgZ
   pIbnhLJCxOFewyfVvDdL3NQu1Wlr3XLzSUNsQLH+DaZC+wn5FwQoDVbN+
   vDgUujAcv3u0+M8uAlwBkp//rGSNdqB88FNrOsrxWO8UwS8Qq17jGoC+R
   r0wdeiaZtjZbHwKNcXqkhFlbuhFYiqjR5JKQGE8aD/zABD24KEGpmBCdh
   vUoE/iAjCNfumZ8PP8OqE4kmaNVe60pKWvWbkmcPenUoq/HvAXArmxL5D
   g==;
X-CSE-ConnectionGUID: ydcHArxySAS5z3tcCvs96A==
X-CSE-MsgGUID: +ZSrmKGXSjq/05gENSSzvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59578011"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59578011"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 18:53:16 -0700
X-CSE-ConnectionGUID: Q2ewZRTwQHG7KgS+O9jxHg==
X-CSE-MsgGUID: rDb0QugRTAqHusgz3nL/jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,245,1751266800"; 
   d="scan'208";a="172030905"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2025 18:53:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uv4af-0004GZ-0n;
	Sun, 07 Sep 2025 01:53:13 +0000
Date: Sun, 7 Sep 2025 03:52:33 +0200
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 37/37] htmldocs:
 Documentation/hwmon/hwmon-kernel-api.rst:291: WARNING: Inline emphasis
 start-string without end-string. [docutils]
Message-ID: <202509070312.GIIw6No7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   3c56a8e682e94ee9ac48c1fb2153becb861c0f7d
commit: a2d68a9f51c27051c4b84990ffbd2531a6024389 [37/37] hwmon: Introduce 64-bit energy attribute support
reproduce: (https://download.01.org/0day-ci/archive/20250907/202509070312.GIIw6No7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509070312.GIIw6No7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid_bpf.h
   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
>> Documentation/hwmon/hwmon-kernel-api.rst:291: WARNING: Inline emphasis start-string without end-string. [docutils]
   ERROR: Cannot find file ./include/linux/i2c-atr.h
   WARNING: No kernel-doc for file ./include/linux/i2c-atr.h
   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h


vim +291 Documentation/hwmon/hwmon-kernel-api.rst

b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  274  
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  275  	int read_func(struct device *dev, enum hwmon_sensor_types type,
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  276  		      u32 attr, int channel, long *val)
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  277  
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  278  Parameters:
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  279  	dev:
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  280  		Pointer to the hardware monitoring device.
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  281  	type:
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  282  		The sensor type.
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  283  	attr:
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  284  		Attribute identifier associated with a specific attribute.
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  285  		For example, the attribute value for HWMON_T_INPUT would be
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  286  		hwmon_temp_input. For complete mappings please see
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  287  		include/linux/hwmon.h.
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  288  	channel:
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  289  		The sensor channel number.
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17  290  	val:
b04f2f7d387b31 Documentation/hwmon/hwmon-kernel-api.txt Mauro Carvalho Chehab 2019-04-17 @291  		Pointer to attribute value.
a2d68a9f51c270 Documentation/hwmon/hwmon-kernel-api.rst Guenter Roeck         2024-08-28  292  		For hwmon_energy64, 'val' is passed as long * but needs
a2d68a9f51c270 Documentation/hwmon/hwmon-kernel-api.rst Guenter Roeck         2024-08-28  293  		a typecast to s64 *.
bf7153fd2c6f70 Documentation/hwmon/hwmon-kernel-api.txt Guenter Roeck         2016-06-23  294  

:::::: The code at line 291 was first introduced by commit
:::::: b04f2f7d387b3160883c2a1f5e2285483a791e82 docs: hwmon: convert remaining files to ReST format

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
