Return-Path: <SRS0=MrID=VK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0594FC742D7
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Jul 2019 13:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B264B2084C
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Jul 2019 13:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE0UJy7o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbfGMNam (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Jul 2019 09:30:42 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45684 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfGMNam (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Jul 2019 09:30:42 -0400
Received: by mail-pl1-f196.google.com with SMTP id y8so6108103plr.12;
        Sat, 13 Jul 2019 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Vhd7eHDRllMaq6HzgrqszVE8HqXcINUKCzz6DuVzFvo=;
        b=dE0UJy7o3IjgOT07ia5w/LEuxLU/nJS3SDq0wcVfusW0y+9wxSJ+MuHTGruokA/qhq
         vmJTOy08Aw9LvIf0Q1y0A+G4bNRiTzNp5xoJ4TQnmgdWmk1XZJsYDKECcY00xzCL0lDb
         p4CgcdSlBdSo3gn2Z89Xi2D2XJPcqqhKJgYxx3DyIELbtRNYa2JYrP3GBBQQvRjw5pcR
         mamIJ7/CqTRc9o/L2YHZ9GdqsNr6AZx17KFuTg29LKRKMxY/ACu7l1gdXts9HTOTTxxz
         JBzGc/bpe1HbrJdFwBK0Od5wXbHomBi33buu0zx2y4iORJhoftSZ4mSq0AGkl9DR1YB/
         mo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Vhd7eHDRllMaq6HzgrqszVE8HqXcINUKCzz6DuVzFvo=;
        b=RXmuvzymKX3i8SDOpJn98VeTgeUc0J0wba0k8jL1jmwwdQ68Or7VxEypiy3FhtkIAc
         dTEzizNdgUunfgRMW+gQNgkTXdDj6x7VxHsKAezGqX/N5PmY0ty3MllGUhTsxuZEWFt2
         lZ1sOC30n4DtAQHvS3zegXo41TuuUnRVxtLFjDgGls8Ribtnp7iamMJysFsIEhGQE0G/
         EH6IHkDiGqGk9BH6egvsykeulJm1ov5k1LgTe46VzWwJhDDuXl+iFwa8hLAr+OniJlBi
         fFtxOgeFyChOvGNm8r3ihgTERKpHpBHXSyriXyG6lyDOd3kPZM9jNXLca9Q+W9xKblBJ
         iNdQ==
X-Gm-Message-State: APjAAAWt+Syog7qcuDyMP1E7b8o9iEINZS1nHHhDx4+8f10ZTlqtS/w4
        /pBP7I4zypAyBToDo9SGj/Y=
X-Google-Smtp-Source: APXvYqx/gVWgAH4ezizLy0JZlrdh83W3IX6WzSGXLQTTyfkoZqpDI3MaALnLU3htZg5Well90uwhMA==
X-Received: by 2002:a17:902:8bc1:: with SMTP id r1mr17793858plo.42.1563024641286;
        Sat, 13 Jul 2019 06:30:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i6sm11953992pgi.40.2019.07.13.06.30.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 06:30:40 -0700 (PDT)
Date:   Sat, 13 Jul 2019 06:30:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com
Subject: Re: [PATCH 2/2] drivers: hwmon: lm75: add support for PCT2075
Message-ID: <20190713133039.GA32420@roeck-us.net>
References: <20190711124504.7580-1-daniel@zonque.org>
 <20190711124504.7580-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711124504.7580-2-daniel@zonque.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 11, 2019 at 02:45:04PM +0200, Daniel Mack wrote:
> The NXP PCT2075 is largely compatible with other chips already supported
> by the LM75 driver. It uses an 11-bit resolution and defaults to 100 ms
> sampling period. The datasheet is here:
> 
>   https://www.nxp.com/docs/en/data-sheet/PCT2075.pdf
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Applied to hwmon-next. Note that I also updated Documentation/hwmon/lm75.rst.

Guenter

> ---
>  drivers/hwmon/lm75.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 447af07450f1..a8aba628468e 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -49,6 +49,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
>  	max6626,
>  	max31725,
>  	mcp980x,
> +	pct2075,
>  	stds75,
>  	stlm75,
>  	tcn75,
> @@ -353,6 +354,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		data->resolution = 9;
>  		data->sample_time = MSEC_PER_SEC / 8;
>  		break;
> +	case pct2075:
> +		data->resolution = 11;
> +		data->sample_time = MSEC_PER_SEC / 10;
> +		break;
>  	case mcp980x:
>  		data->resolution_limits = 9;
>  		/* fall through */
> @@ -428,6 +433,7 @@ static const struct i2c_device_id lm75_ids[] = {
>  	{ "max31725", max31725, },
>  	{ "max31726", max31725, },
>  	{ "mcp980x", mcp980x, },
> +	{ "pct2075", pct2075, },
>  	{ "stds75", stds75, },
>  	{ "stlm75", stlm75, },
>  	{ "tcn75", tcn75, },
> @@ -496,6 +502,10 @@ static const struct of_device_id lm75_of_match[] = {
>  		.compatible = "maxim,mcp980x",
>  		.data = (void *)mcp980x
>  	},
> +	{
> +		.compatible = "nxp,pct2075",
> +		.data = (void *)pct2075
> +	},
>  	{
>  		.compatible = "st,stds75",
>  		.data = (void *)stds75
