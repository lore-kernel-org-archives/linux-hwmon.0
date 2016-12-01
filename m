Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54124 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750847AbcLAWIU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 17:08:20 -0500
Date: Thu, 1 Dec 2016 14:08:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: Re: [PATCH 1/2] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
Message-ID: <20161201220817.GA5274@roeck-us.net>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
 <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480538179-75901-2-git-send-email-john@jmuir.com>
 <e2d01c5f-8d8e-16be-24c8-d19c2a8bc400@roeck-us.net>
 <126058B2-9FD8-4F95-AEAA-3F1A60CCC1FD@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <126058B2-9FD8-4F95-AEAA-3F1A60CCC1FD@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi John,

On Thu, Dec 01, 2016 at 01:50:22PM -0800, John Muir wrote:
> Hi Guenter,
> 
[ ... ]
> 
> >> +static int __maybe_unused tmp108_resume(struct device *dev)
> >> +{
> >> +	struct tmp108 *tmp108 = dev_get_drvdata(dev);
> >> +	int err;
> >> +
> >> +	err = regmap_write(tmp108->regmap, TMP108_REG_CONF,
> >> +			   tmp108->curr_config);
> >> +
> >> +	tmp108->ready_time = jiffies;
> >> +	if (tmp108->curr_config & TMP108_MODE_CONTINUOUS)
> > 
> > Since only continuous mode is supported, and it is somewhat unlikely
> > that we'll ever support one-shot mode, I think it would be better to
> > unconditionally set continuous mode and the delay here and drop
> > curr_config entirely. curr_config adds quite some complexity to the
> > driver with no real gain.
> 
> OK. Due to my ignorance I was assuming that the could would need to restore the current configuration during resume, and also the previous versions (that you did not see) of this code was not using regmap. In fact I see that there is also a function called ‘regmap_sync’ which is used (mainly by audio codecs) to do this (i.e.; as part of device reset but there are examples in resume()). The configuration register is now marked volatile so it would be skipped by regmap_sync anyway.
> 
> Should we be concerned about restoring the configuration here?
> 
Interesting question. If the chip was really powered off, you would
have to restore the entire configuration, not just the configuration
register. Given that, I think it is sufficient to just restore the
operational mode, ie the value changed when entering suspend.

Where did you find regmap_sync() ? It seems to be hiding from me.

Thanks,
Guenter
