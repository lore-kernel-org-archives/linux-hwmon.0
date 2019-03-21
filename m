Return-Path: <SRS0=pmHe=RY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EFCC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Mar 2019 16:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD78C21874
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Mar 2019 16:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7EZOKs5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbfCUQDw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Mar 2019 12:03:52 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45581 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbfCUQDw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Mar 2019 12:03:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id v21so4558475pfm.12;
        Thu, 21 Mar 2019 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T63xkHomkfRT6khd0e8thca6B0+2jRL1i9yG7i8G1w0=;
        b=X7EZOKs5lMATMmXdxS7nYBnIiJ91VIci/6N1506hUpO6QAzHik1OE0U56ffE9hvIm3
         esS6A/1KHHUShO0gRa+AWDNtIEtl3dL+lqFLfGDXad0QIDzGFDRf2P17iOfL/k9eLQZu
         +sSY/TqiX5vrz7Z+QOJe0FV1Iy8jCdea1lhFgLWyskTDWVE0H1KBa5x70UR/Qn/xj3sz
         m+Ymy8wKA9La0qFw89kfCumqH/fclPEiQVyJzFsZl6VxrOhoHBO3/xjVla+3byeFT7tF
         aEUuVIJEIqNxcNE1VM1Q4fUhQc+HzcBmhd6aP5rT+I939MhUWPU8quVrfxVRUbSTiiF3
         sPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=T63xkHomkfRT6khd0e8thca6B0+2jRL1i9yG7i8G1w0=;
        b=ACKh5gAvebQbQQvkhwbDagrR+nSePDdqJMkYIB1u7Uy9Wu98AEi/rFENu2pbFrE+4A
         GnNMTxoaFkToEmNZItItvY6KepIC4YFTvUg9177ggS0fCw8OVyMD4kKnrvo2J8XUIXKl
         Lx7PTxwf6YZ7j3gsLejcRFNBtqes6p24R8FUeP9NWx833yg26saMp7SMQSXq20bzOxOM
         b+Z7hiVykWdyOWgnPb9n9RGJlCdP0OD0+JZXXofIcVLZB4n8m7PMyML41ByZDDwvvQvI
         EyCjE4ZQW0UBimV5ed1oXEKUB7Zz4BBc5bqOIrnTOkQ11aujW9w6+tq/AwtfKZzs1pz+
         wzAA==
X-Gm-Message-State: APjAAAUWj5dNam9v6tjkG4moCK5LIve7LZ0wuSfzAHh7cBYyIP4IJ4Mw
        YmiAxOOGcZqSptBiWIGU9B8=
X-Google-Smtp-Source: APXvYqxHDodbWfEodVJ3RlbyVfYc4eEujldnnhaLzHzoikZBzI6vlCxLx7NEQAn+YQRF12yK8TVW8A==
X-Received: by 2002:a17:902:7b8c:: with SMTP id w12mr4305842pll.153.1553184230362;
        Thu, 21 Mar 2019 09:03:50 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i189sm7503530pfc.71.2019.03.21.09.03.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Mar 2019 09:03:49 -0700 (PDT)
Date:   Thu, 21 Mar 2019 09:03:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190321160348.GA13195@roeck-us.net>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
 <20190320145818.30644-3-ckeepax@opensource.cirrus.com>
 <20190320164010.GA13650@roeck-us.net>
 <20190321115930.GX46536@ediswmail.ad.cirrus.com>
 <792e97a0-8131-7497-fd2b-2285134ef94d@roeck-us.net>
 <20190321154753.GY46536@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190321154753.GY46536@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 21, 2019 at 03:47:53PM +0000, Charles Keepax wrote:
> On Thu, Mar 21, 2019 at 06:14:23AM -0700, Guenter Roeck wrote:
> > On 3/21/19 4:59 AM, Charles Keepax wrote:
> > >On Wed, Mar 20, 2019 at 09:40:10AM -0700, Guenter Roeck wrote:
> > >>On Wed, Mar 20, 2019 at 02:58:18PM +0000, Charles Keepax wrote:
> > >>>From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > >>Is this an ieee754 floating point format ? Please add a comment stating it.
> > >>Also, if the format supports it, please check for NaN. If the HW guarantees
> > >>to never return NaN, please add a respective comment.
> > >>
> > >>How likely is it that the values overflow ? A precision multipler of
> > >>1,000,000,000 means that numbers will overflow quite easily. And does
> > >>the the hardware really report voltages and currents in pico-units,
> > >>and are temperatures really reported in micro-degrees C ?
> > >>
> > >
> > >I believe the hardware can't return NaN. But will check that,
> > >what ranges are possible and add some overflow checking.
> > >
> > 
> > How about the units ? Maybe add a note explaining what the HW actually returns.
> > 
> 
> Yup can do.
> 
> > >>Overall it might make sense to reconfigure the hardware into continuous
> > >>measurement mode and get rid of the delays (if that can be configured -
> > >>the user guide isn't detailed enough to be able to determine for sure).
> > >>After all, it is quite unlikely that the board will be used in an
> > >>environment where the power savings would be worth the inconvenience
> > >>of having to wait more than two seconds for a set of measurement values
> > >>(adding all the current and temperature delays up).
> > >>
> > >
> > >Yeah the hardware is quite slow and regrettably doesn't have a
> > >continuous measurement mode. We could potentially add a thread to
> > >poll them but mostly the usage for this data is just taking power
> > >measurements of various audio use-cases so the large delay isn't
> > >a huge problem and not sure it warrents the additional
> > >complexity.
> > >
> > >>>+	msleep(nsamples);
> > >>>+
> > >>
> > >>This needs some explanation how nsamples translates into millisecond waits,
> > >>especially since that wait can add up significantly (reading the temperature
> > >>will take forever, as will reading all currents).
> > >>
> > >>>+	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
> > >>>+					val & LOCHNAGAR2_IMON_DONE_MASK,
> > >>>+					5000, 2000000);
> > >>
> > >>Can that indeed take another two seconds on top of the sleep above ?
> > >>
> > >
> > >It does about about 1.5-2 seconds I think last time I checked.
> > >
> > >Essentially the hardware will average a number of readings and
> > >return that. The number of readings given in the driver is what
> > >the hardware guys recommended for each, that said we could
> > >potentially make it configurable if that helps at all? Also
> > >I could get the msleep a bit closer to the actual runtime,
> > >just need to check how linear the time is with the number of
> > >samples take (I assume very).
> > >
> > 
> > Brr. Just add a note explaining that the long times are indeed intentional,
> > and that the HW takes that long.
> > 
> 
> From some more detailed discussions with the hardware guys
> (shame on me for following the documentation) it seems
> there isn't really much need for the temp to take so many
> measurements. The current one makes sense as the hardware
> actually does some analogue averaging so it should take account
> of spikes in the current draw from the part under test. But
> the temp should really only change slowly. I have also managed
> to refine the estimates for the time taken by the measurements
> so will factor that lot into the v2 as well.
> 

Ok, that makes more sense.

> Thanks very much for the review, will probably take me a few more

Mu pleasure. And many thanks for the new macro - that is really very useful.

> days to beat the last few clarifications out of the hardware guys
> then I will fire up a v2.
> 

Take your time. It is a few weeks until the next commit window,
after all.

Thanks,
Guenter
