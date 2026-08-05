Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0963CB54A
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785966127; cv=none; b=tPPkM0EA0juUBJ8qDQglJg4W/xsJL5XLzL0SMVhVhLShcWQW4pbwn1ftDLayrN35vBYZIVZZZO2CQhrswOqbtp9TcCLVQfvicZKDxUN27lTr4+zkp3+XoyEEAvYlZU8YtjwuPLoNlzXtFiBDUHlkZF8q0bTDbLTOJvyokn+vgIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785966127; c=relaxed/simple;
	bh=UEdxgFHaDJNKBQB3v4IKdJLgLLbHZx4uYOHcHD4sF6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XV3KNm0s15OIy6hUQoNNHQqzbxDiXeWbbyeO0QyqtyUlPTAS6ygrMcFLf/bV5rLJf2usu+OVFeFbNi5Nus4raAfWlCNI9vNry+0aUEdg18LeGltTep0dp/hEpBjmYREXIv4vPLIl6t7fM5vClD1rogPwCmyD+nrMu01XbY4d3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSh7RZNM; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSh7RZNM"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca913a601fbso1361838a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785966124; x=1786570924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKNXnrSf7XFgFMgEWu28ZKKeVW2ZG44XXk+QUa50qJQ=;
        b=jSh7RZNMySlyNGe4QlWny1cG+YFnSR2m0nbqg8OGkD43wUM3xjbpsqqyh6e7ftdjXQ
         UYFl8f+b70iEMXXeDnjYxeBFEEpB6sTX47Bpsl1F7TfrpLR+cUMtDQT0jmcWwu76KbLA
         HD40p6CI042HniqbxqXCOWnbKCb5vtqwmy8s4gvR5Ci99nTjufbfGgU59mRYJ9Wf6PJL
         eizAJvXiOXsHxGPIQhOwIQUoZJclJ45WYq4pPdOLmCoUlCLZ/OjCdIMIbfhFSDqLPfbA
         ySdYsb3tu127PltSNG7xXdD4slUhtNvm7JNqEyUVHgoIEFvFsjnkGiy9R7b10GpSRMA3
         D52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785966124; x=1786570924;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pKNXnrSf7XFgFMgEWu28ZKKeVW2ZG44XXk+QUa50qJQ=;
        b=ggptoQ1xvtbyK+KBKmHE2GmIwlVM5CrLRJ1nlnwvtCntc6YcS7DZbpAVRnVGfXhjM6
         sAqEsf+JJAUIa/i3vvdIuBniZjxXAW1Z7s0/rkSS2MdTbQqXwBBLGFu8nh9MjXX41fIG
         uqkUHoBMMJnaVY0kzFOALjgNUEKpgTUbuq0viQGVUNeFfxGH2XFgMFKAOTZU2j8Xm0mP
         xU3WPfPTjebrCkz2zGSVon+nHGKslfF5slbMkHySJbnYr84uCkP0a3LrEF+PXgVbO97z
         C2MUYRtMeqjCLiLYoq5dpzUYLCX7ikPv61ontL0/053sI7tRL8ZV5Pv/NXmb5yiFtvZy
         w+aA==
X-Gm-Message-State: AOJu0Yzgpn9DX/KUYJhFJrZHswNW/Nq05uwwIz92osgurdXqw2YwAUxV
	W4XqYg6mlin5rFXElX65opzcGmHm/vqF4uuz03I822b1OiQpFlZl1qiPM5vqQQ==
X-Gm-Gg: AR+sD12rlzmDzEUYlqzGrGwLcjB6WlfCDoSncqSzfchmQe7ptxyWha7TUSYezLWZOL3
	Gi81rMSty9HQ8JnW0QTZjwNlqthjYoBQFN1RM19W/lJmo+vTxEIfwI4Bx+l71sNUVSVDECKc3Nx
	V1HfbwQtFfNm4MSbkr4jNZquV74L580qCNlUKaPoqRSG7epvpQEsplI16DuFh8P9PAKJ8gW7Yyw
	6ydskDcfSJAFlEZ10zNDQCBxhptX20czZL727E0rkYguZMp9kA4/bZArOMK5cKomPmV7oxt+HWk
	QURuV5Qle5FGVmF35Kx9E3dn5S0qoDgLDfCY4XtwRZy6DfEjm7itwxxGdy6c36Do+zzvDJxKpMl
	9UO4ey8stOzKWj3tUgiKD3ehcQ1aFWozFEVR8iW+7TkEiH4Xa6w6UPkhZmt8EBpjPuZafUy+B2V
	jFmgiwF9LyUhCn85U4kxk7XBgtuyvRLqxnB58rKyr0ZuMjFp8+boKAlqLQi5BkN6vl9WD5mEVpW
	kgFCQ3luZtI+kh8RAO1y8y/SAGIDfp+kN5Wlw==
X-Received: by 2002:a05:6a21:139a:b0:3bf:82c5:ed13 with SMTP id adf61e73a8af0-3cb860269a0mr12729424637.38.1785966124095;
        Wed, 05 Aug 2026 14:42:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe708be5bdsm2269952a12.15.2026.08.05.14.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 14:42:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <38c35963-9a73-4d79-aada-9975acd07420@roeck-us.net>
Date: Wed, 5 Aug 2026 14:42:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803184206.18465-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260803184206.18465-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/26 11:42, Sergio Melas wrote:
> This driver provides fan speed monitoring for modern Lenovo consumer
> laptops by interfacing with the Embedded Controller (EC) via ACPI.
> 

Wording (imperative mood required). Also, the above (including the subject)
is not what this patch is doing. You are supposed to describe what the patch
does, and why the change is needed, not the driver functionality.

Why is this v12 anyway ? The driver has long since been applied to the
upstream kernel. Keeping the entire history is just confusing and annoying,
and makes it all but impossible to determine if this is really a new
version of a follow-up patch to the upstream driver or a first-time
submission.

> To address low-resolution sampling in Lenovo EC firmware, a Rate-Limited
> Lag (RLLag) filter is implemented. The filter ensures a consistent physical
> curve regardless of userspace polling frequency.
> 
That filter is already implemented and not added here.

> Hardware identification is performed via DMI-based quirk tables, which
> map specific ACPI object paths and register widths (8-bit vs 16-bit)
> deterministically. This patch introduces specific quirks for the Lenovo
> LOQ 15IAX9, IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, Yoga Pro 7 14IAH10,
> and Yoga 7 16ARP8.
> 

The above has little to do with the actual patch, which improves support
for existing models. Again, please describe (in imperative mood) what the
patch is doing and why.

> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Not sure I understand what Sashiko's feedback has to do with this patch.
Maybe it gets confused with the patch description. Feel free to ignore
its feedback (and any change would have to be a separate patch anyway).

Please either drop the whitespace changes, or provide a rationale for making
them. Also, drop the comment enumeration at "Particular first" and "Generic
Family Fallbacks LAST" as well as the "LAST" since that is obvious.

Thanks,
Guenter

> ---
> v12:
>    - Reordered yogafan_quirks table so exact model matches are evaluated
>      before generic family fallbacks, preventing DMI shadowing.
>    - Added support and proper DMI/ACPI mappings for Lenovo LOQ 15IAX9,
>      IdeaPad 3 15ALC6, Legion Pro 7 16AFR10H, Yoga Pro 7 14IAH10, and
>      Yoga 7 16ARP8 (with thanks to community DSDT contributors).
>    - Updated Documentation/hwmon/yogafan.rst reference database and credits.
> v11.1:
>    - Fixed Documentation formatting (0-day robot warnings).
>    - Fixed yogafan.c header comment
> v11:
>    - Mapped ACPI paths directly via DMI quirks.
>    - Fixed Documentation formatting (0-day robot warnings).
>    - Implemented 100ms MIN_SAMPLING to address rapid polling concerns.
>    - Removed redundant platform_set_drvdata() in probe.
>    - Explicitly defined platform device ID as -1 for cleaner sysfs naming.
> v9/10:
>    - Implement ACPI handle resolution during probe for better performance (O(1) read).
>    - Add MODULE_DEVICE_TABLE(dmi, ...) to enable module autoloading.
>    - Refine RLLag filter documentation and suspend/resume logic.
>    - Include comprehensive EC architecture research database (8-bit vs 16-bit).
>    - Validated efficiency on kernels 6.18, 6.19, and 7.0-rc5: 'perf top'
>      confirms negligible CPU overhead (<0.01%) during active polling.
> v8:
>    - Replaced heuristic multiplier with deterministic DMI Quirk Table.
>    - Added 'depends on DMI' to Kconfig.
>    - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardware traces.
>    - Increased filter precision to 12-bit fixed-point.
> v7:
>    - Fixed Kconfig: Removed non-existent 'select MATH64'.
>    - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an
>      immediate 0-RPM bypass in the filter.
>    - Clarification: Previous "unified structure" comment meant that all
>      6 files (driver, docs, metadata) are now in this single atomic patch.
> v6:
>    - Unified patch structure (6 files changed).
>    - Verified FOPTD (First-Order Plus Time Delay) model against hardware
>        traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
>    - Fixed a rounding stall: added a +/- 1 RPM floor to the step calculation
>      to ensure convergence even at high polling frequencies.
>    - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
>    - Documentation: Updated to clarify 100-RPM hardware step resolution.
>    - 32-bit safety: Implemented div64_s64 for coefficient precision.
> v5:
>    - Fixed 32-bit build failures by using div64_s64 for 64-bit division.
>    - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.).
>    - Fixed filter stall by ensuring a minimum slew limit (limit = 1).
>    - Refined RPM floor logic to trigger only when hardware reports 0 RPM.
>    - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
> v4:
>    - Rebased on groeck/hwmon-next branch for clean application.
>    - Corrected alphabetical sorting in Kconfig and Makefile.
>    - Technical Validation & FOPTD Verification:
>      - Implemented RLLag (Rate-Limited Lag) first-order modeling.
>      - Used 10-bit fixed-point math for alpha calculation to avoid
>        floating point overhead in the kernel.
>      - Added 5000ms filter reset for resume/long-polling sanitation.
> v3:
>    - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
>    - Fixed integer overflow in filter math.
>    - Added support for secondary fan paths (FA2S) for Legion laptops.
> v2:
>    - Migrated from background worker to passive multirate filtering.
>    - Implemented dt-based scaling to maximize CPU sleep states.
>    - Restricted driver to Lenovo hardware via DMI matching.
> v1:
>    - Initial submission with basic ACPI fan path support.
> ---
> ---
>   Documentation/hwmon/yogafan.rst | 27 ++++++++++++-
>   drivers/hwmon/yogafan.c         | 71 +++++++++++++++++++++++++++++----
>   2 files changed, 89 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 68761947a..6395c94f4 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -99,6 +99,11 @@ immediately to ensure the user knows the fan has stopped.
>    82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
>    83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
>    81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 83KF           | XiaoXinPro 13ARE | 0x06/0xFE | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> + 82KU           | IdeaPad 3 15ALC6 | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> + 83RU           | Legion Pro 7 16  | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
> + 83KF           | Yoga Pro 7 14IAH | 0x06      | \_SB.PC00.LPCB.EC0.FANS        |  8-bit | 100
> + 83BS           | Yoga 7 16ARP8    | 0x03/0x06 | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
>    *Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
>    ----------------------------------------------------------------------------------------------------
>   
> @@ -117,7 +122,6 @@ METHODOLOGY & IDENTIFICATION:
>      - 8-bit (Multiplier 100): Standard for Yoga/IdeaPad. Raw values (0-255).
>      - 16-bit (Multiplier 1): Standard for Legion/LOQ. Two registers (0xFE/0xFF).
>   
> -
>   References
>   ----------
>   
> @@ -136,3 +140,24 @@ References
>   4. **Lenovo IdeaPad Laptop Driver:** Reference for DMI-based hardware
>      feature gating in Lenovo laptops.
>      https://github.com/torvalds/linux/blob/master/drivers/platform/x86/lenovo/ideapad-laptop.c
> +
> +5. **Lenovo Product Specifications Reference (PSREF):** Official hardware layout index
> +   and spec sheets for active and withdrawn Lenovo laptop models.
> +   https://psref.lenovo.com/l/withdrawn/
> +
> +6. **Yogafan Master Quirk Database:** Master spreadsheet mapping Lenovo Product
> +   Specifications Reference (PSREF) to explicit EC offsets, register widths, paths, and multipliers.
> +   https://github.com/sergiomelas/lenovo-linux-drivers/blob/main/Lenovo_Drivers/Prototype/PSREF/yogafan_v3_quirks_database.ods
> +
> +7. **Yogafan ACPI DSDT Repository:** Central repository containing user-contributed raw
> +   and decompiled ACPI DSDT firmware dumps used for path verification and hardware expansions.
> +   https://github.com/sergiomelas/lenovo-linux-drivers/tree/main/Lenovo_Drivers/Prototype/DSDT
> +
> +Contributors & DSDT Providers:
> +------------------------------
> +- **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
> +- **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
> +- **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
> +- **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
> +- **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
> +- **Splarkszter** (Yoga 7 16ARP8 - 83BS)
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 0a41b8672..371e35895 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -53,6 +53,7 @@ struct yoga_fan_data {
>   };
>   
>   /* Specific configurations mapped via DMI */
> +
>   static const struct yogafan_config yoga_8bit_fans_cfg = {
>   	.multiplier = 100,
>   	.fan_count = 1,
> @@ -77,6 +78,18 @@ static const struct yogafan_config loq_15iax9_8bit_dual_cfg = {
>   	.paths = { "\\_SB.PC00.LPCB.EC0.FA1S", "\\_SB.PC00.LPCB.EC0.FA2S" }
>   };
>   
> +static const struct yogafan_config xiaoxin_8bit_dual_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 2,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
> +};
> +
> +static const struct yogafan_config yoga_pro_7_14iah10_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 1,
> +	.paths = { "\\_SB.PC00.LPCB.EC0.FANS", NULL }
> +};
> +
>   static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>   {
>   	ktime_t now = ktime_get_boottime();
> @@ -176,6 +189,56 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
>   };
>   
>   static const struct dmi_system_id yogafan_quirks[] = {
> +	/* 1. Particular first  */
> +	{
> +		.ident = "Lenovo LOQ 15IAX9",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ 15IAX9"),
> +		},
> +		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
> +	},
> +	{
> +		.ident = "Lenovo XiaoXin Pro 13ARE 2020",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "XiaoXinPro-13ARE 2020"),
> +		},
> +		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
> +	},
> +	{
> +		.ident = "Lenovo IdeaPad 3 15ALC6",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6"),
> +		},
> +		.driver_data = (void *)&ideapad_8bit_fan0_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Legion Pro 7 16AFR10H",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion Pro 7 16AFR10H"),
> +		},
> +		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga Pro 7 14IAH10",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga Pro 7 14IAH10"),
> +		},
> +		.driver_data = (void *)&yoga_pro_7_14iah10_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga 7 16ARP8",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 7 16ARP8"),
> +		},
> +		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
> +	},
> +	/* 2. Generic Family Fallbacks LAST */
>   	{
>   		.ident = "Lenovo Yoga",
>   		.matches = {
> @@ -200,14 +263,6 @@ static const struct dmi_system_id yogafan_quirks[] = {
>   		},
>   		.driver_data = (void *)&ideapad_8bit_fan0_cfg,
>   	},
> -	{
> -		.ident = "Lenovo LOQ 15IAX9",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ 15IAX9"),
> -		},
> -		.driver_data = (void *)&loq_15iax9_8bit_dual_cfg,
> -	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(dmi, yogafan_quirks);

