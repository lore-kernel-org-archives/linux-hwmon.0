Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4B2C433DB
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Feb 2021 16:49:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAC2264DA5
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Feb 2021 16:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhBAQt3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Feb 2021 11:49:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231494AbhBAQt1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Feb 2021 11:49:27 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D3AC061573
        for <linux-hwmon@vger.kernel.org>; Mon,  1 Feb 2021 08:48:45 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id 16so18094694ioz.5
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Feb 2021 08:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metormote-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJZgLz0IPXFdEChkfMH0kc4zCluHHdUTmru5kk+kkbs=;
        b=NlWpMek6MTyixXva1reZbaipgYWOi722iN5JNEBiHwBL53f1sfHtXj/QnRmYZPKgNr
         kMKx4Uxy0qW7ZdJrZKthq8NfnSWE6gO6iQERO9aAFukbxJdNnMVG8rWDEz4SV8hNTvxe
         IFZYJ0N+dXG6iHqM6aUKFaJSAweQw10uEtEF2lEL4IC4XP9ZPAGAKIJpCMYIbiGPy31T
         u3WnBmq/fl09mVIn+WOuHdd2/s2OMlSHWADHXjUkzuyoxk7CwRz6Ra0DCmfMQxjs/CqN
         DCmXaX/vEfN/Ktdf/q/PTXCxJWRgl7k9D3AgpavEzvSpKLLfVa4bWfrxxCNbRH2cxCYu
         Tu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJZgLz0IPXFdEChkfMH0kc4zCluHHdUTmru5kk+kkbs=;
        b=CIhmPl3ffUQBDaYfNYIZEmtbJ5RwWmZ8ZJSHSZc7OPiPI7LOVqIfA1OlkfNLBjy2uO
         x0ObUdi/n+jN/hhZ/WTqjsRzuNNV3Y8HuQN7qqin3uvxwMI9FX03Dn3HWCSZFvN4KpM0
         QJ+zHPQltc/r0uiVO9Qmel48NOJtjM3WkTQmqJet9gOuMq4Qkabt0F3QIZHVXoWYYzIj
         rqiT01/vIeJmsTSvB+5XHhNEOOA15z/rid0Xbr78LI09H4vWXFrWDBLB9meHPlJM6bDl
         irwSDEqW/o9QSjeoPzqEs0MsD+x4z6sPYgqp6+1JTEmYd8KoDj+HZn1qjbNHZlBWUUqi
         1Auw==
X-Gm-Message-State: AOAM5336cEgPcD7OYHtbw2nWfMetezho+x6wvo/bIOGolgyLWU/uf/jL
        Hx8S7V5j3eIBiV6dILoZTBGInc230PdUZG5RFi9GRg==
X-Google-Smtp-Source: ABdhPJwnnN9ONplvogUBU6iv2iVmz223Bxcch/O5xKWhP9Lg7Z6cLq99JK0Wi7rT/xbFlg7m11I54O1IX0HfWCX+9Aw=
X-Received: by 2002:a05:6638:d8a:: with SMTP id l10mr15790042jaj.2.1612198125347;
 Mon, 01 Feb 2021 08:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20210127084140.35626-1-erik.rosen@metormote.com>
 <20210127084140.35626-2-erik.rosen@metormote.com> <20210127173255.GA144627@roeck-us.net>
 <CA+ui0HmbcQe_CD-0d+AMgx_jSuY=AG9Qx4Ab2g71kPVFrMDe_w@mail.gmail.com> <ee2a89f6-0f55-9328-b53d-b5893eb625db@roeck-us.net>
In-Reply-To: <ee2a89f6-0f55-9328-b53d-b5893eb625db@roeck-us.net>
From:   Erik Rosen <erik.rosen@metormote.com>
Date:   Mon, 1 Feb 2021 17:48:34 +0100
Message-ID: <CA+ui0H=UC495kfZuZeg-ryPh_aSa0wFqf=hnn7oS782qFgh60A@mail.gmail.com>
Subject: Re: [PATCH 1/1] Add ST STPDDC60 pmbus driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter


On Fri, Jan 29, 2021 at 4:50 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Erik,
>
> On 1/29/21 5:07 AM, Erik Rosen wrote:
> [ ... ]
> >>
> >>> +             break;
> >>> +     case PMBUS_VOUT_OV_FAULT_LIMIT:
> >>> +     case PMBUS_VOUT_UV_FAULT_LIMIT:
> >>> +             ret = pmbus_read_word_data(client, page, phase, reg);
> >>> +             if (ret < 0)
> >>> +                     return ret;
> >>> +             ret &= 0x07ff;
> >>
> >> This needs explanation. The BMR481 datasheet does not suggest that only
> >> 11 bits are valid.
> >
> > Ok, I will add a clarification. These registers use LINEAR11 whereas
> > LINEAR16 is expected for vout-related registers.
> >
> Is that the correct fix, then ? LINEAR11 means that the exponent is flexible,
> while it is fixed for LINEAR16. Just assuming that the exponents always match
> seems risky. Also, bit 11 in LINEAR11 is the sign bit, meaning negative limits
> (which seem at least theoretically be possible) would be reported as large
> positive values.

The chip actually uses fixed exponents for representing all linear values and
the specification explicitly states the values of the LSB for all registers.
It also states that the limits can be handled as linear format when
writing  _if_
the exponent is the fixed value used for that limit. This means I'll have to
convert all limit writes to use the expected exponent.
Given this, I think it's safe to assume that the exponents are
constant, but I'll
add a check to handle potential negative values.

>
> >>
> >>> +             break;
> >>> +     default:
> >>> +             ret = -ENODATA;
> >>> +             break;
> >>> +     }
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/*
> >>> + * The vout under- and over-voltage limits are readonly for this chip.
> >>> + */
> >>
> >> Not really. The BMR481 datasheet suggests that the value can be changed
> >> by writing to MFR_OV_LIMIT_OFFSET and MFR_UV_LIMIT_OFFSET.
> >> I am not saying that you should implement that if you don't want to,
> >> but I would suggest a better (more accurate) explanation.
> >
> > I have looked into this a bit more and it's a bit more to it than I expected.
> > The limits are actually dynamic values that will follow both commanded
> > output voltage via the PMBus or SVID/AVSBus as well as current
> > load (droop). To account for this I propose a mechanism to set the
>
> Yes, I noticed.
>
> > 'update' flag on selected sensors after auto-detection of limit attributes.
> >
> > Maybe add a function like this to pmbus_core that can be called
> > after the probing is done?
> >
> > int pmbus_set_update(struct i2c_client *client, u8 reg)
> > {
> >         struct pmbus_data *data = i2c_get_clientdata(client);
> >         struct pmbus_sensor *sensor;
> >
> >         for (sensor = data->sensors; sensor; sensor = sensor->next) {
> >                 if (sensor->reg == reg) {
> >                         sensor->update = true;
> >                         return 0;
> >                 }
> >         }
> >         return -ENXIO;
> > }
> >
>
> Add a boolean 'update' parameter (to be able to disable updates),
> and make the function void. Also, remember that 'reg' may be repeated
> on a chip with multiple pages, so you can't return after the first match.
> Otherwise looks ok.

Ok

>
> > I did also implemented writes to the limit registers via the offset
> > registers but it might be
> > a bit confusing to the user since the limits are set in relation to
> > the current commanded
> > output voltage and will change together with this. In the worst case,
> > the voltage might
> > change at the same time as the limit is written to, which will give
> > unexpected results.
>
> Agreed, that can be tricky.
>
> > The alternative would be to just set these limits read-only. What is
> > your opinion?
> >
>
> Your call. Just add a note explaining why it is made read-only to explain
> the reasoning for future readers.

Ok, I'll keep the functionality and add a note in the docs.


>
> > Also, I found a problem in how pmbus_set_sensor() works together with
> > pmbus_clear_cache()
> > as used in the zl6100 and lm25066 drivers. The new value is written to
> > the sensor struct _after_
> > the _pmbus_write_word_data() has returned and thus after
> > pmbus_clear_cache() is called.
> > The effect is that all values are cleared, except the one just written
> > to, which I believe defeats
> > the purpose of clearing the cache in the first place.> One solution would be to write the new value to sensor->data before
> > the _pmbus_write_word_data
> > is called and to restore the old value in case of error.
> > I can make a separate patch for this if it seems like a reasonable solution?
> >
>
> Good catch.
>
> An alternate and more generic solution might be to set sensor->data to
> -ENODATA after updates. After all, it seems risky to assume that the chip
> returns the value that was written (I have seen it often enough in other
> drivers that this is not necessarily the case). That would also mean that
> it would no longer be necessary to call pmbus_clear_cache() in the zl6100
> and lm25066 drivers. Impact would be that a limit read after a write would
> always be sent to the chip for all drivers, but that seems minimal compared
> to the gain (and presumably limit registers are not frequently updated).

I agree that this is a more robust solution. I'll send a separate patch for this
update. The zl6100 in fact still needs to clear the cache since a write to the
fault limit also changes the value of the warning limit and vice versa. As far
as I can see the usage in lm25066 can be removed however.

>
> Thanks,
> Guenter
