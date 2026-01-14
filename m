Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF2637FF47;
	Wed, 14 Jan 2026 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380705; cv=none; b=I7Hmu8yKkxoXSi8kRk2l6MdIHaf5b5ij9HNBbI8V1/GYaojQIbuiQxbJLo7ncI8upnlW4aACZmyR2Wm+OKKcdqyvRgUL++1f07JMPLi8WbljKRDcK1n1p8X9xGu5/XpE9WseTbf7i76/lOxE1fb9xddj75Z2gy62+hKXVnn0oUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380705; c=relaxed/simple;
	bh=MiqYC275tot1mJjDwI+973ULDxCYSEGTOa4QrdA/6PE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qs9UCFoifbXRw2IMnZNHS7iuAUkYbNw1cJhm8YxyzSIjNe6jCi6/PqEZpHAko6rN6cZ+ObutwP3vStWfH2h1Wg6ViP6qCJifU7hdEwwIbVU5mU9q9BhJN1dJ0foT9RreBxHT44Ss2SDA81bPIMznqoqy49ScRI3ow1qABeEEW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMd6V+mR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMd6V+mR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768380703; x=1799916703;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MiqYC275tot1mJjDwI+973ULDxCYSEGTOa4QrdA/6PE=;
  b=UMd6V+mRVwSBkJ9SJtMOl2h6kH+IQjzoC4fiveYyTFSVtWACG4n7PplN
   rGlspW7cP9kavPMamOvM4cZCfHzcB9mcQiZjmKZ2Il9ltntIVKIzRSuUd
   e5ggckSk/fn2B6CsVjN35H+FmN/rKZDoc0pvGoqXJwmCsNk8d7baxYrCd
   QoiUM91ozeqpkvj+JX7IW1YRGY1RGxDuDwMl2sArVJ/OyJlkMlXDKD5tZ
   Wnryivl5PGku2YoeF5kvEXlx7PzShIInnriL0rsWwY4KWsKmqiBQWoPv6
   1g96COnPgWnTKZDn9iTSzT9YVwHiN23gBBV2C6EDMIG2ROn+NRyCspnEf
   Q==;
X-CSE-ConnectionGUID: La5O6z7ZSACFI/8NDdS7iA==
X-CSE-MsgGUID: rl0bi5xiTsuDBTKl5QD8TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95150934"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="95150934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:51:41 -0800
X-CSE-ConnectionGUID: KVGGSkB3T/miD90YUnm7ug==
X-CSE-MsgGUID: fAOryuHjQP6n1QXzQlFpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209466097"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.107])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:51:37 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Jan 2026 10:51:34 +0200 (EET)
To: kernel test robot <lkp@intel.com>
cc: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, oe-kbuild-all@lists.linux.dev, 
    Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v8 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support
 multiple Capability Data
In-Reply-To: <202601140833.WJ1oZKuV-lkp@intel.com>
Message-ID: <55186ed3-bf74-6c34-1350-51046306083a@linux.intel.com>
References: <20260113172817.393856-4-i@rong.moe> <202601140833.WJ1oZKuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jan 2026, kernel test robot wrote:

> Hi Rong,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on b71e635feefc852405b14620a7fc58c4c80c0f73]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Zhang/platform-x86-lenovo-wmi-helpers-Convert-returned-buffer-into-u32/20260114-013537
> base:   b71e635feefc852405b14620a7fc58c4c80c0f73
> patch link:    https://lore.kernel.org/r/20260113172817.393856-4-i%40rong.moe
> patch subject: [PATCH v8 3/7] platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability Data
> config: x86_64-buildonly-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140833.WJ1oZKuV-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140833.WJ1oZKuV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601140833.WJ1oZKuV-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 function parameter '_cdxx' not described in 'DEF_LWMI_CDXX_GET_DATA'
> >> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 function parameter '_cd_type' not described in 'DEF_LWMI_CDXX_GET_DATA'
> >> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 function parameter '_output_t' not described in 'DEF_LWMI_CDXX_GET_DATA'
> >> Warning: drivers/platform/x86/lenovo/wmi-capdata.c:168 expecting prototype for _get_data(). Prototype was for DEF_LWMI_CDXX_GET_DATA() instead

These are quite annoying. Could you make it non-kerneldoc by removing the 
second * from /**, so it won't trigger these warnings?

-- 
 i.

