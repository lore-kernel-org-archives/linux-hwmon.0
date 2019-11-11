Return-Path: <SRS0=0ZqG=ZD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A0FC43331
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 17:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 43DDE214DB
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Nov 2019 17:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdEctRSh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfKKRfL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Nov 2019 12:35:11 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43891 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfKKRfK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Nov 2019 12:35:10 -0500
Received: by mail-pl1-f196.google.com with SMTP id a18so8057256plm.10
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Nov 2019 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Eo2i+iMeMaAm046EL5ip69xym4vsibb65zfJmkDz5pk=;
        b=bdEctRShAzxa/jV0BuGcfQDkptImnrUbIM2Z4I/ZyXjh9/TCNML+ov2jtilDJcHBq5
         rL/8vidc5cZSYznwuGtbShMyeIBh/7gonA1E+0M5XgcqGblJXTWBvQaqOtjX9StQJIqV
         mXo/Cn1fxh06JCTWbOub8kcrQN6ibuPrhtIUQUo79HjT/d3riQt3+9fm13uiSqyylQAi
         +DA6rraX2ruGpd02XRrQGU7asutg9h1WnAbssYQKvXy+gIPhFAfZ78fOW8BeCWGwm/U/
         8vlzp+3NPuaQfJbGemb0mU0wldwoC6fIjfmJHTSfA2RgWn6RlW9F6/D/jZvmXWrEimMV
         I67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=Eo2i+iMeMaAm046EL5ip69xym4vsibb65zfJmkDz5pk=;
        b=Wpuo8E/FbW/E/5n8mJHQAbMsbPZViayzg7iaWZ9ujQzbK1w8ZbM5FYAzoWzGw+iGp2
         tIGp/0NBUhq9uX6jDQ666QtMO7o7Am20e57ZEg5VVvMiq97Ahs+nL26JTuId2sB/a0mq
         I1e8RuLNYMuDKQqEQBKy9kkgV9fGyURvVzymvgsFx3cJFAHdaR2pw9ib/egftoMOIa/I
         hKzpFX5W8KwWMP5mjVUHTBNAYT6GZm2OnICbM8DSyzOzcCj923ycodRAKIeLuOv6UnC+
         eEmB9DpQlmDYtnYS9xK2U7Vxw1v3lAlGcFRLUhyMX3CsktXs0cZJWLpBZbJIP5K47K48
         +qgQ==
X-Gm-Message-State: APjAAAX+GPx6es0khUi45iCDCcn/rlNsjhNBH56khMb61OMh9gVZo5tv
        TykBUEPCcSUAAS+u7eQdifbKszok
X-Google-Smtp-Source: APXvYqzYYlnft3p/Q8XhFnDvCTl5UP0JI7nX1zsbvaEnNTqVBxON0dI3HZgyRaVTZo7oP53S6IwyVQ==
X-Received: by 2002:a17:902:ac90:: with SMTP id h16mr27749316plr.147.1573493708116;
        Mon, 11 Nov 2019 09:35:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k20sm17766123pgn.40.2019.11.11.09.35.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2019 09:35:06 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:35:05 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-nvme@lists.infradead.org, linux-hwmon@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
        Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
Message-ID: <20191111173505.GB5826@roeck-us.net>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <d3c0c9a7-00b9-0465-16e1-6fd7ba97dfd0@roeck-us.net>
 <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umyiju2Q2fdfVaFyX+Q=sMKr5Gsc_GDVYmSa0vB+w8acvAw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 12, 2019 at 12:56:21AM +0900, Akinobu Mita wrote:
> 2019年11月11日(月) 1:30 Guenter Roeck <linux@roeck-us.net>:
> >
> 
[ ... ]

> > > Example output from the "sensors" command:
> > >
> > > nvme-pci-0100
> > > Adapter: PCI adapter
> > > Composite:    +53.0 C  (low  = -273.0 C, high = +70.0 C)
> > >                         (crit = +80.0 C)
> > > Sensor 1:     +56.0 C  (low  = -273.0 C, high = +65262.0 C)
> > > Sensor 2:     +51.0 C  (low  = -273.0 C, high = +65262.0 C)
> > > Sensor 5:     +73.0 C  (low  = -273.0 C, high = +65262.0 C)
> > >
> >
> > Have you tried writing the limits ? On my Intel NVME drive (SSDPEKKW512G7), writing
> > any minimum limit on the Composite temperature sensor results in a temperature
> > warning, and that warning is sticky until I reset the controller.
> > I don't see that problem on Samsung SSD 970 EVO 500GB; I have not yet tried others.
> 
> I have Crucial CT500P1SSD8 and WDC WDS512G1X0C-00ENX0, and I have no
> problem with these devices.
> 
> > root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
> > nvme-pci-0100
> > Adapter: PCI adapter
> > Composite:    +30.0°C  (low  = -273.0°C, high = +70.0°C)
> >                         (crit = +80.0°C)
> >
> > root@jupiter:/sys/class/hwmon/hwmon0# echo 0 > temp1_min
> > root@jupiter:/sys/class/hwmon/hwmon0# sensors nvme-pci-0100
> > nvme-pci-0100
> > Adapter: PCI adapter
> > Composite:    +30.0°C  (low  =  +0.0°C, high = +70.0°C)  ALARM
> >                         (crit = +80.0°C)
> >
> > It doesn't seem to matter which temperature I write; writing -273000 has
> > the same result.
> >
> > [This is actually why I didn't use the features commands; not that I had observed
> >   the problem, but I was concerned that problems like this would show up.]
> 
> Maybe we should introduce a new quirk so that we can avoid changing
> temperature threshold for such devices.  Could you tell SSDPEKKW512G7's
> vendor and device ID?  Quick googling answers it's 8086:f1a5, but I want
> to make sure.

Yes, that is correct.

01:00.0 Non-Volatile memory controller [0108]: Intel Corporation Device [8086:f1a5] (rev 03)

I'll see if I can test this tonight on my other NVMEs. I also dug up an old
NVMe drive from Toshiba; I'll see if I can connect and test it as well.

[ ... ]

> > >        */
> > >       switch (attr) {
> > >       case hwmon_temp_max:
> > > -             *val = (data->ctrl->wctemp - 273) * 1000;
> > > +             err = nvme_get_temp_thresh(data->ctrl, channel, false, val);
> > > +             if (err)
> > > +                     *val = (data->ctrl->wctemp - 273) * 1000;
> >
> > This would report WCTEMP for all sensors on errors, including errors seen while
> > the controller is resetting. I think it should be something like
> >
> >                 int err = 0;
> >                 ...
> >
> >                 if (!channel)
> >                         *val = (data->ctrl->wctemp - 273) * 1000;
> >                 else
> >                         err = nvme_get_temp_thresh(data->ctrl, channel, false, val);
> >                 return err;
> >
> > assuming we keep using ctrl->wctemp (see below). If changing the upper Composite
> > temperature sensor limit changes wctemp, and we don't update it, we should not
> > use it at all after registration and just report the error.
> >
> > >               return 0;
> > > +     case hwmon_temp_min:
> > > +             return nvme_get_temp_thresh(data->ctrl, channel, true, val);
> > >       case hwmon_temp_crit:
> > >               *val = (data->ctrl->cctemp - 273) * 1000;
> > >               return 0;
> > > @@ -73,6 +117,23 @@ static int nvme_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > >       return err;
> > >   }
> > >
> > > +static int nvme_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> > > +                         u32 attr, int channel, long val)
> > > +{
> > > +     struct nvme_hwmon_data *data = dev_get_drvdata(dev);
> > > +
> > > +     switch (attr) {
> > > +     case hwmon_temp_max:
> > > +             return nvme_set_temp_thresh(data->ctrl, channel, false, val);
> >
> > Does this change WCTEMP if written on channel 0 ? If so, we would have to update
> > the cached value of ctrl->wctemp (or never use it after registration).
> 
> At least for the devices I have, setting the over temperature threshold
> doesn't change the WCTEMP.
> I have checked with  'nvme id-ctrl /dev/nvme0 | grep ctemp'.
> 

Interesting. I just tested this, and the result is the same with Samsung
SSD 970 EVO. With that in mind, maybe we should really not use wctemp
at all after initialization, as I had suggested above. What do you think ?

Thanks,
Guenter
