Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E546818756D
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Aug 2024 13:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853549; cv=none; b=jylmOrh7wwYtnE3CzbAgYzxKo/jKhxX3880oxlsPB7eUK0jkEnkGyC9XTREUmlOE3zoFE/gE0yxgVEWKeSt1vaCkJP5yKLW6y89vWyzLNeC+Ma8IkOlc63896LOxNa2TiQk0QLbrr3TNnsLZDYDck+xHB2aydwr6MbBR1Bk90bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853549; c=relaxed/simple;
	bh=kan6d686HRJfbX7VJOr/HJFs2M3D5PnUfEtaJKd2vic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuvdBcp/b4nkMffyybWKDP8YHIrbDTMDGPT9Cm6LDH9bXiaRxy3f+9K9yeFvVtlGE3c3zajYxqYfu4jTfLfALgOzg13MRCM3nDzl5zQdSpFrpeUwRtXrPEOAkfekBZ0xukrA13sByyDjpEvY/q3ba9NoZ+s87PgIAERLrntTwtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iow7y/OP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iow7y/OP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724853547; x=1756389547;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kan6d686HRJfbX7VJOr/HJFs2M3D5PnUfEtaJKd2vic=;
  b=iow7y/OPZgoUD77GeGHRsxi1GAUZbUbyNcy4Vp6x9AS1Ll3YcqO5rNNR
   J7aWVPLzihhjFOvm7g5ItvPFPwkHhgsN8nR1Bx9hTuSYEwnQI1kXV9Xhu
   RwZWFbYA9/dwmjfLt3wsHCrtoUORq9PFUu2q2WLBCVMaX5McRASU85wIY
   nDXdLHHShdNqJQgHHb0h6cGMtnPIY+x+3/oolq9HONrvwxvG+OXrUEk78
   6fvfjGmg0uGtmh1JymxYlEPZLS/RZJu5BwiEYan0FNdsqK4d4zaHmZ7pY
   ukLoLiJD1GcaagOPQ5smOD5p3cI/STQOHc1iLMC3VSmhlzkYE+liFxgGO
   A==;
X-CSE-ConnectionGUID: HcVjxHKwSz24S9Ov99//Cw==
X-CSE-MsgGUID: nOYXkQR0SDKI+9dfs0vT8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23544453"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23544453"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:59:07 -0700
X-CSE-ConnectionGUID: zU2Nwz+lRBim/X02Z3bLpg==
X-CSE-MsgGUID: rdXY8NsYT4GzxBBV2Qlb1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="68120913"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 06:59:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sjJCP-00000002fGc-0W7N;
	Wed, 28 Aug 2024 16:59:01 +0300
Date: Wed, 28 Aug 2024 16:59:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net,
	andi.shyti@linux.intel.com, intel-gfx@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, anshuman.gupta@intel.com,
	badal.nilawar@intel.com, riana.tauro@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/i915/hwmon: expose package temperature
Message-ID: <Zs8tJNV8ATILvmmA@smile.fi.intel.com>
References: <20240828044512.2710381-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240828044512.2710381-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Aug 28, 2024 at 10:15:12AM +0530, Raag Jadav wrote:
> Add hwmon support for temp1_input attribute, which will expose package
> temperature in millidegree Celsius. With this in place we can monitor
> package temperature using lm-sensors tool.
> 
> $ sensors
> i915-pci-0300
> Adapter: PCI adapter
> in0:         990.00 mV
> fan1:        1260 RPM
> temp1:        +45.0°C
> power1:           N/A  (max =  35.00 W)
> energy1:      12.62 kJ

...

> +static umode_t
> +hwm_temp_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +
> +	if (attr == hwmon_temp_input && i915_mmio_reg_valid(hwmon->rg.pkg_temp))
> +		return 0444;
> +
> +	return 0;

Just a question (I'm fine with this implementation): is the style in this file
to check for correct cases first and return an err/etc at the end?

> +}
> +
> +static int
> +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 reg_val;
> +
> +	if (attr == hwmon_temp_input) {
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> +
> +		/* HW register value is in degrees, convert to millidegrees. */
> +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> +		return 0;
> +	}

...because here we may drop an indentation level by doing it opposite

	if (x != y)
		return -E...;

	...

> +	return -EOPNOTSUPP;
> +}

-- 
With Best Regards,
Andy Shevchenko


