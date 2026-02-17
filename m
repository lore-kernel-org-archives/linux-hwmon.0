Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A18737107D;
	Tue, 17 Feb 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771349879; cv=none; b=aAONJMYFqWN13K6UBrtY8hw+SAGdp6b0/eUkITHdQu0InKPJFHz7fkUKJXV1sCqjc1tCRxpC5yooLRfK/wwHPvG0E1ubfIfzis3rYiomZdKM50bg0mo28SX32XOLJXtEtc0yZH5vCLECHCWa5e9IcuRUDF7uG7xbdshYcm3wMQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771349879; c=relaxed/simple;
	bh=c0eLjxbJ+JYIp4tuQWsxqvXN+OxfmcSd+XrBhArs5UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=URw4YE96fFO6/0kfgW6PqCv6L6QLKU2xKFlv9pcQLGTXMGzEIDKaq/6FP/q8RY9vWdaEBQwufaquefRAj2YkI3xhi6axam59eKBgpnMBP9PxsF/Ur371olJ25smBoLneV+Pk9i4VJ2UK6clJIzqSJVUe7PRTIQvcDBy6On4hpR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyfELRde; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyfELRde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771349878; x=1802885878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c0eLjxbJ+JYIp4tuQWsxqvXN+OxfmcSd+XrBhArs5UY=;
  b=XyfELRde3yFwBGmDJ5AEfuVmCjrIO0dUeAIc90bwZHc9EW8P1TtXjodT
   hhXTPbAFKSY+QHiHX4yT5qa1KS1Bq/K02Js4ByFW7AeeUZ7bPLhi6p/M/
   g/UjcmFhRxs8Mgp+TZIAmPNydGPY2Q3HiTPsNi2YiiFYOkUekpkvO06nb
   NrvxzFsUhmwhnMaohm4WSZTji2/zlwRDOQSvbpnKYsw2TnSpS4DjSzaxn
   goWxfF6yEX8ng9ptTX19FJF8jHuk9Gzxq069+bwzlqm58g6lnFOL8q4xz
   kZ/IxF8ktg9NnU5rNyRN5A8LM1FgLKdDPsOAPHxOJXobMf6eIv21MSYkw
   Q==;
X-CSE-ConnectionGUID: 5kJJA0hwQTyBxlq+3lOwCw==
X-CSE-MsgGUID: Wez49xxuQs2NxSKjcOPy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72470897"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72470897"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:37:58 -0800
X-CSE-ConnectionGUID: wmuDun/uTZqz/bXRySrkfQ==
X-CSE-MsgGUID: K77oRrEaTpWvMXkUYsQJbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213190873"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2026 09:37:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsP1F-0000000033p-2iOH;
	Tue, 17 Feb 2026 17:37:53 +0000
Date: Tue, 17 Feb 2026 18:37:40 +0100
From: kernel test robot <lkp@intel.com>
To: Ian Ray <ian.ray@gehealthcare.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Ian Ray <ian.ray@gehealthcare.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (ina2xx) Add support for INA234
Message-ID: <202602171807.LY5U6PB6-lkp@intel.com>
References: <20260217092325.15867-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217092325.15867-2-ian.ray@gehealthcare.com>

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on robh/for-next krzk-dt/for-next next-20260216]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Ray/hwmon-ina2xx-Add-support-for-INA234/20260217-172450
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20260217092325.15867-2-ian.ray%40gehealthcare.com
patch subject: [PATCH 2/2] hwmon: (ina2xx) Add support for INA234
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260217/202602171807.LY5U6PB6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171807.LY5U6PB6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/ina2xx.rst:138: WARNING: Title underline too short.


vim +138 Documentation/hwmon/ina2xx.rst

9a629d7ada78c3 Documentation/hwmon/ina2xx     Nicolin Chen 2018-11-19  136  
d97d11d21ca0a7 Documentation/hwmon/ina2xx.rst Ian Ray      2026-02-17  137  Additional sysfs entries for ina226, ina230, ina231, ina234, ina260, and sy24655
52172ad87a22ed Documentation/hwmon/ina2xx.rst Wenliang Yan 2024-11-06 @138  ------------------------------------------------------------------------
9a629d7ada78c3 Documentation/hwmon/ina2xx     Nicolin Chen 2018-11-19  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
