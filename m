Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NdxvTine"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E7B10F
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2023 04:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701087474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//Bc9TmEqtVgaODHTvD3WtD2zML+qIZDo7Hazax0zbw=;
	b=NdxvTineAV4qK8LENRCMhw1+UoXCWOHpAmsQw/4v/vW8vRMJeLUxb3brxFr8HvVqL1OrKr
	K0cF+azzTkLHmsy/bep5xlR4Yc6OlzOP0AE2lLi5Y3Zd9Bs4kf+PjYC3b1nRjq4SR5ePy8
	mLHw+wt1OCD2H4TsEoBP0q7i+qxQ1Dc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-tDe3ouPZP9q-5OD9KiN2nA-1; Mon, 27 Nov 2023 07:17:52 -0500
X-MC-Unique: tDe3ouPZP9q-5OD9KiN2nA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-543f45ab457so2680804a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2023 04:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701087471; x=1701692271;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//Bc9TmEqtVgaODHTvD3WtD2zML+qIZDo7Hazax0zbw=;
        b=dvTWrilzNnkREP7/Utx2EsDERIHICZpI4sYgp+Fheu6qlCIV5xsTEAqb19P59WBYWi
         0J///7avb2/XjX3LzefnA0B1HiNm6ztRsLc+oPWsT3G2lydc32VLsgc6f9itYKnufVwk
         IejB5GhhjLLY8AUbbeaxl+xpuCYk0gZLtKe9zgrKBySPnLM1NWBbSPYHG4C8qi7fALqa
         q/fwI9iI6/CJSKFCJ9bDB/38anFiHiaPikAKJd3WAsbOAvkyrGuujyi2sPHiC3KH3ctk
         uA3rD7i17P2l475amD88JmkgP1DL0lExjoUpaXiZD2z4psVsK2ykLwNQLa/PjK39KEuF
         ybig==
X-Gm-Message-State: AOJu0YxdOnhdQytJBnmfSimeOgWagDtOrOgtEAuLl+39BscINhJ92sd4
	WmFeYDq3BAIema1+DyWgv3AymMfObG6gvzEayFtJYqsZoNlqwAKS8n2dyl7b4uE6heKCuX/XWyL
	EQKrt7XKlU2xgKcGuHP2M6ZM=
X-Received: by 2002:a17:907:9187:b0:a04:1714:539d with SMTP id bp7-20020a170907918700b00a041714539dmr6142639ejb.55.1701087471511;
        Mon, 27 Nov 2023 04:17:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHYGZt19UFPMftxcxcsB4rz6e8kcgYsLkL5Xkn69OsoUb+vFFXNJc3Kv6S97js1KYqCzzFPg==
X-Received: by 2002:a17:907:9187:b0:a04:1714:539d with SMTP id bp7-20020a170907918700b00a041714539dmr6142624ejb.55.1701087471197;
        Mon, 27 Nov 2023 04:17:51 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id qc24-20020a170906d8b800b00a0e3b75f8dasm1651929ejb.101.2023.11.27.04.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 04:17:50 -0800 (PST)
Message-ID: <65f989f6-c50b-454a-90e2-f2de4de905ac@redhat.com>
Date: Mon, 27 Nov 2023 13:17:49 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] platform/x86: acer-wmi: Fix recursive dependency
 for acer-wmi
Content-Language: en-US
To: SungHwan Jung <onenowy@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Lee, Chun-Yi" <jlee@suse.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20231124094122.100707-1-onenowy@gmail.com>
 <20231124094122.100707-4-onenowy@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231124094122.100707-4-onenowy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/24/23 10:41, SungHwan Jung wrote:
> "select ACPI_VIDEO" cause recursive dependency when "depends on HWMON"
> is added.
> 
> ---build log
> drivers/hwmon/Kconfig:6:error: recursive dependency detected!
> drivers/hwmon/Kconfig:6: symbol HWMON is selected by EEEPC_LAPTOP
> drivers/platform/x86/Kconfig:326: symbol EEEPC_LAPTOP depends on ACPI_VIDEO
> drivers/acpi/Kconfig:208: symbol ACPI_VIDEO is selected by ACER_WMI
> drivers/platform/x86/Kconfig:173: symbol ACER_WMI depends on HWMON
> ---
> 
> It is not recommended to use "select" for visible symbol, "select" has changed
> to "depends on".
> 
> This patch depends on "platform/x86: acer-wmi: add fan speed monitoring
> for Predator PHN16-71"
> 
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>

This patch should come before the patch adding the "depends on HWMON",
to avoid a bisect ending up with patch 2/3 applied without patch 3/3
applied and thus picking a non building commit.

Also there is a stub defined for the used acpi_video_get_backlight_type()
function when ACPI_VIDEO is not set, so this can use:

        depends on ACPI_VIDEO || ACPI_VIDEO = n

I have changed the order of the patches for this patch to be before
the patch adding the hwmon support and I've updated the depends as
mentioned above while merging this:

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




> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index caf3f4c6b..33ddb644e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -178,7 +178,7 @@ config ACER_WMI
>  	depends on RFKILL || RFKILL = n
>  	depends on ACPI_WMI
>  	depends on HWMON
> -	select ACPI_VIDEO
> +	depends on ACPI_VIDEO
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
>  	select NEW_LEDS

