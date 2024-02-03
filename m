Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBDEFBFC
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706935939; cv=none; b=BxvbZ2v03jb6X6sx/ENhS9V0e4gRXgbfpOgnkiDQ/yemb4zzrUQIBtdMMg1ubpOIpD8C9UaDkYnOOV2yrhDgPnAeMHXk32/FmVOuIX958q5+UUxcS9FYJmGwm9ZfJ4MVrlUpv3+EbkWD231wI1ogx7wfA9Hf5qWnNNEsyS6MKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706935939; c=relaxed/simple;
	bh=ftB/4R5FDYxJSvMBR72XU3as+SGBF2FW1ldD5XeRSkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpH1S1uaQ/MyGWg0mE61zkXQpGauduNBbtcIC2UtshRCJiyfbTso50RxXHLeOgLM8bSqE9Es8tcz+8IGAUuNRB8K7VIJuB/NcfQjxpPJpoobT9txpBzklgZwHTzmooqKccDT1XA07pagXzVYeJMc63EIblY7sRoGPvIcFP4Y5zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZO1INCE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZO1INCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706935936; x=1738471936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftB/4R5FDYxJSvMBR72XU3as+SGBF2FW1ldD5XeRSkg=;
  b=ZZO1INCEd3GmCeAAj/8oYUwPu04Pfp4S79GSy25jRNjYpEYka2l0976q
   HMryKr6w9D1FOKvBSaYdvyTEmQM3mr7V9HHlmQMpG5l/WTmNQoqB/bHbu
   tuyXgMg66alI19QhI1IpYaTw4FztAslJaJXZ25aQ8jHqXt1Pl0NTajT2/
   B3+nQgfSjnU/qPZkNUHC8RkxUUE9hRxcqMq/PasdvPs2GZeytlnC7BzwX
   eo2gewcTg0p0mIb+96waTX8GUBtvXescp0qTRLXzSIxFOkzkc/York0Jo
   nR8zcD4s7B6vRcMEnPNdxNsnqc5X/jKeVPVJKszM8EZk9VOdXOxTtQCtK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11036035"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="11036035"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 20:52:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908766863"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="908766863"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2024 20:52:13 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW80h-0004da-1r;
	Sat, 03 Feb 2024 04:52:11 +0000
Date: Sat, 3 Feb 2024 12:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ivor Wanders <ivor@iwanders.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:22:9:
 warning: no previous prototype for 'surface_fan_hwmon_is_visible'
Message-ID: <202402031253.JPVKEF5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   68ca2db26850ff7eb72388e237103c56db7b4a84
commit: 6652888f0379f01027bb1d7bbdb377710833b4f2 [13/34] hwmon: add fan speed monitoring driver for Surface devices
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402031253.JPVKEF5X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031253.JPVKEF5X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031253.JPVKEF5X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible' [-Wmissing-prototypes]
      22 | umode_t surface_fan_hwmon_is_visible(const void *drvdata,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/surface_fan_hwmon_is_visible +22 drivers/hwmon/surface_fan.c

    20	
    21	// hwmon
  > 22	umode_t surface_fan_hwmon_is_visible(const void *drvdata,
    23					     enum hwmon_sensor_types type, u32 attr,
    24					     int channel)
    25	{
    26		return 0444;
    27	}
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
