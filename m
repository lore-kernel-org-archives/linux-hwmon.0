Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902573ED127;
	Fri, 27 Feb 2026 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190666; cv=none; b=sEa0mnXXr7d6FLfIuNUMRJactbegpjv/nY+HCMTbSi3MNCI4ZNooRaQEUII68Dyr2aG7reqc3azAuKUCOuv2A0VPK63Hlx9YOG8+DPXKxS6JMUd9ANHfZBAw/Jq59bqJTo8lLPAQhaS1kVhIOh6uC7DSLfG6rCqvv9/tbXA0o5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190666; c=relaxed/simple;
	bh=yUQAxqIlsz966wGsDqvB1YhJnmBsPKUfDEivZFSts60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hrs9agdfL4XLNDC+GDD+5qo+g2mGk09nYgqabYKXZMNSYa/yZjmUv/i/2GSsjTXUZBI4Iqzasd6dvAE4Fkj/lCY9UnsO7fs6qIz309oUWziM0aA8Rffe15ZwSx5mMeyj/+GtbtQap8SEcHDnW5Fx+7We6tnXieAJD/dlAaZmy5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQxpYIyd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQxpYIyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772190665; x=1803726665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yUQAxqIlsz966wGsDqvB1YhJnmBsPKUfDEivZFSts60=;
  b=KQxpYIyd/GwJjl+Ek44e3Jt2zIBlQ8LJTlhKNGYSWhH69wDbO3d5ta7C
   Z53RbcssRCjDBAYx6h8Vc0a8flQ2E+v9bcDAhY8kLWAa29vuud0rkcCpE
   vrmpmr3ikGyGatK2tnsrbJrUODg7sx792CslZz0hPRozOn6RWLrpfxFpl
   7NwADyJcz7Yn1KF2PG2KXtRzOdJadt8J6CxuEi7TOywn1+CN1dSzXuNsl
   M9Vd51L+vaAOXoIeGVrXcXjIyIdtgVeLvtpQ90h9TEypnGKge9Vo29TaL
   T2W83gOSFu4njUS1ItUBL/xNcBdzx7Ya5p2ngNV++FaPa4SLX6+TUZVrd
   Q==;
X-CSE-ConnectionGUID: Zm/wTfa6R4+Rsx1/9URaJw==
X-CSE-MsgGUID: Yt4nizpUTtiCqLaxQS9AEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90674902"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="90674902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 03:11:04 -0800
X-CSE-ConnectionGUID: 6m0FN7VlTGKYlJFSScBnCA==
X-CSE-MsgGUID: G9KY5nb2S1OKBZgrxYq5VA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2026 03:10:54 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvvjU-00000000AUZ-0u4I;
	Fri, 27 Feb 2026 11:10:22 +0000
Date: Fri, 27 Feb 2026 18:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: Morduan Zang <zhangdandan@uniontech.com>,
	devnull+cryolitia.gmail.com@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	CoelacanthusHex@gmail.com, Cryolitia@gmail.com, corbet@lwn.net,
	jdelvare@suse.com, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@roeck-us.net, marcin@stragowski.com,
	Morduan Zang <zhangdandan@uniontech.com>
Subject: Re: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel
 ec_read/ec_write
Message-ID: <202602271850.wkrqotlH-lkp@intel.com>
References: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>

Hi Morduan,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Morduan-Zang/hwmon-gpd-fan-replace-custom-EC-I-O-with-kernel-ec_read-ec_write/20260227-105255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/53C09CAECC90EB98%2B20260227024945.151198-1-zhangdandan%40uniontech.com
patch subject: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel ec_read/ec_write
config: x86_64-randconfig-014-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271850.wkrqotlH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602271850.wkrqotlH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602271850.wkrqotlH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ec_read" [drivers/hwmon/gpd-fan.ko] undefined!
>> ERROR: modpost: "ec_write" [drivers/hwmon/gpd-fan.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
