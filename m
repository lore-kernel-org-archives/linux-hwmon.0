Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035727E2
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Jun 2024 03:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718250513; cv=none; b=c2KEWrJXKE8BmRshhGY1qcMBBE9gRbB7DkOWp5c6pA4g5PV5PE15Zh7cvG4nhkzRfR4O/kVHuR9YNBLpC1LN8YhCamCk28/mIS94XjkRqseu0qx0CuxWPwpdWwsXtgksVgudV899PLzfigvVt1nyEkKWedPEfcS5Bk6LtN3Z2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718250513; c=relaxed/simple;
	bh=ChNoaX/fe+fTAksHbjVkgI4G83ZTeRjCeugMcH49YB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWFxV8MU9qo6myD1YVotnE82BZYertMx/DDOad0B1vzOLAAMIGgzNSixHm/HszNbnA5lkVTjsKyQ5QwBDm6oyJ/deUIlcnwIrGCRtmmFg7ez+47Pj55ZmPfEN06qnvBzlZebvblXsdISFjP6jz1IbbIO7FqdU7z3ernyLsUUOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSGD6eag; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSGD6eag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718250512; x=1749786512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChNoaX/fe+fTAksHbjVkgI4G83ZTeRjCeugMcH49YB0=;
  b=DSGD6eagpZTNOYHsDubZBVc+HPLO5CkZmxXoiP/kXtDgHCK58XN+pNvJ
   DmNtIOb9luo5X33zEs1LqCTTAVopW9Yw8fuEWkI2Xm/EX/Ytod6aKu7hT
   VyZExmlzfCwIysyHbPiclvfN5xWpg8saTIhYbag4qIHxHAjAzx8sZjXwr
   Uln2yyDe6uVO0Nhll2936uGMxSxUjrgeaFvjdWPt2rGTcCjrtNN/nSYWW
   Pg/YVFb6DrarqVaIQP0VrYiffT+NjeaCoMoXd1shjwomVDhICsewNG36b
   uGpnCrCBYra2TdGZgZT3vDnG88dIX+0I7+aW94NoRPYcG3n2oYIpvwW5y
   g==;
X-CSE-ConnectionGUID: U/oEMXu+TyCZ9IdVo70MIA==
X-CSE-MsgGUID: KhWRABJpRQWdhlHSoeR9Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="12047251"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="12047251"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 20:48:31 -0700
X-CSE-ConnectionGUID: Hk7RRoDDSbyZKVgxwzw9fQ==
X-CSE-MsgGUID: aze7vhI4TiWEELO9rK3KCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40639232"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2024 20:48:30 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHbRr-0002By-2m;
	Thu, 13 Jun 2024 03:48:27 +0000
Date: Thu, 13 Jun 2024 11:48:13 +0800
From: kernel test robot <lkp@intel.com>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 63/63]
 drivers/hwmon/pmbus/mp9941.c:60:40: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <202406131131.1nU8FPWw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   c16fa69677811f3a33ef5d4102f106a3f8c5cbdf
commit: c16fa69677811f3a33ef5d4102f106a3f8c5cbdf [63/63] hwmon: add MP9941 driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240613/202406131131.1nU8FPWw-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406131131.1nU8FPWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131131.1nU8FPWw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/mp9941.c: In function 'mp9941_set_vout_format':
>> drivers/hwmon/pmbus/mp9941.c:60:40: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      60 |         ret = (ret & ~GENMASK(7, 6)) | FIELD_PREP(GENMASK(7, 6), 3);
         |                                        ^~~~~~~~~~
   drivers/hwmon/pmbus/mp9941.c: In function 'mp9941_identify_vid_resolution':
>> drivers/hwmon/pmbus/mp9941.c:84:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      84 |         if (FIELD_GET(GENMASK(4, 4), ret))
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +60 drivers/hwmon/pmbus/mp9941.c

    43	
    44	static int mp9941_set_vout_format(struct i2c_client *client)
    45	{
    46		int ret;
    47	
    48		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
    49		if (ret < 0)
    50			return ret;
    51	
    52		ret = i2c_smbus_read_word_data(client, MFR_RESO_SET);
    53		if (ret < 0)
    54			return ret;
    55	
    56		/*
    57		 * page = 0, MFR_RESO_SET[7:6] defines the vout format
    58		 * 2'b11 set the vout format as direct
    59		 */
  > 60		ret = (ret & ~GENMASK(7, 6)) | FIELD_PREP(GENMASK(7, 6), 3);
    61	
    62		return i2c_smbus_write_word_data(client, MFR_RESO_SET, ret);
    63	}
    64	
    65	static int
    66	mp9941_identify_vid_resolution(struct i2c_client *client, struct pmbus_driver_info *info)
    67	{
    68		struct mp9941_data *data = to_mp9941_data(info);
    69		int ret;
    70	
    71		/*
    72		 * page = 2, MFR_VR_MULTI_CONFIG_R1[4:4] defines rail1 vid step value
    73		 * 1'b0 represents the vid step value is 10mV
    74		 * 1'b1 represents the vid step value is 5mV
    75		 */
    76		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
    77		if (ret < 0)
    78			return ret;
    79	
    80		ret = i2c_smbus_read_word_data(client, MFR_VR_MULTI_CONFIG_R1);
    81		if (ret < 0)
    82			return ret;
    83	
  > 84		if (FIELD_GET(GENMASK(4, 4), ret))
    85			data->vid_resolution = 5;
    86		else
    87			data->vid_resolution = 10;
    88	
    89		return 0;
    90	}
    91	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
