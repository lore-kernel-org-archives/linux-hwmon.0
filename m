Return-Path: <SRS0=aTgz=W7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C87C3A5AA
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Sep 2019 18:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30C0E206BA
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Sep 2019 18:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS2BjMUQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732186AbfIDSRt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Sep 2019 14:17:49 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43811 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389995AbfIDSMN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Sep 2019 14:12:13 -0400
Received: by mail-pl1-f194.google.com with SMTP id 4so9922759pld.10
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Sep 2019 11:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AnPwxM+0iwXaAcJUSSPSTLHKk1pqbiWTKb15U4mxByA=;
        b=jS2BjMUQz962S2ylMqdV/Pr+3+QSzezFZaowtOGy+tRUHERequgf9wsJbYF/YKkMwx
         RHfqJeSwAuNscA+7VGzegP/FS47J6jPtbC8SB16r/h3xnRUjNCslIHvMEO5a13D77mi3
         PEQVZcqKYN511eqph/IhP1BLnh2kpfngk7VjSLPz9VECGDR+QSMDAqJlw7jCXFzRIUDG
         hUK+n/GkOouiTjMo1sG1TeXDqwnexw8iPxVNYimHv7f0G40MmFE6JuuSEWn2rYAV3TSS
         p6EETs88Fud87X33bgo34+hIanWgLyBrAGt+AFCLt/NgVZckk4hHgmYTJ4XIhnNmpWJk
         Z1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=AnPwxM+0iwXaAcJUSSPSTLHKk1pqbiWTKb15U4mxByA=;
        b=qnK7hVDsUGD9mPx2B4KML8x8cw8yQdxd6yFOF/zQ6esBivLY/Y4WKh905T3NVxf9uh
         ggBkNZRkDqLES87f4IqbI4Pxx4TBdV9XdVwyfnk4VR6hwjbhQvfsCzU6CxY0imlrxMn7
         DNDcY0Bj8+NJCLrXodOcv6Gbse7iZogfBhSOOHEOkwPF4K4Y4XEM8WgCaqpX+xkUd9SI
         eGMZolRk9QhSs2qdVooIc8Mc8lRQt5ys89sUFv2RUpslO51TglgopFbRbdUjhfWvLLPm
         eWL6Oi+wKUUlv7bi3nPLtbFDE7iDkCSP/3jktfF9+xnV2GR9pU+vrpQYXJxfv/mvhAT3
         HidA==
X-Gm-Message-State: APjAAAUXeDxEANpewK5VUneVdon5oAlSIpzRQ+i6kdYEpqyWlGPjJEVH
        7BitTM6GkCh0F9U/IsxjXm5yxaJp
X-Google-Smtp-Source: APXvYqzvjgGgQNBg7GdyydCiWhjo1vf0cGSfF35GHOdcKA/lUIoDRnbaWE0AX6ucpWQBpax4XoBj2Q==
X-Received: by 2002:a17:902:9698:: with SMTP id n24mr43408474plp.14.1567620732307;
        Wed, 04 Sep 2019 11:12:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o19sm1083589pjr.23.2019.09.04.11.12.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 11:12:11 -0700 (PDT)
Date:   Wed, 4 Sep 2019 11:12:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Iker Perez <iker.perez@codethink.co.uk>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: (lm75) Aproximate sample times to data-sheet
 values
Message-ID: <20190904181210.GA7938@roeck-us.net>
References: <20190904115621.15057-1-iker.perez@codethink.co.uk>
 <20190904115621.15057-2-iker.perez@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904115621.15057-2-iker.perez@codethink.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 04, 2019 at 12:56:21PM +0100, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> Current sample time values are over estimated, this patches applies
> values closer to the ones defined in the data-sheets.
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Merged with my lm75 patch series and applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm75.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f68ef9d451ab..2bb3e4ea5abd 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -123,13 +123,13 @@ static const struct lm75_params device_params[] = {
>  	[adt75] = {
>  		.clr_mask = 1 << 5,	/* not one-shot mode */
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 8,
> +		.default_sample_time = MSEC_PER_SEC / 10,
>  	},
>  	[ds1775] = {
>  		.clr_mask = 3 << 5,
>  		.set_mask = 2 << 5,	/* 11-bit mode */
>  		.default_resolution = 11,
> -		.default_sample_time = MSEC_PER_SEC,
> +		.default_sample_time = MSEC_PER_SEC / 2,
>  	},
>  	[ds75] = {
>  		.clr_mask = 3 << 5,
> @@ -145,45 +145,45 @@ static const struct lm75_params device_params[] = {
>  	},
>  	[stlm75] = {
>  		.default_resolution = 9,
> -		.default_sample_time = MSEC_PER_SEC / 5,
> +		.default_sample_time = MSEC_PER_SEC / 6,
>  	},
>  	[ds7505] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode*/
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 4,
> +		.default_sample_time = MSEC_PER_SEC / 5
>  	},
>  	[g751] = {
>  		.default_resolution = 9,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 10,
>  	},
>  	[lm75] = {
>  		.default_resolution = 9,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 10,
>  	},
>  	[lm75a] = {
>  		.default_resolution = 9,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 10,
>  	},
>  	[lm75b] = {
>  		.default_resolution = 11,
> -		.default_sample_time = MSEC_PER_SEC / 4,
> +		.default_sample_time = MSEC_PER_SEC / 10,
>  	},
>  	[max6625] = {
>  		.default_resolution = 9,
> -		.default_sample_time = MSEC_PER_SEC / 4,
> +		.default_sample_time = MSEC_PER_SEC / 7,
>  	},
>  	[max6626] = {
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 4,
> +		.default_sample_time = MSEC_PER_SEC / 7,
>  		.resolution_limits = 9,
>  	},
>  	[max31725] = {
>  		.default_resolution = 16,
> -		.default_sample_time = MSEC_PER_SEC / 8,
> +		.default_sample_time = MSEC_PER_SEC / 20,
>  	},
>  	[tcn75] = {
>  		.default_resolution = 9,
> -		.default_sample_time = MSEC_PER_SEC / 8,
> +		.default_sample_time = MSEC_PER_SEC / 18,
>  	},
>  	[pct2075] = {
>  		.default_resolution = 11,
> @@ -194,19 +194,19 @@ static const struct lm75_params device_params[] = {
>  		.clr_mask = 1 << 7,	/* not one-shot mode */
>  		.default_resolution = 12,
>  		.resolution_limits = 9,
> -		.default_sample_time = MSEC_PER_SEC,
> +		.default_sample_time = MSEC_PER_SEC / 4,
>  	},
>  	[tmp100] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
>  		.clr_mask = 1 << 7,	/* not one-shot mode */
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC,
> +		.default_sample_time = MSEC_PER_SEC / 3,
>  	},
>  	[tmp101] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
>  		.clr_mask = 1 << 7,	/* not one-shot mode */
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC,
> +		.default_sample_time = MSEC_PER_SEC / 3,
>  	},
>  	[tmp112] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
> @@ -218,25 +218,25 @@ static const struct lm75_params device_params[] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
>  		.clr_mask = 1 << 7,	/* not one-shot mode*/
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 4,
>  	},
>  	[tmp175] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
>  		.clr_mask = 1 << 7,	/* not one-shot mode*/
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 4,
>  	},
>  	[tmp275] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
>  		.clr_mask = 1 << 7,	/* not one-shot mode*/
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 4,
>  	},
>  	[tmp75] = {
>  		.set_mask = 3 << 5,	/* 12-bit mode */
>  		.clr_mask = 1 << 7,	/* not one-shot mode*/
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 2,
> +		.default_sample_time = MSEC_PER_SEC / 4,
>  	},
>  	[tmp75b] = { /* not one-shot mode, Conversion rate 37Hz */
>  		.clr_mask = 1 << 7 | 3 << 5,
> @@ -253,7 +253,7 @@ static const struct lm75_params device_params[] = {
>  	[tmp75c] = {
>  		.clr_mask = 1 << 5,	/*not one-shot mode*/
>  		.default_resolution = 12,
> -		.default_sample_time = MSEC_PER_SEC / 4,
> +		.default_sample_time = MSEC_PER_SEC / 12,
>  	}
>  };
>  
> -- 
> 2.11.0
> 
