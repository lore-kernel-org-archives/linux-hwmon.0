Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7781F1315;
	Thu, 19 Feb 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771511461; cv=none; b=QohvwGQgBO+E1FlPIkeBDS4liUZ4yJhvBJoPJZoRLNrRagbW/+loDny7F4HlVBvkuP75vBgANTV7bS3BpzxzXtPomnHidYWm1jaKCYNQMAObJLVqs7xAnVgg2wpZGds8lMFbtLirIpEL30UukAyRqTs7P7DXjh7eKCaJBHc1fbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771511461; c=relaxed/simple;
	bh=rBpoBcixdo3XXI5AYO9izJdZq6HBdIuS1mca5ggHAQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KyJ6l0O54H+vJUTN/VCi3J3pk2Z9vnKZgCc7KXUnD7F8qpq8+l0N+IU4lwfH474nKprRvg2l7Ct8vu727hwtez2l6NCeD/Sfj66PxHslj8+938CoOcTXhsBzoQsXl1+9eTayrtT2uwI5ZhdmWIMIDtSEdX/UG8+J//bGAchoQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PqPB7Xgm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PqPB7Xgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771511459; x=1803047459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rBpoBcixdo3XXI5AYO9izJdZq6HBdIuS1mca5ggHAQg=;
  b=PqPB7XgmWIt2uAvQtMLiPcjJopVvNZZlRi/CrxmB2enIqA/EYwqsKOmN
   oQDZJh29OxzG5IP04IcD4SzyaoY9dvrVCarsKPOmfyDT4/m6h7fjMEQ+M
   kpMREID7IdEujXGzQ2IlYDRllkDf8UtqqSvGOYh3w7nN6fUH0qGmHl6FV
   B9s2ZdOCcIOC0wWBsyZM4z9aM6THa4Sw5YRlcgh0b2s8cWRnEVBftdv51
   IyKxkyeJ3n7XSz35bdmRpJf3avJHcmj1m+iMaKZHgX/9C32TA5pvE+ouC
   JZ7GIv09E94MlI3Xtv0WW50QZcvOk2z1/sesDsmcybem0iMUTTrONX7Dk
   A==;
X-CSE-ConnectionGUID: 0OoYamSuRR+o/8FGIkKDCg==
X-CSE-MsgGUID: zOuz66lhSFOqPfrRIQoU0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72496453"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72496453"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:30:58 -0800
X-CSE-ConnectionGUID: WYAj0HUKSrCmLivtFbGXZQ==
X-CSE-MsgGUID: oysE1EO2SM2Fwpy102YBmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="219530903"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.114])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 06:30:56 -0800
Date: Thu, 19 Feb 2026 16:30:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
Message-ID: <aZcenabXYsOdBu84@smile.fi.intel.com>
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Feb 19, 2026 at 03:21:29PM +0100, Geert Uytterhoeven wrote:
> On Thu, 19 Feb 2026 at 15:06, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > Instead of checking for the specific error codes (that can be considered
> > a layering violation to some extent) check for the property existence first
> > and then either parse it, or apply a default value.

> IIRC, we have removed superfluous presence checks all over the tree
> during the past few years? E.g. of_property_read_*() is documented to
> return -EINVAL if a property does not exist.

Even though, it's still fragile. When we have a check for explicit device
presence, we wouldn't care of the error code we get in case of unsuccessful
parsing.

> So this patch looks like a step back to me...

Obviously I have a disagreement here, this is step forward to weaken
the dependency on the certain error code in the cases when we can avoid
that. Motivation is mentioned in the commit message.

Also note, -EINVAL can sneak in tons of mysterious ways as it's one of
the most overloaded error code in the kernel, its semantic is basically
equals to "an error happened".

Having the code above, we make it robust against some subtle nuances which
may not be discovered in time.

-- 
With Best Regards,
Andy Shevchenko


