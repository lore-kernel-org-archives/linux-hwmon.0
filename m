Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E00EAC7;
	Tue, 17 Mar 2026 20:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780689; cv=none; b=u2HTv1W4QoyIYjvfpKjtsUz9yoTAcwIahxjrxET07SrMzssAPRhzWC79DxvsX/v3gsn1n1HBAyy6C7tm24uZSx57t8h91x4BffeZSeAxUGHxuUUqN6z+wCIqN0L/SQQK5UewZLRDujn+nUWhH6lXMrkN50Q3AYkp+hWS+5TbghM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780689; c=relaxed/simple;
	bh=1A3ndj3WjZjNRAUQgvWW4QdtkkQTcsI2IPjSjNRM6fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAG4OFU3shZcPYTJEYx+kbR/hQzaHuzQIM2rjM6upgKE5JlMzYGv2xpJ7OqC0GJ94WMqgw4F0yAAGsz9Vkb3ev4grkO303RBn2qiupiiDyvO53id21BP1z+YnxTxUuhCl3e7iU3MxCWCdjX7ow4Wybm6QV6iu5MwaH0mP7xaOOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRMf+Hqr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRMf+Hqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773780688; x=1805316688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1A3ndj3WjZjNRAUQgvWW4QdtkkQTcsI2IPjSjNRM6fY=;
  b=YRMf+Hqrq77YNL2ErRwKVX2+foRlKf8fh+H2vi3raC/ly0IT0LTU8krh
   kmqsCPELe+lxLihPY0TtCjNy1p2hKheXX570tCZ3my4kGGNC8SXO8Jki+
   pulzb3BGLSvsM+KAXuJG2OadeSaqWmFrQkHnme5gWhgVktb9tSEwsFu2n
   IXx3nMPCZNQcuVnV4/twK04fBRakj1ryxz5lZIqHvaA4PQHbtimX+wPig
   zcDA78qPoWU5o8pQ3ogtYVaRIPJ69q9bkuP0P/mUwzmSRfaMGOgHdXrLK
   ZHif/53zlW2qLj3VwKYzbtAKrQFYFfUt/ltHUh1vp2/zSsX9ALVg/zzqI
   A==;
X-CSE-ConnectionGUID: rg14CfMISZCoNc+SmjmkQQ==
X-CSE-MsgGUID: BYC1SfZaSH+FswYa1KL6PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74744169"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74744169"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 13:51:27 -0700
X-CSE-ConnectionGUID: 4hgw5MsHTn+OVtH6eu6ZWA==
X-CSE-MsgGUID: XajkNQeCTNeNXvQTXSi6qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="216693393"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 13:51:25 -0700
Date: Tue, 17 Mar 2026 22:51:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
Message-ID: <abm-yiy8ISg9zyUU@ashevche-desk.local>
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdX9CdQNBGegrfHz+-UpuyO-rmHEQ2HUa=JjVpG_0ryacg@mail.gmail.com>
 <aZcenabXYsOdBu84@smile.fi.intel.com>
 <4b24f1f4-b395-467a-81b7-1334a2d48845@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b24f1f4-b395-467a-81b7-1334a2d48845@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Feb 20, 2026 at 12:49:25PM -0800, Guenter Roeck wrote:
> On 2/19/26 06:30, Andy Shevchenko wrote:
> > On Thu, Feb 19, 2026 at 03:21:29PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, 19 Feb 2026 at 15:06, Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > Instead of checking for the specific error codes (that can be considered
> > > > a layering violation to some extent) check for the property existence first
> > > > and then either parse it, or apply a default value.
> > 
> > > IIRC, we have removed superfluous presence checks all over the tree
> > > during the past few years? E.g. of_property_read_*() is documented to
> > > return -EINVAL if a property does not exist.
> > 
> > Even though, it's still fragile. When we have a check for explicit device
> > presence, we wouldn't care of the error code we get in case of unsuccessful
> > parsing.
> > 
> > > So this patch looks like a step back to me...
> > 
> > Obviously I have a disagreement here, this is step forward to weaken
> > the dependency on the certain error code in the cases when we can avoid
> > that. Motivation is mentioned in the commit message.
> > 
> > Also note, -EINVAL can sneak in tons of mysterious ways as it's one of
> > the most overloaded error code in the kernel, its semantic is basically
> > equals to "an error happened".
> > 
> > Having the code above, we make it robust against some subtle nuances which
> > may not be discovered in time.
> > 
> 
> Is that documented somewhere ? I have been asking people to use the current
> approach to reduce code size. device_property_present() isn't even mentioned
> as API in Documentation/. If "do not rely on error codes from device property
> API functions to determine if a default should be applied" or similar is a new
> rule or guidance, it should be clearly documented somewhere.

Fair enough.

Currently if one reads kernel-doc for fwnode_property_*() / device_property_*()
APIs, there is no clear specification that -EINVAL is equal to "property not
present". It's documented as

 *         %-EINVAL if given arguments are not valid,

which may be the case, if the parameter itself is wrong, for example fwnode is
invalid to begin with. Checking against -EINVAL for 'property not present' is
layering violation and relying on deep implementation detail.

I will craft a change to put something like this to the
fwnode_property_present() and device_property_present() kernel-docs.

-- 
With Best Regards,
Andy Shevchenko


