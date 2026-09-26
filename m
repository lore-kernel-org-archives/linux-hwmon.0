Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF883876B7;
	Sat, 26 Sep 2026 03:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790394587; cv=none; b=Xp1HOa9527CAxjwaom4fVndos0Bbi83+NYnUc8i9bcv3F3y+yg3nQxknY4MB9jDhKNcxHGastovU1TNN40gARu7xuU4UjIjYehiehpVckGCKom1aOdHdFiRu8k+wCaxHVCO1zeSonDuwMjGyNw5DeafD8g66Wbz8U9QgtzWwH0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790394587; c=relaxed/simple;
	bh=uJIOl6MQOMizALJA/WIcN9GH8gvIhPXtISmRXPGsd1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rdxg729CRhOUQJp8Is4WNYIW7NEqExeogaZfO/lnmPadmKC+ZGomkOs6lvJE5A8pfW6gH7ZeMy/I3WYp/XXcmOJw0sQDA+0UAiiB82kUtI8oCjFJWjq7lh4vLf0Stz9CtzGisPJxZwXNvd0rvESh/2eJp8WqGwkspJtaDTpewGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsCuNaUw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsCuNaUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790394584; x=1821930584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uJIOl6MQOMizALJA/WIcN9GH8gvIhPXtISmRXPGsd1I=;
  b=bsCuNaUwwv2ukzZR7fZq5+yTE+h+HWYpQcNAAvG9oV0NlsxnRaJJUXVd
   2cdvLkavP3mVxmkivcaduz40criWNrakQ2bRgxZdMaJMZod6qAqpwgUQD
   K1SOwUhP01rHvyJGR/3tpV8O6LcAD3m5uVrI+s49nP+bFOc35cEXhGSKu
   Zp9VD5lNQ8rQJwnamc/jjkHfURDl0Srq2AP1FJUchNHeaRk0SFSGPOmQY
   igvLiHuytEqQpaKgYmNuDLDt7Ak/c0C5Z9Rh5VWPw5tlL0PY+AxMWpRpH
   hvU4NPvhD4tt3SBMqcPVm52R8DH2iNFvWJMrGa5mV7oc0rAYl3SZgVjnr
   g==;
X-CSE-ConnectionGUID: FtyvQaQ/SOaWgneeN3wmlw==
X-CSE-MsgGUID: WXFwcbGTSJugH7+r+oquOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93673369"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="93673369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:49:43 -0700
X-CSE-ConnectionGUID: xfxULKiITsaFNtIv+Y5F4w==
X-CSE-MsgGUID: 2e1oWw1SRGaxCvbsQmRgEQ==
X-ExtLoop1: 1
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:49:43 -0700
Date: Fri, 25 Sep 2026 20:58:19 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 0/3] hwmon: (coretemp) Report unreliable temperature
 readings
Message-ID: <20260926035819.GA27616@ranerica-svr.sc.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <46f9f319-de71-412f-a424-6cb801478456@roeck-us.net>
 <20260925182158.GA27122@ranerica-svr.sc.intel.com>
 <254a2bdb-c759-469d-a1bb-c10f476cebe0@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <254a2bdb-c759-469d-a1bb-c10f476cebe0@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Sep 25, 2026 at 02:23:49PM -0700, Guenter Roeck wrote:
> On Fri, Sep 25, 2026 at 11:21:58AM -0700, Ricardo Neri wrote:
> > On Thu, Sep 24, 2026 at 07:37:18PM -0700, Guenter Roeck wrote:
> > > On Thu, Sep 24, 2026 at 07:33:19PM -0700, Ricardo Neri wrote:
> > > > Hi,
> > > > 
> > > > Intel CPUs indicate in IA32_[PACKAGE]_THERM_STATUS whether the digital
> > > > thermal readout they expose is valid. coretemp deliberately ignores that
> > > > indication, for the reason given in commit bf6ea084ebb5 ("hwmon:
> > > > (coretemp) Do not return -EAGAIN for low temperatures"): some CPUs clear
> > > > it while the temperature is too low to be measured, and the value reported
> > > > in that state is more useful to userspace than an error would be.
> > > > 
> > > > The consequence is that userspace cannot distinguish a genuinely low
> > > > temperature from one the CPU could not measure. This series exposes the
> > > > indication through the standard hwmon temp%d_fault attribute, leaving
> > > > temp%d_input exactly as it is.
> > > > 
> > > > One user-visible effect is worth mentioning: sensors(1) prints FAULT in
> > > > place of the temperature when temp%d_fault reads 1. On a CPU that clears
> > > > the valid bit at low temperature, that core stops showing a number in the
> > > > default output, although sensors -u and -j still report it, as does
> > > > anything that reads temp%d_input from sysfs directly. A driver-custom
> > > > attribute name would avoid this, but would be invisible to generic tools.
> > > > Reporting the condition through the documented attribute looks like a
> > > > better option, but please say if you prefer otherwise.
> > > 
> > > I think it would be _much_ better to return -ENODATA for invalid readings.
> > > This isn't really a fault, after all. The sensor is not defective,
> > > it just can not provide valid data.
> > > 
> > > With -ENODATA the sensors command reports N/A for the temperature
> > > measurement, which I also think would be better than reporting FAULT.
> > 
> > Thank you for your feedback and for applying the other two patches!
> > 
> > Thank you for your feedback anf for applying the first two patches!
> > 
> > Userspace has seen a number in temp%d_input for over 12 years, and with
> > this change it would get an error on CPUs that clear the valid bit. I can
> > certainly implement returning -ENODATA; I just want to confirm you don't
> > see this as an issue for userspace.
> > 
> 
> Userspace should be able to handle error returns. That is not an ABI change.
> Even if the fault attribute was implemented, trying to read the temperature
> should still return an error.

Then it seems that the fault attribute is redundant.

> 
> On the other side, claiming that the sensor is faulty is, in my opinion,
> just wrong. It is not faulty, it just does not return valid data.

I see. I will implement returning -ENODATA and drop the temp%d_fault.

Best,
Ricardo
