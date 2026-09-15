Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807B3932FC
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484054; cv=none; b=uf6A6RQ51cvKNehngyQogWWl0NAl2iICDHqssKplDcpZG4o28nPc9o/EElEn+zn4hOzi2m8Nz2M++Obkgi52sNqzlAuT+duv8o8pEFMeLnsqz06KFncq9zcIO/RpVv/bz9nd7a/xq3v/uFZwC/GhzwffK31781AJQQ/ojjLaVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484054; c=relaxed/simple;
	bh=ZmjEB8NGYbYstUhk7EXsXHGAJRTCBRS05ZAeq1d0Oes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a86RP8EuuZjKLE6SCfPCvVzXCMmcVuhpCyRF0vPF/3F8UiHaSXC0BT32RVEIhMI/WSQ0cQyOwXcf4IbIkHmOwPyHxtLYmuk5UxKLzBSf20uulj74mOjBNN1vz25iOLXE7GyzQpM47/E/2mgUtybnTN9Lx0sR4HewkcR+mG6zDNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3Y423BC; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3Y423BC"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86e6d007703so2263830b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789484051; x=1790088851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LHrAOg3floaT1iC6iBo1fU/J9sjxdoLj89uhRqAue4=;
        b=J3Y423BCGVoLzcU97SYD6xUHqqIBLq7xQ/17ya5Phv2A68wolodCpLpc52CBO1VkGy
         6DzO2mcEUgLL5myGvdy59JmYZpxWdNCUpW9FBgPv3A17i9Jbq1YP3mxKliwG8iOY8Vou
         nFC4u4eoDOzrQSRIuyhneXTXzdtMs42yw/zaQL6B/Rb64oLHr0OST3e4L9RZqc2BlfS5
         AR6hbVt9i0Qsnd8/asoJd724uhF5kPlXw63yIyUz4/Q6vMEj6fmvvWAcZkrIrzpef7IU
         4UUEdnGGoRU331IntJHB+afpWnblTB7+DVJuxgmRhlj/PiHan52Y8gLjZ1/Ic1iCLtsE
         qgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484051; x=1790088851;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1LHrAOg3floaT1iC6iBo1fU/J9sjxdoLj89uhRqAue4=;
        b=jVYanjbo5YAsyVr1/BMUmDZ9KpUFW4VIjl0yRhpFnZQFHWkcM38msXbZEAQ9JANeOT
         nmMvGOluM5Evd1/uw/7D8TU+M8Cz6AqmkFSyiFtmCi7V+5KaA1VtZ2ZExWWLWf1QjoWr
         HObKq7vH84CuqhaLPYRdK5GviuzqbBw36sqH5uL7qxgGkbcctryC4m2OVgPSIFWGSmeV
         9DFsSwrdIhGrfg6CRAKCRd9jM9vH206G1T1n4EmR8trCYt95yjVCZ8XuWidHrnMJ12Jq
         LqHEZw5a8tItNP82bKBQLXlr0Lczg+kuspoT/OI8grqssR0g7h/sTnAHejgPsEgcEB8w
         mylg==
X-Gm-Message-State: AFuF++nIzn+mglJLSIkMKA7e1cjkmzw+tl67tvZTVPtceU2iptTiZXId
	zzBnY7XowE4gd9Ptosmu9BGP54dOKxoLeJFoTf5T9VjVUSQwdgHx8bkB
X-Gm-Gg: AYBFou3kAniLcqRqgwsGUbh5WmgJ9Krnak7jxPsDmzWVDfIZ2B45ssUtt4ZVPgxOrED
	t5lY6p1dWYb0pl/S7L7OlzGV0bjTrSN2f15WwpEAx4ikoWnmtSIJrvOU+SDc5yXw4N0ukNq8Alx
	n4LlMu486m+ajOVzv42Q6TKrtQg4O+u5ksDT6odGEfak7pbYKsr3/zKXxhQQ7SHyGbdr2fDLd8I
	p/re2h5NN55aQWVRcZt5IzzqnMGanMaNeKyLKZqfCSQZDmButw7Kug+EMLVXetVRMKMvQAZ1GbQ
	/DGRJgUNbWvKiIhJ+cus16DSySm2/i+FFIBP5uzIbNEaCnZEkkeVSBkvXYDWsw4sdSp5+WcFQdi
	DKKxE8lGk2R5w6EK+BdvlOz4UyC72U6OVuIgY2jw4uCQWXjZXA+/PhsaLVecUVcVF7YvIkzq9j7
	Cuway+ANB2++kZQxcAu2LtV7PhNxVlVEobcxUU4mAs7ewkYLBH02tqgNXlx5MhPlnYawHT/gLg2
	kZAFVfI5LtLyVPr7Q/aHJH5QOWYJ2iSIKCmfW9qs6nhU5/i
X-Received: by 2002:a05:6a00:430e:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86f85dd8726mr15672736b3a.20.1789484050863;
        Tue, 15 Sep 2026 07:54:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c3f3csm6713624b3a.16.2026.09.15.07.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:54:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b314524-c0f9-4528-b86d-645747b59ac9@roeck-us.net>
Date: Tue, 15 Sep 2026 07:54:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: acpi_power_meter: use named initializers for
 acpi_device_id
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 06:40, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
> This series is converting lists that contain the acpi_device_id struct,
> which is defined in the include/linux/device-id/acpi.h to make use of named
> initializers (which they do not use currently). This work is part of the on
> going effort in the kernel associated with device-ids [1]
> 
> The plan is to convert acpi_device_id::driver_data to have an anonymous
> union, similarly to what was introduced for PCI and I2C device ID tables.
> The goal is to increase type-safety (most of the existing casts are gone),
> to improve readability and to make use intent a bit more clear:
> 
> ```
> union {
> 	kernel_ulong_t driver_data;
> 	const void *driver_data_ptr;
> }
> ```
> 
> But for that to work all lists containing the structs need to use named
> initializers first to avoid triggering -Wmissing-braces. I already have
> patches that implement this and touching a lot of kernel subsystmes that
> use the acpi_device_id struct and that list keeps on growing. Therefore,
> I have decided to split the series per every subsystem into:
> - pre-clean-ups that convert the lists to use named initializers
>    (which is this series)
> - actual implementations that make some of the modules use the new
>    driver_data_ptr member
> 
> That way the task can be fragmented into manageable and independent chunks
> of work and makes this effort easier to review.
> 
> Tested builds on x86-64 in Yocto using 7.3-rc3.
> 
> [1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
> ---
>   drivers/hwmon/acpi_power_meter.c | 4 ++--
>   drivers/hwmon/asus_atk0110.c     | 4 ++--
>   drivers/hwmon/pt5161l.c          | 4 ++--
>   drivers/hwmon/xgene-hwmon.c      | 6 +++---

The subject and patch description fail to mention that it touches four
drivers and not just acpi_power_meter. Do not sneak in undocumented changes,
please.

>   4 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
> index 8a539e8d1334..d8e871509405 100644
> --- a/drivers/hwmon/acpi_power_meter.c
> +++ b/drivers/hwmon/acpi_power_meter.c
> @@ -54,8 +54,8 @@ static int can_cap_in_hardware(void)
>   }
>   
>   static const struct acpi_device_id power_meter_ids[] = {
> -	{"ACPI000D", 0},
> -	{"", 0},
> +	{ .id = "ACPI000D" },
> +	{ }

This is a functional change. It replaces a pointer to an empty string
with a NULL pointer. I don't know ACPI expectations (drivers use both),
but the change needs to be explained.

>   };
>   MODULE_DEVICE_TABLE(acpi, power_meter_ids);
>   
> diff --git a/drivers/hwmon/asus_atk0110.c b/drivers/hwmon/asus_atk0110.c
> index 92afb64c09df..868c4e14d26a 100644
> --- a/drivers/hwmon/asus_atk0110.c
> +++ b/drivers/hwmon/asus_atk0110.c
> @@ -141,8 +141,8 @@ typedef ssize_t (*sysfs_show_func)(struct device *dev,
>   			struct device_attribute *attr, char *buf);
>   
>   static const struct acpi_device_id atk_ids[] = {
> -	{ATK_HID, 0},
> -	{"", 0},
> +	{ .id = ATK_HID },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, atk_ids);
>   
> diff --git a/drivers/hwmon/pt5161l.c b/drivers/hwmon/pt5161l.c
> index 2b408a69b085..1638f54f8eae 100644
> --- a/drivers/hwmon/pt5161l.c
> +++ b/drivers/hwmon/pt5161l.c
> @@ -611,8 +611,8 @@ static const struct of_device_id __maybe_unused pt5161l_of_match[] = {
>   MODULE_DEVICE_TABLE(of, pt5161l_of_match);
>   
>   static const struct acpi_device_id __maybe_unused pt5161l_acpi_match[] = {
> -	{ "PT5161L", 0 },
> -	{},
> +	{ .id = "PT5161L" },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, pt5161l_acpi_match);
>   
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 38b140c23c88..eebbb741deac 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -595,9 +595,9 @@ static void xgene_hwmon_tx_done(struct mbox_client *cl, void *msg, int ret)
>   
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id xgene_hwmon_acpi_match[] = {
> -	{"APMC0D29", XGENE_HWMON_V 1},
> -	{"APMC0D8A", XGENE_HWMON_V2},
> -	{},
> +	{ .id = "APMC0D29", .driver_data = XGENE_HWMON_V1 },
> +	{ .id = "APMC0D8A", .driver_data = XGENE_HWMON_V2 },
> +	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, xgene_hwmon_acpi_match);
>   #endif
> 
> ---
> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
> change-id: 20260915-acpi-hwmon-12061c767bc7
> 
> Best regards,
> --
> Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

