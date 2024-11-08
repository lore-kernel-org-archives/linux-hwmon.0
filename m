Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9251C9ECE
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731050216; cv=none; b=RfftNrl6r+N1TFN7yUjwhhoVx5T1Lh9UCnY0smuxEaivaRAGCPai4xp9xChjDldHsxVLd6H5kB3EGQ0xP0KrokQFt9n9zd64+B9y2mEKrStaw4YRSXCiE471LsD5z8pdBgqa8Al0YPitJIWr5Ha7/08zqLGGalXuzKTLKC+3DcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731050216; c=relaxed/simple;
	bh=czbrLjEcY2nAe8k4lsx//1qBCnHGzVzcdVpMd61kRtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hx9AV9ByVFrxNyqCt/jRRo4M5glMV7y3cEj/lsl9qxeTVIjcQOqIhvD9++AwaCuuaaD8Vjv5Nn6mmfLlt/rqf1q6S7Strk5SyyEDdglHpEqwtA7amA7O2ZYGkMCJ2XdMNz1j6w3v+J+1GegBhYx5vYjjVmYlxw2WEVKCp0ZA0vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMQzmC7V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMQzmC7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731050215; x=1762586215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czbrLjEcY2nAe8k4lsx//1qBCnHGzVzcdVpMd61kRtE=;
  b=hMQzmC7VCrWX/WVHExjd/V1gFLnhL5XpMUwVPagIO+zLB1ONO5qHppTz
   yLDjXeitJXqTCW3pzqlYu9nMinfwEkAUN4jA+iCKEvFFvr6e13boVS9+v
   WSTT/18YNVnIYT5poD3t/C3C28APAOVwkhzbe7Qh108saTCM/y7LYK/LD
   ukOn2g9meiFMkYlm7rNcx94qSj9Qn3RWmUe+BP9q825Q3KmD1mHYieBH6
   3VAEr8nJpDrnsiTFWDuu38jt5a1OCt+m05Scq9zNDr4zFPSrbjKKEQTJ6
   J+IPGGMiJjjxlo65ZU8zunhfsOFjsxiHPID804pQ+mUY/qU0KZEdof1kh
   g==;
X-CSE-ConnectionGUID: dHidC7tMQ+6opI54ElORMw==
X-CSE-MsgGUID: 6rUvdA38QMyjYYCuslxmKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41482430"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41482430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 23:16:54 -0800
X-CSE-ConnectionGUID: iOh6qkJWQsCKzy95p1eeVA==
X-CSE-MsgGUID: 4BapqxqWSvCgrSlayWBEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="85410942"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Nov 2024 23:16:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9JEh-000r8U-07;
	Fri, 08 Nov 2024 07:16:51 +0000
Date: Fri, 8 Nov 2024 15:16:20 +0800
From: kernel test robot <lkp@intel.com>
To: Wenliang Yan <wenliang202407@163.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 32/37] drivers/hwmon/ina2xx.c:734:17:
 error: duplicate case value
Message-ID: <202411081521.uiK1CM2g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   33c7c88cd30fa65f5479722ba7eea300ebf889a5
commit: 8fb186818c2fe7be4e2f722c1bc1108ec854d416 [32/37] hwmon: (ina226) Add support for SY24655
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241108/202411081521.uiK1CM2g-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081521.uiK1CM2g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081521.uiK1CM2g-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwmon/ina2xx.c: In function 'sy24655_average_power_read':
>> drivers/hwmon/ina2xx.c:524:22: warning: unused variable 'regval' [-Wunused-variable]
     524 |         unsigned int regval;
         |                      ^~~~~~
   drivers/hwmon/ina2xx.c: In function 'ina2xx_is_visible':
>> drivers/hwmon/ina2xx.c:734:17: error: duplicate case value
     734 |                 case hwmon_power_average:
         |                 ^~~~
   drivers/hwmon/ina2xx.c:722:17: note: previously used here
     722 |                 case hwmon_in_input:
         |                 ^~~~


vim +734 drivers/hwmon/ina2xx.c

   710	
   711	static umode_t ina2xx_is_visible(const void *_data, enum hwmon_sensor_types type,
   712					 u32 attr, int channel)
   713	{
   714		const struct ina2xx_data *data = _data;
   715		bool has_alerts = data->config->has_alerts;
   716		bool has_power_average = data->config->has_power_average;
   717		enum ina2xx_ids chip = data->chip;
   718	
   719		switch (type) {
   720		case hwmon_in:
   721			switch (attr) {
   722			case hwmon_in_input:
   723				return 0444;
   724			case hwmon_in_lcrit:
   725			case hwmon_in_crit:
   726				if (has_alerts)
   727					return 0644;
   728				break;
   729			case hwmon_in_lcrit_alarm:
   730			case hwmon_in_crit_alarm:
   731				if (has_alerts)
   732					return 0444;
   733				break;
 > 734			case hwmon_power_average:
   735				if (has_power_average)
   736					return 0444;
   737				break;
   738			default:
   739				break;
   740			}
   741			break;
   742		case hwmon_curr:
   743			switch (attr) {
   744			case hwmon_curr_input:
   745				return 0444;
   746			case hwmon_curr_lcrit:
   747			case hwmon_curr_crit:
   748				if (has_alerts)
   749					return 0644;
   750				break;
   751			case hwmon_curr_lcrit_alarm:
   752			case hwmon_curr_crit_alarm:
   753				if (has_alerts)
   754					return 0444;
   755				break;
   756			default:
   757				break;
   758			}
   759			break;
   760		case hwmon_power:
   761			switch (attr) {
   762			case hwmon_power_input:
   763				return 0444;
   764			case hwmon_power_crit:
   765				if (has_alerts)
   766					return 0644;
   767				break;
   768			case hwmon_power_crit_alarm:
   769				if (has_alerts)
   770					return 0444;
   771				break;
   772			default:
   773				break;
   774			}
   775			break;
   776		case hwmon_chip:
   777			switch (attr) {
   778			case hwmon_chip_update_interval:
   779				if (chip == ina226 || chip == ina260)
   780					return 0644;
   781				break;
   782			default:
   783				break;
   784			}
   785			break;
   786		default:
   787			break;
   788		}
   789		return 0;
   790	}
   791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
