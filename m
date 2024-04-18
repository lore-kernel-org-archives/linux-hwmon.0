Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02613F443
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2024 21:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713477432; cv=none; b=QdHMNuN8VL4y4v3vIqN/fapU1yirGOj7iOv7JvsufkFhzGwb2B0DxjVsGAL6zwzi7yR6hVShHQra1PKoUE7F2pAtSvL6dHoEgUy0XiEWsHWgtyIaw3XHY0OlQdb5nyvbJF0bwwSvo+Qa8vPFx3V54R6tdLUX583g8/48vO+RurI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713477432; c=relaxed/simple;
	bh=YTAwvbMycwG5cb3j7vIP93lVwZ8xj4iKyrEBeO9eL4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMWWai8f+Ux3Ozg0uhGkdk1dP1R6Nn6EHsqWxEF0kxnn4U5R0q1nyNPyOkEFTs7E+ngaO85o+aM7xCMjsnAmYqp3qKRLvxceeP52O25m7iLAIS/mCSU3dA3HW98CFJlj/3yhAoigsimpN07QWPfZ7fx/ueh/TVnsSAqxLmWvd9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kc2y2rwn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kc2y2rwn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713477431; x=1745013431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YTAwvbMycwG5cb3j7vIP93lVwZ8xj4iKyrEBeO9eL4w=;
  b=Kc2y2rwnY8HfRxvDoj/cIjpGoRxPUisu6eBTPFvnWWjCTOpWIHRmPZ3v
   oU+Dgbrt9jf0kBQhFVrAfRLca0qtoE8QxTHcTFdQiwtwvvJwrhLfk6pxc
   vwu8gRh4S6z/uqXmnz5IO40of6jHhbltYK7lR+xtxgwsvu49JVVyFEDJR
   b32FZBMhq7JKuk4JTSc8df0eVoL9IGQQ9Gf5AA/8jKGU6xnnxiLRwVNBh
   U6f16fl2B0s0IvwvgJQAIOdpzkybk5ZjotZWYk2MfqntulYnZ645ct+K4
   1/LmGBWjoUE/NeDthmT8t2RqxgV0NPYR68Fd1DCsRmbYViwYyBWUITHQC
   g==;
X-CSE-ConnectionGUID: GMQUQoSOTcmXoilNp/rHfg==
X-CSE-MsgGUID: mjdEgIgGQv2Y2tOOOAHHBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19664976"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="19664976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:57:10 -0700
X-CSE-ConnectionGUID: 1BB1O1PHRtGMYYpDSinWww==
X-CSE-MsgGUID: RtenSBPEQoaLM7kXIE5B4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="46417112"
Received: from unknown (HELO intel.com) ([10.247.119.51])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 14:57:05 -0700
Date: Thu, 18 Apr 2024 23:56:58 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	Badal Nilawar <badal.nilawar@intel.com>,
	Ville =?iso-8859-15?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-hwmon@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/hwmon: Get rid of devm
Message-ID: <ZiGXKrheNEJlk56X@ashyti-mobl2.lan>
References: <20240417145646.793223-1-ashutosh.dixit@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417145646.793223-1-ashutosh.dixit@intel.com>

Hi Ashutosh,

On Wed, Apr 17, 2024 at 07:56:46AM -0700, Ashutosh Dixit wrote:
> When both hwmon and hwmon drvdata (on which hwmon depends) are device
> managed resources, the expectation, on device unbind, is that hwmon will be
> released before drvdata. However, in i915 there are two separate code
> paths, which both release either drvdata or hwmon and either can be
> released before the other. These code paths (for device unbind) are as
> follows (see also the bug referenced below):
> 
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_group+0xb2/0x110
> component_unbind_all+0x8d/0xa0
> component_del+0xa5/0x140
> intel_pxp_tee_component_fini+0x29/0x40 [i915]
> intel_pxp_fini+0x33/0x80 [i915]
> i915_driver_remove+0x4c/0x120 [i915]
> i915_pci_remove+0x19/0x30 [i915]
> pci_device_remove+0x32/0xa0
> device_release_driver_internal+0x19c/0x200
> unbind_store+0x9c/0xb0
> 
> and
> 
> Call Trace:
> release_nodes+0x11/0x70
> devres_release_all+0x8a/0xc0
> device_unbind_cleanup+0x9/0x70
> device_release_driver_internal+0x1c1/0x200
> unbind_store+0x9c/0xb0
> 
> This means that in i915, if use devm, we cannot gurantee that hwmon will
> always be released before drvdata. Which means that we have a uaf if hwmon
> sysfs is accessed when drvdata has been released but hwmon hasn't.
> 
> The only way out of this seems to be do get rid of devm_ and release/free
> everything explicitly during device unbind.
> 
> v2: Change commit message and other minor code changes
> v3: Cleanup from i915_hwmon_register on error (Armin Wolf)
> v4: Eliminate potential static analyzer warning (Rodrigo)
>     Eliminate fetch_and_zero (Jani)
> v5: Restore previous logic for ddat_gt->hwmon_dev error return (Andi)

Thanks!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
