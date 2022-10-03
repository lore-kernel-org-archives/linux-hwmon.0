Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231AFC43219
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 18:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiJCSKI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiJCSKG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 14:10:06 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1328FAF9
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 11:10:04 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id a26so1868734pfg.7
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Oct 2022 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=bInG0y+Aj+SqX/LvLJdn7gIUfIHxx5yaLDIN9/BzF8Y=;
        b=FQ95fYiiUULBe8iDFOD2EfUljZtiZkSpC8yl3rxxbWazIAaaB1pivc4GfvSEN/Cx4b
         kSLELoGUohbQ2hBYrYRDzT2u5SFbPi6rdSDHJlzbAUy0eR9pdScT2+IPdPeWxb15VZlb
         heR+6PskJuwB6psqbFpK7GtCUCjVUNLj6XwF/p6DOVW+YrdZUngkPqgEM8sWOKb3iD9p
         14dww/cjzxTbFbEuPmBAkxAkUl3vD5eNZ82hJpEKB8KCsEViz6moGIvImEHzE/LyUEVy
         J/42EqRI3bDcPLbG1To3sdky2b6P319Qi5yP32B1xluAM2ZAj13dQBc04cu12JsnMuuK
         Y7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bInG0y+Aj+SqX/LvLJdn7gIUfIHxx5yaLDIN9/BzF8Y=;
        b=ZWi7REVgsziU2x9BgJ2/XkjgNECKLV37TRrMpfz7ye0xdKbpfUnHZzoJxTa7t4RePT
         WVD+qAy3rq8HIUZRul4EXXNbfYkzEvxl9KKAhBeR97puELoz3/DCB6L6sUn62LwCfy2e
         IWCHKabfLYxEJC+07frd2X+v6rnY1MBQhzCl/LYjbTv3ktOWuL+F+HiVorJrBgIkZjqt
         vrccru8+I9TSemFKPvzirk7Biziyz23dM0d60GCsYhhuiX49E16vNzGNPjxihoq4ul1C
         Y6r/x+Ee3Vq8qbZR852TuSKKzv0zrMR8jpG1Qy8T9xGufeNkOqEp5bdUgA8BKG/UneRI
         EGBA==
X-Gm-Message-State: ACrzQf2uoq7o2xOcOwfS+EfuNMKLz2Qu1Wl7U7LDERYfK95gfVk9jbmp
        Tmx4+z8KFsoZWbS+Iq8bOSg=
X-Google-Smtp-Source: AMsMyM5JHJYLfqmRO2MwqZiD2UvFGvS/ytvOsEzudhxWyckYfjagxaJHbxgn5iA8FeX0f0USsoMEsA==
X-Received: by 2002:a05:6a00:1990:b0:545:aa9e:be3d with SMTP id d16-20020a056a00199000b00545aa9ebe3dmr23855254pfl.59.1664820603489;
        Mon, 03 Oct 2022 11:10:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p17-20020a17090a429100b00203125b6394sm6634032pjg.40.2022.10.03.11.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:10:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 3 Oct 2022 11:10:02 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] it87: Add param to ignore ACPI resource conflicts
Message-ID: <20221003181002.GC1023056@roeck-us.net>
References: <20221002174259.14609-1-ahmad@khalifa.ws>
 <20221002174259.14609-2-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221002174259.14609-2-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Oct 02, 2022 at 06:43:00PM +0100, Ahmad Khalifa wrote:
> Add in the parameter to ignore ACPI resource conflicts so that modprobe
> can use the force_id parameter when ACPI has the same address mapped.

force_id and ignore_resource_conflict are orthogonal / unrelated to each
other. Why create a dependency or correlation where none exists ?

The reason for introducing ignore_resource_conflict in the driver was that
some systems didn't like the system wide parameter (acpi_enforce_resources)
to ignore resource conflicts and failed to boot if it was set to lax
or disabled.

> 
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
> ---
>  drivers/hwmon/it87.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 0e543dbe0a6b..ce579f5aebcf 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -69,6 +69,10 @@ static unsigned short force_id;
>  module_param(force_id, ushort, 0);
>  MODULE_PARM_DESC(force_id, "Override the detected device ID");
>  
> +static bool ignore_resource_conflict;
> +module_param(ignore_resource_conflict, bool, false);

The third parameter is the access permission. It should be 0 or maybe 0000.
Why "false" ?

> +MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
> +
>  static struct platform_device *it87_pdev[2];
>  
>  #define	REG_2E	0x2e	/* The register to read/write */
> @@ -3261,8 +3265,10 @@ static int __init it87_device_add(int index, unsigned short address,
>  	int err;
>  
>  	err = acpi_check_resource_conflict(&res);
> -	if (err)
> -		return err;
> +	if (err){

Formatting: Space between ) and { required.

Guenter

> +		if (!ignore_resource_conflict)
> +			return err;
> +	}
>  
>  	pdev = platform_device_alloc(DRVNAME, address);
>  	if (!pdev)
> -- 
> 2.30.2
> 
