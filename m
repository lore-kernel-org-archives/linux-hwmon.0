Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4DD41754;
	Fri, 20 Feb 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771598583; cv=none; b=BVbvr4oDB5SmSuggfrfTdl6L3B5BvyxlV/sQpjTdA52mpoqxoB48hWaCCXpUrVmD5GBB6OwRCaR8AuOwLMTbTFfoNq3h6PFV4LtpryLtlobcAmwo9Gw0mlq7wSq7UNpjqUBxlNJfTLcD9Fd2YngDXZsFJjrikzmEVf7+izW3wdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771598583; c=relaxed/simple;
	bh=0IvU0+vL+S0ObfnRnzzuEwfOTQwE5YBDNEIOzu5Ldow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e07kt5BdmymerEC3jw2k0B9J/RDsW8FiBtOUdfb634HMI/iBfu96QYhfZ5XhXgqyE2nCN5swg77LnK4JozTCoQEsc9fskezzCXqAjscuSq6XLvDgZe2kiPHxgnCe2QKyoi0gRTJOpO4dBh6MGMUswV2fbbjmLlW4df7ynNvKZoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cme9t0PH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cme9t0PH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771598583; x=1803134583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0IvU0+vL+S0ObfnRnzzuEwfOTQwE5YBDNEIOzu5Ldow=;
  b=Cme9t0PHWfZvwBZRbFI7wW9DG8rm/IYXZ62Pxv0QH8ZY+F5Mqu70CrnL
   hhPpnbLbiYlLfwzs9UoI30Uq2hXBA37ZgeQS8QV3Cy/9+9vDKwphRy4+x
   mAMqARdg6WkyAQ9oM+h0V8tlZtJ3WBAUvp+UTKNLZ23pc2WD8BveW69zS
   Zm+2MQmTz/ETnlvbBCOZ3yVEnP5J+YC06wXjJzxxD5ntYGWEY/yoAxWUP
   sAgmFcwnj8dM/n+VZZSUTfDUfBVLzKwQk4uJWZ4ZTa6zPkY6LT06lrj8m
   ZAmW5qfObhfXp1x11kDmbRtT6YfNykjJdsrNgmJctfKQmbMEXshSvpHow
   A==;
X-CSE-ConnectionGUID: qL5xlh4DSniap2WdrtSQ6A==
X-CSE-MsgGUID: tSzhXlafQTaHjiaUMX3u5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72868093"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72868093"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 06:43:01 -0800
X-CSE-ConnectionGUID: HsgUCRDKTi6avQlF2oAluw==
X-CSE-MsgGUID: n4KTY0IaRtu2t7TIKj10Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214984483"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.25])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 06:42:59 -0800
Date: Fri, 20 Feb 2026 16:42:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1 1/1] hwmon (bt1-pvt) Remove not-going-to-be-supported
 code for Baikal SoC
Message-ID: <aZhy8L5oDLbU91ny@smile.fi.intel.com>
References: <20260220143611.2401353-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220143611.2401353-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 20, 2026 at 03:36:11PM +0100, Andy Shevchenko wrote:
> As noticed in the discussion [1] the Baikal SoC and platforms
> are not going to be finalized, hence remove stale code.

It seems the same message was sent twice. There are no differences at all
between them.

Please, use the first one
https://lore.kernel.org/r/20260220143500.2401057-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko


