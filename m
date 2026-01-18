Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16852BB13
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Jan 2026 00:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768696991; cv=none; b=SD10ynFLlNNwiLLMn1rvcV2/dVs5lVLEBLBr/Esepk/FIS/kzucA2B23MbwSZyOxRpHjMUgHq8kJU3Tg8goCCm//2Mpld/O6xLW0RFow7gBY66j658upWe4qlYU5eNo+bQlqBXFvCPRf9ekOk4N4AR8ZNH9HchBD3sDu6feS/GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768696991; c=relaxed/simple;
	bh=8h6crzWe1SV07XPvNQ3YRXAZ1GEXmBh2p8v+I06VDlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q//c92YGWk+VKzHDS61VglYFWWtdUQQmk8gGat9r7LFgyV8u5pCflcMfcYuDJeACt7nwRgLhL2wOsF3Bs5Q9KLa1GliVjj1w/nklrUZ8QlQKDQXWDRtFMLr7xFzgHpo6QxMSebrqUx9PCPwuHOzL2iZQNmXma3eTuLcyPCiCtcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NODlzAbg; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NODlzAbg"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124566b6693so1644237c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 16:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768696989; x=1769301789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6ngnw0Pf7oGksa0zFf7fwqwQCWR+z2Dul3Lwc4iUWxU=;
        b=NODlzAbgkFxp5ANgsWxBx28/6NHgKdXCqLpIkqF1fq/2mxA3RtbNnyD5bC1iBRlfQH
         aM6csNvzBajpoB19gtNHX8wwF3pnIl2WmLsJzljC33RrwX8wO2Aa1UV+XvDm65WPLGdF
         YvPPQsErdfUbo6bUfafAHrEEyuw6yOyoLcJu9LjTxwoQ72fuckY8IVFYoCCy4KkChASP
         maHaBzgLp2Eg8lLYA6BfYfAtybgY8lNckdihLwVwzS+t4LUy/7rJRKuOmDVe5bed6GR3
         SXxalmcfVe4AF2bINxvHQbv/niCGiRzIUL82/e0pOsooAr74ZDb4Wxxu8XvpB6CgKTj+
         lbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768696989; x=1769301789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ngnw0Pf7oGksa0zFf7fwqwQCWR+z2Dul3Lwc4iUWxU=;
        b=q7SQGGwr+pgu8vLYRAWepfkYG1ize6JubDGflB/KZJ4wYttH32lK0mayZzeg87F365
         vXvv9ggmrmC11EILdSkOEU/YGHVJZFoJ7CAlNLYQ0K/2AqWz0ubuUxF9rOTCQGflNHrU
         BGVKqprLsTeXzQYbCBlVP7RTdKzHn5//LLN319ug8pVyE4nUMdEgp1u7dRfTPaDc/7ab
         Bmtg+f7TnRPoA1WnBiO5mXUtWXFFvX/7XC9grX74PcLwaaD2PuPGDKI2CeLEER75sKUg
         NgQP4sT+0ls23L0rlHNyQgYAJjST6ivHonVZtIqfpJLBIs8xBUcIV176DUn0371idlbA
         6QhA==
X-Forwarded-Encrypted: i=1; AJvYcCVvxgkCmsh7T9MC8bxXARgB1SzRklxJ1PEOMS/1pnyQLVM/g1QlxlYCiQQraDgZExBdrKqmlGikEw0s0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUVUPqeM7XUXie4t8VaxquDdA1LyqWB+kxGQpJ4tM53lrc1dVw
	jBWOA6FuUJqo+fSVvFIMJcYdVGY147yC2cxwVWaBjrHROLQUR8wt8WIL
X-Gm-Gg: AY/fxX6q4Swvjp2HsguhyoQ2xJjeNLS/LC11z5n65fWSy5CclkIwbL/5eiz8rOiYLnS
	eHHSmtTeuQqtCpo97fqtZyW5wL+TxrQT5xmN+yuEewHe/F+MQlct8WaiQq16Zs2dbjp1oKuEMMZ
	UMZpRBDXSTyup1pwjP1ZzougsTEejGbcIjWAGdw/h//oLGiGpPc5Db7EIrKn5YY6+s/KmuEClFJ
	C+iQuO7ljFmL0IpLotSsH5OgishdoY/wG2JXd67PuZKKZeVgO04ZkDVbt/pGdoC0SG8pUQ761qb
	S6Vd9IYAS3GFSSp3eET4pFs20gg2RhiFfo7T0TTkb4tG2uPsKJYVLdgwqgisbBnaTAm7EOXurQ7
	gUwdeUjZbeNd0XE/NxwpSUgparc5EW4K5lxxKq3+koV3Y1/Fy8A3tM53i4rr5uoYIobSuKOm2cC
	R1xMd51Qhx2WopaOAki1NaPWDWvpeCJHJ7CZ4zPpsBXn96F5Gey1lmEz2X4JkP+1Z6t46Co04=
X-Received: by 2002:a05:7300:148b:b0:2af:fbb:97cf with SMTP id 5a478bee46e88-2b6b5060894mr7206631eec.43.1768696988783;
        Sat, 17 Jan 2026 16:43:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b365650bsm7603059eec.29.2026.01.17.16.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 16:43:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <db48e680-2386-449f-8882-387e8069c541@roeck-us.net>
Date: Sat, 17 Jan 2026 16:43:06 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 0/8] hwmon: (ina3221) Various improvement and
 add support for SQ52210
To: Wenliang Yan <wenliang202407@163.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260114081741.111340-1-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260114081741.111340-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/14/26 00:17, Wenliang Yan wrote:
> Resending this series.
> 
> 1.Add review information for the binding(PATCH 1).
> 
> 2.Modify the description of the patch(PATCH 2).
> 
> 3.Add initialization for 'alert_type_select'(PATCH 4).
> 
> 4.Add out-of-bounds checks for the array(PATCH 8).
> 
> ---
> v3: https://lore.kernel.org/linux-hwmon/20251120081921.39412-1-wenliang202407@163.com/
> v2: https://lore.kernel.org/linux-hwmon/20251118125148.95603-1-wenliang202407@163.com/
> v1: https://lore.kernel.org/linux-hwmon/20251111080546.32421-1-wenliang202407@163.com/
> 
> Wenliang Yan (8):
>    dt-bindings: hwmon: ti,ina3221: Add SQ52210
>    hwmon: (ina3221) Add support for SQ52210
>    hwmon: (ina3221) Pre-calculate current and power LSB
>    hwmon: (ina3221) Support alert configuration
>    hwmon: (ina3221) Introduce power attribute and alert characteristics
>    hwmon: (ina3221) Support for writing alert limit values and modify the
>      'ina3221_read_value' function
>    hwmon: (ina3221) Support write/read functions for 'power' attribute
>    hwmon: (ina3221) Modify write/read functions for 'in' and 'curr'
>      attribute
> 

I applied the series to the branch and asked to an AI code review.
The applied patches are:

2befc15cc315 (HEAD -> ina3221) hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute
fe1c157ccfb6 hwmon: (ina3221) Support write/read functions for 'power' attribute
12ac733cc62c hwmon: (ina3221) Support for writing alert limit values and modify the 'ina3221_read_value' function
306f47c14733 hwmon: (ina3221) Introduce power attribute and alert characteristics
bd15aff74e6b hwmon: (ina3221) Support alert configuration
5780752da297 hwmon: (ina3221) Pre-calculate current and power LSB
dabf3c279a1f hwmon: (ina3221) Add support for SQ52210

This is the AI feedback:

Review Summary

   The top 7 patches (commits dabf3c279a1f to 2befc15cc315) introduce support for the Silergy SQ52210 chip. While the overall structure follows the project conventions, there are several critical issues that need to be addressed.

   1. Arithmetic Overflows on 32-bit Systems
   Several calculations can overflow a 32-bit long, which is common on many embedded architectures supported by the Linux kernel.

    * `ina3221_read_power` (Patch 2: `fe1c157ccfb6`):

    1     *val = DIV_ROUND_CLOSEST(regval * ina->power_lsb_uW, 1000);
       With a 16-bit regval (up to 65535) and a possible power_lsb_uW of up to 800,000,000 (for a 1µΩ shunt), the product can reach ~52.4e12, significantly exceeding the ~2.1e9 limit of a 32-bit signed long. Even with a standard 10mΩ shunt,
   the product is ~5.2e9, which still overflows.

    * `ina3221_read_curr` (Patch 1: `2befc15cc315`):

    1     *val = DIV_ROUND_CLOSEST(regval * ina->current_lsb_uA, 1000);
       Similar to power, regval * current_lsb_uA can exceed 2^31 if the shunt resistor is small (e.g., < 1mΩ).

    * `sq52210_alert_limit_write` (Patch 3: `12ac733cc62c`):

    1     regval = DIV_ROUND_CLOSEST(val * 1000, ina->current_lsb_uA) & 0xfff8;
    2     ...
    3     regval = DIV_ROUND_CLOSEST(val * 1000, ina->power_lsb_uW) & 0xfff8;
       The val * 1000 operation can overflow if val (in mA or mW) is large. For power, a value above 2.1kW will overflow.

   Recommendation: Use u64 for intermediate products and div_u64 or DIV_S64_ROUND_CLOSEST to ensure 64-bit arithmetic is used where necessary.

   2. Documentation Typo (Patch 4: 306f47c14733)
   In Documentation/hwmon/ina3221.rst:

    1 power[123]_input        Current for channels 1, 2, and 3 respectively
   The description for power[123]_input should be "Power for channels..." instead of "Current".

   3. Missing Channel Validation (Patch 1: 2befc15cc315)
   In ina3221_write_in, there is no check to ensure the channel index is within the valid range for alerts (0-2) before calling sq52210_alert_limit_write.

    1 static int ina3221_write_in(struct device *dev, u32 attr, int channel, long val)
    2 {
    3     ...
    4     case hwmon_in_lcrit:
    5         return sq52210_alert_limit_write(ina, SQ52210_ALERT_BUL, channel, val);
   Since in4_lcrit through in7_lcrit might be visible (due to ina3221_is_visible logic), a user could write to these attributes. sq52210_alert_limit_write then performs channel % INA3221_NUM_CHANNELS, which would cause in4_lcrit (shunt
   voltage) to overwrite the bus voltage alert for in1.

   Recommendation: Add if (channel >= INA3221_NUM_CHANNELS) return -EOPNOTSUPP; to ina3221_write_in for the lcrit and crit attributes.

   4. Incorrect Current Alert Validation (Patch 3: 12ac733cc62c)
   In sq52210_alert_limit_write:

    1 if (item >= ARRAY_SIZE(alert_groups) || val < 0)
    2     return -EINVAL;
   This rejects negative values for all alert types. However, the SQ52210 (and INA3221) supports bi-directional current measurement. A "Shunt Under Limit" (SUL) alert should logically be able to trigger on negative current values if the
   hardware supports it. The subsequent code in the same function even attempts to handle negative values with clamp_val(regval, -32760, 32760).

   Recommendation: Allow negative values for SQ52210_ALERT_SUL.

   5. Inconsistent Register Masking (Patch 3: 12ac733cc62c)
   In sq52210_alert_limit_write, the SUL and POL types apply & 0xfff8 to the register value, but BOL and BUL (Bus Over/Under Limit) do not. If the hardware ignores the lower 3 bits for all limit types on these registers (as the comments
   suggest), this masking should be applied consistently.

I did not verify if the entire feedback is correct, but it does look reasonable.
Please fix or explain why the feedback does not apply.

Thanks,
Guenter

