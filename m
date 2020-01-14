Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D937C33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1564424670
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H15/N7R8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgANOGb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:06:31 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38571 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgANOGb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:06:31 -0500
Received: by mail-pg1-f194.google.com with SMTP id a33so6441452pgm.5;
        Tue, 14 Jan 2020 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a0hdJGsmj0WtvFddn029qKHvonfhRErRMrR5AlkdqjY=;
        b=H15/N7R8zFqVlQvG4PhgYHvN/Uw5M5O5kjlyl7r0Bvf6p0EhkWMAeNeyFg1UoiB/zz
         9zZpHhRavBsljQpQzjJWCMPjxRNoSupY9xbilFh+3QpavULor9N/X6rrR3tOZNCKlO24
         cArB/cGoO/5A+HYSJKg6NBKGQVkWp90k9ddtCnfF3oc2C7zWB+G8TaT1tt2kkz9iFJy1
         y8aI9ZGEs9JSMHBoJBvru0NkgSBDaV1Qu52jUza1dGzTlL6n0VvdT0uTel8jAaLXZt6F
         Gm5qFAb7zofZYDrUSSK3E/xTZxITOenfAFwt88waTvpzbafi2HhfmtyvyPe9lW/TnwfF
         P7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=a0hdJGsmj0WtvFddn029qKHvonfhRErRMrR5AlkdqjY=;
        b=Kf90inDfRGRo7HSE+88Xb65vthP7kVwF8qDOPGFCOmNr+Teei9moJp8S9kKRhX+osI
         0/OgY8aX+SZXAeoUiZbaJ1wgpo2XwjA3GfE8hAzHjfdm5PJRbWKuK/RMmpiXzpz3fCXo
         T1zDpLcguPOen4CfXE68ouVAbx/eugSThuH+m+FcrJV+CoF5Q/+d6Cy+gHi+m/ivf0Aw
         Kl7wdqYXVEIGmf1wRHo8ZfRnAMtBVqi38tUe/ygrQ7zWDP5hc0iTTkaJ3qouE/WIRkYr
         yWlwclQxGk3NvqEuN7ICGVyeyc21QFGHVSMX9OdB6o8K5l37RY+54FgLfPxS4VUXRcwz
         554w==
X-Gm-Message-State: APjAAAXRcArDGoVLYhjnKaOjhv4KXKovsR/QyIFIvMFAbGmQ7aD/DebB
        0F1uD+/b8Khn/wqFm3Toehg=
X-Google-Smtp-Source: APXvYqyxdXVMhSJA9p1/pajnGPhAmjiC3yfxUPP4/Uc9licLQenzW8jXXQin2BCf3PTvZA93gW/VCw==
X-Received: by 2002:a65:52ca:: with SMTP id z10mr27676338pgp.47.1579010790302;
        Tue, 14 Jan 2020 06:06:30 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm19056538pfn.5.2020.01.14.06.06.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:06:29 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:06:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     robh+dt@kernel.org, vijaykhemka@fb.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v1 1/6] hwmon: (pmbus/core) Add support for
 vid mode detection per page bases
Message-ID: <20200114140628.GA19858@roeck-us.net>
References: <20200113150841.17670-1-vadimp@mellanox.com>
 <20200113150841.17670-2-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113150841.17670-2-vadimp@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jan 13, 2020 at 03:08:36PM +0000, Vadim Pasternak wrote:
> Add support for VID protocol detection per page bases, instead of
> detecting it based on "PMBU_VOUT" readout from page 0 for all the pages
> supported by particular device.
> The reason that some devices allows to configure different VID modes
> per page within the same device.
> Patch modifies the field "vrm_version" within the structure
> "pmbus_driver_info" to be per page array.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/max20751.c   |  2 +-
>  drivers/hwmon/pmbus/pmbus.c      |  5 +++--
>  drivers/hwmon/pmbus/pmbus.h      |  2 +-
>  drivers/hwmon/pmbus/pmbus_core.c |  2 +-
>  drivers/hwmon/pmbus/pxe1610.c    | 44 ++++++++++++++++++++++------------------
>  drivers/hwmon/pmbus/tps53679.c   | 44 +++++++++++++++++++++-------------------
>  6 files changed, 53 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
> index ee5f0cdbde06..da3c38cb9a5c 100644
> --- a/drivers/hwmon/pmbus/max20751.c
> +++ b/drivers/hwmon/pmbus/max20751.c
> @@ -16,7 +16,7 @@ static struct pmbus_driver_info max20751_info = {
>  	.pages = 1,
>  	.format[PSC_VOLTAGE_IN] = linear,
>  	.format[PSC_VOLTAGE_OUT] = vid,
> -	.vrm_version = vr12,
> +	.vrm_version[0] = vr12,
>  	.format[PSC_TEMPERATURE] = linear,
>  	.format[PSC_CURRENT_OUT] = linear,
>  	.format[PSC_POWER] = linear,
> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
> index c0bc43d01018..9109f305ebbb 100644
> --- a/drivers/hwmon/pmbus/pmbus.c
> +++ b/drivers/hwmon/pmbus/pmbus.c
> @@ -115,7 +115,7 @@ static int pmbus_identify(struct i2c_client *client,
>  	}
>  
>  	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
> -		int vout_mode;
> +		int vout_mode, i;
>  
>  		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
>  		if (vout_mode >= 0 && vout_mode != 0xff) {
> @@ -124,7 +124,8 @@ static int pmbus_identify(struct i2c_client *client,
>  				break;
>  			case 1:
>  				info->format[PSC_VOLTAGE_OUT] = vid;
> -				info->vrm_version = vr11;
> +				for (i = 0; i < info->pages; i++)
> +					info->vrm_version[i] = vr11;
>  				break;
>  			case 2:
>  				info->format[PSC_VOLTAGE_OUT] = direct;
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index d198af3a92b6..2bdebd0ea9c1 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -382,7 +382,7 @@ enum vrm_version { vr11 = 0, vr12, vr13 };
>  struct pmbus_driver_info {
>  	int pages;		/* Total number of pages */
>  	enum pmbus_data_format format[PSC_NUM_CLASSES];
> -	enum vrm_version vrm_version;
> +	enum vrm_version vrm_version[PMBUS_PAGES]; /* vrm version per page */
>  	/*
>  	 * Support one set of coefficients for each sensor type
>  	 * Used for chips providing data in direct mode.
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 8470097907bc..98226e84b351 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -696,7 +696,7 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
>  	long val = sensor->data;
>  	long rv = 0;
>  
> -	switch (data->info->vrm_version) {
> +	switch (data->info->vrm_version[sensor->page]) {
>  	case vr11:
>  		if (val >= 0x02 && val <= 0xb2)
>  			rv = DIV_ROUND_CLOSEST(160000 - (val - 2) * 625, 100);
> diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
> index ebe3f023f840..517584cff3de 100644
> --- a/drivers/hwmon/pmbus/pxe1610.c
> +++ b/drivers/hwmon/pmbus/pxe1610.c
> @@ -19,26 +19,30 @@
>  static int pxe1610_identify(struct i2c_client *client,
>  			     struct pmbus_driver_info *info)
>  {
> -	if (pmbus_check_byte_register(client, 0, PMBUS_VOUT_MODE)) {
> -		u8 vout_mode;
> -		int ret;
> -
> -		/* Read the register with VOUT scaling value.*/
> -		ret = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> -		if (ret < 0)
> -			return ret;
> -
> -		vout_mode = ret & GENMASK(4, 0);
> -
> -		switch (vout_mode) {
> -		case 1:
> -			info->vrm_version = vr12;
> -			break;
> -		case 2:
> -			info->vrm_version = vr13;
> -			break;
> -		default:
> -			return -ENODEV;
> +	int i;
> +
> +	for (i = 0; i < PXE1610_NUM_PAGES; i++) {
> +		if (pmbus_check_byte_register(client, i, PMBUS_VOUT_MODE)) {
> +			u8 vout_mode;
> +			int ret;
> +
> +			/* Read the register with VOUT scaling value.*/
> +			ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
> +			if (ret < 0)
> +				return ret;
> +
> +			vout_mode = ret & GENMASK(4, 0);
> +
> +			switch (vout_mode) {
> +			case 1:
> +				info->vrm_version[i] = vr12;
> +				break;
> +			case 2:
> +				info->vrm_version[i] = vr13;
> +				break;
> +			default:
> +				return -ENODEV;
> +			}
>  		}
>  	}
>  
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 86bb3aca09ed..163e8c6aaa8e 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -24,27 +24,29 @@ static int tps53679_identify(struct i2c_client *client,
>  			     struct pmbus_driver_info *info)
>  {
>  	u8 vout_params;
> -	int ret;
> -
> -	/* Read the register with VOUT scaling value.*/
> -	ret = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> -	if (ret < 0)
> -		return ret;
> -
> -	vout_params = ret & GENMASK(4, 0);
> -
> -	switch (vout_params) {
> -	case TPS53679_PROT_VR13_10MV:
> -	case TPS53679_PROT_VR12_5_10MV:
> -		info->vrm_version = vr13;
> -		break;
> -	case TPS53679_PROT_VR13_5MV:
> -	case TPS53679_PROT_VR12_5MV:
> -	case TPS53679_PROT_IMVP8_5MV:
> -		info->vrm_version = vr12;
> -		break;
> -	default:
> -		return -EINVAL;
> +	int i, ret;
> +
> +	for (i = 0; i < TPS53679_PAGE_NUM; i++) {
> +		/* Read the register with VOUT scaling value.*/
> +		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
> +		if (ret < 0)
> +			return ret;
> +
> +		vout_params = ret & GENMASK(4, 0);
> +
> +		switch (vout_params) {
> +		case TPS53679_PROT_VR13_10MV:
> +		case TPS53679_PROT_VR12_5_10MV:
> +			info->vrm_version[i] = vr13;
> +			break;
> +		case TPS53679_PROT_VR13_5MV:
> +		case TPS53679_PROT_VR12_5MV:
> +		case TPS53679_PROT_IMVP8_5MV:
> +			info->vrm_version[i] = vr12;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
>  	}
>  
>  	return 0;
