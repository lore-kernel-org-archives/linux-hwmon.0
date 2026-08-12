Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B96C372696
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 01:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786499823; cv=none; b=hFKBnOWWhQhScD/P2mewZfQMxRP2kL/UepKi5QDOhiX8iqTPhLvDuWFG0sxSqVYFUrTGScm7KS03emmsjfvUm5Jg1FpS7NBFeVq1QXUJ/MzqCM/fu5juiYtX7SkY3Y94DdEDt6wy6JdXrq0Mk4eJYL65Rb6SWCGHSJsrVwMGYxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786499823; c=relaxed/simple;
	bh=yxdwP2xy95+aqAmp95DAzRsf1MWkHBcoSVuqmIxjcxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXUlPrKlqV8Hf28x+WqlT+2rwn8CQqbsa2k9HBIg2LNSUfUDZEz56lPuw6StxRpBy6dwv5KIMq2eFrvq1M7Y0Xmf7GShhaOyBnn4YJ8hcdV8WmxhOp5T9hFEzlZ/DgJl7DHmGHMasCRm6OxXROc/Q0mcWY6d3L3dUDn1XrJrBiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rLhU0JwQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rLhU0JwQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so568846b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 18:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786499821; x=1787104621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zC2vfFmUzEKCSyHmGW3bbnUa/7l8VzKn766q3j9vYlE=;
        b=rLhU0JwQ/Ka8+XYY+0TEiP6ruZGKCjOMpv7jvIFZMLiAaBiCMpZPR2uXGslNAckoed
         rjHyQh7+25SPtbTReqjBU6bjsM53rD7CXII/+i6MDfsRpOJAr0+hwXwJDhdXCNC7PZ/+
         BhuaINoMFjQXtJEPd1lhW3tXBCXFoOoKyWvV3NdS1CBTZ1sedQRLjIzFr5z7s+meywWr
         I7EIkkYsq7DCIbissNQfswDIvY4mPSIUWSVRNTpcJ2RnpR3hQbLxcd8R/bgJkJo0sux6
         IlaeblaJOZSKenzQ7lFQNkmZmlvtPZvtOrtg1RYK5ywUmKLNgxBDNRzCBCKfmtYejtUL
         fH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786499821; x=1787104621;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zC2vfFmUzEKCSyHmGW3bbnUa/7l8VzKn766q3j9vYlE=;
        b=snX/mT5yC01JRfXfZFz8mue8YpE2NknFghKIAuiUrj8Kzn0OmEAbwPzAVE7ZuijpbP
         3VuCvblm9a+Bn8BCofggXGKmoOkQzA/8LLJYv/GfeAtO5zXJVBEmPmfo9VqZGiXKzsxg
         GtkImnN2kNZjz5qbrY6150LojDymAG79sfTg/DsWfQbEEKB1Cgps4320jJPFAk4HS8LK
         vcYOYkQTtjMG2O5XYGpOjz6javHP6hIahVbgjoYvzgPgE0CmmyPrb+2eZFEbBj7TrZul
         DgUDNJZ6XvRmgvaBWWRn64KHz5jvk0ypj6FeeED5m5Yxd1ijUbOdM0bQuOOiLJbEu3ma
         HETg==
X-Forwarded-Encrypted: i=1; AHgh+RpCB6TbJlB71rAHMcqiM5/Fcf46pcjvfjyJd7sKRC9ZBaxbr2HP8uBJll6vtHNstF9wo+laAIJFpfwisw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLNGq+H/k4hotx7zLoX5tkVneKXdzlgHSSdzBkY8tt+yj2SgJ
	cx27deYYprRuCERaQKZsZy31yf/yx03z7O9nC8iwLtBhB1fQS0kWQ+js
X-Gm-Gg: AR+sD13G4CIv2w5bcO/L12pVVEZoGuCKgzUTuKfNLFrLYmOC2YemcZv1fvilGz8+WjE
	W/ScpZ+cJKeQA5wVJpVfrkf+gB8Mw1r+ASvEujvpgHEbGOzGhb4JRpZZF47Gp5J4oxMocApYYei
	Hoan1Sr9EpraNM139t4h9dNqXWEQGXUL59kO/55CXCRORzg+7n10nDktPocFCMbZRmudPeiQtR+
	MEyy1V3OTFo1fOd33zMJ53biLzyt3+U8DjqSNjYGjKdTlDYqX6u+p8p/JeLy6v+E9nikqJniPu6
	wU26LwPOUC5GpGfZJ1Y1hH/bZOT57V8oS6ECGSxYuD8f/+macPRFpuNT331GYyDu5SmpXnNwODG
	LsFBNQKQOMRyk/DKdK/O83PkXNIkHdVV63FY8cQ+WEXm1lcu7ibycKu1y/koQxHzgZrGrkYiSiG
	z5maiBuIumdiIyU+4eIbn4CxPCO3bTiKP5H2fK0VIcOhIO1mWkNhrx7wB/O5RF/vF2M5gHFCUnv
	QOF7/s//gZ/kOYMdwoN9NndPgpr0Csapol4sGnVRgsurGie
X-Received: by 2002:a05:6a21:6e95:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3cc3f51d911mr1524611637.8.1786499821446;
        Tue, 11 Aug 2026 18:57:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d7a366sm4687587eec.27.2026.08.11.18.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 18:57:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0b6f2990-9ad4-4977-9b28-287f6dd65911@roeck-us.net>
Date: Tue, 11 Aug 2026 18:56:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
To: rahlquist <rahlquist@gmail.com>, linux-hwmon@vger.kernel.org
Cc: sergiomelas@gmail.com
References: <20260812003234.93924-1-rahlquist@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260812003234.93924-1-rahlquist@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/26 17:32, rahlquist wrote:
> The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at different ACPI paths from the generic Yoga configuration. Add a model-specific two-fan configuration for the PC00.LPCB.EC0 namespace and document the corrected mapping.
> 
> Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the patched module registers fan1_input and fan2_input, both reporting 1800 RPM at idle.
> 
> Signed-off-by: rahlquist <rahlquist@gmail.com>

checkpatch says:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#95:
The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at different ACPI paths from the generic Yoga configuration. Add a model-specific two-fan configuration for the PC00.LPCB.EC0 namespace and document the corrected mapping.

WARNING: Block comments use a trailing */ on a separate line
#128: FILE: drivers/hwmon/yogafan.c:75:
+ * 8-bit fan tachometer fields. */

Guenter

> ---
>   Documentation/hwmon/yogafan.rst |  3 ++-
>   drivers/hwmon/yogafan.c         | 17 +++++++++++++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 6876194..cd7206b 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -89,7 +89,8 @@ immediately to ensure the user knows the fan has stopped.
>    ----------------------------------------------------------------------------------------------------
>    82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>    80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
>    82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>    81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
>    82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 605cc92..71b5f81 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -71,6 +71,15 @@ static const struct yogafan_config legion_16bit_dual_cfg = {
>   	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
>   };
>   
> +/* Lenovo Yoga Pro 9 16IMH9 (83DN) uses the PC00 namespace and has two
> + * 8-bit fan tachometer fields. */
> +static const struct yogafan_config yoga_pro_83dn_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 2,
> +	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
> +		   "\\_SB.PC00.LPCB.EC0.FA2S" }
> +};
> +
>   static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>   {
>   	ktime_t now = ktime_get_boottime();
> @@ -170,6 +179,14 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
>   };
>   
>   static const struct dmi_system_id yogafan_quirks[] = {
> +	{
> +		.ident = "Lenovo Yoga Pro 9 16IMH9 (83DN)",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83DN"),
> +		},
> +		.driver_data = (void *)&yoga_pro_83dn_cfg,
> +	},
>   	{
>   		.ident = "Lenovo Yoga",
>   		.matches = {

