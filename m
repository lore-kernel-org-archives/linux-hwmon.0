Return-Path: <SRS0=Xc2u=X5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B46C47404
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 15:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39DE1207FF
	for <linux-hwmon@archiver.kernel.org>; Fri,  4 Oct 2019 15:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSaiSXdc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389567AbfJDPG2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 4 Oct 2019 11:06:28 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36247 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389559AbfJDPG1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 4 Oct 2019 11:06:27 -0400
Received: by mail-pg1-f195.google.com with SMTP id 23so3929880pgk.3;
        Fri, 04 Oct 2019 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fljOStxG7TSCg6T2QdDg7cOX0++32t9uCouTe+LxBpw=;
        b=bSaiSXdczjVv+sKSFECQhHmy8M/vLWNRgXw+UJmefUQhW/XKuIMYh0ry91g71YjEfn
         Tz9cTJI6zbCtPIrnBjdVy0KB70Zkqc+i2pmJXrU/HzdgJTmlmIYt18Q+8Qmd0aqJd5FM
         KW1MR7jOGzpRHDEYM8i5GGRHxTIR+Qvr2ncnsC73byDJz10ULqBenMLRTiIaG0MFKqjX
         xu+e7tyWZIubxzmwTAxE07sIWgpXAFUR/Khq7IQ4CQ/Z+ZcYn8mds7TaWuqI+UUqCyEV
         yyLZd2kRqGIuSL9JEOUrom2d4xDTHfKPQM1cWor3CbBlDvP4qCQPwo/aujR3gdb6L4PU
         5X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fljOStxG7TSCg6T2QdDg7cOX0++32t9uCouTe+LxBpw=;
        b=kH0iowa+rTzp60t+5LGGrecpFes5WoKnaFRzAfLH9TPoDABh7BJeP/1uiOE+fQe0qR
         QImg7Vyw/4dO7iXIQcpVqICtyNtUlNeDXk/cEi7VjmALQR+F91LSqe1g7KVfbakfiU1C
         9i2bnPqzv8K1J1w/o26T/kVHlE5/m2b2NFryAbEjfSOmwM8xppkukYvRgaFAz2rkeEHw
         sVG/lcMNdzhnsby1MY/E+2AsTPYEVVaAie1PQUjFP1iddoK1MQdt9n22/7MfeZRJDm7K
         6z1EmjY6X+/qcqwMpXsFqKBDuzXR4/Vi0tnbdaLB5UaXIxgz4Rj0HK6QjdiP37PHSDgr
         dC0Q==
X-Gm-Message-State: APjAAAUOaIvKnP3oKQ8JfmR5xF3fpO0lAK3TzhDDX2/LYze50JnfUVnY
        T1dlGViq3/Vtg2ii2G5X46g=
X-Google-Smtp-Source: APXvYqyszNL1CU+42DYpWlJPp1f52iQ+aYENmAKStZLUWhtLTj3zM0/qJ6qhaM6Z2Hquv7VLZ940Fg==
X-Received: by 2002:aa7:910c:: with SMTP id 12mr17395357pfh.166.1570201586741;
        Fri, 04 Oct 2019 08:06:26 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a23sm6380446pgd.83.2019.10.04.08.06.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 08:06:25 -0700 (PDT)
Date:   Fri, 4 Oct 2019 08:06:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Sa, Nuno" <Nuno.Sa@analog.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 2/3] hwmon: Add support for  ltc2947
Message-ID: <20191004150623.GA28287@roeck-us.net>
References: <20190924124945.491326-1-nuno.sa@analog.com>
 <20190924124945.491326-3-nuno.sa@analog.com>
 <20191003041446.GA2332@roeck-us.net>
 <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0a992bebbc3c388b6be100d1821fa5813fcc1b4.camel@analog.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Oct 04, 2019 at 07:45:07AM +0000, Sa, Nuno wrote:
[ ... ]
> > > +static int ltc2947_val_read(struct ltc2947_data *st, const u8 reg,
> > > +			    const u8 page, const size_t size, s64 *val)
> > > +{
> > > +	int ret;
> > > +	u64 __val = 0;
> > > +
> > > +	mutex_lock(&st->lock);
> > > +

On a side note, suspend code is supposed to be atomic,
If this lock is held, the process or thread holding it
will likely stall suspend since it won't run.
At the very least, this would have to be a trylock,
with suspend failing if the lock can not be acquired.

> > > +	if (st->reset) {
> > > +		mutex_unlock(&st->lock);
> > > +		return -EPERM;
> > 
> > Not sure what the error here should be, but EPERM is not correct.
> > 
> > Under which conditions would this function be called while in
> > suspend ?
> 
> Honestly, this is more like a sanity check. I'm not sure if we can get
> here in suspend mode. Don't userland apps can still run in suspend? I
> guess so but I'm not 100% sure on this. Do you have any recommendation
> for the error here?
> 
Sorry, I won't accept "just in case" code.

Having said that, please inform yourself how suspend works. Userland code
has to be stopped before any hardware can be disabled. Similar, hardware
has to be re-enabled before userland code can resume.
Otherwise the kernel would crash all over the place. In many cases,
disabling the hardware means that trying to access hardware registers
will cause an acess fault.

[...]

> > > +
> > > +static struct attribute *ltc2947_attrs[] = {
> > > +	&sensor_dev_attr_in0_fault.dev_attr.attr,
> > > +	&sensor_dev_attr_in1_fault.dev_attr.attr,
> > > +	&sensor_dev_attr_curr1_fault.dev_attr.attr,
> > > +	&sensor_dev_attr_temp1_fault.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_input.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_max.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_min.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_input_highest.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_input_lowest.dev_attr.attr,
> > > +	&sensor_dev_attr_power1_fault.dev_attr.attr,
> > > +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> > > +	&sensor_dev_attr_energy1_max.dev_attr.attr,
> > > +	&sensor_dev_attr_energy1_min.dev_attr.attr,
> > > +	&sensor_dev_attr_energy1_max_alarm.dev_attr.attr,
> > > +	&sensor_dev_attr_energy1_min_alarm.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_input.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_max.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_min.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_max_alarm.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_min_alarm.dev_attr.attr,
> > > +	&sensor_dev_attr_energy1_overflow_alarm.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_overflow_alarm.dev_attr.attr,
> 
> These overflow attributes are kind of an alarm for the energy ones. It
> tells that the energy registers are about to overflow. I guess that
> some application can easily find out the maximum values supported on
> these registers and implement whatever logic they want in the app
> itself. So, if you prefer I can just drop this ones?
> 
I understand the overflow use case. However, the mere presence
of min/max attributes for energy attributes suggests that this
is not the min/max use case for hwmon attributes. There is no "minimum"
or "maximum" energy for an accumulating value. Such attributes
only make sense in an application abler to measure available 
energy (eg a battery controller). I'll have to read the chip
specification to understand the intended use case.

> > > +	&sensor_dev_attr_energy1_fault.dev_attr.attr,
> > > +	&sensor_dev_attr_energy2_fault.dev_attr.attr,
> > 
> > Some of those are non-standard attributes. You'll have
> > to explain each in detail, especially why it makes sense
> > to provide such attributes to the user and why you can't
> > use standard attributes instead. Also, for the _fault
> > attributes, I don't entirely see the point. If the fault bit
> > is set, ADC readings are not valid because supply voltage
> > is low. This means that ADC register reads will be invalid.
> > What is the point of having a non-standard attribute - which
> > likely will be ignored - instead of returning an error when
> > an attempt is made to read an ADC value ?
> 
> I was also not sure on this *_fault attributes. They are there to tell
> that the readings are invalid. Now that I think about it, I'm not sure
> if it even makes sense to return error if this bit is set. The part is
> in continuous mode so, it might happen that we have the fault bit set
> for a short time but afterwards things go normal and the bit will still
> be set until we read it. So my point is, we might be returning error
> for a conversion that happened way before our current reading. Any
> suggestion here? Would you be fine if I just drop this attributes?
>   

It sounds like "fault" means something like "one of the past readings
was wrong, but I don't know which one and I don't know if the wrong
value was ever read by user space". Sorry, I fail to see what value
those attributes are supposed to have for the user. At best it could
mean "please re-read the associated attrribute", but that could as well
be accomplished without userspace action if it is really needed.
Also, per datasheet, it looks like the fault bit is set of the chip
voltage is too low. If that happens, the system has a severe problem
which can not be resolved with an attribute visible to userspace.

> > Others, like energy1_input, or most of the power attributes,
> > are standard attributes. Please explain the reasoning for
> > not using the standard API for those. 
> 
> This ones were because we need 64bit variables. For energy, the part
> also supports the alarms, max and min attributes so I included them.
>  
I can to some degree the logic for energy attributes, but do you really
have an application where the chip is used on a 32-bit system and
monitors power larger than 2kW ?

If you do have such a use case, we'll need to enhance the API
to reflect it.

Thanks,
Guenter
