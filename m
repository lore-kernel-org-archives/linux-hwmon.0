Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47402 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751394AbdCIBrI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2017 20:47:08 -0500
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9560 into DMI list
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>
References: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6d67939d-8aad-aa12-ee71-e7cc0f302f65@roeck-us.net>
Date: Wed, 8 Mar 2017 17:43:59 -0800
MIME-Version: 1.0
In-Reply-To: <1488580912-13578-1-git-send-email-pali.rohar@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/03/2017 02:41 PM, Pali Rohár wrote:
> It was reported that dell-smm-hwmon is working fine on Dell XPS 15 9560.
>
> Link: http://www.spinics.net/lists/platform-driver-x86/msg10751.html
> Reported-by: Vasile Dumitrescu <vasile.dumitrescu@undeva.eu>
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>

With Vasile's feedback, I'll consider this patch tested and will apply it
to hwmon-next.

Thanks,
Guenter


> ---
>  drivers/hwmon/dell-smm-hwmon.c |    7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 34704b0..3189246 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -995,6 +995,13 @@ enum i8k_configs {
>  		},
>  		.driver_data = (void *)&i8k_config_data[DELL_XPS],
>  	},
> +	{
> +		.ident = "Dell XPS 15 9560",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
> +		},
> +	},
>  	{ }
>  };
>
>

