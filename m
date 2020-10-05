Return-Path: <SRS0=kkoh=DM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8475C4363A
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 23:06:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59F872083B
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 23:06:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="OKZAR4QY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbgJEXGG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Oct 2020 19:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgJEXGG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Oct 2020 19:06:06 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34572C0613CE
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2020 16:06:06 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id r8so11296062qtp.13
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2020 16:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vxxQ9gocXfWXOuxXjHODE4zl7ezUzHUPAtWaBg80uZI=;
        b=OKZAR4QYHSO4bSHxOPrCpeKjDrid9Vx2YG1bpq2HD5DvySWLBmumwv4DDrG/ASBkkO
         L3ZHzC9+JQdi4jFZx2cj6BwHO0vhb0ILG/ip9OQovNrat0nObEJYRmvvqWAMHVHDFzyL
         ZXp6hnLIVxS50EEE83+72GXmyCOKmwDxi4beY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vxxQ9gocXfWXOuxXjHODE4zl7ezUzHUPAtWaBg80uZI=;
        b=m/qlqVCi6p9aOiPMRlyeD39aAN6xWRPoSRdBc4ZInipALe/8H1xGIHa2h37vcVKcy0
         2jAteChSNxiKraXm9wVJIVWOsMlseMpHOs9AsGtjc2sSYw6IjQRMoSr8dXQxA19Y/0wg
         WAb91iLGvuZJ8Y96qI3/8uVEM4KRyRw4CKC6E1INr1nW0HlRNTkN7RIzTcBxx1UcHU+9
         DnjXjN7VP4ZQuOlMbCCioc122Boup8irD/2qass6qgRVexZxlEXYGlcTYU51ATGDs/y4
         XNQYv2mRoZVy4FpdBn5QQgDNqaZeeAjUGg3UCia+ftkso6deduPQHkCDXHqWs+Ca+iCW
         mTdw==
X-Gm-Message-State: AOAM531lQMtOL9J5N/e6DNNjh3WsvYtwa13unyBgZjyduUoe2IaU6Tf2
        g0dyYMzwX/pkH/dI4aPIQlQ/l4W0RKHy7WK75xA=
X-Google-Smtp-Source: ABdhPJwlqhxTg6QiPUsq1lIx7VWPSYa7cf+CzELJzw9BudDY1a4FEUG1/WPq1FhIt3yC6bJ2JGCN4Eemy8FyMmw+Fu8=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr2419882qta.176.1601939165341;
 Mon, 05 Oct 2020 16:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <1601504817-16752-1-git-send-email-lancelot.kao@fii-usa.com> <20201001123249.GC6152@heinlein>
In-Reply-To: <20201001123249.GC6152@heinlein>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 5 Oct 2020 23:05:53 +0000
Message-ID: <CACPK8XewuMZTvhh7QA6iBbkH5AqQWS9RVeZXaAF-XzAYhYsG1A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] hwmon: Ampere Computing ALTRA SMPMPRO
 sensor driver
To:     Patrick Williams <patrick@stwcx.xyz>, linux-hwmon@vger.kernel.org
Cc:     Lancelot <lancelot.kao@fii-usa.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 1 Oct 2020 at 12:32, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Wed, Sep 30, 2020 at 05:26:57PM -0500, Lancelot wrote:
> > From: Lancelot Kao <lancelot.kao@fii-usa.com>
> >
> > Add SMPMPro-hwmon driver to monitor Ampere CPU/Memory/VR via an
> > i2c interface of the CPU's smpmpro management device.
> >
> > Signed-off-by: Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
> > Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
>
> Nice work at adding this driver.
>
> It does look like you've missed CC'ing upstream though.  Was this
> intentional?  (linux-hwmon@vger.kernel.org)

As Patrick mentioned, let's review this on the upstream list.

Cheers,

Joel

>
> > +/* Capability Registers  */
> > +#define TEMP_SENSOR_SUPPORT_REG      0x05
> > +#define PWR_SENSOR_SUPPORT_REG       0x06
> > +#define VOLT_SENSOR_SUPPORT_REG      0x07
> > +#define OTHER_CAP_REG                    0x08
> > +#define CORE_CLUSTER_CNT_REG 0x0B
> > +#define SYS_CACHE_PCIE_CNT_REG       0x0C
> > +#define SOCKET_INFO_REG              0x0D
>
> There seems to be some sporatic indentation throughout all the #defines
> in this file, where it appears you attempted to align the values.  Make
> sure you have tabs set to 8-step spacing for kernel code.
>
> > +static void smpmpro_init_device(struct i2c_client *client,
> > +                             struct smpmpro_data *data)
> > +{
> > +     u16 ret;
> > +
> > +     ret = i2c_smbus_read_word_swapped(client, TEMP_SENSOR_SUPPORT_REG);
> > +     if (ret < 0)
> > +             return;
> > +     data->temp_support_regs = ret;
>
> i2c_smbus_read_word_swapped returns a s32 even though you're looking for
> a u16.  By setting `ret` to u16 you've caused two problems:
>
>     * You are immediately truncating -ERRNO values into a u16 so that
>       you are unable to differentiate values like 0xFFFFFFFF as a
>       register value and -1 as an errno.
>
>     * The if condition here can never be true, so you're never catching
>       error conditions.  (An u16 can never be negative, so ret < 0 can
>       never be true.)
>
> This issue occurs throughout the driver.
>
> > +static int smpmpro_read_temp(struct device *dev, u32 attr, int channel,
> > +                          long *val)
> > +{
> > +     struct smpmpro_data *data = dev_get_drvdata(dev);
> > +     struct i2c_client *client = data->client;
> > +     int ret;
>
> You might want a sized int on this one?  Repeated in most other
> functions.
>
> > +static int smpmpro_read_power(struct device *dev, u32 attr, int channel,
> > +                          long *val)
> > +{
> > +     struct smpmpro_data *data = dev_get_drvdata(dev);
> > +     struct i2c_client *client = data->client;
> > +     int ret, ret_mw;
> > +     int ret2 = 0, ret2_mw = 0;
>
> Any reason to not initialize ret/ret_mw?  By it being different from
> ret2/ret2_mw it makes me question "is this ok?", which spends more time
> in review.
>
> > +static int smpmpro_i2c_probe(struct i2c_client *client,
> > +                       const struct i2c_device_id *id)
> ...
> > +     /* Initialize the Altra SMPMPro chip */
> > +     smpmpro_init_device(client, data);
>
> I didn't see anything in the smpmpro_init_device function, but is there
> anything you can or should do to ensure this device really is an
> SMPMPro rather than exclusively relying on the device tree compatible?
>
> > +static struct i2c_driver smpmpro_driver = {
> > +     .class          = I2C_CLASS_HWMON,
> > +     .probe          = smpmpro_i2c_probe,
> > +     .driver = {
> > +             .name   = "smpmpro",
> > +     },
> > +     .id_table       = smpmpro_i2c_id,
> > +};
> > +
> > +module_i2c_driver(smpmpro_driver);
>
> Are you missing the .of_match_table inside .driver?  Is that necessary
> or useful for your use?  I'm not sure if you can have device tree
> entries that automatically instantiate the hwmon driver otherwise.
>
> --
> Patrick Williams
