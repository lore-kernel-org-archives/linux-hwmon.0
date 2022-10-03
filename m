Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927F2C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 08:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJCIkJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 04:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbiJCIjW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 04:39:22 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD3E4D155
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 01:14:13 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bu25so15463438lfb.3
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Oct 2022 01:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tS2WhQfDTQ5XRI83dZZXEjLfz+Bdzbu6tgG4oPFfDXY=;
        b=jyNfGU+c4IyLm9QAFKv3OU1MJPCyo4I3vRtTlIOMRwlvx5mS3CF+e2Vf/H5xsWEZGW
         dY0d14uf8BVR3Fkk9TgVcRy/hJKJjHarzJq2DP09BLPpcOkZo1cpy1hvhpYXzI0HJgeQ
         4+fRqdg6E/IeBDi4fVlwfxdEkDyxkFhKn5Rc+KnMg2V75Js1rc02Ej8ZOlyiHFLgDk4y
         JuxLuODXz2n6I1RK9LzGMpHeawVjw5XBFBfHKxfBvmwThixTbcoKpNv7Ffnwfm4OM2df
         CJ3nKVD3ayhp1pfBkdjOcRBJkYgSe7fuEWWcdfxTj3D1MBHkb/rwDugh34hfpN0yl0li
         ppqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tS2WhQfDTQ5XRI83dZZXEjLfz+Bdzbu6tgG4oPFfDXY=;
        b=KPsQHhwEnQAUn6tA5Pzz7Mhwl7amZNxn0baDi+l9+m6VYIc5X2vDze36BRFh//5CY5
         nnNGRM2A3RHj40TvbONLm/HJx59zC8WSETaezkMWeSreYcWFfh369aBwvsypTYvTEkJQ
         nydpLqLdTyvEIGCvU9OstgbqW5nbPHidLoNZ9hUBxp3DGpacbWVZu1FcrmgbP7ghn1B/
         Yamkm5zSzTnmzjtq+obq5sKZJ6JNX1qbtiRNcSK30dIprbENDu6j9uW3F1BfZ/3aIjO0
         dx1vHBdDoCYii4fybMsHhCR0tsaWHM7WWJo6tAuU8hZExBIOVYbHEPoMs47pRS2ChGub
         e9Rw==
X-Gm-Message-State: ACrzQf1fIr1LRWWOIO+7O2ud0W+JrhAeaQ8oNMVHMr2c/EJ0JQ//RjA7
        z7c70d3eLK1+sZ9+ri6MrtHRbkAtydEMJXOV2Ghu7Q==
X-Google-Smtp-Source: AMsMyM5aNnON8tY8jJc9Xq/aAamvtgglftZh4nNm54jS+VeuXs9Tv9dTN6Xx0dCiXtfpB+XJAWYYxqIqzw/tHoIxAeo=
X-Received: by 2002:a19:7003:0:b0:4a2:40b9:dea8 with SMTP id
 h3-20020a197003000000b004a240b9dea8mr907848lfc.688.1664784843457; Mon, 03 Oct
 2022 01:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <YznOUQ7Pijedu0NW@monster.localdomain>
In-Reply-To: <YznOUQ7Pijedu0NW@monster.localdomain>
From:   Jonas Malaco <jonas@protocubo.io>
Date:   Mon, 3 Oct 2022 05:13:27 -0300
Message-ID: <CANS_-EOai0-4=oDvNgHCUjhnNz_AmAtKx_sOPxF9Z88TsJv7FA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: corsair-psu: add USB id of new revision of the
 HX1000i psu
To:     Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 2, 2022 at 2:46 PM Wilken Gottwalt
<wilken.gottwalt@posteo.net> wrote:
>
> Also updates the documentation accordingly.
>
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> ---
>  Documentation/hwmon/corsair-psu.rst | 2 +-
>  drivers/hwmon/corsair-psu.c         | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
> index c3a76305c587..3c1b164eb3c0 100644
> --- a/Documentation/hwmon/corsair-psu.rst
> +++ b/Documentation/hwmon/corsair-psu.rst
> @@ -15,7 +15,7 @@ Supported devices:
>
>    Corsair HX850i
>
> -  Corsair HX1000i
> +  Corsair HX1000i (revision 1 and 2)
>
>    Corsair HX1200i
>
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index c99e4c6afc2d..345d883ab044 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -813,13 +813,14 @@ static const struct hid_device_id corsairpsu_idtable[] = {
>         { HID_USB_DEVICE(0x1b1c, 0x1c04) }, /* Corsair HX650i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c05) }, /* Corsair HX750i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c06) }, /* Corsair HX850i */
> -       { HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i */
> +       { HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i revision 1 */
>         { HID_USB_DEVICE(0x1b1c, 0x1c08) }, /* Corsair HX1200i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c09) }, /* Corsair RM550i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c0a) }, /* Corsair RM650i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c0b) }, /* Corsair RM750i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
>         { HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
> +       { HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsaur HX1000i revision 2 */

Wilken,

A small typo has creeped in: s/Corsaur/Corsair/.

P.S. Sorry if this reply arrives somewhat mangled, I'm away from my
regular setup.

>         { },
>  };
>  MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
> --
> 2.37.3
>
