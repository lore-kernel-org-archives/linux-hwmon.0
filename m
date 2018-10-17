Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44238 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbeJRFMB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Oct 2018 01:12:01 -0400
Date: Wed, 17 Oct 2018 14:14:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] hwmon: (ina3221) Return -ENODATA for two alarms
 attributes
Message-ID: <20181017211426.GA10990@roeck-us.net>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-3-nicoleotsuka@gmail.com>
 <20181017194605.GB6812@roeck-us.net>
 <20181017203917.GB15941@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017203917.GB15941@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 17, 2018 at 01:39:17PM -0700, Nicolin Chen wrote:
> On Wed, Oct 17, 2018 at 12:46:05PM -0700, Guenter Roeck wrote:
> > On Tue, Oct 16, 2018 at 06:24:23PM -0700, Nicolin Chen wrote:
> > > There is nothing critically wrong to read these two attributes
> > > without having a is_enabled() check at this point. But reading
> > > the MASK_ENABLE register would clear the CVRF bit according to
> > > the datasheet. So it'd be safer to fence for disabled channels
> > > in order to add pm runtime feature.
> > > 
> > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > ---
> > >  drivers/hwmon/ina3221.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> > > index d61688f04594..3e98b59108ee 100644
> > > --- a/drivers/hwmon/ina3221.c
> > > +++ b/drivers/hwmon/ina3221.c
> > > @@ -200,6 +200,8 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
> > >  		return 0;
> > >  	case hwmon_curr_crit_alarm:
> > >  	case hwmon_curr_max_alarm:
> > > +		if (!ina3221_is_enabled(ina, channel))
> > > +			return -ENODATA;
> > 
> > Makes sense, but can you check what the sensors command does with this ?
> 
> Not quite understanding the question. Do you mean the user case
> causing the race condition -- wiping out the CVRF bit?
> 
No. Question is what the "sensors" command reports if reading the alarm
attribute returns -ENODATA. If it reports an error, we would have a regression.

Guenter

> > If it bails out I'd rather have the code return 0 and no error (after all,
> > the sensor is disabled, so any alarm would be bogus).
> 
> That's true. Since they are alert flags, should return 0. I will
> fix it.
> 
> Thanks
