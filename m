Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D650D1865E5;
	Mon, 13 Jan 2025 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736793073; cv=none; b=nZ6eklgwi4nmlfByC25htxcTN24OjyCoStJIEPsVuj2KHNFd3N525yS73kkxg47Nx6xNtZCnOQj0FtD/qnNI7jJPgThrqM2rX6QiMUZpDmHkn9ovr/kNw5phEkHD2d+pBuxzvKyywWol2SIn2QrnRdHN8xyYeG3Ts+uSnLjPGus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736793073; c=relaxed/simple;
	bh=lt0vIoFTnMCQOVSvLsv+sck7u8dfFDzlpFeDubHafro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4vHIx0MMJkuzRJWO/M2+MPyxktTR2FsrVdNzGhRW0Ckely1M/GyhvVSL0TLwM5/mrstInGyDPcopEPlJw0by/RO2xYZI1FGUgAqaYcWQJxnG4Lj27w/XTi9SPg3SsiAqDwSXjN4nyq/SQ0dNt3oWTwiuOsG+m7EbDynhsA+k24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jk5hD2RU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jk5hD2RU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736793072; x=1768329072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lt0vIoFTnMCQOVSvLsv+sck7u8dfFDzlpFeDubHafro=;
  b=jk5hD2RUnvvVqFScwOEGH8sOrBEpdf9BuE/n+3YFPQcNLjU9NN1EKxYo
   si3+nYrUyg/klpX3kxFBdHCo8fgLsIMbTCaZBQ2pb4ePE7DdMbWLUnTqs
   hsAvk07X1/2J0iS5pgKggYgcQHlgeLZMNxgEAp290j4G3BCYfi35N1vlg
   12fyKvCDhDi1jKlx2JAAycsVZ4X8vHvdp0O2NsA2RMdiJJvZUFLJb8lyF
   k67N8AqE15mQeYSNfjxxyu1DnHu3CyUAgPrh42wFwbGwepqivjgziYofE
   k4MPvCmdgYZGvdMxD7bUK4RR/CA1gLUMsaUZDEc8IcJQDsQVMBKAJzdyL
   A==;
X-CSE-ConnectionGUID: gR2IwBSjScWst0OONETQrw==
X-CSE-MsgGUID: FgCly3p5TGaGx5Ez9//kAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48452658"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48452658"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 10:31:12 -0800
X-CSE-ConnectionGUID: SRoEQ8AkQf2I0iJBEHFx9Q==
X-CSE-MsgGUID: 5Z6nm63bSKKR7VAE9srxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141838421"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 10:31:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXPDN-000NX4-2G;
	Mon, 13 Jan 2025 18:31:05 +0000
Date: Tue, 14 Jan 2025 02:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Wenliang Yan <wenliang202407@163.com>, linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
Message-ID: <202501140230.5s2Uytod-lkp@intel.com>
References: <20250113035023.365697-3-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113035023.365697-3-wenliang202407@163.com>

Hi Wenliang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.13-rc7 next-20250113]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenliang-Yan/dt-bindings-Add-SQ52206-to-ina2xx-devicetree-bindings/20250113-115457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250113035023.365697-3-wenliang202407%40163.com
patch subject: [PATCH v2 2/2] hwmon:(ina238)Add support for SQ52206
config: csky-randconfig-002-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140230.5s2Uytod-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140230.5s2Uytod-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140230.5s2Uytod-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from drivers/hwmon/ina238.c:9:
   drivers/hwmon/ina238.c: In function 'ina238_probe':
>> include/linux/compiler.h:55:26: warning: suggest explicit braces to avoid ambiguous 'else' [-Wdangling-else]
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                          ^
   drivers/hwmon/ina238.c:699:9: note: in expansion of macro 'if'
     699 |         if (chip == sq52206)
         |         ^~
   drivers/hwmon/ina238.c: In function 'ina238_is_visible':
>> drivers/hwmon/ina238.c:581:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
     581 |                 switch (attr) {
         |                 ^~~~~~
   drivers/hwmon/ina238.c:594:9: note: here
     594 |         case hwmon_temp:
         |         ^~~~


vim +581 drivers/hwmon/ina238.c

eacb52f010a807 Nathan Rossi 2021-11-02  552  
eacb52f010a807 Nathan Rossi 2021-11-02  553  static umode_t ina238_is_visible(const void *drvdata,
eacb52f010a807 Nathan Rossi 2021-11-02  554  				 enum hwmon_sensor_types type,
eacb52f010a807 Nathan Rossi 2021-11-02  555  				 u32 attr, int channel)
eacb52f010a807 Nathan Rossi 2021-11-02  556  {
f08436905922ae Wenliang Yan 2025-01-13  557  	const struct ina238_data *data = drvdata;
f08436905922ae Wenliang Yan 2025-01-13  558  	bool has_power_highest = data->config->has_power_highest;
f08436905922ae Wenliang Yan 2025-01-13  559  
eacb52f010a807 Nathan Rossi 2021-11-02  560  	switch (type) {
eacb52f010a807 Nathan Rossi 2021-11-02  561  	case hwmon_in:
eacb52f010a807 Nathan Rossi 2021-11-02  562  		switch (attr) {
eacb52f010a807 Nathan Rossi 2021-11-02  563  		case hwmon_in_input:
eacb52f010a807 Nathan Rossi 2021-11-02  564  		case hwmon_in_max_alarm:
eacb52f010a807 Nathan Rossi 2021-11-02  565  		case hwmon_in_min_alarm:
eacb52f010a807 Nathan Rossi 2021-11-02  566  			return 0444;
eacb52f010a807 Nathan Rossi 2021-11-02  567  		case hwmon_in_max:
eacb52f010a807 Nathan Rossi 2021-11-02  568  		case hwmon_in_min:
eacb52f010a807 Nathan Rossi 2021-11-02  569  			return 0644;
eacb52f010a807 Nathan Rossi 2021-11-02  570  		default:
eacb52f010a807 Nathan Rossi 2021-11-02  571  			return 0;
eacb52f010a807 Nathan Rossi 2021-11-02  572  		}
eacb52f010a807 Nathan Rossi 2021-11-02  573  	case hwmon_curr:
eacb52f010a807 Nathan Rossi 2021-11-02  574  		switch (attr) {
eacb52f010a807 Nathan Rossi 2021-11-02  575  		case hwmon_curr_input:
eacb52f010a807 Nathan Rossi 2021-11-02  576  			return 0444;
eacb52f010a807 Nathan Rossi 2021-11-02  577  		default:
eacb52f010a807 Nathan Rossi 2021-11-02  578  			return 0;
eacb52f010a807 Nathan Rossi 2021-11-02  579  		}
eacb52f010a807 Nathan Rossi 2021-11-02  580  	case hwmon_power:
eacb52f010a807 Nathan Rossi 2021-11-02 @581  		switch (attr) {
eacb52f010a807 Nathan Rossi 2021-11-02  582  		case hwmon_power_input:
eacb52f010a807 Nathan Rossi 2021-11-02  583  		case hwmon_power_max_alarm:
eacb52f010a807 Nathan Rossi 2021-11-02  584  			return 0444;
eacb52f010a807 Nathan Rossi 2021-11-02  585  		case hwmon_power_max:
eacb52f010a807 Nathan Rossi 2021-11-02  586  			return 0644;
f08436905922ae Wenliang Yan 2025-01-13  587  		case hwmon_power_input_highest:
f08436905922ae Wenliang Yan 2025-01-13  588  			if (has_power_highest)
f08436905922ae Wenliang Yan 2025-01-13  589  				return 0444;
f08436905922ae Wenliang Yan 2025-01-13  590  			break;
eacb52f010a807 Nathan Rossi 2021-11-02  591  		default:
eacb52f010a807 Nathan Rossi 2021-11-02  592  			return 0;
eacb52f010a807 Nathan Rossi 2021-11-02  593  		}
eacb52f010a807 Nathan Rossi 2021-11-02  594  	case hwmon_temp:
eacb52f010a807 Nathan Rossi 2021-11-02  595  		switch (attr) {
eacb52f010a807 Nathan Rossi 2021-11-02  596  		case hwmon_temp_input:
eacb52f010a807 Nathan Rossi 2021-11-02  597  		case hwmon_temp_max_alarm:
eacb52f010a807 Nathan Rossi 2021-11-02  598  			return 0444;
eacb52f010a807 Nathan Rossi 2021-11-02  599  		case hwmon_temp_max:
eacb52f010a807 Nathan Rossi 2021-11-02  600  			return 0644;
eacb52f010a807 Nathan Rossi 2021-11-02  601  		default:
eacb52f010a807 Nathan Rossi 2021-11-02  602  			return 0;
eacb52f010a807 Nathan Rossi 2021-11-02  603  		}
eacb52f010a807 Nathan Rossi 2021-11-02  604  	default:
eacb52f010a807 Nathan Rossi 2021-11-02  605  		return 0;
eacb52f010a807 Nathan Rossi 2021-11-02  606  	}
eacb52f010a807 Nathan Rossi 2021-11-02  607  }
eacb52f010a807 Nathan Rossi 2021-11-02  608  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
