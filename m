Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F7325705
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537273; cv=none; b=AyOAli0k+U4To2TWKYaly3YBXJczzwQ0+VLyp+YHC6m3ssPxoksbu91cBKvlQgU8Tqwusb8JaTGx2kThhVsqATDVZLxRcFQEXcdgwuSf/NHOBebWlJGui0teGnNLwea8JpKLEqadR2l/41uhZNXWhmnCF2zFi8NWTj3yHxlPLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537273; c=relaxed/simple;
	bh=ngAa7exeLB5gDmNghwIR44uqNNxwffiVafjG9Dte/YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyaE2NdNYxtDjDm17WQKMJLp8XED/YIE68Og5zK2iJOyR6mpCkLf0sEMZ3DobruoflxzKc8L27pg5U+e8PRSYrTJwC/aO0+xEgPhQBYRdvcYfkRCXSckqej1n9R1ZK9EuNS3lZ76Ww30Hn/OGT/B0uVrBLZULKyOEhTqCVpFDJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OX/67nQh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OX/67nQh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c613a0ca52dso3165221a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 10:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769537270; x=1770142070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61Q9qvVACFV/Gip0ktst+VombCVJQ9f27Ti9Ba+TeIw=;
        b=OX/67nQhuKJI9w5yYVZG62m+a1uvJgOB4OS6fNgdKEs123mMK4ASovLG0vbYaAMmIf
         qBDAXI4rIoUK9+2dtnhAyCDnCygK1dsz/iaR9xEjaP2zYATetG9j2SqQziNj+lKZxMaD
         mfWwrq2qfSlRippgMxl2t1WoCYIEz3A33XBDGcvK9+ruzTk2RzsQo4O0HUJuOc1/7hs3
         lw+C52o49DuV4WUk05AwJnX17gCxlNAZZO+SMz5qW5qNciZ5LTnij8xz/6AtokD5mmjI
         679an6Ud83CDZp6xZE5RGaDRGMaHsJc7BKSIaMQLPhC7M2F3pwqh/9c1izJfjvVKLrpz
         gWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537270; x=1770142070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=61Q9qvVACFV/Gip0ktst+VombCVJQ9f27Ti9Ba+TeIw=;
        b=ZPvzI+FmhWYE8FWabo0BL4ZB8aTkCRMBRNuPQhYzJg70ZzF3JAtU/P5Q8fqK+nLLNS
         mzsQtARv0ahHJ879rnyL3vtJyNMHOhyBIg0pPJTcPxw8AiJxYB8pUgxrXUcrlxIooPfu
         A9HmXK9W4RJ/4ll2NVVEKaJM5FPIYFKRXtFqt1SABxnpuAmiplESlIkCgbm2em1SMe0D
         glEUrqUp0Y2Y7m9Xok2aoEasEY+fB1v7iYP2wcfPbRE4/yofg3QEzXs3vKhslewRKEVM
         361MBBh1HCricnO1abRevKhGNnGLfyKoOqtApmz6sRqQlhGm58vVdXCwerEfgKye1txQ
         cIhg==
X-Forwarded-Encrypted: i=1; AJvYcCVM78C6aAAMFppcboI0StTMd3qCxF0q0pfldNsSV8UBUVcZmOSp3nWzMUDVzxG5Y3pAQRp9ZLdJ36k9ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9pttTAgayuDuSHRhuAYJn5UrAQsp+ezpRs5SwcFA3u3XV6Yw
	F1ZeK++iCe+VnBi1EBaVINy78DAgXHl6MjE5K92tL2fjiQpS3EsSdr3B
X-Gm-Gg: AZuq6aLhwSxkU/u8pjuigBi7tU+JlxvBTrVLMZYJ0u76pILQsw/n0pw0o57sflgL+Fv
	2H361EQp9PgKfmttvWpAvyKdROU7UIBeEsVh6pegcCzst4rn11WiZx78nddZTwicWPZgUtYvXdW
	/JJRjwJyj9Xnp1OcLHJnZJXeGpEppUtsDX3P68UJQaQiQCcDA2iin8JpC4EYabuS6ZnDJR1V57m
	DTyUblk0/8C4EVakFc48WxDUCktX95SdzAExsgkCWrQJUb6OkgC7Qp0FfAIGqCynrPQWYMgCE8d
	TWgjDFj1wOslJ3yvz8h5wNzXT/T7IG1GAUuTzQV1Cjxx8QI2CUIeIkKHrwAG3TslkHCNXhrzOf/
	ZsPYT7nvaXc+qUSpsEzp3POtVx6NFv3o/tr5X2l6CtzQoDYkPy7UsE098FQvnSL0dZdFjNTP4Qy
	IJ6ndJ8iIOclWKTQc6/sA26ozRNwVZrVbA/10=
X-Received: by 2002:a17:90a:c2cb:b0:352:e796:bb65 with SMTP id 98e67ed59e1d1-353fedae2efmr2325937a91.31.1769537270166;
        Tue, 27 Jan 2026 10:07:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2cb0a7sm134264a91.2.2026.01.27.10.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:07:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 10:07:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wenliang Yan <wenliang202407@163.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] hwmon: (ina3221) Various improvement and add
 support for SQ52210
Message-ID: <956b92bd-950b-44fc-af85-6f76ed60656f@roeck-us.net>
References: <20260119121446.17469-1-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119121446.17469-1-wenliang202407@163.com>

Hi,

On Mon, Jan 19, 2026 at 07:14:38AM -0500, Wenliang Yan wrote:
> Make modifications according to the guidance provided in the reply.
> 
> 1.Modify the description for power[123]_input(PATCH 5).
> 
> 2.Re-annotate the significance of the limit value calculation
> and the use of register masks in the sq52210_alert_limit_write.
> Modify the calculation process to resolve arithmetic overflow issues.
> The limit values SOL, BOL, and BUL are all stored using the upper
> 13 bits of the register, so shifting is required. In contrast,
> the POL value is configured by setting the lower three bits
> to 0 directly(PATCH 6).
> 
> 3.Resolve arithmetic overflow issues in the ina3221_read_power(PATCH 7).
> 
> 4.Resolve arithmetic overflow issues in the ina3221_read_curr,
> and validate channel indices in ina3221_write_in(PATCH 8).
> 

AI review of the series provided the feedback below. Please fix or explain
false positives.

Thanks,
Guenter

---
Analysis of Top 8 Commits in drivers/hwmon/ina3221.c

Commit: a0f07f4a272b hwmon: (ina3221) Modify write/read functions for 'in' and 'curr' attribute
--------------------------------------------------------------------------------------------
Change Categories:
- CHANGE-1: Added read/write support for inX_crit/lcrit/alarm
- CHANGE-2: Added read/write support for currX_lcrit/alarm
- CHANGE-3: Refactored ina3221_write_curr

Regressions/Bugs:
1. MAJOR BUG: In `ina3221_write_curr`, `hwmon_curr_lcrit` passes current value (in mA) directly to `sq52210_alert_limit_write`. `sq52210_alert_limit_write` treats the value as Shunt Voltage (in uV) for `SQ52210_ALERT_SUL` (divides by 5). This fails to account for the shunt resistor value. The alert limit will be incorrect for any shunt resistor other than 1 mOhm.
   Evidence:
   `ina3221_write_curr`: `return sq52210_alert_limit_write(ina, SQ52210_ALERT_SUL, channel, val);`
   `sq52210_alert_limit_write`: `regval = DIV_ROUND_CLOSEST(val, 5) & 0xfff8;`

Commit: ef198f703062 hwmon: (ina3221) Support write/read functions for 'power' attribute
----------------------------------------------------------------------------------------
Change Categories:
- CHANGE-1: Added read/write support for powerX attributes
- CHANGE-2: Updated ina3221_is_visible

Regressions/Bugs:
1. BUG: `ina3221_is_visible` incorrectly enables `hwmon_power_crit` and `hwmon_power_crit_alarm` based solely on `has_alerts`. Standard INA3221 devices have `has_alerts` set to true but do not support power measurement (`has_power` is false). This exposes unsupported power attributes to userspace for INA3221.
   Evidence:
   ```c
   case hwmon_power_crit:
       if (has_alerts)
           return 0644;
       return 0;
   ```

Commit: 61e453283222 hwmon: (ina3221) Support for writing alert limit values and modify the 'ina3221_read_value' function
-------------------------------------------------------------------------------------------------------------------------
Change Categories:
- CHANGE-1: Refactored `ina3221_read_value` to handle SQ52210 registers
- CHANGE-2: Added `sq52210_alert_limit_write`

Regressions/Bugs:
1. CRITICAL BUG: `ina3221_read_value` leaves `*val` uninitialized when reading `SQ52210_ALERT_LIMITx` registers if `ina->alert_type_select` is 0 (default). `ina3221_probe` initializes `alert_type_select` to 0 but does not sync it with the device's `SQ52210_ALERT_CONFIG` register. Reading these attributes before writing them results in returning garbage stack data to userspace.
   Evidence:
   ```c
   switch (reg) {
   ...
   case SQ52210_ALERT_LIMIT3:
       if (ina->alert_type_select & SQ52210_ALERT_ALL_SUL_MASK)
           *val = ...
       else if (...)
           *val = ...
       break;
   }
   return 0;
   ```
   If no mask matches, `*val` is never assigned.

Summary:
Multiple significant regressions found in the series. The logic for SUL (Shunt Under Limit) handling for Current attributes is fundamentally broken regarding unit conversion (mA vs uV) and shunt resistance. Visibility checks for power attributes are too permissive for legacy devices. Uninitialized variable usage in read path poses a stability/correctness risk.
