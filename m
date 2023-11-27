Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEqoDFBt"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCA219B2
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2023 04:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701087334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fI+C8/bX9e2YG+K+fSYEaSTwRfiC0DEcv0zKQARub9o=;
	b=jEqoDFBt7Kil4v9ngJ2V/elmgAKFTzfuTRwWMfExKyXpWX9TIJEnQr7+d/rPcH3J0XlAwI
	pxItu0HHMkHG8W/r3+iKKn+T6XwYWTSMTmxxvHSpEKzIXcp5BoF22S+6dgAzvVIlKSe/PG
	RkzJemLCmKgpzI0qWT/E/4ylshid730=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-wDvQceaiPmmizphtsoeuuw-1; Mon, 27 Nov 2023 07:15:33 -0500
X-MC-Unique: wDvQceaiPmmizphtsoeuuw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-54acdd65e8cso2202471a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2023 04:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701087332; x=1701692132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fI+C8/bX9e2YG+K+fSYEaSTwRfiC0DEcv0zKQARub9o=;
        b=h41CSqXaQ6+oOe1n6/p0b1mjNQkeA5bzR2PwS3QyAvlPTy9I/Y3w9NQNgrSxvLekGx
         O9kEWQx/HvnCHtsWZsM+ECiyV/RV2ZbTe6eiPPe2og5U0JRmrnLPvEJ4Fhxpns8bJNru
         9xWvTZJu+1d3/sbB3WPRl++inef2DBJO9qF4Ser5EKAkxuGiCmpCDZV7FRTy9yrHQkNm
         9u2Hg6LUF6jar7mmdNq0RCnO9wYBx9XQG86kFWAT2QYXJSygR5mYISuePUyseF6/9S6e
         7SlZQPnvAD66aP1emo/AXGzkrKKU8DeQ2By/DWetmFPjJONg7m5+Wtxn6yLTYvszgF0f
         8I2Q==
X-Gm-Message-State: AOJu0Yzil9aL1qKxS62OC/K2opyQnzig4X9EeRWx2tLG8Zwf0+/8m8q4
	p65H5sasBWYr4or3OtRujpCNr0ubCMz0/i0BzXIrSEMEP13N3HOuEMmQtxNBK9K54UeN7EI3VkK
	W1ZiMyGKQJStD4C4uBk2wF7Q=
X-Received: by 2002:a05:6402:2219:b0:54a:f86f:669e with SMTP id cq25-20020a056402221900b0054af86f669emr7353951edb.18.1701087332022;
        Mon, 27 Nov 2023 04:15:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwcfpY06TcykQSkgFiIy2S0dzMfyIKToC9aYumGwhcH28dgXbKs+PgbTqDA6zw07uTQ7+thw==
X-Received: by 2002:a05:6402:2219:b0:54a:f86f:669e with SMTP id cq25-20020a056402221900b0054af86f669emr7353934edb.18.1701087331730;
        Mon, 27 Nov 2023 04:15:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g18-20020a50d0d2000000b0054b89583a2fsm376455edf.49.2023.11.27.04.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 04:15:31 -0800 (PST)
Message-ID: <13bee0fc-2a32-4f6d-ba5d-cac99882686a@redhat.com>
Date: Mon, 27 Nov 2023 13:15:30 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] platform/x86: acer-wmi: add fan speed monitoring
 for Predator PHN16-71
Content-Language: en-US
To: SungHwan Jung <onenowy@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Lee, Chun-Yi" <jlee@suse.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20231124094122.100707-1-onenowy@gmail.com>
 <20231124094122.100707-3-onenowy@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231124094122.100707-3-onenowy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 11/24/23 10:41, SungHwan Jung wrote:
> Support CPU and GPU fan speed monitoring through WMI for Predator
> PHN16-71.
> 
> This patch depends on patch "platform/x86: acer-wmi: Add platform
> profile and mode key support for Predator PHN16-71"
> 
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>
> ---
>  drivers/platform/x86/Kconfig    |   1 +
>  drivers/platform/x86/acer-wmi.c | 104 +++++++++++++++++++++++++++++++-
>  2 files changed, 103 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7e69fdacc..caf3f4c6b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig

<snip>

> @@ -2505,6 +2535,9 @@ static int acer_platform_probe(struct platform_device *device)
>  			goto error_platform_profile;
>  	}
>  
> +	if (has_cap(ACER_CAP_FAN_SPEED_READ))
> +		err = acer_wmi_hwmon_init();
> +
>  	return err;
>  
>  error_rfkill:
This has the same error-handling problem as patch 1/3. I have fixed
this up in the same manner while merging this, resulting in:

        if (has_cap(ACER_CAP_PLATFORM_PROFILE)) {
                err = acer_platform_profile_setup();
                if (err)
                        goto error_platform_profile;
        }

        if (has_cap(ACER_CAP_FAN_SPEED_READ)) {
                err = acer_wmi_hwmon_init();
                if (err)
                        goto error_hwmon;
        }

        return 0;

error_hwmon:
        if (platform_profile_support)
                platform_profile_remove();
error_platform_profile:
        acer_rfkill_exit();
error_rfkill:
        if (has_cap(ACER_CAP_BRIGHTNESS))
                acer_backlight_exit();

	...

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



