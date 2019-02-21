Return-Path: <SRS0=LV6A=Q4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F8AC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 18:48:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 001CA2084D
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Feb 2019 18:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Opjfi4iG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfBUSsI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Feb 2019 13:48:08 -0500
Received: from mail-pg1-f182.google.com ([209.85.215.182]:38218 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfBUSsI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Feb 2019 13:48:08 -0500
Received: by mail-pg1-f182.google.com with SMTP id m2so11901127pgl.5
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Feb 2019 10:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J2btSTaBPKxusC2B9qmEeEOd8WxzbLHN3oj1cSwrjy4=;
        b=Opjfi4iGDEHXrn5M+vxWftYy54TOKV73JpJ5iomFFxI0YBZl3S66LpH6jgRM3LIVeJ
         ThUNTOnTPar77+5M2a/Ahtqju+Vg+eqV2SALQycTjcDFWsq67rL8/8fMCri+mn0DhI7/
         CDJ86aywUqfGc0W1pgxp9gnKOv7y2/umV6pjMFc1WuTPdtUdNrD1hTObi6D29nkufzhY
         CBQQC0UDRIQE0AMBEG/vIEv2UiMRPoSm8d3slnteF3kK+P4ewUrYFzFdBi7TrjIf/4+x
         eYVH8gwyTrEdZ+P976wQVkR4i1xasp0K4aNHszJgLvRrw9sMBzYTI+57ktPlxkezpAUM
         QI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=J2btSTaBPKxusC2B9qmEeEOd8WxzbLHN3oj1cSwrjy4=;
        b=i1K7conWYSvWvdnZjhA3hNyV/uuNPJtT6waQIjwm0zWvlrnD6mJfWJEXKwhOJFPLyd
         js6ZBr/Z5Y+c+zfCSJyEBIwgJeFu1OMPwx9dzRYIu5s9sy/g92CAIoNjcZ2krEBqDHf2
         iYOaKoRbECi5YNxRaIBbdLJXx2Xw+oGxmpRal7u5U/t1l+gN0l8alzpLhkfJyAc0M8mf
         7gjMpHd7+osjyI2XOJcZVDOamM6lJVx2ydmCP2d+L51y8niNMUB+xSXK2ySMwGBoEPuP
         mvWSrdiPfwfWMPXgG3Yq+2cstzKVX1duohjckWCK3fpGWehSpqPn6nQQvRuyv9GPuplW
         7mLQ==
X-Gm-Message-State: AHQUAualngZC6eR6+8D5glyaCjMILeNeTYqJ1lBRAwRjkzN6gpreO90U
        bhBpHbie3TLJYxhtukGhClk=
X-Google-Smtp-Source: AHgI3IYM/VnwCLwHlNWjdaer3HM5CGH4eY2cPBZJhg6h6bS+DJm4MRiviuSlHyoEMG/HKYKQhLNWPg==
X-Received: by 2002:a63:5d48:: with SMTP id o8mr26775080pgm.297.1550774887379;
        Thu, 21 Feb 2019 10:48:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t12sm55861225pgq.68.2019.02.21.10.48.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Feb 2019 10:48:06 -0800 (PST)
Date:   Thu, 21 Feb 2019 10:48:05 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vinay Simha B N <simhavcs@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: tmp102 hwmon accessing temp1_input, max, max_hyst
Message-ID: <20190221184805.GC22715@roeck-us.net>
References: <CAGWqDJ48N5Q6OsHq_f217za-34zQMDY8qNL6XEDLREPY3JP3MA@mail.gmail.com>
 <20190221175511.GA22715@roeck-us.net>
 <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqDJ4pvVeTsqepodC-9g2UDjVq6NT-n3FaudXN456uwLQ00w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 21, 2019 at 11:46:32PM +0530, Vinay Simha B N wrote:
> guenter,
> 
> i want to use these three  tmp102 temp1_input, max and max_hys in
> dsi2hdmi(adv7533) driver to enable or disabled based on temperature
> range.
> 
> https://github.com/vinaysimha/kernel-msm/commit/8ee2b9104fa56765320d4846086d91b8271f5609
> 
> dsi2hdmi operating temperature range is -10 to 85 deg C, we will
> enable dsi2hdmi only when temperate in operating range otherwise will
> disable the chip.
> 
Do you envision a system utilizing this chip that would have an operating range
outsize -10 .. +85 degrees C ? That seems to be quite unlikely.

Your solution will only work for a system with exactly one tempperature sensor;
otherwise there is no guarantee that the sensor will be instantiated as hwmon1.

Either case, a decison like this would not only apply to a single chip,
but to other chips in the system. It might be in the scope of power
or thermal management, though it seems to me that it might make more
sense to control it from user space.

Overall, with the above in mind, I don't think a hwmon specific solution
would make sense. If a solution is really warranted in the first place
(I really wonder about that operating range), it should be implemented
as generic solution which applies to the rest of the system as well.

There are some pieces which should be implemented in the hwmon driver -
for example, it looks like your code implements interrupt handling for
the tmp102. That should be handled in the tmp102 driver, which would
then read the alert bit and report the status as temp1_alarm.

Thanks,
Guenter

> 
> On Thu, Feb 21, 2019 at 11:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Thu, Feb 21, 2019 at 08:21:09PM +0530, Vinay Simha B N wrote:
> > > hi,
> > >
> > > could you please suggest, how to export_symbol the tmp102 temp1_input, max
> > > and max_hyst values to another kernel driver?
> > >
> > > We can acess the values
> > > from filp_open("/sys/class/hwmon/hwmon1/temp1_input", O_RDONLY, 0); in
> > > kernel space, but is there better apporach to access the values in the
> > > kernel space.
> > >
> > There is no in-kernel API to do that, and I do not immediately see
> > the purpose. Either case, accessing the sysfs attribute directly is
> > as wrong as it can get, if for nothing else since there is no guarantee
> > that this will always be the hwmon1 device.
> >
> > Can you explain what you are trying to do ?
> >
> > Thanks,
> > Guenter
> 
> 
> 
> --
> regards,
> vinaysimha
