Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7897015443F
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Sep 2024 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726217492; cv=none; b=EvP/d06yJsfO9mLU5HMiP0a4U8jpNg+xHCOWW/P6q726gkz3xs3VTFgpkEgeqlZ+mHSNYakajqJXsLoIn9COT+t3s7rxIzwCs0HbdlNEmq23N2+b5QZMxg9jxEv0/ITMCFKNhGVUZLQEbvKbyIraf2IVcJxLv1AkgkkyMPfIFYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726217492; c=relaxed/simple;
	bh=Kuou1UDIR8sRCsdCi3Dz03oGqiLyO92eLFhY9tNaFRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnZOA1U+MwLSEhkkwDpS3yaAuHgpfebdDL+t1zfPq6SXQfPZ6+pY6syEjuE1xBbC1SutZR98pcnyr8P8Ai0llCzCWegBGg0+tles4Pif6amkuZ0V0UqQtXPdJB5rRqHGFekCmQxAMVt0pFxD/rW3rxd/u4lkvJ4AYQPzUKVO1xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4qPj6Hu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4qPj6Hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726217490; x=1757753490;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Kuou1UDIR8sRCsdCi3Dz03oGqiLyO92eLFhY9tNaFRY=;
  b=J4qPj6Hu7vHii1nUYGAicX76IIfXxL7yzuvaUusqEXP2fd/iHH7O0lfl
   2p30b/999NzCgrySi2BjZ2NPxSGfMorZZIu+B3xd2XxjkFBJC7SF+KFTd
   h6zOCwCQ3FffakwZrQbgL0kETPsSa8mnQKsg+s28lneHFVUtaY6TCmBZG
   JSG28UoNugS2Wdz8Zsb7QOmYpEPlY+K/WVxMKT82Xyfh0funCVppFNXml
   +wi49CChUlujpAFswBhwIn8pCvafjWjwrZVYux6S+XYeeQTwcq29FyrxB
   mGg+iTBlJWoD9fObreUB0i2QZEFBIjcxlS6gQrl0bUjFaPNay5w5A87ID
   g==;
X-CSE-ConnectionGUID: KQMjkCWrQ+OstOcgc7mSng==
X-CSE-MsgGUID: NtKEfEX9QIqGZ4y9Vsxuog==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36488158"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="36488158"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:51:29 -0700
X-CSE-ConnectionGUID: pp7l4qToQl+QtMddyvZaIw==
X-CSE-MsgGUID: hIeNoAJUQgq30dUhb+FB9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72790718"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 01:51:26 -0700
Date: Fri, 13 Sep 2024 11:51:22 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, andi.shyti@linux.intel.com
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net,
	andriy.shevchenko@linux.intel.com, intel-gfx@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com,
	badal.nilawar@intel.com, ashutosh.dixit@intel.com,
	karthik.poosa@intel.com
Subject: Re: [PATCH v3] drm/i915/hwmon: expose package temperature
Message-ID: <ZuP9Cvd_LfJS_Yir@black.fi.intel.com>
References: <20240910105242.3357276-1-raag.jadav@intel.com>
 <b0eb87b5-e42d-4ab0-9d48-7ca07ef80708@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0eb87b5-e42d-4ab0-9d48-7ca07ef80708@intel.com>

On Fri, Sep 13, 2024 at 11:14:22AM +0530, Riana Tauro wrote:
> On 9/10/2024 4:22 PM, Raag Jadav wrote:
> > Add hwmon support for temp1_input attribute, which will expose package
> > temperature in millidegree Celsius. With this in place we can monitor
> > package temperature using lm-sensors tool.
> > 
> > $ sensors
> > i915-pci-0300
> > Adapter: PCI adapter
> > in0:         990.00 mV
> > fan1:        1260 RPM
> > temp1:        +45.0°C
> > power1:           N/A  (max =  35.00 W)
> > energy1:      12.62 kJ
> > 
> > v2: Use switch case (Anshuman)
> > v3: Comment adjustment (Riana)
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11276
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Looks good to me
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thank you :)

Andi, can you pick this one up? Anshuman's machine is down.

Raag
