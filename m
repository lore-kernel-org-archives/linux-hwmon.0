Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C97C33C8C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 16:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5573E20678
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 16:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLH43rsw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgAEQ0L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 11:26:11 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41961 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgAEQ0L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 11:26:11 -0500
Received: by mail-pg1-f193.google.com with SMTP id x8so25721216pgk.8;
        Sun, 05 Jan 2020 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ycBkhnR+ukyeX9iH7WIPjBDwNZCXA2qetamPgs9JgyQ=;
        b=GLH43rswJGGg/TkYciKlluFXsAB0XVF48Q3ZHaQHlLB6qDWCG2gdVAJ0JUvewt/mEf
         6Lu3UCybiuTFeWerhzwDW8KUVB12fwpYPA2W4G1VsKwi2CNzpAU9kq1JA6E/tMUyvICi
         R9LYPaPTWoXfhit/c9fyCw/vtAQESr5yM/gzYmeEvbSsbO5jE+hmQX2rKfTCsBQ2Z/Bs
         3wMoCiCz1mCbk39b1tjxpfcxAt1DU0g9MLc7rJ/9TdFcss5fHK6p4ykNwu9o6YHywjBb
         xeWlAtsmDc/dejwQqwsoryU2/4VYtMalAT0hg2pz4eYvphIS0DgheeDnSc1kj56/02D1
         J+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ycBkhnR+ukyeX9iH7WIPjBDwNZCXA2qetamPgs9JgyQ=;
        b=cZB/XPYLUMMSOqdN9Uhxap/BAzKCy5tKkvHCMSaLSaQu38rZ81VqMNTEUE6v7qQ2Yq
         CBBNcbi/oZOfuCt+CcXQ8dkl56NlG4dZDZlcjOcGP7OZ/H7ClFv4vznQY3Pip6uqMwGj
         crubYrNqmMsbwNzVm7LTtP2N8bCIrozSkOXuwZuyn+s4tlqr4/jiNg7U+CxAaBRtzNf/
         O40qo0T+ZxmTlnoFNGvnfJ1oQvYdkL+DiBrk6myEw8Ho6sAc7A6pGiKjqqx8xpan5K5C
         g0UxqzAfjntMP8XgTYfGF4dXVj+bVYS5czapDGUGlGIYeNnfb8dPn5jYOC0o5fT45v7l
         Ps+w==
X-Gm-Message-State: APjAAAWACK+pRIdDrCX+cZG8SJg1vyKAAGlClyo5a4uW/iy2PcDk0NXg
        6sqOVYjkt33r0iHRcO2B3X12riS3
X-Google-Smtp-Source: APXvYqzHYHQwYzS0cDDrO8CCxE7QsPig3jbh4pWtQ3c5f4xgcVyHRsw6cT4sv/mz3hu2v2dXilsOWw==
X-Received: by 2002:a63:b642:: with SMTP id v2mr104671005pgt.126.1578241570304;
        Sun, 05 Jan 2020 08:26:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h11sm67972149pgv.38.2020.01.05.08.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2020 08:26:09 -0800 (PST)
Subject: Re: [RFC PATCH hwmon-next v1 2/5] hwmon: (pmbus/core) Add support for
 Intel IMVP9 specification
To:     Vadim Pasternak <vadimp@mellanox.com>, robh+dt@kernel.org,
        vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-3-vadimp@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <0be6b849-939d-49a7-476e-62bf201fdd93@roeck-us.net>
Date:   Sun, 5 Jan 2020 08:26:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200105105833.30196-3-vadimp@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/5/20 2:58 AM, Vadim Pasternak wrote:
> Extend "vrm_version" with support for Intel IMVP9 specification.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>   drivers/hwmon/pmbus/pmbus.h      | 2 +-
>   drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 2bdebd0ea9c1..c6b2401f1c6c 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -377,7 +377,7 @@ enum pmbus_sensor_classes {
>   #define PMBUS_PAGE_VIRTUAL	BIT(31)
>   
>   enum pmbus_data_format { linear = 0, direct, vid };
> -enum vrm_version { vr11 = 0, vr12, vr13 };
> +enum vrm_version { vr11 = 0, vr12, vr13, imvp9 };
>   
>   struct pmbus_driver_info {
>   	int pages;		/* Total number of pages */
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 98226e84b351..a9b7b555cf6e 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -709,6 +709,10 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
>   		if (val >= 0x01)
>   			rv = 500 + (val - 1) * 10;
>   		break;
> +	case imvp9:
> +		if (val >= 0x01)
> +			rv = 200 + (val - 1) * 10;
> +		break;

There is also Intel VR14, and there is some indication that it is identical
to imvp9. If that is the case, I would prefer to use existing terminology.
Unfortunately, Intel is a bit close-lipped about both. If you have access
to documentation, can you check ?

Thanks,
Guenter

>   	}
>   	return rv;
>   }
> 

