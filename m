Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2F36F06D
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2024 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253461; cv=none; b=YYCYT+U3thy9QHTYc3ooR/PIFR/mELf8IgtGjaOgqBlajbwqq3sP3nc5VxTkgDk3z74NF3Eby/NEztpMsZaKHRkKLfGoogRkCwLxMNp538yFRi1MnQeOl80FJZ+TLZxKcXEc4v12vshmwL5n0XIQZK5AT5oKahd7OsWNXeJejv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253461; c=relaxed/simple;
	bh=K1q1+4LndZnbflXCqVazF7Av2lnURkJBr8LQJjdOjes=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A8YqJkGSwpIJBnsQ2IhnVJXb6KSyYOv4kovKVzXDejEoF2styMmS2Kjk7YQLGjdRbolTKC4d/hke9VH1lCNQrijnxn2O3rm2Us3nb13iEo47vRZ3nEg1OsUWIqilu8KwRSSwu5ArPBWzTgOuND77b1LiqqagjGMzIONFqJiRGbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmBY2CeL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmBY2CeL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713253460; x=1744789460;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=K1q1+4LndZnbflXCqVazF7Av2lnURkJBr8LQJjdOjes=;
  b=RmBY2CeL7bFnulD6F4Z+tpbYroJZ6l37Jz8UHiGH+zeUY7Wl1L5EnK8P
   bfCX1GVWvIOi3jLkU4mdW1iC6bp7MuXnOZyFzv6Q5eTTpwYLri8FBhCVL
   cJ4dKRpqG8sTN+BkjE4+nS+ol77ODDo5EbQatFG+xvNqssffg5/I/XPc8
   vBuVmJCJdXqciMzYcoxNO0PX6q4xvCBra8Ie+Zs+2lfQBNhTBJ4KvGToy
   AT4iRBk6YR+F2uP9lSDyK8Bkf1G54k7jzC5t37t+j/9pflo7F29Pqv2j1
   JzwBG6BUEL6F2slsr0vXzD6OJty5yeJqo5Q05qMiYsch9Eu+3DVll3YKF
   Q==;
X-CSE-ConnectionGUID: yt4PpTp2QRm2ITdMDmnwSQ==
X-CSE-MsgGUID: NqtYTBlUQT+y5L3wlsqVwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12452331"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="12452331"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:44:15 -0700
X-CSE-ConnectionGUID: 6NrNlSPoT6y8Y6E+T9WTwQ==
X-CSE-MsgGUID: wfA0atppRRGA9vkY6ucx9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22073048"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost) ([10.252.44.100])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 00:44:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Armin Wolf <W_Armin@gmx.de>
Cc: intel-gfx@lists.freedesktop.org, Badal Nilawar
 <badal.nilawar@intel.com>, Andi Shyti <andi.shyti@intel.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-hwmon@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/i915/hwmon: Get rid of devm
In-Reply-To: <857cgyt0iv.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240415223612.738535-1-ashutosh.dixit@intel.com>
 <020612d1-2e6b-4bd7-87a6-dbd31574fdd8@gmx.de>
 <857cgyt0iv.wl-ashutosh.dixit@intel.com>
Date: Tue, 16 Apr 2024 10:44:09 +0300
Message-ID: <87wmoxzr92.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 15 Apr 2024, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> On Mon, 15 Apr 2024 16:35:02 -0700, Armin Wolf wrote:
>>
>
> Hi Armin,
>
>> Am 16.04.24 um 00:36 schrieb Ashutosh Dixit:
>> > @@ -818,10 +818,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>> >	hwm_get_preregistration_info(i915);
>> >
>> >	/*  hwmon_dev points to device hwmon<i> */
>> > -	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>> > -							 ddat,
>> > -							 &hwm_chip_info,
>> > -							 hwm_groups);
>> > +	hwmon_dev = hwmon_device_register_with_info(dev, ddat->name,
>> > +						    ddat,
>> > +						    &hwm_chip_info,
>> > +						    hwm_groups);
>> >	if (IS_ERR(hwmon_dev)) {
>> >		i915->hwmon = NULL;
>>
>> you need to free hwmon here, since it is not managed by devres anymore.
>
> Thanks a lot for catching this, I had missed it in v2, it's fixed in v3. I
> am actually reusing i915_hwmon_unregister() for error unwinding in v3.
>
>>
>> >		return;
>> > @@ -838,10 +838,10 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>> >		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0))
>> >			continue;
>> >
>> > -		hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat_gt->name,
>> > -								 ddat_gt,
>> > -								 &hwm_gt_chip_info,
>> > -								 NULL);
>> > +		hwmon_dev = hwmon_device_register_with_info(dev, ddat_gt->name,
>> > +							    ddat_gt,
>> > +							    &hwm_gt_chip_info,
>> > +							    NULL);
>> >		if (!IS_ERR(hwmon_dev))
>> >			ddat_gt->hwmon_dev = hwmon_dev;
>> >	}
>> > @@ -849,5 +849,26 @@ void i915_hwmon_register(struct drm_i915_private *i915)
>> >
>> >   void i915_hwmon_unregister(struct drm_i915_private *i915)
>> >   {
>> > -	fetch_and_zero(&i915->hwmon);
>> > +	struct i915_hwmon *hwmon = fetch_and_zero(&i915->hwmon);
>>
>> Why is fetch_and_zero() necessary here?
>
> As mentioned, in v3 i915_hwmon_unregister() itself is used for error
> unwinding so we need to prevent multiple device_unregister's etc. That is
> the purpose of setting i915->hwmon to NULL. But even earlier, though it is
> not obvious, i915_hwmon_unregister() is called multiple times. So e.g. it
> will be called at device unbind as well as module unload. So once again we
> prevent multiple device_unregister's by setting and checking for NULL
> i915->hwmon.

IMO it's more obvious to set i915->hwmon to NULL separately.

BR,
Jani.

>
>>
>> > +	struct hwm_drvdata *ddat = &hwmon->ddat;
>> > +	struct intel_gt *gt;
>> > +	int i;
>> > +
>> > +	if (!hwmon)
>> > +		return;
>> > +
>> > +	for_each_gt(gt, i915, i) {
>> > +		struct hwm_drvdata *ddat_gt = hwmon->ddat_gt + i;
>> > +
>> > +		if (ddat_gt->hwmon_dev) {
>> > +			hwmon_device_unregister(ddat_gt->hwmon_dev);
>> > +			ddat_gt->hwmon_dev = NULL;
>> > +		}
>> > +	}
>> > +
>> > +	if (ddat->hwmon_dev)
>> > +		hwmon_device_unregister(ddat->hwmon_dev);
>> > +
>> > +	mutex_destroy(&hwmon->hwmon_lock);
>> > +	kfree(hwmon);
>> >   }
>
> Thanks.
> --
> Ashutosh

-- 
Jani Nikula, Intel
