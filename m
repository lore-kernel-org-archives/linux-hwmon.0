Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80D7C32771
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 14:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbiIXObs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 10:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiIXObs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 10:31:48 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB5179A43
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:31:47 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id e67so2742567pgc.12
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=L8cbEwb1bmDpU79MDBUVY8wmONOIMGAej8DlYWBrBGA=;
        b=h7DfshjJ7avX4ucU20ssI4xQjdXytJrbqo7wtgXDB6kMcB4rAmibvbK9RaJ0w48zQ+
         nwTtrTkijqOZ8qsOlGj/xhEDLFLwXbzrvLVV9FiUSDAR5wjGUAATdnkpzYBEqB1WLU62
         o5VBf+yoPcMTTqCLmJsqr9BT6h3681Z60TWb25r9chk/w4+Ipl6NqWHOU+QXXzgNd13Z
         qThLh5PJgG4px4z7HjQl0r4XocS6ng2TjYdo93SZ93f0S4gSQXe23RFHTCPtlaGcNpkv
         LlhWdzvcFMmUvv1vO44vtxdnznnKg8XEcR9cP261NHhiy/eC7kzPuuJSMb5dQsqYifg/
         hyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=L8cbEwb1bmDpU79MDBUVY8wmONOIMGAej8DlYWBrBGA=;
        b=33ZVvuk5l5CMBzVhgZ0Ua82yVX2uRPDzollnSVvqinpXfq4qa0p9BIVtIZLj+k0120
         u6ZpDw0Dc/Dpi1wtkoHHtSfzdEtNy8b7Q9Bafpk0OOed0yJG1LkEvTF47FmRnmz63pYq
         X36OOHCGRb8BDowrfkjwmQDSjIImmG0mbl2+UhxdZOSqEBBsHQVPVKN4XYG0cdrIlal+
         MRhR5+5MWgImMOxIzOQgHDHzqlk0QBcIriue1Fg9SNxTIWTgunutzfky6mwJR0L4Upru
         0x1uOe0cfNXQ/ueqJ7w2Z3vpi1r1QRnEYuM0cQIaeR6/PliXGvmxZtfxd30UACFu07s7
         Satw==
X-Gm-Message-State: ACrzQf15X+cj26igWrxIHvVfJRBNFMXcKk3JpEZLasFXt3+DD3rgaV4h
        e0xLw+t4Rk5me+sGKVg/FpU=
X-Google-Smtp-Source: AMsMyM6Rq//pF/sKPJdf0QKl7kbb+2YULvtlMUHM5Bt5Ypk8tTiKiGNl6frbZe5seZCTqTj7OMi/4w==
X-Received: by 2002:a05:6a00:1412:b0:557:d887:2025 with SMTP id l18-20020a056a00141200b00557d8872025mr984174pfu.39.1664029906715;
        Sat, 24 Sep 2022 07:31:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902684100b001641b2d61d4sm8026374pln.30.2022.09.24.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 07:31:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 24 Sep 2022 07:31:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, davidm@egauge.net,
        navin@linumiz.com, keescook@chromium.org
Subject: Re: [PATCH] hwmon: (sht4x) do not overflow clamping operation on
 32-bit platforms
Message-ID: <20220924143144.GA2299435@roeck-us.net>
References: <20220924101151.4168414-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924101151.4168414-1-Jason@zx2c4.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 24, 2022 at 12:11:51PM +0200, Jason A. Donenfeld wrote:
> On 32-bit platforms, long is 32 bits, so (long)UINT_MAX is less than
> (long)SHT4X_MIN_POLL_INTERVAL, which means the clamping operation is
> bogus. Fix this by clamping at INT_MAX, so that the upperbound is the
> same on all platforms.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/sht4x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
> index c19df3ade48e..13ac2d8f22c7 100644
> --- a/drivers/hwmon/sht4x.c
> +++ b/drivers/hwmon/sht4x.c
> @@ -129,7 +129,7 @@ static int sht4x_read_values(struct sht4x_data *data)
>  
>  static ssize_t sht4x_interval_write(struct sht4x_data *data, long val)
>  {
> -	data->update_interval = clamp_val(val, SHT4X_MIN_POLL_INTERVAL, UINT_MAX);
> +	data->update_interval = clamp_val(val, SHT4X_MIN_POLL_INTERVAL, INT_MAX);
>  
>  	return 0;
>  }
