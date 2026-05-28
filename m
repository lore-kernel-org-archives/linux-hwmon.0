Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F5325485;
	Thu, 28 May 2026 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986984; cv=none; b=cIDMMezsl8cc6ycMrP+4CSZiNbn1QG+2bMjGBrjHaSW4bXN8+5YAUKif9dkm2cxuxSrSpEBs2T6Niz6zTKbEyazI0ItbMaAEN5wEbklGkPpNpqEDqHdI4x8rhQcoMSViande7z+Kb1eRbksHi1SWRrz/Ek2NhX1uxqjZfPKZYxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986984; c=relaxed/simple;
	bh=jRNLJqJ2HvzVjQj+tHx25T+AidGfUuIqtwnCkO6JJPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BV1/7O0AUrjet3qT5ueGwnl07ZrD7Fol8yOgsQvpJ1kygwxg2er3UMPnsPDnl4CNId1Y1oEd8Y3VBAO3b6CKsJN5d5RORrdBCsJzLNdEvv30OiNc2005qmpS1YnkNd+Y1Jl/ClYAVQ+DMJfCsoIjiDX35G5+zV7kiJZE5eWQlgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvxniM4J; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvxniM4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779986983; x=1811522983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jRNLJqJ2HvzVjQj+tHx25T+AidGfUuIqtwnCkO6JJPk=;
  b=lvxniM4J2SK5TuY1kREpKbeklxr/+nxeg/7XaKlQCzEzK865bNXGmJx3
   hT+1KbYfkUayt6V6ypq0L9lzFXjvf08RWwW4p6TtW4KDMdqlzASLRZ5Hk
   dX1xj5IHGw6W2ie5KvxFh4AXLqQc3m+JenGAJjKuaK5IfKqQbvXeOQQTR
   WwqlwHVU86IxvULpT++C11iXhvl/OkLzPMUmp8hNh9YPvLlvEpdNcHngm
   KxLtPERYK60kteFgesvNFrE/j/cpKRJPMY+d/FOUMnbPSn9OhzTRCOMxq
   XQTaUi0IKDr509cOiajcxDWGEBc6uQTUaAtDQjKUIlb1Yd2Sm9fT5gZpf
   Q==;
X-CSE-ConnectionGUID: IXnQmY74TfaSHY9jP1Kn6Q==
X-CSE-MsgGUID: Ae+a0IxaTDWMxnkXunoKjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91522128"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="91522128"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 09:49:42 -0700
X-CSE-ConnectionGUID: GalvE7ydTGKhYxVR2sLgZg==
X-CSE-MsgGUID: eLHufy7CRaWI7Bqe/yeR3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="241567216"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 09:49:40 -0700
Date: Thu, 28 May 2026 18:49:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?utf-8?B?5Y2gd2Vp?= <zhanwei919@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/xe/hwmon: report a single fan for DG2 instead of
 two
Message-ID: <ahhyIMa3Btj7oZv6@black.igk.intel.com>
References: <20260527115311.13398-1-zhanwei919@gmail.com>
 <ahb3VMRCQpofblbW@black.igk.intel.com>
 <CA+qUFcnP-XEPHJD-+djRydD92-bAz5bxxVaRHGJ3nrpwtq4m7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+qUFcnP-XEPHJD-+djRydD92-bAz5bxxVaRHGJ3nrpwtq4m7w@mail.gmail.com>

On Wed, May 27, 2026 at 11:18:52PM +0800, 占wei wrote:
> Thanks for the detailed explanation -- that make sense
> 
> I can think of two paths forward:
> 
> 1) Have fan_input_read() return -ENODATA if one channel has started
>  reporting pulses but another remains silent for, say, 30 seconds.
>  This way the phantom entry still appears in sysfs but userspace
>  tools like `sensors` can handle the "no data" case gracefully
>  instead of showing a misleading 0 RPM.

Sounds a bit over engineered solution with its own caveats because

a) We assume that both channels are monitored simultaneously and first
   channel actually reports non-zero value for 30 seconds (or whatever
   trivial value we device) continuously, which is not guaranteed.

b) This means the output of one channel depends on another and I'm
   doubtful if maintainers would be okay with such hacks.

> 2) Drop the code change entirely and instead add a short note in
>  Documentation/gpu/xe/xe_hwmon.rst explaining that on DG2 boards
>  where the OEM routes multiple physical fans through a shared tach
>  line, fan{2,3}_input may read 0, so future contributors don't end
>  up re-attempting the same v1 patch I just sent.

This one makes more sense to me though.

Raag
