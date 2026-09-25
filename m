Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F734CE662;
	Fri, 25 Sep 2026 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360005; cv=none; b=bVS1W3/GUi5u71oRTMKy30pVCUHcOCSlJZ4jXuszUixETF6Zq3byv5uHJQaN9yF4V+L776zl0vWFwMAmR01uPe8aoS+al5ZEvWs/7yA15G+1HCb/Qo2nV91VFG8DaE9gC63Ilu9c4eYrfzQVt5fE4XYRWq7V8U0RzJh/bIbTCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360005; c=relaxed/simple;
	bh=URS6Hu0ava//dZgC/QuywmqTusydX5p3wGqktbcv4Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5Q4nr2HnDCG6EUborXhrUVI4JUV9QI5PLjtnXbBC5iEvFXlEJtOCSEeNZ08zpZI9bNhzvzfimmNrefh3UKCKbD8SAK5AcbohY7lFNkqoSVkEaKvPPlAG9RyHCFtx56Ry8hVrTGES8A75yViX+y8nF60GMT9zIX1imBvPuoyXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxTxceOw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxTxceOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790360003; x=1821896003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=URS6Hu0ava//dZgC/QuywmqTusydX5p3wGqktbcv4Rg=;
  b=YxTxceOwp63A/2wcbNdc+iXXBwB3Pnw5EuMdytHHxoYxoqxaiFEmDghC
   Tam9oKcIozc908u42YAf7B2X99fe33TST9Qm21hqiZqj35xUFrRHfhZ6h
   YHC0Ixv9U+7vQbLLOPL7BhafkZOdPkp0iDYIde9MRLSYtUiEH5JyqNCjU
   A4JYi3ykLtC9PQDXhWQoy1TY/MKiuKhnZZRbN01Fx9kbnNio8DCdcbr0a
   Y1tFv7EFhpMM90rYVVjfQq3+KiuL4ADyiZQCBqU3bqHrrH8qa1Tp8Be5c
   2EJFMizjU5JyD+mlZ/Sm+ErCpq0iao9P303pexMhv/YAsB3YU8oWkUFOF
   A==;
X-CSE-ConnectionGUID: +/AD6DkoS7iQtvC4OlrfaA==
X-CSE-MsgGUID: fucXcThiShe3Atw+up9Law==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93647096"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93647096"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 11:13:22 -0700
X-CSE-ConnectionGUID: ogdMag4SSveiIiNbKeek0A==
X-CSE-MsgGUID: 0qWPQ+dFSeu9Sl37iv8mcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273971799"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 11:13:23 -0700
Date: Fri, 25 Sep 2026 11:21:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 0/3] hwmon: (coretemp) Report unreliable temperature
 readings
Message-ID: <20260925182158.GA27122@ranerica-svr.sc.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <46f9f319-de71-412f-a424-6cb801478456@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46f9f319-de71-412f-a424-6cb801478456@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Sep 24, 2026 at 07:37:18PM -0700, Guenter Roeck wrote:
> On Thu, Sep 24, 2026 at 07:33:19PM -0700, Ricardo Neri wrote:
> > Hi,
> > 
> > Intel CPUs indicate in IA32_[PACKAGE]_THERM_STATUS whether the digital
> > thermal readout they expose is valid. coretemp deliberately ignores that
> > indication, for the reason given in commit bf6ea084ebb5 ("hwmon:
> > (coretemp) Do not return -EAGAIN for low temperatures"): some CPUs clear
> > it while the temperature is too low to be measured, and the value reported
> > in that state is more useful to userspace than an error would be.
> > 
> > The consequence is that userspace cannot distinguish a genuinely low
> > temperature from one the CPU could not measure. This series exposes the
> > indication through the standard hwmon temp%d_fault attribute, leaving
> > temp%d_input exactly as it is.
> > 
> > One user-visible effect is worth mentioning: sensors(1) prints FAULT in
> > place of the temperature when temp%d_fault reads 1. On a CPU that clears
> > the valid bit at low temperature, that core stops showing a number in the
> > default output, although sensors -u and -j still report it, as does
> > anything that reads temp%d_input from sysfs directly. A driver-custom
> > attribute name would avoid this, but would be invisible to generic tools.
> > Reporting the condition through the documented attribute looks like a
> > better option, but please say if you prefer otherwise.
> 
> I think it would be _much_ better to return -ENODATA for invalid readings.
> This isn't really a fault, after all. The sensor is not defective,
> it just can not provide valid data.
> 
> With -ENODATA the sensors command reports N/A for the temperature
> measurement, which I also think would be better than reporting FAULT.

Thank you for your feedback and for applying the other two patches!

Thank you for your feedback anf for applying the first two patches!

Userspace has seen a number in temp%d_input for over 12 years, and with
this change it would get an error on CPUs that clear the valid bit. I can
certainly implement returning -ENODATA; I just want to confirm you don't
see this as an issue for userspace.

Best,
Ricardo
