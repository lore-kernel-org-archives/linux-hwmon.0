Return-Path: <SRS0=R5Lj=RC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CFDC43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Feb 2019 20:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 771B8217F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Feb 2019 20:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0PikF5+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbfB0UuD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Feb 2019 15:50:03 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:33701 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbfB0UuD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Feb 2019 15:50:03 -0500
Received: by mail-pg1-f173.google.com with SMTP id h11so8544486pgl.0
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Feb 2019 12:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5yMjRhP9l+X+7Jk9HWcxJaq96w08BtBV5P2W8yiti6M=;
        b=j0PikF5+8MYhWcNkX6ZZPVin0i5RYNxWn4JHdaECTO3y19tTn8epkI2+rbsWQzLh5N
         PJ+V7Fe0CXNFHeGQycAE+UONmNmrOhX8mGqSQfWSMK9uEaLWErtMaFjzU9DRkKvKHN/5
         8+hQYYU9bLFH/mCky6lmkoFGiM1OwBX2BaZC4PfQgW2O8Qfj97UABUMhwPhs/bRbj7ru
         dthRa4zRnS6EtVcPX86IfxsHlan67vqPNKSA5KWmP3XP9a1a+uW5tcoVRyEXMyFd8rAb
         Hzm7eWSemx9ZaHipQyc3eAVBOUCqi7LOqqWkT9dUNQZiVyzDUk7I2LOP4x+BFekWV9XR
         VCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5yMjRhP9l+X+7Jk9HWcxJaq96w08BtBV5P2W8yiti6M=;
        b=C9di1jN7MkrnWO2vs20FSoSWJEA4TbCrIqMPugoiNfeURco/b7gSrNnxQFGN0Q0OhT
         4i8V0DEp8yDnxfMq9l+j1N4N6EVInmcrxNGINOmbKhjh08czzUp6deuIm6NJp1AVXO25
         AmyKOZdx0dZiaOUSdqnhEU6bRFRBQ+7yHVujrQNLIjABGkDf1vOX4nfyYQMDDumeTOxS
         nIkfqe7I0dWGj8CnSEnNZdkwpiNDll9+e8FS/moT1uP9HN70z/gPDYwGdZvY9Q+sCo4v
         vaFjKCwwT1aI4tcSemawXWXBtAO/UyfLgaOUZqPOZWKQfutAhvH2/hsT7ovCulbrCkuF
         TuVw==
X-Gm-Message-State: AHQUAuYUb9MmhlDl3Qdpd4U1hvMVkXQPwDEw4H4YkH1Y3+zOcr36xyVx
        JDz7zegV82wvC1fDIutAC6CKC5gC
X-Google-Smtp-Source: AHgI3IYusFkWJBXb83VFByY0fcBTnlvquSGaetxNbnIbDzytYdp0ushC91GiLCoSVHQx0uaHCmQvXg==
X-Received: by 2002:aa7:8186:: with SMTP id g6mr3676916pfi.138.1551300601751;
        Wed, 27 Feb 2019 12:50:01 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y14sm25599317pgs.47.2019.02.27.12.49.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Feb 2019 12:50:00 -0800 (PST)
Date:   Wed, 27 Feb 2019 12:49:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vinay Simha B N <simhavcs@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
Message-ID: <20190227204959.GA3990@roeck-us.net>
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
 <20190221175511.GA22715@roeck-us.net>
 <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
 <20190221184805.GC22715@roeck-us.net>
 <CAGWqDJ6p1yo+LJrJESCCQ-UcF8LnhPj8Tyug4Jhne_ydA2Z7GA@mail.gmail.com>
 <20190221194929.GA676@roeck-us.net>
 <CAGWqDJ40sphwJ7Dy_3jLd-_UYb+c+oSwzc05zOz5aMAca1rWbw@mail.gmail.com>
 <CAGWqDJ6__c8HyGx2HbSbJ6du8zDh3tr+nLsOuWxAny_=0RS-4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqDJ6__c8HyGx2HbSbJ6du8zDh3tr+nLsOuWxAny_=0RS-4A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Feb 27, 2019 at 12:14:44PM +0530, Vinay Simha B N wrote:
> hi,
> 
> the trip point of temperature and hystersis values does not get
> updated in hwmon/hwmon1/temp1_max_hyst and hwmon/hwmon1/temp1_max.
> Do we need to manually set these values, though we are attaching the
> tmp102 to thermal_zone? otherwise will not get the interrupt.
> 
> please suggest.
> 

Thermal zone data/configuration does not update thermal sensor limits,
primarily because the thermal subsystem's notion of zones does not match
the typical thermal sensor hardware. Thermal sensor hardware assumes
that limits are set to fixed values, but the thermal subsystem assumes
they are freely programmable. This can cause real trouble if a thermal
sensor's alarm signal is directly wired to some action. It also interfers
with the hwmon subsystem's notion of alarms, which also assume fixed
limits.

Guenter

> On Mon, Feb 25, 2019 at 4:00 PM Vinay Simha B N <simhavcs@gmail.com> wrote:
> >
> > attached the tmp102 to thermal zone, i am able to read the
> > thermal_zone_get_temp, tz_dev->ops->get_trip_temp, get_trip_hyst.
> >
> > the trip point of temperature and hystersis values does not get
> > updated in hwmon/hwmon1/temp1_max_hyst and hwmon/hwmon1/temp1_max.
> > Do we need to manually set these values, though we are attaching the
> > tmp102 to thermal_zone? otherwise will not get the interrupt.
> > please suggest.
> >
> > &thermal_zones {
> >         hdmi-thermal {
> >                 polling-delay-passive = <250>;
> >                 polling-delay = <1000>;
> >
> >                 thermal-sensors = <&temp_sensor_u49 0>;
> >
> >                 trips {
> >                         hdmi_alert: trip0 {
> >                                 temperature = <75000>;
> >                                 hysteresis = <2000>;
> >                                 type = "passive";
> >                         };
> >                         hdmi_crit: trip1 {
> >                                 temperature = <95000>;
> >                                 hysteresis = <2000>;
> >                                 type = "critical";
> >                         };
> >                 };
> >         };
> > };
> >
> > On Fri, Feb 22, 2019 at 1:19 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Fri, Feb 22, 2019 at 12:32:08AM +0530, Vinay Simha B N wrote:
> > > > On Fri, Feb 22, 2019 at 12:18 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > >
> > > > > On Thu, Feb 21, 2019 at 11:46:32PM +0530, Vinay Simha B N wrote:
> > > > > > guenter,
> > > > > >
> > > > > > i want to use these three  tmp102 temp1_input, max and max_hys in
> > > > > > dsi2hdmi(adv7533) driver to enable or disabled based on temperature
> > > > > > range.
> > > > > >
> > > > > > https://github.com/vinaysimha/kernel-msm/commit/8ee2b9104fa56765320d4846086d91b8271f5609
> > > > > >
> > > > > > dsi2hdmi operating temperature range is -10 to 85 deg C, we will
> > > > > > enable dsi2hdmi only when temperate in operating range otherwise will
> > > > > > disable the chip.
> > > > > >
> > > > > Do you envision a system utilizing this chip that would have an operating range
> > > > > outsize -10 .. +85 degrees C ? That seems to be quite unlikely.
> > > > this system sits in a place below this temperature range, cpu can
> > > > handle upto -30, but the adv7535(dsi2hdmi) operating range -10 to +85,
> > > > so we want the system to be on and disable and enable display based on
> > > > temp range.
> > > > >
> > > > > Your solution will only work for a system with exactly one tempperature sensor;
> > > > > otherwise there is no guarantee that the sensor will be instantiated as hwmon1
> > > > we do have two temperature sensor, currently i had used hwmon1 for testing,
> > > > i have to read hwmon1 otherwise interrupt will not get cleared.
> > > > thought to have polling method also, since in this code reading from
> > > > userspace is not feasible, is it possible to optimize, any suggestion?
> > > > either i need to have global variable declared in adv7511_drv.c and
> > > > export it to tmp102.c driver . please suggest
> > >
> > > You might want to consider attaching the tmp102 to a thermal zone, and then
> > > use thermal_zone_get_temp() to read the temperature.
> > >
> > > > >
> > > > > Either case, a decison like this would not only apply to a single chip,
> > > > > but to other chips in the system. It might be in the scope of power
> > > > > or thermal management, though it seems to me that it might make more
> > > > > sense to control it from user space.
> > > > >
> > > > > Overall, with the above in mind, I don't think a hwmon specific solution
> > > > > would make sense. If a solution is really warranted in the first place
> > > > > (I really wonder about that operating range), it should be implemented
> > > > > as generic solution which applies to the rest of the system as well.
> > > > >
> > > > > There are some pieces which should be implemented in the hwmon driver -
> > > > > for example, it looks like your code implements interrupt handling for
> > > > > the tmp102. That should be handled in the tmp102 driver, which would
> > > > > then read the alert bit and report the status as temp1_alarm.
> > > > initially i had implemented irq in tmp102.c , but how to inform this
> > > > information to dsi2hdmi(adv7511_drv.c)
> > > > any references how temp1_alarm is used.
> > >
> > > This would require some work, since the infrastructure does not currently
> > > support handling thermal alarms. In a nutshell,
> > >
> > > - the tmp102 driver would implement an interrupt handler
> > > - the interrupt handler would notify the hwmon core that an
> > >   interrupt was observed. This notification callback would have
> > >   to be implemented. It would notify userspace using sysfs_notify()
> > >   and possibly with a udev event, and it would notify the thermal
> > >   core by calling thermal_zone_device_update(). I don't know how
> > >   the thermal core would then notify the dsi2hdmi driver.
> > >
> > > Guenter
> > >
> > > > >
> > > > > Thanks,
> > > > > Guenter
> > > > >
> > > > > >
> > > > > > On Thu, Feb 21, 2019 at 11:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > > >
> > > > > > > On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
> > > > > > > > hi,
> > > > > > > >
> > > > > > > > could you please suggest, how to export_symbol the tmp102 temp1_input, max
> > > > > > > > and max_hyst values to another kernel driver?
> > > > > > > >
> > > > > > > > We can acess the values
> > > > > > > > from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
> > > > > > > > kernel space, but is there better apporach to access the values in the
> > > > > > > > kernel space.
> > > > > > > >
> > > > > > > There is no in-kernel API to do that, and I do not immediately see
> > > > > > > the purpose. Either case, accessing the sysfs attribute directly is
> > > > > > > as wrong as it can get, if for nothing else since there is no guarantee
> > > > > > > that this will always be the hwmon1 device.
> > > > > > >
> > > > > > > Can you explain what you are trying to do ?
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Guenter
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > regards,
> > > > > > vinaysimha
> > > >
> > > >
> > > >
> > > > --
> > > > regards,
> > > > vinaysimha
> >
> >
> >
> > --
> > regards,
> > vinaysimha
> 
> 
> 
> -- 
> regards,
> vinaysimha
