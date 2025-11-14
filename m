Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3D31A7EA;
	Fri, 14 Nov 2025 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763128245; cv=none; b=Lz8fbIaSEIL2xC3QYNiZQxewJsUw+P+dWWitC8FJb9nIVgd+PUV3HwkIGj7vZEtgyNL6inPE5vH0xj7/ls8Ky5wLdwzA/4D51/Ezq6gm+MVCk7jpmxu46XYXw32bKeFBY1B0XxD+9HnxupfA0v+Azo6SCumbBXmYUW3x8AckM/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763128245; c=relaxed/simple;
	bh=mWNK2hiG9QRE2Ctd7U5PceNP7yOK/OuxC9Ptb2GvFys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ757h0MhkpWzoVdyjopixaAWRvvCbsZ1lphRKbEJSTnsQDQMSDn9cZlVuyfnPceG0DnoFFUqwAgC6DBWKM+YvhaCVV6h/L76EfPcSHJSKra/2RSk/xNIpPV0V1/rFp9/28fGpthvc9z/W4R0utNdLl01rtnJJ/hUTmoN9bIrg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ej9wTnEc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ej9wTnEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763128244; x=1794664244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mWNK2hiG9QRE2Ctd7U5PceNP7yOK/OuxC9Ptb2GvFys=;
  b=ej9wTnEcjnT2wcV0npK7SCX1xd5MS1sZOQU1epV+TL+kwGIzV2ISRKx4
   9NUb9lH7OWn6m6Q3CZn0HhU3wp+K+QIWqOVJjse1ij8HJXnqc4Vs2OoZS
   gPchjwL4bGcYQ8STt3N73Fqz/Sn1FpXdEHEjbbOr4FfWmW3M/orbpZT66
   3aO4V8ojyXwx98gg/9TCMUwx6yZ/GZq38n9T4PRotQ3gT2TftMlLGBfDQ
   AqZPiXXqCAQIGlomAoHBYwJTvjmqIgQCaLzwAoK4j3B2RNJ68dvdnkOq/
   Ezt4G99pfHocAr//5lQ7ave2XtyC4qFMDhwrUphZI7Jy+DcQDyDlxEblE
   A==;
X-CSE-ConnectionGUID: D0VvAbHvRoOCZaGK9jZbxw==
X-CSE-MsgGUID: ZcI7+aZfTXmtZDQ9KFOzxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65378436"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65378436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 05:50:43 -0800
X-CSE-ConnectionGUID: Cj15Y7jvT0SY+oo11AyNEg==
X-CSE-MsgGUID: bBeyauZDRmOWEQfgeovpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="220651214"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2025 05:50:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJuCE-0006d1-2c;
	Fri, 14 Nov 2025 13:50:38 +0000
Date: Fri, 14 Nov 2025 21:50:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rong Zhang <i@rong.moe>, Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support
 multiple Capability Data
Message-ID: <202511142143.WLGlvDdQ-lkp@intel.com>
References: <20251113191152.96076-4-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113191152.96076-4-i@rong.moe>

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ccec5944606ee1389abc7ee41986825c6ceb574]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/platform-x86-lenovo-wmi-helpers-Convert-returned-buffer-into-u32/20251114-032343
base:   2ccec5944606ee1389abc7ee41986825c6ceb574
patch link:    https://lore.kernel.org/r/20251113191152.96076-4-i%40rong.moe
patch subject: [PATCH v4 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
config: x86_64-randconfig-011-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142143.WLGlvDdQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511142143.WLGlvDdQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142143.WLGlvDdQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/lenovo/wmi-capdata.c:88:27: warning: cast to smaller integer type 'enum lwmi_cd_type' from 'void *' [-Wvoid-pointer-to-enum-cast]
      88 |         enum lwmi_cd_type type = (enum lwmi_cd_type)data;
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +88 drivers/platform/x86/lenovo/wmi-capdata.c

    78	
    79	/**
    80	 * lwmi_cd_match() - Match rule for the master driver.
    81	 * @dev: Pointer to the capability data parent device.
    82	 * @data: Type of the capability data (cast to enum lwmi_cd_type).
    83	 *
    84	 * Return: int.
    85	 */
    86	static int lwmi_cd_match(struct device *dev, void *data)
    87	{
  > 88		enum lwmi_cd_type type = (enum lwmi_cd_type)data;
    89		struct lwmi_cd_priv *priv;
    90	
    91		if (dev->driver != &lwmi_cd_driver.driver)
    92			return false;
    93	
    94		priv = dev_get_drvdata(dev);
    95		return priv->list->type == type;
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
