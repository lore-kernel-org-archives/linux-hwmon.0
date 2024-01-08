Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EBC46459
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jan 2024 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxxNTYsE"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5ce10b5ee01so1197210a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jan 2024 07:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704728069; x=1705332869; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=agGIE3P0U9KqFwsAOiklp2qw1a2sHrZPfdbbKMZIBfw=;
        b=LxxNTYsEfrA/IJQqNoDcYGWWzzvBJA8UoGe2R4WESXhdT07fgXc8nD2Qnp79O5LdXY
         Bwhi7wCJIgODmLperdiuaellZY/E8F1vrZxJC3uvf/Wqfxc9oa3UqT/kytf2NMwKhd4n
         KaWOpY3+bjQBhr5BHlblSmxADR3MhKAzGBSCBtfq+BRRQhnz5gZufcmfwhgC7I6MtK6P
         V6QYPTOTfedBlAUDeqCXl4vtnUDKmrj6krFamXFH8aW52f1f7bo+Ik05/0dLKHY6UxC8
         sOxiu83rU6PPlrXevnz9ZlS4VWg2nAdn5iDP7DKfDekqHEOJmb13aAaw23l8iowWY2NU
         mR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704728069; x=1705332869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agGIE3P0U9KqFwsAOiklp2qw1a2sHrZPfdbbKMZIBfw=;
        b=a0cgb8gVujREVE5678o2Zy2o8vrq3LikctJ9sw+pIi0fQIOuPxizPYqPlYxGut/wcx
         qBjOoaCGur5d2Jn1S9rRliClmM99STyfY7uQcch+Cx7RqKSbo3QXQRAzFPtka44Zw88I
         /QnT20Sj843Do2LMxn+7Lu/ZB1pQUx+P4gdbFvgh3V0JNmDSSJ2iqCEM6hOcPoX5CDYC
         x5cTh/U9fClh7J4lrcsmj3NDTK/oAnS70TEvZZeWRzGalCN1ytyYNdiIeBHSmN+Jsa7z
         tYJOKcSa8IKt4YpCl9Aa+kOqie7LX5Vi+ntc1W+xRP0M+npnahmMT2FaDgpq26KylGAP
         eW+Q==
X-Gm-Message-State: AOJu0YwZHWEK2uBw4TH5WJ2Gw/lDCL7uLtAGEh/1NpmbFYYXcdkxsTS9
	cIix56uQ2WROqX19fjSxrWA=
X-Google-Smtp-Source: AGHT+IGrPaEJxqZsCGARIaVsQ3USfuFJrZJBo+X/NnpR408IXQyAfVRbH+B8BwIrNM4DoTrX20W8Xw==
X-Received: by 2002:a05:6a20:104c:b0:199:8837:1a35 with SMTP id gt12-20020a056a20104c00b0019988371a35mr3307758pzc.37.1704728069152;
        Mon, 08 Jan 2024 07:34:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fa38-20020a056a002d2600b006d0a29ad0aasm13545pfb.5.2024.01.08.07.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 07:34:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jan 2024 07:34:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Seiji Nishikawa <snishika@redhat.com>
Cc: pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Also add Dell Precision 7540 to fan
 control whitelist
Message-ID: <3f0d7398-401e-4e7d-9f48-0a6bc0034c28@roeck-us.net>
References: <20231223073658.354773-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231223073658.354773-1-snishika@redhat.com>

On Sat, Dec 23, 2023 at 04:36:58PM +0900, Seiji Nishikawa wrote:
> This patch, in addition to 95d88d054ad9 that added Dell Precision 7510 to fan
> control whitelist, also adds Precision 7540 to the whitelist, which allows manual

Use imperative mood to describe your patch.

> PWM control on Dell Precision 7540. It has been confirmed that the same SMM
> commands work to enable/disable manual PWM control on Dell Precision 7540.
> Acked-by: Pali Rohár <pali@kernel.org>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 44aaf9b9191d..f946257f72c6 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1330,6 +1330,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
>  		},
>  		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
>  	},
> +        {
> +                .ident = "Dell Precision 7540",
> +                .matches = {
> +                        DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                        DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 7540"),
> +                },
> +                .driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
> +        },
>  	{
>  		.ident = "Dell XPS 13 7390",
>  		.matches = {

Patch uses spaces instead of tabs and produces lots of checkpatch warnings
and errors. Also, Signed-off: tag is missing.

Overall, please read and follow Documentation/process/submitting-patches.rst.

Guenter
