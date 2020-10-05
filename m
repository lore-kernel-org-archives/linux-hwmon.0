Return-Path: <SRS0=kkoh=DM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2C3C4363D
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 03:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 106142072D
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 03:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FZnenUBZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbgJEDHu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Oct 2020 23:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgJEDHu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Oct 2020 23:07:50 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E463BC0613CE
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2020 20:07:48 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id j2so7696040eds.9
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Oct 2020 20:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uT8eBmZAqAJJEsDETrljz3PEL4hvmZF2Cp5EfH9iMro=;
        b=FZnenUBZkR5/srG/i1tklrh+dgQj/7iCDNZNFSp2gchwIc4kWqSXuplT3kXQWR4GWT
         nuUcUqBPAR463D9bC67rLHycs8UE7FIb/vK/zEgLhGK7vuV7OOSjN60qy2/yMEzzEv09
         xzYhs0elSJ4cbXQbnmShHO2doSN7qBRkgkOMGjE32n+KTWFa8q4hy9POz9qvydWfM3wV
         5I6bjSN2A38mcRvRuF/KbXZcEwPZ38r+sr8OLcBENFgWdMKrLYOwNpmnjdWRIOc2kUUq
         mZEFK/UG6i0HmWfj6NZxe2iSW/cd0+ZXM1P4Xz+WQ25v0xlmUBy7hehWhWa5wkn3ueuv
         OEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uT8eBmZAqAJJEsDETrljz3PEL4hvmZF2Cp5EfH9iMro=;
        b=J9ndMVBlsoEUIlB+t6IS/BLonnCqU2mf0HT/JLomf8obXqwc0zqeAixnJo2RqcuW1J
         jqqLLAajzzudEDp4hAxPTqZWq9jtbaqAjvudjkzgb4BNcrqMcIBqQ/5PaQmAkc56hu87
         02FxejD6tgVsdN1PnZxtOVFoxXvKxbfiKh39W+3XsrnPx9SKSTxA4MprzelUe6fL0aFJ
         wwtnbXEwjtaf5Y6B6sadKogcSI/El3folNeEqQ4UoZPeQXhd5+dRNBCTgbtqg9aYuecb
         ocnRISDtGANR+M+QinB2bdGEWQeVa94MMCHNqyrYNOvzVHoHZnmdkXEjsV22USpvehba
         kHzg==
X-Gm-Message-State: AOAM532Tl8xjyryFxe7Wbj9snNtlPQfptDdqiSqryTov84l3fx9638E3
        RdkxrN9uaK2HkgjyqmbtjC6PeBKguWU9W0ayfYluGA==
X-Google-Smtp-Source: ABdhPJyiHYoWxb75JlXnvyI+r40RWo4/rUWvWOoBwuuStjJ4Ut9bCfRyWWdZ8apTr71La2o6cqiks3+W3pUiGae+qT0=
X-Received: by 2002:a05:6402:32f:: with SMTP id q15mr5789731edw.230.1601867267305;
 Sun, 04 Oct 2020 20:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201004031445.2321090-1-linchuyuan@google.com>
 <20201004031445.2321090-3-linchuyuan@google.com> <20201004154345.GA110630@roeck-us.net>
In-Reply-To: <20201004154345.GA110630@roeck-us.net>
From:   Chu Lin <linchuyuan@google.com>
Date:   Sun, 4 Oct 2020 20:07:36 -0700
Message-ID: <CAKCA56AenkTvWrNkLvJSfSC6z0kCcB=YeKA2yX69uLgF+nASbA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: pmbus: max20730: adjust the vout reading
 given voltage divider
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 4, 2020 at 8:43 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sun, Oct 04, 2020 at 03:14:45AM +0000, Chu Lin wrote:
> > Problem:
> > We use voltage dividers so that the voltage presented at the voltage
> > sense pins is confusing. We might need to convert these readings to more
> > meaningful readings given the voltage divider.
> >
> > Solution:
> > Read the voltage divider resistance from dts and convert the voltage
> > reading to a more meaningful reading.
> >
> > Testing:
> > max20730 with voltage divider
> >
> > Signed-off-by: Chu Lin <linchuyuan@google.com>
> > ---
> > ChangeLog v1 -> v2
> >   hwmon: pmbus: max20730:
> >   - Don't do anything to the ret if an error is returned from pmbus_read_word
> >   - avoid overflow when doing multiplication
> >
> > ChangeLog v2 -> v3
> >   dt-bindings: hwmon: max20730:
> >   - Provide the binding documentation in yaml format
> >   hwmon: pmbus: max20730:
> >   - No change
> >
> > ChangeLog v3 -> v4
> >   dt-bindings: hwmon: max20730:
> >   - Fix highefficiency to high efficiency in description
> >   - Fix presents to present in vout-voltage-divider
> >   - Add additionalProperties: false
> >   hwmon: pmbus: max20730:
> >   - No change
>
> You claim that there have been no changes since v2 of this patch,
> yet you dropped my Reviewed-by: tag. Any reason ?
>
> Guenter
Sorry for the confusion. I thought I can't tag the patch with the Review-by tag.
Just to make sure I do correctly next time, once you tagged a certain
patch in the batch
If there is no change from version to version for this patch, I should
carry the tags when
submitting new revisions. Also, please let me know what is the best
way to fix this revision?
Should I submit a new V5 with the tag attached?

Sincerely,
Chu

>
> >
> >  drivers/hwmon/pmbus/max20730.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
> > index a151a2b588a5..fbf2f1e6c969 100644
> > --- a/drivers/hwmon/pmbus/max20730.c
> > +++ b/drivers/hwmon/pmbus/max20730.c
> > @@ -31,6 +31,7 @@ struct max20730_data {
> >       struct pmbus_driver_info info;
> >       struct mutex lock;      /* Used to protect against parallel writes */
> >       u16 mfr_devset1;
> > +     u32 vout_voltage_divider[2];
> >  };
> >
> >  #define to_max20730_data(x)  container_of(x, struct max20730_data, info)
> > @@ -114,6 +115,14 @@ static int max20730_read_word_data(struct i2c_client *client, int page,
> >               max_c = max_current[data->id][(data->mfr_devset1 >> 5) & 0x3];
> >               ret = val_to_direct(max_c, PSC_CURRENT_OUT, info);
> >               break;
> > +     case PMBUS_READ_VOUT:
> > +             ret = pmbus_read_word_data(client, page, phase, reg);
> > +             if (ret > 0 && data->vout_voltage_divider[0] && data->vout_voltage_divider[1]) {
> > +                     u64 temp = DIV_ROUND_CLOSEST_ULL((u64)ret * data->vout_voltage_divider[1],
> > +                                                      data->vout_voltage_divider[0]);
> > +                     ret = clamp_val(temp, 0, 0xffff);
> > +             }
> > +             break;
> >       default:
> >               ret = -ENODATA;
> >               break;
> > @@ -364,6 +373,15 @@ static int max20730_probe(struct i2c_client *client,
> >       data->id = chip_id;
> >       mutex_init(&data->lock);
> >       memcpy(&data->info, &max20730_info[chip_id], sizeof(data->info));
> > +     if (of_property_read_u32_array(client->dev.of_node, "vout-voltage-divider",
> > +                                    data->vout_voltage_divider,
> > +                                    ARRAY_SIZE(data->vout_voltage_divider)) != 0)
> > +             memset(data->vout_voltage_divider, 0, sizeof(data->vout_voltage_divider));
> > +     if (data->vout_voltage_divider[1] < data->vout_voltage_divider[0]) {
> > +             dev_err(dev,
> > +                     "The total resistance of voltage divider is less than output resistance\n");
> > +             return -ENODEV;
> > +     }
> >
> >       ret = i2c_smbus_read_word_data(client, MAX20730_MFR_DEVSET1);
> >       if (ret < 0)
> > --
> > 2.28.0.806.g8561365e88-goog
> >
