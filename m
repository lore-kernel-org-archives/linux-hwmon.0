Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944463C2F
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2024 04:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725943823; cv=none; b=ruPK8EejMDCZC9DQqRoV3LGekIA58+B0C/afVGBAawTO9Y+7XrTxNOtFOpmt3uA87jYuU1Pdf2M2SoAPriXqIY26OV8IfS86qWzKtgpl8nQM2/0qV+8Bs67ecfEMd6/LGNPRcuhvVc4vtQ2FftBX5Cq2d3bMT2qNEm/F+7u4SKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725943823; c=relaxed/simple;
	bh=l5nzl3UiU4kQOiDK8BBK5kbTQqqyJIIWoPEgwGbWiS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JniRXgTffEFLadwUkxMvt0mM8Wxn90fGpzvYlTPU7RLTWUL8x6zHqhZ8cuYBoZzLEBPqjSja9SIqEDDB5tI29Lrg0OONviqKkspEVswTVlbpapEE3jWRaj0FT+5pSOowMvB+OwSwzy//39N0eYHLmORwDoHuYfgqWjSnjBPUsFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXFFEWOz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXFFEWOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725943821; x=1757479821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l5nzl3UiU4kQOiDK8BBK5kbTQqqyJIIWoPEgwGbWiS8=;
  b=JXFFEWOzc44MadqqQh33zwe9rMI2D6PF+3uXXbyUQcIUVz4ACQiX8Z27
   uRv2X7BbU0XwN3eURCiwUcB3LC9NT2oWMnPPGTZvR+xNiD9+YNW4CmiWG
   TRq5VyADtAXiy1vHa/dGHQdXkE14tAz/5GwLrCn9ENzZ3oC/EomFxOykx
   Vtu0XF+9E9lX6uub0SGVteFHTng4yZzGe0/nru+W/fHBXSO+51JBkqjT2
   Uf/t1CVL+GoKKoeQ2Iq9eyoCmYdsH/FrD0D3GrTIoFB7qaJnZIyNWoeoJ
   mW2VNPUtQaiGUfrvXi+JvvBK+ki6oVe7qNqrz4GUag2sSYTzuTihqQlGF
   w==;
X-CSE-ConnectionGUID: FqcKy5UqQVaJfPbg/8Nopg==
X-CSE-MsgGUID: 7X+urGsOQoORrtY/1wpjLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35264952"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="35264952"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 21:50:20 -0700
X-CSE-ConnectionGUID: ELYHc6Q9S5KFdGmbPTkc0w==
X-CSE-MsgGUID: krA60JhASdyXqmw9dWh8/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67642543"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 21:50:16 -0700
Date: Tue, 10 Sep 2024 07:50:12 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tursulin@ursulin.net, linux@roeck-us.net,
	andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	anshuman.gupta@intel.com, badal.nilawar@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/i915/hwmon: expose package temperature
Message-ID: <Zt_QBM_qeAMGD1by@black.fi.intel.com>
References: <20240906093118.3068732-1-raag.jadav@intel.com>
 <ec2f4b09-03f7-4866-ae50-2f3b5d093a0d@intel.com>
 <Ztw4JIWCpsDpMHN0@black.fi.intel.com>
 <4nlwj725xkrb3zsulbehgqc7mpjjysnra3ep543ux5ewn7po4h@72psjd3dnw4v>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4nlwj725xkrb3zsulbehgqc7mpjjysnra3ep543ux5ewn7po4h@72psjd3dnw4v>

On Tue, Sep 10, 2024 at 12:27:16AM +0200, Andi Shyti wrote:
> Hi Raag,
> 
> > > > +	case hwmon_temp_input:
> > > > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > > > +
> > > > +		/* HW register value is in degrees, convert to millidegrees. */
> > > use millidegree Celsius here
> > 
> > The intent here is to signify the conversion rather than the unit.
> > But okay, will add if we have another version.
> 
> is Riana asking to improve the comment here? Then please do, if
> someone asks to make better comments it means that he is asking
> to answer to an open question that someone might have in the
> future.

To me this looks quite self documenting, but agree.

> Sending a v3 is not much of a work but improving the comment
> later is not trivial.

Already have it locally, was going to send out after you review :)

Raag
