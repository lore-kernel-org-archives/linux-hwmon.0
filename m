Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43516 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbeJYC0G (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Oct 2018 22:26:06 -0400
Date: Wed, 24 Oct 2018 10:57:02 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] hwmon: (ina3221) Add PM runtime support
Message-ID: <20181024175701.GB6374@Asurada-Nvidia.nvidia.com>
References: <20181024023623.4231-1-nicoleotsuka@gmail.com>
 <20181024023623.4231-6-nicoleotsuka@gmail.com>
 <20181024092418.Horde.x5q-8wat9jjHp8dU00-w2gW@cp2.active-venture.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181024092418.Horde.x5q-8wat9jjHp8dU00-w2gW@cp2.active-venture.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 24, 2018 at 09:24:18AM +0000, linux@roeck-us.net wrote:
> > +fail:
> > +	if (enable) {
> > +		dev_err(dev, "Reverting channel%d enabling: %d\n",
> > +			channel, ret);
> 
> This message is confusing. Something like "Failed to enable channel %d:
> error %d" would be much better.

Will fix in v3.

> > +fail_pm:
> > +	pm_runtime_disable(ina->hdev);
> > +	pm_runtime_set_suspended(ina->hdev);
> > +	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
> > +		pm_runtime_put_noidle(ina->hdev);
> 
> The count here doesn't match the count above if some channels
> are disabled, or if the enable loop above aborted.
> 
> > +	/* Decrease the PM refcount */
> > +	for (i = 0; i < INA3221_NUM_CHANNELS; i++)
> > +		pm_runtime_put_noidle(ina->hdev);
> > 
> As above, this doesn't take disabled channels into account. Maybe that
> doesn't matter; if so, there needs to be a comment indicating that
> negative use counts don't matter. If that is the case, make sure that
> this is acceptable use of the pm API (if it works but is not documented,
> the PM core may change and complain about it at a later time).

The API will stop decrease at 0. But I will see if I can explicitly
loop a matched number, or at lest will mention this in comments.

Thanks
Nicolin
