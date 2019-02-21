Return-Path: <SRS0=LV6A=Q4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021B2C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 19:02:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C340D2081B
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 19:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKGkWWec"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbfBUTCV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Feb 2019 14:02:21 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:39171 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbfBUTCV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Feb 2019 14:02:21 -0500
Received: by mail-io1-f53.google.com with SMTP id x3so3125732ior.6
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Feb 2019 11:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u/2BtC5YNLvvwrBsk0MihhiBscmKAVcm6LwkshKFG8M=;
        b=cKGkWWecasxelswsVpawKoKSRa9rDAY19uaBk+44P3yF6A3EtjqhXy0Ol2ykINfmta
         SkxUTsDAI+qAPy99CHpjsVi99SaJCcX4OyBvGIWSstmW1xHPdOr+Y3+vWI7jOTXGYxUX
         HRES2z0HnpP3EpnNnAIqHtQy9UZUBxnLBG5+8FcMdp+sdroq6RhlSbK4fTj69RTnRULK
         O2FIn7pOfzXyAOlW0S9fooWiP9WtdY782XmUibA5wcVKH06uexkoPeptrfF3E/udlYlC
         /JFsQJT+ibzU4NOjOvkY+g9+W/Z/C9eagzkwYp0CS0M1ZMcQNlvqiBZr6e5GTpi2aRyr
         GQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u/2BtC5YNLvvwrBsk0MihhiBscmKAVcm6LwkshKFG8M=;
        b=SM57l9sDjH+imQnOdM9SoDgha0noKtDMS4RaWCBG1EbShvEQ7F5o7FBTk6dom1FbVg
         Td9sqw1v8/brWobIEywP5dpUlSclrXGSkIMSufzIgQJXjB9NHMk9RbFnl591w4nnWk4D
         ZPyxFTLDfL9AMjrYSQuWWBDHMHofaHHquoc5q68ogXPZLS3dXYmIKJl8ENhMc1q43Gak
         pXiq84qr9r9H7tB29o5EEW4neeQh2qdL7Bjtb0E1ew6eE+TRLQs6pnxSkDxUekBBoY9I
         9BADKAOWzTYHrjA6bt+zgkkLAKHtlf4BZtx4S1bPsOLgyPADyMswyquRDxUf9Wit4nZE
         K2zw==
X-Gm-Message-State: AHQUAubY6Fnyqd+2cUfo2t2Yh3edPxQAr2G4myarJJOQYaQm3AsyB8vb
        cBdd6al8Xbk+9SvQ8mmyh+K/bHgnCRMAvHhlriyS+g==
X-Google-Smtp-Source: AHgI3IYD662wVWxAyV8kO8ywV+zVJ45+fiepZhGu4pXeWrruDiZ0KFy6idmg8w7up4fR7Kd08Isrs/kdX9pYM1evLrY=
X-Received: by 2002:a24:4290:: with SMTP id i138mr48252itb.24.1550775740030;
 Thu, 21 Feb 2019 11:02:20 -0800 (PST)
MIME-Version: 1.0
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
 <20190221175511.GA22715@roeck-us.net> <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
 <20190221184805.GC22715@roeck-us.net>
In-Reply-To: <20190221184805.GC22715@roeck-us.net>
From:   Vinay Simha B N <simhavcs@gmail.com>
Date:   Fri, 22 Feb 2019 00:32:08 +0530
Message-ID: <CAGWqDJ6p1yo+LJrJESCCQ-UcF8LnhPj8Tyug4Jhne_ydA2Z7GA@mail.gmail.com>
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Feb 22, 2019 at 12:18 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Feb 21, 2019 at 11:46:32PM +0530, Vinay Simha B N wrote:
> > guenter,
> >
> > i want to use these three  tmp102 temp1_input, max and max_hys in
> > dsi2hdmi(adv7533) driver to enable or disabled based on temperature
> > range.
> >
> > https://github.com/vinaysimha/kernel-msm/commit/8ee2b9104fa56765320d4846086d91b8271f5609
> >
> > dsi2hdmi operating temperature range is -10 to 85 deg C, we will
> > enable dsi2hdmi only when temperate in operating range otherwise will
> > disable the chip.
> >
> Do you envision a system utilizing this chip that would have an operating range
> outsize -10 .. +85 degrees C ? That seems to be quite unlikely.
this system sits in a place below this temperature range, cpu can
handle upto -30, but the adv7535(dsi2hdmi) operating range -10 to +85,
so we want the system to be on and disable and enable display based on
temp range.
>
> Your solution will only work for a system with exactly one tempperature sensor;
> otherwise there is no guarantee that the sensor will be instantiated as hwmon1
we do have two temperature sensor, currently i had used hwmon1 for testing,
i have to read hwmon1 otherwise interrupt will not get cleared.
thought to have polling method also, since in this code reading from
userspace is not feasible, is it possible to optimize, any suggestion?
either i need to have global variable declared in adv7511_drv.c and
export it to tmp102.c driver . please suggest
>
> Either case, a decison like this would not only apply to a single chip,
> but to other chips in the system. It might be in the scope of power
> or thermal management, though it seems to me that it might make more
> sense to control it from user space.
>
> Overall, with the above in mind, I don't think a hwmon specific solution
> would make sense. If a solution is really warranted in the first place
> (I really wonder about that operating range), it should be implemented
> as generic solution which applies to the rest of the system as well.
>
> There are some pieces which should be implemented in the hwmon driver -
> for example, it looks like your code implements interrupt handling for
> the tmp102. That should be handled in the tmp102 driver, which would
> then read the alert bit and report the status as temp1_alarm.
initially i had implemented irq in tmp102.c , but how to inform this
information to dsi2hdmi(adv7511_drv.c)
any references how temp1_alarm is used.
>
> Thanks,
> Guenter
>
> >
> > On Thu, Feb 21, 2019 at 11:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
> > > > hi,
> > > >
> > > > could you please suggest, how to export_symbol the tmp102 temp1_input, max
> > > > and max_hyst values to another kernel driver?
> > > >
> > > > We can acess the values
> > > > from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
> > > > kernel space, but is there better apporach to access the values in the
> > > > kernel space.
> > > >
> > > There is no in-kernel API to do that, and I do not immediately see
> > > the purpose. Either case, accessing the sysfs attribute directly is
> > > as wrong as it can get, if for nothing else since there is no guarantee
> > > that this will always be the hwmon1 device.
> > >
> > > Can you explain what you are trying to do ?
> > >
> > > Thanks,
> > > Guenter
> >
> >
> >
> > --
> > regards,
> > vinaysimha



-- 
regards,
vinaysimha
