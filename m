Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B169C3F6B0
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jul 2022 13:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239104AbiGZN7R (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 09:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239208AbiGZN7O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 09:59:14 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82667101ED;
        Tue, 26 Jul 2022 06:59:13 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id j70so17166312oih.10;
        Tue, 26 Jul 2022 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3CE6r59UbZWFRPQFwsRGzWwILdcmigdGmimoBM3/j00=;
        b=pLVkoY/T3ljaVdC9m7a8TyzJxnj9ZiqnL3DSFhSQYbL0BzS5ul69jv4gyPFUAc0N4W
         iM1/JivjY6LCKVA/6KAKNrNw1/GVWkiQ+fWTEF5rOMKl+h8B8mlZoLJNZU3NbHx1vFGG
         08sgN3KVZkWMCTTsGyUZNLRAq32KdZAvRg6FLeMT60ah1vaSoZjEVdEVyPrdH32rNjI5
         GV89/Saor6vgwrDAjGDTWvY3mbjDHUSDzAtGBMARmiV7TI6iVqZofp3IeR0C8OWKUMHW
         y1ThaFiXXi639p5buaJr28jBTfODqQbjIEK+E3Y5UVk5ctxAHicC7dktir7dkUiy4eN2
         KGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=3CE6r59UbZWFRPQFwsRGzWwILdcmigdGmimoBM3/j00=;
        b=z2Ygn3w5IHTj2zqt2X8nw2nNahhQL7go1a5kli0WR4gVI3DT2ELXIzIoxD1tfbpeGg
         D4lwMY0RxVimUZThkVEzxXhWsUVOoLy8cCT1GccGMG2/tuwGDllGb06DJxpPTvvvTXG2
         RmoUOBnwJFe5KtOLAMWy6lvROkKFPX60S+mI5ytXeylDEde1oCsusAIUF5pYxz5Oht/2
         xarcTB8kDfAkf738tLOerd3aNhPouo2P0zMgsdR0XaAqCRwOpP3CZxKphOwkySQo21yf
         WLVlP3Nq+piMAGMW8O5TI8mJ9phXuD51VSH+foZ206ScFwVN1P3lHMlcYTO7cn8HzXoq
         ILoQ==
X-Gm-Message-State: AJIora8748IaTYnq3W1BOp+bkwIwmAt6K7XPeAChn/am+zMe6irMsLGt
        /j/+VzLsu4wELqH5+gdOpBE=
X-Google-Smtp-Source: AGRyM1tY0QAxhFowx0g8LT07J8LxkOMVr+l2dkYMDIsaCY9ybvV6LMjuhYC39eLOm8PspfukNdT37Q==
X-Received: by 2002:aca:ac84:0:b0:33a:373f:878d with SMTP id v126-20020acaac84000000b0033a373f878dmr14910054oie.253.1658843952785;
        Tue, 26 Jul 2022 06:59:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d24-20020a05680805d800b0032f63c4638esm6115159oij.2.2022.07.26.06.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:59:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 26 Jul 2022 06:59:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Aleksa Savic <savicaleksa83@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jack Doan <me@jackdoan.com>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aquacomputer_d5next) Add support for reading the
 +12V voltage sensor on D5 Next
Message-ID: <20220726133225.GA3021073@roeck-us.net>
References: <20220726120203.33773-1-savicaleksa83@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726120203.33773-1-savicaleksa83@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jul 26, 2022 at 02:02:03PM +0200, Aleksa Savic wrote:
> Add support for reading the +12V voltage that the D5 Next pump receives.
> 
> Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/aquacomputer_d5next.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 997d72ea6182..738a1df8eae6 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -71,6 +71,7 @@ static u8 secondary_ctrl_report[] = {
>  #define D5NEXT_PUMP_OFFSET		0x6c
>  #define D5NEXT_FAN_OFFSET		0x5f
>  #define D5NEXT_5V_VOLTAGE		0x39
> +#define D5NEXT_12V_VOLTAGE		0x37
>  #define D5NEXT_CTRL_REPORT_SIZE		0x329
>  static u8 d5next_sensor_fan_offsets[] = { D5NEXT_PUMP_OFFSET, D5NEXT_FAN_OFFSET };
>  
> @@ -114,7 +115,8 @@ static const char *const label_d5next_power[] = {
>  static const char *const label_d5next_voltages[] = {
>  	"Pump voltage",
>  	"Fan voltage",
> -	"+5V voltage"
> +	"+5V voltage",
> +	"+12V voltage"
>  };
>  
>  static const char *const label_d5next_current[] = {
> @@ -340,8 +342,8 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
>  	case hwmon_in:
>  		switch (priv->kind) {
>  		case d5next:
> -			/* Special case to support voltage sensor */
> -			if (channel < priv->num_fans + 1)
> +			/* Special case to support +5V and +12V voltage sensors */
> +			if (channel < priv->num_fans + 2)
>  				return 0444;
>  			break;
>  		default:
> @@ -574,6 +576,7 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
>  	switch (priv->kind) {
>  	case d5next:
>  		priv->voltage_input[2] = get_unaligned_be16(data + D5NEXT_5V_VOLTAGE) * 10;
> +		priv->voltage_input[3] = get_unaligned_be16(data + D5NEXT_12V_VOLTAGE) * 10;
>  		break;
>  	default:
>  		break;
