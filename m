Return-Path: <SRS0=IuZw=6V=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB019C38A2A
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 May 2020 20:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A86721835
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 May 2020 20:20:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gTu2gLt5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgEGUUL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 May 2020 16:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGUUK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 May 2020 16:20:10 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD38C05BD43
        for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2020 13:20:10 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m33so2130791otc.5
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2020 13:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4MjMErFCv71soxzo/j+eQtxZjSdTcvc1/vqlXXzVDaU=;
        b=gTu2gLt5EwSZ2ANa39UTR/uYNhkoSML42E9FVwoRm5wdpT1lpAoNX1Dv197WJCOc51
         JqAfUM+7CkCVTcRU7z13Iq4mxqGK0dMlfigy5/scTpA1e1U0QOfNO3QaabnlF5Tz5NLs
         wvcvhFskDC5uZD2FD2drysvGmwT5Hux5bV9YgGauo37lksDnrAFXIBoEVHexQGYF94m+
         KPp1RkepscPvCWnBZDFIBmvnQGiumV61hQ87gVHQTAeVY4RfSHYnNwfrYTTQY3iJ10EU
         HEkmOkkqyfO6nbLgv0t6GlNtrOvb2ISfNT33gGnq3vED7Fsh/XverRQFwDLNXrycAwOc
         ECZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4MjMErFCv71soxzo/j+eQtxZjSdTcvc1/vqlXXzVDaU=;
        b=mRj8hst+rHa/bKUZPWi5/7rgujDxczQeJropDAJl8hU38EgY5NSapYC2W1HADJ8JwW
         zo4YG3G50ZVcHAXbMp3fDzMwMQuCFZBwnXKH54t5y3DXZgEQl3/CVUdYGE9P3mMAEcXU
         rB3OddjU9pYs9BGX8DDmoQzXbOYNY/A2ejQ6Lmypfo2CtOHSr2iVaWkDoGqJt/0uTPn8
         kSragQR2mHD3b/lnI3+Jkva8o7MC0AOm9+d4y2T+NjSH/lS6uXBrKN1P14Sqh6jKEFme
         qL5D6avKjljq8C61YHYrV8m+anxZN1N77EYh674bRlxx6GbRhVyeooD9BgaCVpsLD6tZ
         50Rw==
X-Gm-Message-State: AGi0PuZaT+M+Zk7LGfSAtSmh63JsZT0+osRjEcWaygnx8fihE6Oozzkh
        JhrvLwdsvvN43Ztvz51yAsWG3T/nOP0EaGTXRsuZNw==
X-Google-Smtp-Source: APiQypLDN6FYKzSwznDgjAydKboaExiVd/dKR3qPayt3WXxtqlHza/sD/MeO0S46XKF7c/zlqo05xtulT/VB4pZGUCY=
X-Received: by 2002:a9d:7a8a:: with SMTP id l10mr6332264otn.302.1588882809807;
 Thu, 07 May 2020 13:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200507174407.36576-1-linux@roeck-us.net>
In-Reply-To: <20200507174407.36576-1-linux@roeck-us.net>
From:   Alex Qiu <xqiu@google.com>
Date:   Thu, 7 May 2020 13:19:58 -0700
Message-ID: <CAA_a9x+HokYr+kTVfE-tqpztwJRF78bD-YA9TDAak41V81oPoA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus) Improve initialization of 'currpage' and 'currphase'
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

LGTM; minor nits:

On Thu, May 7, 2020 at 10:44 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The 'currpage' and 'currphase' variables in struct pmbus_data are used by
> the PMBus core to determine if the phase or page value has changed. Both
> are initialized with values which are never expected to be set in the code
> to ensure that the first page/phase write operation is actually performed.
>
> This is not well explained and occasionally causes confusion. Change the
> type of both variables to s16 and initialize with -1 to ensure that the
> initial value never matches a requested value, and clarify that this
> value means "unknown/unset".
>
> Cc: Alex Qiu <xqiu@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 8d321bf7d15b..a420877ba533 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -109,8 +109,8 @@ struct pmbus_data {
>         bool has_status_word;           /* device uses STATUS_WORD register */
>         int (*read_status)(struct i2c_client *client, int page);
>
> -       u8 currpage;
> -       u8 currphase;   /* current phase, 0xff for all */
> +       s16 currpage;   /* current page, -1 for unknown/unset */
> +       s16 currphase;  /* current phase, 0xff for all, -1 for unknown/unset */
I'm not sure if assigning macros for -1 and 0xff would be a good idea?
>  };
>
>  struct pmbus_debugfs_entry {
> @@ -2529,8 +2529,8 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
>         if (pdata)
>                 data->flags = pdata->flags;
>         data->info = info;
> -       data->currpage = 0xff;
> -       data->currphase = 0xfe;
> +       data->currpage = -1;
> +       data->currphase = -1;
>
>         ret = pmbus_init_common(client, data, info);
>         if (ret < 0)
> --
> 2.17.1
>

Thx!

- Alex Qiu
