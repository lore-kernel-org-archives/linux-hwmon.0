Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39B83A18
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Apr 2024 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342542; cv=none; b=K1fMY/q4q+Ykw05L9VldGaXlChue0XSruaTCHkA0KQUBP/WYa8f9DPqJaE0LCZMIJH8O1CZK/SwgMNM4HoPYcODm+sMzvsX7Bs0TbqyYj5fFrpTKjsXbd2Jlgf1gb7U3fewoitnL2WnArBckbFGgvat0BZnX1C8DMbt/JvT2AV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342542; c=relaxed/simple;
	bh=fLwc5QJKW9xWSzTV50z4nM9GSFcxa5YEMRBtnSrODm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYxm1OrfjSwKn44tVjCPCiZ399Skf/VqykWFXgvHEHpIj0ExYe16i3Qo6gLn+fKvbwdoftySrC+SKzCQyTTN7y85uSVWh0nvBWr0k1S7L0HyguMlj2zAI1+H+6d4jyHCTDeoPQ3hps7m+MjXy0/eJMK+ODXKuh3/Nz1PSdTiCXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1nOdFbP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1nOdFbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713342541; x=1744878541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fLwc5QJKW9xWSzTV50z4nM9GSFcxa5YEMRBtnSrODm8=;
  b=F1nOdFbPDVLSZ+e46MF5eAZKj8kmllqdj3tl+uc+6rTmztxBbP+to9w1
   SsmUpI6OOuo/GfMuUx1ulQpPYKNGZhbq7G6XruAzx7zKAHsrU1GTE07yk
   KBe48e84K8wGhHJXyiWSqMZ2d92+GUUGvjR2keGtrEz4aiQE/jZWHVGKk
   YKqVSAl0e4TTKdpImW4piIwoDMsEzTt6veZru9vXicvnQuC21nh/4rGyo
   qmL5Q35zVQoO4jUpdCHikZ8jhakyLDXKCs06rabImKNJdikn24ClYmH6T
   JNwbYh0zDmHfzwR1PNOHIHyJWxP5i5wfiHc2LX75E/qC10Jm0NNhLQ6yy
   g==;
X-CSE-ConnectionGUID: LuimjVSZTK+Zvats7CWRmw==
X-CSE-MsgGUID: SaFOMoS3Rb+EVOJ+4JcLHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19380791"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="19380791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:29:00 -0700
X-CSE-ConnectionGUID: pxGiJCywTGqYzrP6I/mu2g==
X-CSE-MsgGUID: Whn9xkY8QmOAwTSMPF0lHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27104397"
Received: from unknown (HELO intel.com) ([10.247.119.38])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:28:54 -0700
Date: Wed, 17 Apr 2024 10:28:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	Badal Nilawar <badal.nilawar@intel.com>,
	Ville =?iso-8859-15?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/i915/hwmon: Get rid of devm
Message-ID: <Zh-IQENH0hHokBbv@ashyti-mobl2.lan>
References: <20240417051642.788740-1-ashutosh.dixit@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417051642.788740-1-ashutosh.dixit@intel.com>

Hi Ashutosh,

> @@ -839,16 +837,38 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>  		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
>  			continue;
>  
> -		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
> -								 ddat_gt,
> -								 &hwm_gt_chip_info,
> -								 NULL);
> -		if (!IS_ERR(hwmon_dev))
> -			ddat_gt->hwmon_dev = hwmon_dev;
> +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
> +							    ddat_gt,
> +							    &hwm_gt_chip_info,
> +							    NULL);
> +		if (IS_ERR(hwmon_dev))
> +			goto err;

here the logic is changing, though. Before we were not leaving if
hwmon_device_register_with_info() was returning error.

Is this wanted? And why isn't it described in the log?

Thanks,
Andi

> +
> +		ddat_gt->hwmon_dev = hwmon_dev;
>  	}
