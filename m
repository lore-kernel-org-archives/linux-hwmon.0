Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9083B175A7D;
	Sun, 29 Mar 2026 11:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774785173; cv=none; b=XXUhYdB3+vDA8da2p59uYB0hqqbFVtTxdVTT+ePy8wjn/4bDgIXN4mYhylfjmrKD1A9q5/bYVdGvfcgdwxzAFHfz6uCCNE9BnOl9pwpGQOTHCjVFIih3Cf9XN24C0k5LlZ9Nql6nSUW3oApvDhNEHfu4C+iQzMmCAYbcP9TQNgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774785173; c=relaxed/simple;
	bh=3c1zQGqevZbMkkqPPq3SzsklV8eKwzMaHogP/8yJ9K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rslaHBF4NNmPAGbObOQvWvbu27gps6534QETunJsBEV4zZmv3/olGTmdiAAbYBOY51OnUl3IOZeqeQsMbJsscqk0cgfxTHXCWl+F4WN3P1manYEI9uDSpdSeWlhwhTE1RRLLfIGDqUjFGCh9Bngac7B2ELroZTZPSxTd4xKZWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JuXfNxqY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JuXfNxqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774785170; x=1806321170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3c1zQGqevZbMkkqPPq3SzsklV8eKwzMaHogP/8yJ9K4=;
  b=JuXfNxqYAE2IEbFTDxiXnZ8IOrvjSRBSlfJIIKhsaJN/2oFc5jTcR+Ce
   8PTyPDCNtqps3GIwVwFcTXaAfcAmmFpyqZPZ6yC4XaBVV2I9+vB6dlyrr
   2k1iKUdQG/LH4Vzzld0LwWIE2h+6bEPIn/Gv3wvo4tGb1LAl8yNGjqfgc
   z99s2tnRos5PR7xdtmZ3idImW5iPoI+wgj3Am45tmzXYhA1cBj9TtBvuH
   a4FaaaKjVkYMEqr7g57uWejRx8SApZCmUaWkau76oeehS9FgCctJas5qp
   VSFPYVhyRgsBm4Adj5EwKupADhsojo+pPeY2yW5OdWCTl9oqu/NcaBfq7
   w==;
X-CSE-ConnectionGUID: TfGAeVIBSK6Y722X5lL8wg==
X-CSE-MsgGUID: lGWtPhduSly8b3lbGZeJng==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87182685"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="87182685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 04:52:50 -0700
X-CSE-ConnectionGUID: 3/vRv02JS7SbS8EXIkg0+g==
X-CSE-MsgGUID: O2OgY6tNQxGmrvNc1BgQGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="222476326"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Mar 2026 04:52:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ohB-00000000CKv-3C6N;
	Sun, 29 Mar 2026 11:52:45 +0000
Date: Sun, 29 Mar 2026 19:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Zhang <i@rong.moe>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Rong Zhang <i@rong.moe>
Subject: Re: [PATCH 4/4] hwmon: (witrn) Add monitoring support
Message-ID: <202603291947.CoxzmTCo-lkp@intel.com>
References: <20260327-b4-hwmon-witrn-v1-4-8d2f1896c045@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-b4-hwmon-witrn-v1-4-8d2f1896c045@rong.moe>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0138af2472dfdef0d56fc4697416eaa0ff2589bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/hwmon-Add-label-support-for-64-bit-energy-attributes/20260329-030139
base:   0138af2472dfdef0d56fc4697416eaa0ff2589bd
patch link:    https://lore.kernel.org/r/20260327-b4-hwmon-witrn-v1-4-8d2f1896c045%40rong.moe
patch subject: [PATCH 4/4] hwmon: (witrn) Add monitoring support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260329/202603291947.CoxzmTCo-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291947.CoxzmTCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291947.CoxzmTCo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__udivdi3" [drivers/hwmon/hwmon-fp.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/hwmon/hwmon-fp.ko] undefined!
ERROR: modpost: "__divdi3" [drivers/hwmon/witrn.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
