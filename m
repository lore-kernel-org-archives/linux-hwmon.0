Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6621CB9E1
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732188048; cv=none; b=FqbjEdXW/CTWr1znp2usEb97wgPvOGhnpY+67dZXkz17FUJc4XoqqMteqa8sDpgeKWMqrxWlO0FGtz4q6SQX3KYpyfw2Y7v3/4Ev7HVKrItMzxJhcopEIio8DpQee+vkWs400oqUI2tXQyZtjAdZBCKv7ZKPM+Xvwh+1o2ZJFVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732188048; c=relaxed/simple;
	bh=EMYtenlYzh62udWgkkT6GSwJFi42owO56AGmFQcG3G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LewAw9LoQO6uoSRZeaQvCTrj1QapRfEYCp5zdXSzVqbVFugFCh39gc9BTleBMdzra5xD62gvQc6klCvAo+8IXEI4o4PqqXKhcjSPLO4qEZOvH69K2c7O5GZE4LevR2OuAngxD1uAACwsTPxd3poiHx0A54WcdleFCAgEdkN2PXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlgtKB5b; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlgtKB5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732188047; x=1763724047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EMYtenlYzh62udWgkkT6GSwJFi42owO56AGmFQcG3G8=;
  b=BlgtKB5boSkf7xoevzoePtF7wLiunsa/DgcOp69qOcEfp5l+XOHebJFs
   XE5JSjE8qC/LQbXF5yWZqtxgPNIWpZ+eVvAipLgryWu1hyn8m3tH0QgcA
   6lCoGedS6LTvqIUkc8L7yeMWTrkU+PdpI4uDeJfXhbOL60j8PloTSDMom
   z1Tsuafh6JQ1bpTtndzsaTh2gGk/Gmhf2kXDEyj0VCIGzjF5A6w5zvExF
   tAEKFgiaUiv1kNh8sJmSJ5u+5QcdCwP/ar77WWRZaCxyoj7uYO/buqP+l
   22ZTpuX9ewcXR6By1kJXP8uQ8eI5Cm3SstCt5Y9HeZMFavq8jysqukr7K
   Q==;
X-CSE-ConnectionGUID: lL5GprFzTfOI2gM7IgGoqg==
X-CSE-MsgGUID: Y3GJCZAmQ8CVa1f4wjZsWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49719385"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; 
   d="scan'208";a="49719385"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 03:20:46 -0800
X-CSE-ConnectionGUID: U4tSn1ARSrCQyWM9LOGTQQ==
X-CSE-MsgGUID: I23+vgVfTIuEpPnIT3WzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95284330"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Nov 2024 03:20:44 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tE5Eo-0002tb-2G;
	Thu, 21 Nov 2024 11:20:42 +0000
Date: Thu, 21 Nov 2024 19:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: [groeck-staging:testing 1/42] drivers/hwmon/hwmon.c:432:84: warning:
 pointer type mismatch in conditional expression
Message-ID: <202411211946.6XukCd3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git testing
head:   b731b2c24d88f6782fdf6e1c19d735cd5aadeb3b
commit: 2c67fcdff546bc261761a3d66aa165a627b71458 [1/42] hwmon: Introduce 64-bit energy attribute support
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241121/202411211946.6XukCd3K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241121/202411211946.6XukCd3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411211946.6XukCd3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/hwmon.c: In function 'hwmon_attr_show':
>> drivers/hwmon/hwmon.c:432:84: warning: pointer type mismatch in conditional expression
     432 |                                hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
         |                                                                                    ^


vim +432 drivers/hwmon/hwmon.c

   422	
   423	static ssize_t hwmon_attr_show(struct device *dev,
   424				       struct device_attribute *devattr, char *buf)
   425	{
   426		struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
   427		s64 val64;
   428		long val;
   429		int ret;
   430	
   431		ret = hattr->ops->read(dev, hattr->type, hattr->attr, hattr->index,
 > 432				       hattr->type == hwmon_energy64 ? (long long *)&val64 : &val);
   433		if (ret < 0)
   434			return ret;
   435	
   436		if (hattr->type != hwmon_energy64)
   437			val64 = val;
   438	
   439		trace_hwmon_attr_show(hattr->index + hwmon_attr_base(hattr->type),
   440				      hattr->name, val64);
   441	
   442		return sprintf(buf, "%lld\n", val64);
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
