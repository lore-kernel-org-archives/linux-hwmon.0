Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94773E7F146
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Sep 2023 23:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjIZXfy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Sep 2023 19:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjIZXdx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Sep 2023 19:33:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2114B72A6
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 15:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695767940; x=1727303940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7qq4ZRv6WnnMAgCSbfzwTJu+7DemR5VZO2titfmffI4=;
  b=HoprseRHSzRrI2ZWCycUgXZPOGwxYtroGBVbKdgvNIvKqmZHcj9JtmgJ
   3UTP3S2MxsyfM+Mn67VtTinJeNAXzRlDVS8AfTahuoINxmlbpl8sYkv4L
   bw7RPzdyIXwsLSSP1MHoA+a7O64/Gvrxa/dV97MwFSgLEjAUzJl82wr3P
   NTJ8FSWTj1sBtE7hgNUwwgu6ijNbHgMT6K7KLssHCpNcXWSJrjozTvJUI
   4n1DVzhQwnADKGd+3zmbQAoqWjvmhNfOLDJqfGxSljkym/O42GXy0zmEA
   UBggOScHjUjRshmR7KW+YRGi+0jG1T3rD+SNsZoI1FDda3Z1L0+rGx7s9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378949212"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="378949212"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864537824"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864537824"
Received: from yeehernc-mobl2.gar.corp.intel.com (HELO intel.com) ([10.214.173.104])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 14:01:13 -0700
Date:   Tue, 26 Sep 2023 23:01:06 +0200
From:   Andi Shyti <andi.shyti@linux.intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>
Cc:     Andi Shyti <andi.shyti@linux.intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        linux@roeck-us.net, riana.tauro@intel.com, matthew.brost@intel.com,
        rodrigo.vivi@intel.com
Subject: Re: [PATCH v6 5/5] drm/xe/hwmon: Expose power1_max_interval
Message-ID: <ZRNGkgVqsnJ9Z8O2@ashyti-mobl2.lan>
References: <20230925081842.3566834-1-badal.nilawar@intel.com>
 <20230925081842.3566834-6-badal.nilawar@intel.com>
 <ZRF1f2OsC1pr5hFd@ashyti-mobl2.lan>
 <e5801f36-2f9a-6d24-7af2-1e7174f2e0b4@intel.com>
 <ZRKP2UIGUWTXnZN6@ashyti-mobl2.lan>
 <ec2a4e33-0b34-fb00-5470-f2d39edc6eb1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2a4e33-0b34-fb00-5470-f2d39edc6eb1@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Badal,

> > > > > +	/* val in hw units */
> > > > > +	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
> > > > > +	/* Convert to 1.x * power(2,y) */
> > > > > +	if (!val) {
> > > > > +		/* Avoid ilog2(0) */
> > > > > +		y = 0;
> > > > > +		x = 0;
> > > > > +	} else {
> > > > > +		y = ilog2(val);
> > > > > +		/* x = (val - (1 << y)) >> (y - 2); */
> > > > 
> > > > this is some spurious development comment, can you please remove
> > > > it?
> > > 
> > > This is kept intentionally to help to understand the calculations.
> > 
> > then this is confusing... Can you please expand the concept?
> > As it is it's not understandable and I would expect someone
> > sending a patch with title:
> > 
> >   [PATCH] drm/xe/hwmon: Remove spurious comment
> > 
> > Because it just looks forgotten from previous development.
> I will add this comment inside the comment at the top of if. So it will look
> like.
> /*
>  * Convert to 1.x * power(2,y)
>  * y = ilog(val);
>  * x = (val - (1 << y)) >> (y-2);
>  */

All right.

> > > > > +		x = (val - (1ul << y)) << x_w >> y;
> > > > > +	}
> > > > > +
> > > > > +	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
> > > > > +
> > > > > +	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
> > > > > +
> > > > > +	mutex_lock(&hwmon->hwmon_lock);
> > > > > +
> > > > > +	xe_hwmon_process_reg(hwmon, REG_PKG_RAPL_LIMIT, REG_RMW, (u32 *)&r,
> > > > > +			     PKG_PWR_LIM_1_TIME, rxy);
> > > > > +
> > > > > +	mutex_unlock(&hwmon->hwmon_lock);
> > > > 
> > > > why are we locking here?
> > > 
> > > Since it is rmw operation we are using lock here.
> > 
> > OK... so what you are trying to protect here is the
> > 
> >    read -> update -> write
> > 
> > and it makes sense. The problem is that if this is a generic
> > rule, which means that everyone who will do a rmw operation has
> > to take the lock, why not take the lock directly in
> > xe_hwmon_process_reg()?
> > 
> > But also this can be a bit confusing, because a function is
> > either locked or unlocked and purists might complain.
> > 
> > A suggestion would be to do something like:
> > 
> >     static int xe_hwmon_process_reg(..., enum xe_hwmon_reg_operation operation)
> >     {
> >     	...
> >     }
> > 
> >     static int xe_hwmon_reg_read(...);
> >     {
> >     	return xe_hwmon_process_reg(..., REG_READ);
> >     }
> > 
> >     static int xe_hwmon_reg_write(...);
> >     {
> >     	return xe_hwmon_process_reg(..., REG_WRITE);
> >     }
> > 
> >     static int xe_hwmon_reg_rmw(...);
> >     {
> > 	int ret;
> >     	
> > 	/*
> > 	 * Optional: you can check that the lock is not taken
> > 	 * to shout loud if potential deadlocks arise.
> > 	 */
> > 
> > 	/*
> > 	 * We want to protect the register update with the
> > 	 * lock blah blah blah... explanatory comment.
> > 	 */
> > 	mutex_lock(&hwmon->hwmon_lock);
> > 	ret = xe_hwmon_process_reg(..., REG_RMW);
> > 	mutex_unlock(&hwmon->hwmon_lock);
> > 
> > 	return ret;
> >     }
> > 
> > What do you think? It looks much clearer to me.
> 
> REG_PKG_RAPL_LIMIT register is being written in xe_hwmon_power_max_write
> also, that's why lock is taken. But some how while cleaning up I forgot to
> take it in xe_hwmon_power_max_write(), thanks for catching it up. I will
> update xe_hwmon_power_max_write() and resend series.

yes... OK... then, please add the lock also in the write case.

But still... thinking of hwmon running in more threads don't you
think we might need a more generic locking? This might mean to
lock all around xe_hwmon_process_reg()... maybe it's an overkill.

For the time being I'm OK with your current solution.

If you don't like my suggestion above, feel free to ignore it.

Andi
