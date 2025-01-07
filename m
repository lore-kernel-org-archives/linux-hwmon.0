Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEEC1F2C41;
	Tue,  7 Jan 2025 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269726; cv=none; b=XzyPr2n9LxtJ/tLqs7A55XUoHOSIVa/VbSwzQa4Tknt4UqK5tuOyZQRQT6fO/XkhkuDyuNllnCFVFErW4ug+SxCOHKAdeTyiljGjZ/qK/2YaPTItHNRFGbjughxhyn9RmpbpyRI/hNm3NScer8RyJ6zWCDoA38Z/RH3eWh1oa1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269726; c=relaxed/simple;
	bh=2N37pvqY9JtK82ffSrxBCtwOdMjgx5xq3c2IXnVUeUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqpma0ycGnDP0375aguH7Qx1WCwqAtdlPJea8b74WI9zkfinm+YoW+K5esdue1vpKSQjHInjYK2Klitge3YR5R2F24ZfkKeOKJNCNZoUWc8I9RJxoAE6qtXaxk4J/tX8f/6ihEfdmzyIg310Q7awFF+lISBDr5uv+m1DV6jWkHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHSQq9NE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHSQq9NE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736269724; x=1767805724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2N37pvqY9JtK82ffSrxBCtwOdMjgx5xq3c2IXnVUeUo=;
  b=XHSQq9NEHM9lp+c6G9axfftfgRZI9ymdAgJynd/6F+KRj7tdDFGQZtxT
   /uHEpHkchq+3dFIJFLjI7NlhmL5gHTCpzVkSPBlBZ3GgDT6XEO1Z8RKuR
   CV6RGPI2d4N2pHpvWJY+RQDrGyKGPccQ/c5yx5CRSBIhjA46cvCiLWtfk
   9SXXpz/EFzbDe0E+DMDJxTHNZOv7sKoqJdSOkuYkFZHxkaGMKok0dUegC
   8WujHnXkfpMqWBGAgNRIHh4Zmhz/RcE7baEOh/UQeXuDiTWTR+jwHNIZZ
   0NasKZjkTHVtfiWOedx8Xm0QQ9hd9jcyfqZE435oDv1y4YzZZe0MMfnaE
   Q==;
X-CSE-ConnectionGUID: rNUDsYuSTJOAjVha5lHWKA==
X-CSE-MsgGUID: esxULo9HQEitRYPxJRIWpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36357616"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36357616"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:08:43 -0800
X-CSE-ConnectionGUID: htf44ynhTIS0GikYRtGobg==
X-CSE-MsgGUID: YXpfGKs7RKC5x79pnAkopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103025289"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 09:08:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVD4H-000F1b-2x;
	Tue, 07 Jan 2025 17:08:37 +0000
Date: Wed, 8 Jan 2025 01:08:09 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yang <leo.yang.sy0@gmail.com>, jdelvare@suse.com,
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Leo-Yang@quantatw.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power
 Monitor
Message-ID: <202501080011.H8YAGThn-lkp@intel.com>
References: <20250106071337.3017926-3-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106071337.3017926-3-Leo-Yang@quantatw.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc6 next-20250107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yang/dt-bindings-Add-INA233-device/20250106-151934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250106071337.3017926-3-Leo-Yang%40quantatw.com
patch subject: [PATCH 2/2] hwmon: Add driver for TI INA233 Current and Power Monitor
config: csky-randconfig-r131-20250107 (https://download.01.org/0day-ci/archive/20250108/202501080011.H8YAGThn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250108/202501080011.H8YAGThn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080011.H8YAGThn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/pmbus/ina233.c:93:26: sparse: sparse: symbol 'ina233_info' was not declared. Should it be static?

vim +/ina233_info +93 drivers/hwmon/pmbus/ina233.c

    92	
  > 93	struct pmbus_driver_info ina233_info = {
    94		.pages = 1,
    95		.format[PSC_VOLTAGE_IN] = direct,
    96		.format[PSC_VOLTAGE_OUT] = direct,
    97		.format[PSC_CURRENT_OUT] = direct,
    98		.format[PSC_POWER] = direct,
    99		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_INPUT
   100			| PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
   101			| PMBUS_HAVE_POUT
   102			| PMBUS_HAVE_VMON | PMBUS_HAVE_STATUS_VMON,
   103		.m[PSC_VOLTAGE_IN] = 8,
   104		.R[PSC_VOLTAGE_IN] = 2,
   105		.m[PSC_VOLTAGE_OUT] = 8,
   106		.R[PSC_VOLTAGE_OUT] = 2,
   107		.read_word_data = ina233_read_word_data,
   108	};
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
