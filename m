Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155E3C53210
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Jan 2023 18:48:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238273AbjACSs3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 13:48:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238985AbjACSrh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 13:47:37 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F84140A5
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 10:46:52 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id k7-20020a056830168700b0067832816190so19592982otr.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Jan 2023 10:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=So7TxHZWgjwP9U7KHE1giofiiZZ83KP7j/ivuiIHB8M=;
        b=RJGBLPTmIG/GD8HPNyOp+c9nF+dGiUchSHpOKl1Bic7iEvjQO+tzCENtKbcELTxDPJ
         CIcmHk17DWwEtjKCHmtXz+hQCaqss6bsge7N4DD51wFQIwPI6+1g7LRhNnjhvVcfVgmW
         pYgkY+AarckVtwJc511iXojvFSd9Jvij3DLHkApmf0EKbpvarWBgy7CiM1MwueyDQzuC
         O+0ym2XdIAh+QfoKck9+po13pIzbaUFIq60+5trCEkBp4TfTddTmopT4OvaNR1Ox9zpJ
         HeVM1pIJ4+xLxLYkqzqM7jcStBIVmDjUg+y92iP4Fd+QblgWrzwHyFllLt+VuCS1cHaS
         eHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=So7TxHZWgjwP9U7KHE1giofiiZZ83KP7j/ivuiIHB8M=;
        b=PPBwV84Izry5Cce2jMIMBpA5qU+TnsLluq4IcEvtHt3afcBs4YoK7dV+ahckI0Gvfz
         xJU0uU6Pzq/+sIKZ1OqiCxnorogRnLy+X+JOknqOzdABGl5MbOKKimoMLUvIKJkw7LyD
         68l73NO6lMKSEQKw3QBCDSVpSq073wazJ1qBcWEA27CyjasfulXtMp1N+Mr99L46PWl5
         9JbjuMA30cZje34EqfetGEqHOp2tEmudoC34Mi/lJ6Q0f96zTDFOh6+IxWzDA6FMkY9Z
         wYb6VIm6gy0LllQ6Rg9CHca1KaXzfcfBQGm5p2Zwr5SzmPYdwHj3eqV4uuQIX60PA+Df
         Odow==
X-Gm-Message-State: AFqh2kqZUwoRBPxpDXgHLttanoujwbIHDhVReHaswUue4blkRRg7qRON
        f8TiG3rWdyt/glKrmWA7Pno=
X-Google-Smtp-Source: AMrXdXth0CgloPMKnjRtGU/i87AmOpF5Pfqi1p1dlFwPll1nIqPhBEsTixLgEhU/tjvTkBdfJV1L8w==
X-Received: by 2002:a05:6830:3354:b0:670:5f0e:8b70 with SMTP id l20-20020a056830335400b006705f0e8b70mr19827009ott.5.1672771612157;
        Tue, 03 Jan 2023 10:46:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3-20020a056830278300b006605883eae6sm14941047otu.63.2023.01.03.10.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 10:46:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 3 Jan 2023 10:46:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: (it87) Add entries to dmi_table
Message-ID: <20230103184650.GB204971@roeck-us.net>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
 <20230103064612.404401-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103064612.404401-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 03, 2023 at 05:46:12PM +1100, Frank Crawford wrote:
> Call initialisation of second chipset.
> 
> Update the dmi_table with mother boards that have been tested.
> 

That doesn't really describe what is done and why. See
Documentation/process/submitting-patches.rst, "Describe your changes".
The comment iin the code is much better. 

> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 4ebce2c661d7..2ecfa2c901f6 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -3315,6 +3315,27 @@ static int it87_dmi_cb(const struct dmi_system_id *dmi_entry)
>  	return 1;
>  }
>  
> +/*
> + * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
> + * (IT8792E) needs to be in configuration mode before accessing the first
> + * due to a bug in IT8792E which otherwise results in LPC bus access errors.
> + * This needs to be done before accessing the first Super-IO chip since
> + * the second chip may have been accessed prior to loading this driver.
> + *
> + * The problem is also reported to affect IT8795E, which is used on X299 boards
> + * and has the same chip ID as IT8792E (0x8733). It also appears to affect
> + * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
> + * Z87X-OC.
> + * DMI entries for those systems will be added as they become available and
> + * as the problem is confirmed to affect those boards.
> + */
> +static int gigabyte_sio2_force(const struct dmi_system_id *dmi_entry)

s/gigabyte/it87/

While this is seen on Gigabyte boards, it doesn't _have_ to be Gigabyte
specific. Other boards i using the same chips (it there are any) may be
affected as well.

> +{
> +	__superio_enter(REG_4E);
> +
> +	return it87_dmi_cb(dmi_entry);
> +};
> +
>  /*
>   * On the Shuttle SN68PT, FAN_CTL2 is apparently not
>   * connected to a fan, but to something else. One user
> @@ -3337,7 +3358,44 @@ static struct it87_dmi_data nvidia_fn68pt = {
>  		.driver_data = data, \
>  	}
>  
> +#define IT87_DMI_MATCH_GBT(name, cb, data) \
> +	IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.", name, cb, data)
> +
>  static const struct dmi_system_id it87_dmi_table[] __initconst = {
> +	IT87_DMI_MATCH_GBT("AB350", gigabyte_sio2_force, NULL),
> +		/* ? + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("AX370", gigabyte_sio2_force, NULL),
> +		/* ? + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("Z97X-Gaming G1", gigabyte_sio2_force, NULL),
> +		/* ? + IT8790E */
> +	IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME", gigabyte_sio2_force, NULL),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF", gigabyte_sio2_force, NULL),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("Z490 AORUS ELITE AC", it87_dmi_cb, NULL),
> +		/* IT8688E */

Why list boards with only a single chip ?

> +	IT87_DMI_MATCH_GBT("B550 AORUS PRO AC", gigabyte_sio2_force, NULL),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("B560I AORUS PRO AX", it87_dmi_cb, NULL),
> +		/* IT8689E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS ELITE WIFI", it87_dmi_cb, NULL),
> +		/* IT8688E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS MASTER", gigabyte_sio2_force, NULL),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS PRO", gigabyte_sio2_force, NULL),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI", gigabyte_sio2_force, NULL),
> +		/* IT8688E + IT8792E/IT8795E */
> +	IT87_DMI_MATCH_GBT("X570 I AORUS PRO WIFI", it87_dmi_cb, NULL),
> +		/* IT8688E */
> +	IT87_DMI_MATCH_GBT("X570S AERO G", gigabyte_sio2_force, NULL),
> +		/* IT8689E + IT87952E */

IT87952E ? Is that chip known to be affected as well ?

> +	IT87_DMI_MATCH_GBT("X670E AORUS MASTER", it87_dmi_cb, NULL),
> +		/* IT8689E - Note there may also be a second chip */

Don't add an entry unless known that it is needed.

> +	IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4", gigabyte_sio2_force, NULL),
> +		/* IT8689E + IT87952E */
> +	IT87_DMI_MATCH_GBT("Z690 AORUS PRO", gigabyte_sio2_force, NULL),
> +		/* IT8689E + IT87952E */
>  	IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi_cb, &nvidia_fn68pt),
>  	{ }
>  
> -- 
> 2.38.1
> 
