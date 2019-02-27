Return-Path: <SRS0=R5Lj=RC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D867C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Feb 2019 06:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62D8F218CD
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Feb 2019 06:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ble9ZnIv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbfB0Go5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Feb 2019 01:44:57 -0500
Received: from mail-it1-f174.google.com ([209.85.166.174]:53564 "EHLO
        mail-it1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbfB0Go4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Feb 2019 01:44:56 -0500
Received: by mail-it1-f174.google.com with SMTP id v2so7778144ith.3
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Feb 2019 22:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVx6fadNg0fSdt8TnxoIDWFiVwg6aYdYEh35PMBY2Fs=;
        b=ble9ZnIvrxOsXua6QVAZTdibc02cyXAXvrt2AFDUhR2A8pRtJlNcVE5bKUG6O6L0N4
         5+qx4qI2lbzDO3vTd07UCOc35BzIhAodKJp2XTy0MJ5bPVBeN0pw/of2FjYL/WFag3Qz
         FbbM/ck1ZnX3/TCZuodH3TXL2Q1roU79GQ02sV+5vA4QyWe6OIFGakzbNLvGS0N3j5vD
         zEsX/ATLrc1g+DJ+0cvP+78RBgbH18XKv6iyEN082eE052TMhZavf3GxqOatHhkcUOBw
         fnTOnyimKiMhj2Aupr27TTQK+Bt932BLaAUQEvf975v9KTVJbYHn+5V6A2cyHKuhHebY
         xnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVx6fadNg0fSdt8TnxoIDWFiVwg6aYdYEh35PMBY2Fs=;
        b=WwfSiLQJeWbO83ALxnjW2lVc7h75Q8Uy7rf6EWMIX2KKFCDcZvDV74c1IHSS4T8kln
         O9ZkfYsM3OszfKXHFkZN26lioXwjHqflEyl5sPubE/GNustqkM/U/L8x2BJAyrKmS1Qf
         v2WapFWOVgaglgXx9VDa3Wo30TTMxd86FVk1xcO6/6v0ZMCOBDdQtxpNTHfTDeG1W3Xw
         azlPB0O/gF3JU5Mzyr7TFRVn2+Tc6viqRbwW31itu4U6+3Y9/c0mQHqmEoyRuY9WctTW
         PBnKkwHFsLZDIE9nHdU9dS5zTwXfFP9PyI/Z1VOsh9+FQ0wLjsQT3uWWmqh1Cq5zrGlt
         f/qw==
X-Gm-Message-State: AHQUAubEaHeE6UlomA7UFaMSwLFO/RNNyiaSZEIaQWBS6/Inx+Jq6zbj
        R/ixl97JwZJ5zLtyM4FIPNOZXey8pavA/ttivgeOEIsG
X-Google-Smtp-Source: AHgI3IYvisJxqwtJchfmRy8mCc8AfaEFeNWlnYEdu/eDyJqqTUvLCdbb4WiZ+9xaFuXz3WMgXiO6VM03Q/O5xRqcJmQ=
X-Received: by 2002:a24:298b:: with SMTP id p133mr637731itp.43.1551249895444;
 Tue, 26 Feb 2019 22:44:55 -0800 (PST)
MIME-Version: 1.0
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
 <20190221175511.GA22715@roeck-us.net> <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
 <20190221184805.GC22715@roeck-us.net> <CAGWqDJ6p1yo+LJrJESCCQ-UcF8LnhPj8Tyug4Jhne_ydA2Z7GA@mail.gmail.com>
 <20190221194929.GA676@roeck-us.net> <CAGWqDJ40sphwJ7Dy_3jLd-_UYb+c+oSwzc05zOz5aMAca1rWbw@mail.gmail.com>
In-Reply-To: <CAGWqDJ40sphwJ7Dy_3jLd-_UYb+c+oSwzc05zOz5aMAca1rWbw@mail.gmail.com>
From:   Vinay Simha B N <simhavcs@gmail.com>
Date:   Wed, 27 Feb 2019 12:14:44 +0530
Message-ID: <CAGWqDJ6__c8HyGx2HbSbJ6du8zDh3tr+nLsOuWxAny_=0RS-4A@mail.gmail.com>
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hi,

the trip point of temperature and hystersis values does not get
updated in hwmon/hwmon1/temp1_max_hyst and hwmon/hwmon1/temp1_max.
Do we need to manually set these values, though we are attaching the
tmp102 to thermal_zone? otherwise will not get the interrupt.

please suggest.

On Mon, Feb 25, 2019 at 4:00 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
>
> attached the tmp102 to thermal zone, i am able to read the
> thermal_zone_get_temp, tz_dev->ops->get_trip_temp, get_trip_hyst.
>
> the trip point of temperature and hystersis values does not get
> updated in hwmon/hwmon1/temp1_max_hyst and hwmon/hwmon1/temp1_max.
> Do we need to manually set these values, though we are attaching the
> tmp102 to thermal_zone? otherwise will not get the interrupt.
> please suggest.
>
> &thermal_zones {
>         hdmi-thermal {
>                 polling-delay-passive = <250>;
>                 polling-delay = <1000>;
>
>                 thermal-sensors = <&temp_sensor_u49 0>;
>
>                 trips {
>                         hdmi_alert: trip0 {
>                                 temperature = <75000>;
>                                 hysteresis = <2000>;
>                                 type = "passive";
>                         };
>                         hdmi_crit: trip1 {
>                                 temperature = <95000>;
>                                 hysteresis = <2000>;
>                                 type = "critical";
>                         };
>                 };
>         };
> };
>
> On Fri, Feb 22, 2019 at 1:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Fri, Feb 22, 2019 at 12:32:08AM +0530, Vinay Simha B N wrote:
> > > On Fri, Feb 22, 2019 at 12:18 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On Thu, Feb 21, 2019 at 11:46:32PM +0530, Vinay Simha B N wrote:
> > > > > guenter,
> > > > >
> > > > > i want to use these three  tmp102 temp1_input, max and max_hys in
> > > > > dsi2hdmi(adv7533) driver to enable or disabled based on temperature
> > > > > range.
> > > > >
> > > > > https://github.com/vinaysimha/kernel-msm/commit/8ee2b9104fa56765320d4846086d91b8271f5609
> > > > >
> > > > > dsi2hdmi operating temperature range is -10 to 85 deg C, we will
> > > > > enable dsi2hdmi only when temperate in operating range otherwise will
> > > > > disable the chip.
> > > > >
> > > > Do you envision a system utilizing this chip that would have an operating range
> > > > outsize -10 .. +85 degrees C ? That seems to be quite unlikely.
> > > this system sits in a place below this temperature range, cpu can
> > > handle upto -30, but the adv7535(dsi2hdmi) operating range -10 to +85,
> > > so we want the system to be on and disable and enable display based on
> > > temp range.
> > > >
> > > > Your solution will only work for a system with exactly one tempperature sensor;
> > > > otherwise there is no guarantee that the sensor will be instantiated as hwmon1
> > > we do have two temperature sensor, currently i had used hwmon1 for testing,
> > > i have to read hwmon1 otherwise interrupt will not get cleared.
> > > thought to have polling method also, since in this code reading from
> > > userspace is not feasible, is it possible to optimize, any suggestion?
> > > either i need to have global variable declared in adv7511_drv.c and
> > > export it to tmp102.c driver . please suggest
> >
> > You might want to consider attaching the tmp102 to a thermal zone, and then
> > use thermal_zone_get_temp() to read the temperature.
> >
> > > >
> > > > Either case, a decison like this would not only apply to a single chip,
> > > > but to other chips in the system. It might be in the scope of power
> > > > or thermal management, though it seems to me that it might make more
> > > > sense to control it from user space.
> > > >
> > > > Overall, with the above in mind, I don't think a hwmon specific solution
> > > > would make sense. If a solution is really warranted in the first place
> > > > (I really wonder about that operating range), it should be implemented
> > > > as generic solution which applies to the rest of the system as well.
> > > >
> > > > There are some pieces which should be implemented in the hwmon driver -
> > > > for example, it looks like your code implements interrupt handling for
> > > > the tmp102. That should be handled in the tmp102 driver, which would
> > > > then read the alert bit and report the status as temp1_alarm.
> > > initially i had implemented irq in tmp102.c , but how to inform this
> > > information to dsi2hdmi(adv7511_drv.c)
> > > any references how temp1_alarm is used.
> >
> > This would require some work, since the infrastructure does not currently
> > support handling thermal alarms. In a nutshell,
> >
> > - the tmp102 driver would implement an interrupt handler
> > - the interrupt handler would notify the hwmon core that an
> >   interrupt was observed. This notification callback would have
> >   to be implemented. It would notify userspace using sysfs_notify()
> >   and possibly with a udev event, and it would notify the thermal
> >   core by calling thermal_zone_device_update(). I don't know how
> >   the thermal core would then notify the dsi2hdmi driver.
> >
> > Guenter
> >
> > > >
> > > > Thanks,
> > > > Guenter
> > > >
> > > > >
> > > > > On Thu, Feb 21, 2019 at 11:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > >
> > > > > > On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
> > > > > > > hi,
> > > > > > >
> > > > > > > could you please suggest, how to export_symbol the tmp102 temp1_input, max
> > > > > > > and max_hyst values to another kernel driver?
> > > > > > >
> > > > > > > We can acess the values
> > > > > > > from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
> > > > > > > kernel space, but is there better apporach to access the values in the
> > > > > > > kernel space.
> > > > > > >
> > > > > > There is no in-kernel API to do that, and I do not immediately see
> > > > > > the purpose. Either case, accessing the sysfs attribute directly is
> > > > > > as wrong as it can get, if for nothing else since there is no guarantee
> > > > > > that this will always be the hwmon1 device.
> > > > > >
> > > > > > Can you explain what you are trying to do ?
> > > > > >
> > > > > > Thanks,
> > > > > > Guenter
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > regards,
> > > > > vinaysimha
> > >
> > >
> > >
> > > --
> > > regards,
> > > vinaysimha
>
>
>
> --
> regards,
> vinaysimha



-- 
regards,
vinaysimha
