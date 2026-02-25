Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9084B2D780C;
	Wed, 25 Feb 2026 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051581; cv=none; b=gGOVcPasBI1M3vLXCBwYkY/YyC/v9w97sJY1+nWxUlj0+jBhabbVlKZx7AMAIMhVwlMDacGpSvZOWiZQD1z7BzjUOhNzxVJb6gu7Ynnmkp2xfyU/9YHk/k+6/Az5P2rvI4pGJncIovOjt+SMTKMbeW6wba9jwfDjUkzvHleqAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051581; c=relaxed/simple;
	bh=cMOFcYsIf7vYkht4roKoOIWdlNRy2CjH+GUs8sdYMU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/r9Kypkd0GJge47uVuQirZS1BrgGJjg4sy/9zFa510dRjGfunaip6C4uKkOncvg2yedsAOzkiShOzrxExFG4qaqYxeKIezVlD7OFO7Txm6DjA0eRiK8L7QCC7lQl1J0WhAWEFU0soT/WkOb7SzDXw7Z4QhVzCJdZn+2NZpm57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJR9XyGd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJR9XyGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772051580; x=1803587580;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cMOFcYsIf7vYkht4roKoOIWdlNRy2CjH+GUs8sdYMU0=;
  b=KJR9XyGdXDMDgMjcpHCKhwSHnA03f+ly8R7XQ04rvbiPrBbGrm1C9ZNc
   UTJLJSJ66aKoOrYwcoSSuKwBjyNYBpCTidixjhMZnj/dMEv7mT4H4lhG7
   p0rkjTQSN0nZpU0HYr4pBFbNFWKsIZ8GZC1vbm/h6wWoc9GzZIeWZRLMP
   LJLs5uuLQRyqGAzXeBj9eagXhFFZnmNTL2yffcsbwg91Y/PYaJ6YK13td
   3tWCaA+XkMufj1X2QVBL4ef+hqbQO2t3xDabaHpyp7+yIcF63cr22q9sg
   09Swyg7MgG0FzpMazYZNkZg3PDtFLwwnONNS4YnVw41esrGByP2JC6bxr
   w==;
X-CSE-ConnectionGUID: 8+h0tOtJTmunhoGT8dErfg==
X-CSE-MsgGUID: XM9No1+OQuOySszl1RG28A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73209039"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73209039"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 12:32:59 -0800
X-CSE-ConnectionGUID: A7j05I9JSYGROixWI/IkOw==
X-CSE-MsgGUID: /PDDTgL7RriDFFUsPJkh4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220969742"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Feb 2026 12:32:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvLWj-000000007G1-2nwQ;
	Wed, 25 Feb 2026 20:31:13 +0000
Date: Thu, 26 Feb 2026 04:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Charkov <alchark@flipper.net>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Charkov <alchark@flipper.net>
Subject: Re: [PATCH 2/2] hwmon: Add support for TI INA4230 power monitor
Message-ID: <202602260418.XKPUlQmZ-lkp@intel.com>
References: <20260225-ina4230-v1-2-92b1de981d46@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-ina4230-v1-2-92b1de981d46@flipper.net>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-bindings-hwmon-Add-DT-schema-for-TI-INA4230/20260225-173657
base:   3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
patch link:    https://lore.kernel.org/r/20260225-ina4230-v1-2-92b1de981d46%40flipper.net
patch subject: [PATCH 2/2] hwmon: Add support for TI INA4230 power monitor
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260226/202602260418.XKPUlQmZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260418.XKPUlQmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260418.XKPUlQmZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/hwmon/ina4230.o: in function `ina4230_set_calibration':
>> ina4230.c:(.text.ina4230_set_calibration+0x584): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
