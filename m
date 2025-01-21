Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90508831;
	Tue, 21 Jan 2025 03:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737428527; cv=none; b=tqORf6f0ipYheA4KoXwdbwkjm2nuAS8G1lzsqFoY9V0g+K7H9EshohtJxQLAwOrUvr9Mb9Q5nKzyeMFXEEqReFr7xlQzTBXh1KpCHWYHRzDJ1J6oMo2ORYPoj0LL6IJp3J+0rxco+LM0tu6h5/glyrzPvYrDgMdLcK06jwwqu+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737428527; c=relaxed/simple;
	bh=VngkI13m0a6394z7V6bn+vTOXKQRZK2y/gQ+ebv30+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DttEU5ntLQfYyaEUrYJuMIZBzjgqDhi6c6inHY8pDmQZGBqxM3PfoQt1SvAZWyxFeF0D+Izl7loIisjOZ827/xVih1wiuM3twuzIpL9VmQWZ00bNb6GXpe/SAfQE7qzJPr4WRnlfs0QP0pdDDnE47nIjSBBWONjrbVcGJAkU+hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3+VLWdA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3+VLWdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737428526; x=1768964526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VngkI13m0a6394z7V6bn+vTOXKQRZK2y/gQ+ebv30+A=;
  b=X3+VLWdA69NzM8DPT3IORP0st+8bW/wxqOBiq46bcV5XgHnnWrQe4Sfs
   LC236aiyuWeVefIigXE62OKiqfmtImd5Jsh143APG2MLQxiKIS0REoK7R
   LWma4Dc9v0rB3QouwD0j445bHh0wQCT1krDv2HYQYrxsCMDjf2uWHpD/h
   3rVaWcgcLtG3h3EMRF0hx+6d8IZg/s1T/37Sc9t/XhiLG51MOx25InPJZ
   Y9QNN1qhWbp+FnI4rqLrnivBxG1G5NPmGk8u7j8ielC1NiAaxyjDfDHTL
   n8okDWJrH2TZiHnsGx071hUVDcVCvKi5UwoBBcSEYViOxlVh6xDtJgR97
   g==;
X-CSE-ConnectionGUID: Yk6qJdC0Rqa1nMwnKyatsw==
X-CSE-MsgGUID: tx/B0guQThSASaUY3ZPZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37712693"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37712693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 19:02:05 -0800
X-CSE-ConnectionGUID: 3V1WsWUHQzOgyn0Q857QFg==
X-CSE-MsgGUID: BSmIHu4KSnu+cjc77rvf6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106483671"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Jan 2025 19:02:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta4Wd-000XWp-3B;
	Tue, 21 Jan 2025 03:01:59 +0000
Date: Tue, 21 Jan 2025 11:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Potin Lai <potin.lai.pt@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Patrick Williams <patrick@stwcx.xyz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
Message-ID: <202501211015.8Szwv3Cd-lkp@intel.com>
References: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>

Hi Potin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fc033cf25e612e840e545f8d5ad2edd6ba613ed5]

url:    https://github.com/intel-lab-lkp/linux/commits/Potin-Lai/hwmon-ina238-Add-support-for-shunt-voltage-scaling/20250121-002826
base:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
patch link:    https://lore.kernel.org/r/20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5%40gmail.com
patch subject: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
config: x86_64-buildonly-randconfig-004-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211015.8Szwv3Cd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211015.8Szwv3Cd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211015.8Szwv3Cd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/ina238.c:120:30: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
     120 |         return sprintf(buf, "%d\n", data->shunt_volt_scale);
         |                              ~~     ^~~~~~~~~~~~~~~~~~~~~~
         |                              %ld
   1 warning generated.


vim +120 drivers/hwmon/ina238.c

   114	
   115	static ssize_t shunt_volt_scale_show(struct device *dev,
   116					     struct device_attribute *attr, char *buf)
   117	{
   118		struct ina238_data *data = dev_get_drvdata(dev);
   119	
 > 120		return sprintf(buf, "%d\n", data->shunt_volt_scale);
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
