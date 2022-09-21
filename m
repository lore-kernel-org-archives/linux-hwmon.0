Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA685ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 15:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiIUPpw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 11:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbiIUPpp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 11:45:45 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F94F75FD1
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663775143; x=1695311143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8hHbat5N6VA30ihoXXlhd3xZsiKWP0LhwqZjL4MyHI=;
  b=GMALCvfjyKTJWvhjRZEt4MtcoG3DHps+8rEZ6YF2SY+vXz6RA1OFKIwn
   Gq4scQuvmyLTtzmh+e+ZMyVTsC5tmEgwRQQ/muJ5nI0dKJVGPaMKZrR7F
   ilUrd8T+4rqQCRraBI/R3/GtlVz7lIiMBo65xiOeezjBMrcapQK4Z9Zph
   jmQk2HYd2Ytd8JbQDzykdhKE5reo4T1UhWzmmvBKDioiTTT8S/UJkeAGn
   /SYzUzga+dANYTHcQeZqp/OEP1uBb9dj++htuDoLv2/sSWg91IpriiD9S
   WhFy3K0ntCxNg5kkEQzL34HXaQ3YeZxyeFgDg53okJ6sKXlkhQnL/aFwi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="364017083"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="364017083"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 08:45:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="948206992"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.180.68])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 08:45:39 -0700
Date:   Wed, 21 Sep 2022 17:45:37 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
Message-ID: <YysxoXpnsct6QHyT@ashyti-mobl2.lan>
References: <20220916150054.807590-1-badal.nilawar@intel.com>
 <20220916150054.807590-2-badal.nilawar@intel.com>
 <YysHM8Ot1escBzEy@ashyti-mobl2.lan>
 <cf707153-a034-fae7-22b0-443592594433@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf707153-a034-fae7-22b0-443592594433@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

> > > +struct hwm_reg {
> > > +};
> > > +
> > > +struct hwm_drvdata {
> > > +	struct i915_hwmon *hwmon;
> > > +	struct intel_uncore *uncore;
> > > +	struct device *hwmon_dev;
> > > +	char name[12];
> > > +};
> > > +
> > > +struct i915_hwmon {
> > > +	struct hwm_drvdata ddat;
> > > +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
> > > +	struct hwm_reg rg;
> > > +};
> > > +
> > > +static const struct hwmon_channel_info *hwm_info[] = {
> > > +	NULL
> > > +};
> > > +
> > > +static umode_t
> > > +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> > > +	       u32 attr, int channel)
> > > +{
> > > +	switch (type) {
> > > +	default:
> > > +		return 0;
> > > +	}
> > > +}
> > > +
> > > +static int
> > > +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > > +	 int channel, long *val)
> > > +{
> > > +	switch (type) {
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +}
> > > +
> > > +static int
> > > +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > > +	  int channel, long val)
> > > +{
> > > +	switch (type) {
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +}
> > > +
> > > +static const struct hwmon_ops hwm_ops = {
> > > +	.is_visible = hwm_is_visible,
> > > +	.read = hwm_read,
> > > +	.write = hwm_write,
> > > +};
> > > +
> > > +static const struct hwmon_chip_info hwm_chip_info = {
> > > +	.ops = &hwm_ops,
> > > +	.info = hwm_info,
> > > +};
> > 
> > what's the point for splitting so much? Can't you just send the
> > hwmon driver all at once? With this patch you are not actually
> > doing anything useful. In my opinion this should be squashed with
> > the next ones.

> During discussion in cover letter of rev0 series we decided to create
> separate infrastructure patch, as we wanted to keep kconfig, i915 hwmon
> structures and new file addition in separate patch. Further feature wise we
> kept adding new patches.

I don't really like this patch splitting, but it's my fault I
haven't reviewed it already in v1. Please, ignore then.

Andi
