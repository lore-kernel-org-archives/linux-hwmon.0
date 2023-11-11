Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD41FA4;
	Sat, 11 Nov 2023 01:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzV1vbSx"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C607F3C15;
	Fri, 10 Nov 2023 17:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699664699; x=1731200699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a/WYDyowvn/qeJxIudnok8S85/kUjh7Jm91z5RVre+A=;
  b=EzV1vbSxAVhNM9qBLOenwGik4mjpK1Xlux7O1gpyBZohH0ZzqCUwZAbB
   bKCyc6fRpi0d3y9CeeZWEdmhXCcDk0eGMDXBvLeHGhzp/JYd2cbmBxGKy
   dEj4mSfNFrA9GREEGu+cEgr44L0OsOvgLqUPEA3hOxyvuXxFNIinvDGFA
   AplpNvlRFztA1hArj4BAQhOfTboZAlzFqGcMvQej01vKf8iyLxJxSFqhE
   2galhw/H1VnhegrB+5rcK+sU4QudIyy8XM8QfiN+bgLTG02dzIIOpYUhO
   qI58q3cYnGOKIvrumUGkvKdd4Q5WopxKeWPcci539V15hP1vc4vghVujP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="3236764"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="3236764"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="5167067"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Nov 2023 17:04:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1cQf-000A6c-0P;
	Sat, 11 Nov 2023 01:04:53 +0000
Date: Sat, 11 Nov 2023 09:04:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, Nuno Sa <nuno.sa@analog.com>,
	Rob Herring <robh+dt@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <202311110850.BINBPMG5-lkp@intel.com>
References: <20231110151905.1659873-3-nuno.sa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110151905.1659873-3-nuno.sa@analog.com>

Hi Nuno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa/dt-bindings-hwmon-Add-LTC4282-bindings/20231110-232017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231110151905.1659873-3-nuno.sa%40analog.com
patch subject: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110850.BINBPMG5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110850.BINBPMG5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/ltc4282.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
