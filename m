Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF84C122
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Feb 2024 06:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707115399; cv=none; b=SsTN8ae6GEaBAfcZ6ch0Lucb1SB5pDTUDdN0pyRWRkZJYxotyIn/lLlqpQOHsJIfQ1B0nbCndRXe7vXRzRGlK50NKvJ9l9pT/lUMphb6svqnSXCfqhSMSwwSpFyBU+iLbPk48VIiHDY59P4mg2LAuryl4MdZLVKRvnlzquhv1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707115399; c=relaxed/simple;
	bh=HrsjW1rqWWxhvos+xn1TLrEhVexnwXxYatvIMBE02JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hWJ53E1c4c8VpzRQ5MFGVexJxcld8PTbqAyFF/vp5i4P3dflUHZ9uj4fmGE2gxtUNsimEVVr7UYiHAeGufT8li05rh/u2aiSpsQucztOoPI5zqRfyUQN783ep7JYjjo6e71KvtmhT+SeY9QXlRKP9UFMBnPK5JgrP/Zh6rmxITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7vi4185; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7vi4185"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707115396; x=1738651396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrsjW1rqWWxhvos+xn1TLrEhVexnwXxYatvIMBE02JM=;
  b=J7vi4185uIJTukHvgvcdD2So2ohzIXQV8q17EBKe42MAWXMTERAqrmiL
   iUpeYejZzvN3xDf2UWnYQeDxLvoTDhH8ryG0OCFc06Bt5tX7I5NpXRrmq
   tC6Wz/HlnfmTOY4BdLJQHfMT3MOND4+XmBnh4VSyZmEEsP1xg+uvNmGYL
   dB7ndRXHYLaP1w/81/089MaFSSlQYDy1Yni4rKzzE3TwRzQ68+gW7RnYy
   z2a9Ogiv9we30gZ9WDIo33D7u650Ujp/sdgHRHEPWdUsAHcLjpgPtO00h
   kHtXw+j5+WJkDWEWlER9EpjTh/WiBlCQ7Q7Nl5MOcq0gdlaaOEP5COs99
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="712576"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="712576"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 22:43:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5257810"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2024 22:43:14 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWshE-0000CO-0d;
	Mon, 05 Feb 2024 06:43:12 +0000
Date: Mon, 5 Feb 2024 14:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ivor Wanders <ivor@iwanders.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:87:
 undefined reference to `__ssam_device_driver_register'
Message-ID: <202402051456.JOjQbD3G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   fb0833325ac45560e6b62681c77bed56bcfc20a9
commit: c3747f28ebcefe34d6ea2e4eb2d3bb6b9d574b5f [13/34] hwmon: add fan speed monitoring driver for Surface devices
config: x86_64-randconfig-121-20240205 (https://download.01.org/0day-ci/archive/20240205/202402051456.JOjQbD3G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051456.JOjQbD3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051456.JOjQbD3G-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/hwmon/surface_fan.o: in function `surface_fan_init':
>> drivers/hwmon/surface_fan.c:87: undefined reference to `__ssam_device_driver_register'
   ld: drivers/hwmon/surface_fan.o: in function `surface_fan_exit':
>> drivers/hwmon/surface_fan.c:87: undefined reference to `ssam_device_driver_unregister'


vim +87 drivers/hwmon/surface_fan.c

    78	
    79	static struct ssam_device_driver surface_fan = {
    80		.probe = surface_fan_probe,
    81		.match_table = ssam_fan_match,
    82		.driver = {
    83			.name = "surface_fan",
    84			.probe_type = PROBE_PREFER_ASYNCHRONOUS,
    85		},
    86	};
  > 87	module_ssam_device_driver(surface_fan);
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
