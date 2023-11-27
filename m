Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JpZJlCy0"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4306C0
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2023 03:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701085417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkOpbKWU2mA/hyWylJke4xZIKkSX936DZIZ1I7bnNmk=;
	b=JpZJlCy0zBuX4JTgGK2C3IfZljCbrQKE6oaoucBh2VNR4xGOTIq2C+4HTzDuvUb94p059j
	ep9YAsPFl2MEH29TP7ZS3G+xWLrQNp6qrFKNZ5KM1rKklRrWow4Y5SFp5iG+GEAKrWFHwn
	kzFFHIuYDu7sEJ7QWZjO+FzQLsI5dTM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-S12hPRi9P4Wv6LchrMTE1A-1; Mon, 27 Nov 2023 06:43:36 -0500
X-MC-Unique: S12hPRi9P4Wv6LchrMTE1A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a01c7b09335so332354466b.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Nov 2023 03:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701085415; x=1701690215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CkOpbKWU2mA/hyWylJke4xZIKkSX936DZIZ1I7bnNmk=;
        b=WslD3IIFO1X93JLVjqe/CuIn0lhiVXnBvP4izhpaudvAAifVRASdUde7Q5h7hYsflD
         F+Nh4wnBJnzvV777WcUie4MrfzmwQARFwlfuHSlqsARmuVOsX3ouYCw25R3llcuSdNsZ
         sqhmy4FaOP0LoVK2MYtmgwUx1le4YJdDNlX3uxTXBlYed88sJx9Lg8GLy1ewmV4btyVa
         yZcb4GmedySbFSxCNkNxv2SY3pFHLbUCFpfi8wgZZ93aE3PjhbwMCBcqgNgxZG2FOe1J
         td37p+5cvIZuL80LmNH56QT6Tr4q6ANs+gSEJ4x1ytBi8VikywVPgxa3smZXgs2+/H0U
         A7hQ==
X-Gm-Message-State: AOJu0YzLbG+WRBpRFrAtwczDRGL4GH1PdHBc21T3xwL5iPQXuQeImSqk
	H+cAoDDSnvZtE13fDbxc9uNOYfrgJPNHT6QTdam82jV4a+vr0pVWfMXNWyXb46gTYrBUHdTvPp9
	Ei4nFxt9q1QOkj6uESpWItaA=
X-Received: by 2002:a17:906:2201:b0:9de:32bb:fa96 with SMTP id s1-20020a170906220100b009de32bbfa96mr7127948ejs.9.1701085415418;
        Mon, 27 Nov 2023 03:43:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmKUrycQqNYa+3j0Nw4B7Z518q5PzsL8c61NkF9I5E9+gV3sIGxXsJuD4vcv1c2jUrQRcfRQ==
X-Received: by 2002:a17:906:2201:b0:9de:32bb:fa96 with SMTP id s1-20020a170906220100b009de32bbfa96mr7127928ejs.9.1701085415024;
        Mon, 27 Nov 2023 03:43:35 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090668d600b00a029145bbb9sm5581623ejr.3.2023.11.27.03.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 03:43:34 -0800 (PST)
Message-ID: <adba7928-1ca7-4076-ba8f-32276b8fea5c@redhat.com>
Date: Mon, 27 Nov 2023 12:43:33 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] platform/x86: acer-wmi: Add platform profile and
 mode key support for Predator PHN16-71
Content-Language: en-US
To: SungHwan Jung <onenowy@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Lee, Chun-Yi" <jlee@suse.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20231124094122.100707-1-onenowy@gmail.com>
 <20231124094122.100707-2-onenowy@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231124094122.100707-2-onenowy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for your patch.

On 11/24/23 10:41, SungHwan Jung wrote:
>  The Acer Predator PHN16-71 has the mode key that is used to rotate
> thermal modes or toggle turbo mode with predator sense app (ver. 4) on
> windows.
> This patch includes platform profile and the mode key support for the
> device and also includes a small fix for "WMI_gaming_execute_u64"
> function.
> 
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 268 +++++++++++++++++++++++++++++++-
>  1 file changed, 267 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 0e472aa9b..e3650dce0 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -20,6 +20,7 @@
>  #include <linux/backlight.h>
>  #include <linux/leds.h>
>  #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
>  #include <linux/acpi.h>
>  #include <linux/i8042.h>
>  #include <linux/rfkill.h>
> @@ -62,9 +63,12 @@ MODULE_LICENSE("GPL");
>  
>  #define ACER_WMID_SET_GAMING_LED_METHODID 2
>  #define ACER_WMID_GET_GAMING_LED_METHODID 4
> +#define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
>  #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
>  #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
>  
> +#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
> +
>  /*
>   * Acer ACPI method GUIDs
>   */
> @@ -90,6 +94,10 @@ enum acer_wmi_event_ids {
>  	WMID_GAMING_TURBO_KEY_EVENT = 0x7,
>  };
>  
> +enum acer_wmi_predator_v4_sys_info_command {
> +	ACER_WMID_CMD_GET_PREDATOR_V4_BAT_STATUS = 0x02,
> +};
> +
>  static const struct key_entry acer_wmi_keymap[] __initconst = {
>  	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>  	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> @@ -232,6 +240,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_TURBO_OC     BIT(7)
>  #define ACER_CAP_TURBO_LED     BIT(8)
>  #define ACER_CAP_TURBO_FAN     BIT(9)
> +#define ACER_CAP_PLATFORM_PROFILE BIT(10)

When Ilpo set to use tabs for indent here, he meant to do
this in this patch too, I have fixed this up while merging the patch.

I have also found several places where you separate blocks
by multiple empty lines instead of just 1 empty line,
I have also fixed this (reducing things to 1 empty line)
while applying this.

<snip>


> @@ -2245,6 +2499,12 @@ static int acer_platform_probe(struct platform_device *device)
>  	if (err)
>  		goto error_rfkill;
>  
> +	if (has_cap(ACER_CAP_PLATFORM_PROFILE)) {
> +		err = acer_platform_profile_setup();
> +		if (err)
> +			goto error_platform_profile;
> +	}
> +
>  	return err;
>  
>  error_rfkill:

The error handling here is wrong, on error you need to undo all previous steps,
so your error handling needs to add a label above the first (error_rfkill)
label and then undo the last step before the platform-profile-setup,
specifically call acer_rfkill_exit(); from the new label. IOW the code here
should look like this:

        if (has_cap(ACER_CAP_PLATFORM_PROFILE)) {
                err = acer_platform_profile_setup();
                if (err)
                        goto error_platform_profile;
        }

        return err;

error_platform_profile:
        acer_rfkill_exit();
error_rfkill:
        if (has_cap(ACER_CAP_BRIGHTNESS))
                acer_backlight_exit();
	...

I have also fixed this up while merging this patch:

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

