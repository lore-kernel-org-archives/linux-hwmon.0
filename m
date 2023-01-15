Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D573FC3DA78
	for <linux-hwmon@archiver.kernel.org>; Sun, 15 Jan 2023 16:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbjAOQRc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 15 Jan 2023 11:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjAOQRb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 15 Jan 2023 11:17:31 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C10CC1C
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 08:17:30 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id o66so21478787oia.6
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Jan 2023 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnPvt/LcsK9rPxyw/xGon4FdjMi9yyD9WS4+kPvqjWM=;
        b=PefQaFFB2JzHYyea0QNNLf2CjIWped1/PgV9SCNkD7zF0faEw6uT23+H1A6PNn/Dl5
         TjzQ95fimFIJ9i2ShUYWMcizrhdJ+ruKFPbategz80sX1qYmUw2o7k0CKR0ctL0cL0NC
         x+e8ayf6CYzukeJwUrjWJxazJXQL2KC9EW361bL4kIuJ6ofczPK1gYFiEuVc1oeuLVwZ
         jiSjsEByWZHFXJEWJa3CDdg8dMvcynrgMrxZcAd2CapWoVvLVa3o20LG+XlXHG3W8FmY
         ofTb1pmaUWl2zr2kOodALgebKT6xii6/FRUfpH0Eukm/7UPBZYYi9HZ71OA6JUNZNuT9
         4yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnPvt/LcsK9rPxyw/xGon4FdjMi9yyD9WS4+kPvqjWM=;
        b=NYgayq01hvrIC+iyyGTeeORnWGEtuOf1SD7r3UqCE8rrXOrXEZBuPKyahaTlf2whz+
         6HAD1aEzgD7oKUejXa+ugwb1Jebfhc4s2aeiIEcm7dD8sDD4ZQsZIP2amFf9BsHGZ9v5
         tjOOPQPkTPxgY1xHE0B0vi8SQFwNpykcTSLgw7fT1Wl19ue+2L415t4E322pmEr1ldbv
         C5TMbpdRlZXOJ7YiFlcWTjT3rtbNH3aCep7OzEGW79aPlxwwe26VXgLJySQEnYmMAYtt
         gJJ/wBkPMesFyrz/+6rySiEQztO5Skgba8bawRtPTNpUNIUF/B/khyNCP7AELcWBRh4+
         aAKQ==
X-Gm-Message-State: AFqh2koCFf4c8Es1lscvJrYAyuRQLOWriqsYsQ1AmJHyGSbzrxIVy3Q1
        UktPDlsAgxjOPyFwacTz+ORKxxMor5I=
X-Google-Smtp-Source: AMrXdXsyNqIbtXaRtwflPZYlp7pJ+VQIXSE/tuQiHlkTDJTOFtWvvHd5bufoNTSkYxcyV/qFlOJmAg==
X-Received: by 2002:a05:6808:1595:b0:360:fc5b:48f8 with SMTP id t21-20020a056808159500b00360fc5b48f8mr52745312oiw.59.1673799450084;
        Sun, 15 Jan 2023 08:17:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m6-20020a9d73c6000000b006860be3a43fsm244990otk.14.2023.01.15.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 08:17:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 15 Jan 2023 08:17:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (it87) Allow calling __superio_enter
 outside mux
Message-ID: <20230115161728.GA1247062@roeck-us.net>
References: <20230104060926.619686-1-frank@crawford.emu.id.au>
 <20230104060926.619686-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104060926.619686-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 04, 2023 at 05:09:25PM +1100, Frank Crawford wrote:
> Allow for superio_enter to be called without requesting the muxed memory
> region, in particular for initialisation of the second chipset, which must
> be put into configuration mode, but without an associated call to leave
> configuration mode.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> v2:
>  * Improved description for patch
> 
> ---
>  drivers/hwmon/it87.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 9997f76b1f4a..4ebce2c661d7 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -87,6 +87,14 @@ static struct platform_device *it87_pdev[2];
>  #define	DEVID	0x20	/* Register: Device ID */
>  #define	DEVREV	0x22	/* Register: Device Revision */
>  
> +static inline void __superio_enter(int ioreg)
> +{
> +	outb(0x87, ioreg);
> +	outb(0x01, ioreg);
> +	outb(0x55, ioreg);
> +	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
> +}
> +
>  static inline int superio_inb(int ioreg, int reg)
>  {
>  	outb(reg, ioreg);
> @@ -124,10 +132,7 @@ static inline int superio_enter(int ioreg)
>  	if (!request_muxed_region(ioreg, 2, DRVNAME))
>  		return -EBUSY;
>  
> -	outb(0x87, ioreg);
> -	outb(0x01, ioreg);
> -	outb(0x55, ioreg);
> -	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
> +	__superio_enter(ioreg);
>  	return 0;
>  }
>  
