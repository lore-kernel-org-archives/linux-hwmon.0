Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA112139A1;
	Thu,  9 Jan 2025 05:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736399201; cv=none; b=CK3c3Ll5cD2IJpQo60n4TYNhF5JVsRYqCg7TqGoN47xR9LIwdulWsJ0xrlH7VFDy1JI/mRvca1p2L4oV0H6/SmOJJsMbCeI1xgs6p3nQP6dwcP9bwfhCVdr+MLH+enWGVl9SPp6r+OZbOL/OcbUmgAshCV/VIdYCaURGJsftlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736399201; c=relaxed/simple;
	bh=CtGctgHU9yLvubsT9bMm0yStuOWITuMnMgbPCQ9TtW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVu6O1m4QIKLRrkrs3Up8aopfF0wc5osmZGUlXDFIDedsKGgCislTQt2irS9Wv3TKJDyBy+5QdFXZN6TkZI8neL0wYFzRdi/wahlAOVgYoOA2qG39KG+r8Li4AIDi6Kdt291+UzGr+WLPqGOIskbvJdHbQ1AgGF1khQGA+pDhKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9fqrVSg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9fqrVSg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736399200; x=1767935200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CtGctgHU9yLvubsT9bMm0yStuOWITuMnMgbPCQ9TtW8=;
  b=T9fqrVSgBbGMKPExY/l9LWsVufqMHGeND0TeYG3atbguAl43g+P3ApyN
   5wnXj36eeJS2+gpRGFwL416EUqr6PwbxG1PEhOJSRSCRP4x80Ih/2QtJQ
   gaEIIEZ6x6skW8p87Wh05h373E8OyOO2BtcmMTPlcx7J0o+Ijt3APJDKT
   WZSOcUbyqHuNnnxots1k+wshPtCS4qqffQSdpDo5bNOamAnQ1OJFJKc6Y
   +YSE/OZCpGu8LnnP88lH08G3yqzw3YPVWmijXfmW6T9/DL94Tc40UhDHw
   N2ilFa4pGLMdKcG0h9rGd+KfZPP3Z7YKuMy2H19n+Pk7Lmq89TJ7J9rJh
   A==;
X-CSE-ConnectionGUID: cg93iW7kSNWSpVC/R0kLCw==
X-CSE-MsgGUID: 8AicqMy2Ss2Qk/8h9clheA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36340334"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36340334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 21:06:39 -0800
X-CSE-ConnectionGUID: h4Hq8411SWS6j/HUs6rxIQ==
X-CSE-MsgGUID: xTEzb9jUT/u/CW+2t7y7KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="103801982"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 21:06:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVkkb-000H4J-0s;
	Thu, 09 Jan 2025 05:06:33 +0000
Date: Thu, 9 Jan 2025 13:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/3] hwmon: (max31827) refactor enum chips to chip info
Message-ID: <202501091228.9APcsnSs-lkp@intel.com>
References: <20250108082531.15467-2-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108082531.15467-2-johnerasmusmari.geronimo@analog.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on adc52dd4078067fabf1431036ba180eafd8a7eee]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Erasmus-Mari-Geronimo/hwmon-max31827-refactor-enum-chips-to-chip-info/20250108-162739
base:   adc52dd4078067fabf1431036ba180eafd8a7eee
patch link:    https://lore.kernel.org/r/20250108082531.15467-2-johnerasmusmari.geronimo%40analog.com
patch subject: [PATCH 1/3] hwmon: (max31827) refactor enum chips to chip info
config: hexagon-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250109/202501091228.9APcsnSs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501091228.9APcsnSs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501091228.9APcsnSs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/max31827.c:93:40: warning: tentative definition of variable with internal linkage has incomplete non-array type 'const struct max31827_chip_info' [-Wtentative-definition-incomplete-type]
   static const struct max31827_chip_info max31827;
                                          ^
   drivers/hwmon/max31827.c:93:21: note: forward declaration of 'struct max31827_chip_info'
   static const struct max31827_chip_info max31827;
                       ^
   drivers/hwmon/max31827.c:94:40: warning: tentative definition of variable with internal linkage has incomplete non-array type 'const struct max31827_chip_info' [-Wtentative-definition-incomplete-type]
   static const struct max31827_chip_info max31828;
                                          ^
   drivers/hwmon/max31827.c:93:21: note: forward declaration of 'struct max31827_chip_info'
   static const struct max31827_chip_info max31827;
                       ^
   drivers/hwmon/max31827.c:95:40: warning: tentative definition of variable with internal linkage has incomplete non-array type 'const struct max31827_chip_info' [-Wtentative-definition-incomplete-type]
   static const struct max31827_chip_info max31829;
                                          ^
   drivers/hwmon/max31827.c:93:21: note: forward declaration of 'struct max31827_chip_info'
   static const struct max31827_chip_info max31827;
                       ^
   drivers/hwmon/max31827.c:96:40: warning: tentative definition of variable with internal linkage has incomplete non-array type 'const struct max31827_chip_info' [-Wtentative-definition-incomplete-type]
   static const struct max31827_chip_info max31875;
                                          ^
   drivers/hwmon/max31827.c:93:21: note: forward declaration of 'struct max31827_chip_info'
   static const struct max31827_chip_info max31827;
                       ^
   drivers/hwmon/max31827.c:602:1: error: expected expression
   static const struct max31827_chip_info max31829 = {
   ^
   drivers/hwmon/max31827.c:677:23: error: expected '}'
   MODULE_LICENSE("GPL");
                         ^
   drivers/hwmon/max31827.c:598:51: note: to match this '{'
   static const struct max31827_chip_info max31828 = {
                                                     ^
   drivers/hwmon/max31827.c:677:23: error: expected ';' after top level declarator
   MODULE_LICENSE("GPL");
                         ^
                         ;
   4 warnings and 3 errors generated.


vim +93 drivers/hwmon/max31827.c

    91	
    92	struct max31827_state;
  > 93	static const struct max31827_chip_info max31827;
    94	static const struct max31827_chip_info max31828;
    95	static const struct max31827_chip_info max31829;
    96	static const struct max31827_chip_info max31875;
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
