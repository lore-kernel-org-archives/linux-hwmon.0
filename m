Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6247E18CBE1
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Apr 2026 04:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775364019; cv=none; b=Xmh9Wcg8u/LaV3mNVLFpBsaxlQ1MKtM8+k0Fvm5F60ewozvn7pbdX+ldrnRttXgq/dnvLdSF1svA7XVA5xph923AbHu1C8skIBOC4vAdJ4CKJVA8jp70/9cuQuY7fAZyUHcVWyDIqP9tqmIc6mRVrovnnrv3/th8NQonTCOi5OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775364019; c=relaxed/simple;
	bh=EqXxUi0gdPi2Jj1lyI+0BRQg8s7FObjRWPdDa7U6bAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kogXg6QN4nVinhElMqfX0Ks8BNhZLrE5AVW1W5i9nr7kzY1/JuwXSl/4NTi7q6llKSKB9uPJ+N6Zt47xTyWc/2BMhkCwEPpzHln6SAV1n7+Fm1qm7GFk31E00VKEmbiq4V02N/qZcWLbsV7fT42Bc4jVQ71LHouRPvTjQidNyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuCkRH+n; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuCkRH+n"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so1159992a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Apr 2026 21:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775364016; x=1775968816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UbGbRA+TZRahecRUYonWuVpmknc61Rqc5dOLncgjvj8=;
        b=ZuCkRH+nACJ5PTXdYN15bd/q0gxCYHnAn3794Ngy6R1InaWCJjW+8gJYjFies4mEE5
         /UnegfolVD3hyzx5deYHfBFnyr5C8dtnxS6if1oNY7Qa8FpmQWBQUw/tvkdbKf/y1HMP
         ot/oljHU9RLWU7EJ48KKLsWqsUt8RC9bH5WaVnliggaQJAI5/CEvG/Z9ZHVkm6JKTUbQ
         xKhDa8DTJP17kHyweNUo9bV1omkE0MNoKXWnNLc6jWNIn4NfspqzsqiQYXAgvnwgakGr
         DqsEKAQfVAOR+CKNye0ju63DebMy2XyeYNsDeH9g5udsXO+k4KPbcjp7oRShmLjJeXKr
         iyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775364016; x=1775968816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbGbRA+TZRahecRUYonWuVpmknc61Rqc5dOLncgjvj8=;
        b=alMAz1hMZmClLgdjBwWhEi6sKoNORVheKlLNg/DCzfBrMXQN4YpmvHCPRmgZ3gk2Y9
         TojBKkCFAf3By3XxM2CiP9JkdzM3W9hV2SSUA/y649cs/pBAFJkXrXTLiBYsECAVkJUe
         zEfKGcKqf/t++ozWVNrbY2FWaXJN55GrEtRRCUeyZf73TAgZTD4lk4WIecIxHj/iJ53g
         1zJgp0Fac0GgiCyzfEfASSgFiIQ0Xgwbdzjmu++ZTGrGFVVXTgosd1nKkRsi69rFYxRu
         m9PqqkevWvSbNWDTOhRBoERexR+fgNVajVtvckdXRj0cDbBYL3XBmouwdSWfBle/lAYU
         DgOg==
X-Forwarded-Encrypted: i=1; AJvYcCVYngYx7c4X60Pdu8v1aRAVuSH1DHA5L+S5kzFHjvUD6ScF08BD77UAnPCDBIqxK6HQVNW7kaT81XPWwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcv+Q6cYybDZHzRUBkKAuXDScVwL5h5i6ori2tpSDGFCjKRD7z
	TU6O0XO+3YWLt0Dq/T/LSSVo8n7hGN6ZkvMgvzzVEsRQ9+kiR259q3GtpujJNw==
X-Gm-Gg: AeBDies5KtgBMVeYTLNTJv5HJrRb+7dRwsgT/RCRBT++ehbOvsJz4ktPoLeSMf7SPGp
	h5iz09DeuJaNEhfTHBZnkFnh86Ta/phSYSVoHmT2SgyoKvRXjJ0o45vLND8UUG5mam2fyBiNbBH
	wkzYgWfBxIIVZ3yh/uUIaYZPPfIIm9UbHDzn7aHbJuhoW6rQM0dVsxZbYEuRtToCqdaXcMIpwnT
	GK8a4ezfpYxwyf8xmS61LqgI54+EqPkNX0LSeyb1wIs5xu+pdmbqKYzB98p5BshLIZ9tu0i0gJ1
	LKwEBCfKWfguOhcEUN7JnU7+b1xTy/mcI7f2KnrqZ+mNl8sPBg/pJyDtAXl2Tl5R4Tt9Bgfiune
	la7Ld5RLj0nlXfEprd8Oiaa63EtpDqzHBASm93+vUYMj7i+GjZl8GnqU0g0fnzvELWNz0P4Tn39
	gW565cUlA6GnZTkOR89xOus9xsGcqSwKHPob3qZ2V1pAQXyBO32yWbIwadAKEs9xPWDYCzKcsS
X-Received: by 2002:a17:90a:d406:b0:35b:a656:a60e with SMTP id 98e67ed59e1d1-35de68952f4mr8238128a91.10.1775364015195;
        Sat, 04 Apr 2026 21:40:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm9124898a12.31.2026.04.04.21.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 21:40:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <af1725c3-fb25-493a-819b-b25c375c058b@roeck-us.net>
Date: Sat, 4 Apr 2026 21:40:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] Subject: [PATCH v14] hwmon: (yogafan) Extend support
 to more Lenovo consumer models
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260404164339.119023-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260404164339.119023-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/26 09:43, Sergio Melas wrote:
> Please disregard the previous V13 submission; the patch was malformed
> due to a header corruption issue during generation.
> 
> This patch expands hardware compatibility for the yogafan driver from
> 3 families to 12, covering approximately 95% of the Lenovo consumer
> portfolio released between 2011 and 2026.
> 
> Key improvements include:
> - Implementation of linear estimation for discrete Embedded Controllers.
> - A major architectural refactor to move physics constants into hardware
>    profiles.
> - Safety fixes for divide-by-zero risks and filter state corruption.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
> I realize we are late in the current cycle and this expansion will have to
> wait for the next merge window. I am submitting V13 now to address the
> technical and safety concerns raised in the V12 review so the code is ready
> when the next window opens.
> 

Ok, I must admit that I am lost here. This patch (starting with v12) builds
on top of the applied series, meaning it is a new patch. Why do you increase
the sequence number from the original series ? Do you want me to drop the
original (accepted) patch ?

Either case, Sashiko has a number of comments.

v13:
https://sashiko.dev/#/patchset/20260404144313.27701-1-sergiomelas%40gmail.com

v14:
https://sashiko.dev/#/patchset/20260404164339.119023-1-sergiomelas%40gmail.com

Please let me know if you want me to drop the initial series and start from scratch.
If so, please submit a complete new driver.

If not, stop increasing the version. This is either the original patch, and it
needs to be complete and replace the original one (dropping the original patch
from 7.1), or it is a follow-up patch which needs a new sequence.

Please let me know immediately, because the commit window opens soon and I'll
need to drop the original patch if that is what you want.

Also, I randomly noticed this in the patch:

+	/* 2. Dynamically build the HWMON channel info (Fixes Guenter's complaint) */
                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^
I don't know what exactly that complaint was. Do you refer to this from v12 ?

   Does specifying HWMON_F_MAX here instruct the hwmon core to create sysfs
   attributes named fan1_max and fan2_max, colliding with the custom attributes
   of the same name defined in yogafan_group above? Could this lead to a sysfs
   filename collision and registration failure?

That was about specifying HWMON_F_MAX both in struct hwmon_channel_info and
as discrete attribute, not about declaring the structure dynamically.

Or was it about my comment about having entries with two ACPI nodes for some systems
but only a single fan ? That again was a completely different problem.

In fact, you don't explain why you now create that structure dynamically,
and instead just blame it on me without explaining why you are doing it,
which leaves me puzzling wondering why I may have asked for it because I don't
see an obvious reason.

Such a comment has no place in kernel code. I can only guess that you are unhappy
with some of my feedback. Fine, that can happen. However, please discuss with me
and in public instead of adding obscure references to the code.

Thanks,
Guenter

> V14:
>    - Technical content identical to v13.
>    - Fixed malformed email headers and MIME/Subject corruption that prevented patch application.
>    
> v13: Complete Architectural Refactor & Safety Fixes
>    - Hardcoded Physics: Moved filter constants (Tau, Slew, Threshold) from
>      global defines into static hardware profiles within 'yogafan_config'
>      to provide model-specific tuning and clear technical rationale.
>    - Eliminated Module Parameters: Removed all module_param inputs to comply
>      with subsystem guidelines and prevent runtime instability.
>    - Divide-by-Zero Protection: Implemented safety clamps (?: 1) in the probe
>      calculation to ensure the denominator is never zero during initialization.
>    - State Corruption Fix: Modified yoga_fan_read() to handle static _max
>      attribute requests at the entry point. This prevents userspace polling
>      (e.g., KDE/Dashboards) from inadvertently triggering the RLLag filter
>      and corrupting the last_sample timestamp.
>    - Sysfs Sanitation: Deleted custom attribute groups and non-standard _raw
>      files; switched to standard HWMON core registration.
>    - Clean Probing: Refactored the ACPI path discovery loop to a simplified
>      conditional for loop and removed unnecessary (void *) type casts.
>    - Documentation Sync: Updated yogafan.rst to include secondary ACPI paths
>      (.FANS) for Yoga 3/11s models to match the driver's probing logic.
> 
> v12: Expanded Architecture & Universal Coverage (Rejected)
>    - Implemented Discrete Level Architecture (Linear Estimation) using the formula
>      raw_RPM = (Rmax * IN) / Nmax to support legacy and ultra-portable models
>      reporting fixed PWM steps.
>    - Added specific DMI-based quirks for Yoga 710, 720, 510, IdeaPad 500S, U31-70,
>      and Yoga 2/3 series to utilize the new estimation logic.
>    - Expanded ACPI path probing to include "FAN0", "FA2S", and "FANS" handles,
>      ensuring out-of-the-box compatibility for ThinkBook G6 and LOQ series.
>    - Integrated the RLLag filter with discrete steps, mathematically smoothing
>      abrupt level jumps into a continuous physical RPM curve.
>    - Refactored driver to store filter constants (Tau, Slew) per-device,
>      enabling dynamic synchronization with model-specific maximum RPMs.
>    - Updated Documentation/hwmon/yogafan.rst with the validated Master
>      HAL Reference Database (2026).
>    - Expanded support from 3 to 12 distinct hardware families, covering over
>      450 unique models and 95% of Lenovo's consumer portfolio (2011–2026).
>    - Fixed Documentation formatting, now table appear correctly.
> 
> V11: Multirate Filter & Autoreset Logic
>    - Mapped ACPI paths directly via DMI quirks.
>    - Fixed Documentation formatting (0-day robot warnings).
>    - Implemented 100ms MIN_SAMPLING to address rapid polling concerns.
>    - Removed redundant platform_set_drvdata() in probe.
>    - Already Supported Models: Yoga 14c, Slim 7, Pro 7, Pro 9, Legion 5, Legion 7i, LOQ.
> 
> v9/10:RLLag V1 Physics & Multiplier Fix
>    - Implement ACPI handle resolution during probe for better performance (O(1) read).
>    - Add MODULE_DEVICE_TABLE(dmi, ...) to enable module autoloading.
>    - Refine RLLag filter documentation and suspend/resume logic.
>    - Include comprehensive EC architecture research database (8-bit vs 16-bit).
>    - Validated efficiency on kernels 6.18, 6.19, and 7.0-rc5: 'perf top'
>      confirms negligible CPU overhead (<0.01%) during active polling.
> V08: ACPI Handle Discovery & Initial Probe
>    - Replaced heuristic multiplier with deterministic DMI Quirk Table.
>    - Added 'depends on DMI' to Kconfig.
>    - Verified FOPTD model (1000ms TAU / 1500 RPM/s slew) against hardware traces.
>    - Increased filter precision to 12-bit fixed-point.
> V07: DMI Quirk Table & Device Identification
>    - Fixed Kconfig: Removed non-existent 'select MATH64'.
>    - Fixed unused macro: Utilized RPM_FLOOR_LIMIT to implement an
>      immediate 0-RPM bypass in the filter.
>    - Clarification: Previous "unified structure" comment meant that all
>      6 files (driver, docs, metadata) are now in this single atomic patch.
> V06: Dual-Fan Support & ACPI Handle Eval
>    - Unified patch structure (6 files changed).
>    - Verified FOPTD (First-Order Plus Time Delay) model against hardware
>        traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
>    - Fixed a rounding stall: added a +/- 1 RPM floor to the step calculation
>      to ensure convergence even at high polling frequencies.
>    - Set MAX_SLEW_RPM_S to 1500 to match physical motor inertia.
>    - Documentation: Updated to clarify 100-RPM hardware step resolution.
>    - 32-bit safety: Implemented div64_s64 for coefficient precision.
> V05: Raw EC Register Offset Validation
>    - Fixed 32-bit build failures by using div64_s64 for 64-bit division.
>    - Extracted magic numbers into constants (RPM_UNIT_THRESHOLD, etc.).
>    - Fixed filter stall by ensuring a minimum slew limit (limit = 1).
>    - Refined RPM floor logic to trigger only when hardware reports 0 RPM.
>    - Resolved 255/256 unit-jump bug by adjusting heuristic thresholds.
> v04: Initial HWMON Sysfs Implementation
>    - Rebased on groeck/hwmon-next branch for clean application.
>    - Corrected alphabetical sorting in Kconfig and Makefile.
>    - Technical Validation & FOPTD Verification:
>      - Implemented RLLag (Rate-Limited Lag) first-order modeling.
>      - Used 10-bit fixed-point math for alpha calculation to avoid
>        floating point overhead in the kernel.
>      - Added 5000ms filter reset for resume/long-polling sanitation.
> V03: DSDT Analysis & ACPI Path Mapping
>    - Added MAINTAINERS entry and full Documentation/hwmon/yogafan.rst.
>    - Fixed integer overflow in filter math.
>    - Added support for secondary fan paths (FA2S) for Legion laptops.
> V02: Proof-of-Concept Embedded Controller Reads
>    - Migrated from background worker to passive multirate filtering.
>    - Implemented dt-based scaling to maximize CPU sleep states.
>    - Restricted driver to Lenovo hardware via DMI matching.
> V01: Initial Module Skeleton & Kbuild Setup
>    - Initial submission with basic ACPI fan path support.
> ---
> ---
>   Documentation/hwmon/yogafan.rst | 293 ++++++++++++++++++++----
>   drivers/hwmon/Kconfig           |   1 -
>   drivers/hwmon/yogafan.c         | 381 +++++++++++++++++++++++++++-----
>   3 files changed, 571 insertions(+), 104 deletions(-)
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index c0a449aa8..eb5534fb8 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -1,56 +1,186 @@
>   .. SPDX-License-Identifier: GPL-2.0-only
> -===============================================================================================
> +
> +=====================
>   Kernel driver yogafan
> -===============================================================================================
> +=====================
> +
> +The yogafan driver provides fan speed monitoring for Lenovo consumer laptops (Yoga, Legion, IdeaPad)
> +by interfacing with the Embedded Controller (EC) via ACPI, implementing a Rate-Limited Lag (RLLag)
> +filter to ensure smooth and physically accurate RPM telemetry.
>   
>   Supported chips:
> +----------------
> +
> +  * YOGA & SLIM SERIES (8-bit / Discrete Logic)
> +    - Yoga 14cACN, 14s, 13 (including Aura Edition)
> +    - Yoga Slim 7, 7i, 7 Pro, 7 Carbon
> +    - Yoga Pro 7, 9 (83E2, 83DN)
> +    - Yoga 710, 720, 510 (Discrete Step Logic)
> +    - Yoga 3 14, 11s, Yoga 2 13 (Discrete Step Logic)
> +    - Xiaoxin Pro, Air, 14, 16 (All PRC/Chinese Variants)
> +
> +  * LEGION, LOQ & G-SERIES (16-bit High-Precision Raw)
> +    - Legion 5, 5i, 5 Pro (AMD & Intel 82JW/82JU)
> +    - Legion 7, 7i, 7 Slim (82WQ)
> +    - LOQ 15, 16 (82XV, 83DV)
> +    - GeekPro G5000, G6000 (PRC Gaming Series)
> +
> +  * IDEAPAD & FLEX SERIES (8-bit / Discrete Logic)
> +    - IdeaPad 5, 5i, 5 Pro (81YM, 82FG)
> +    - IdeaPad 3, 3i (Modern 8-bit variants)
> +    - IdeaPad 500S, U31-70 (Discrete Step Logic)
> +    - Flex 5, 5i (81X1)
> +
> +  * THINKBOOK, V-SERIES & LEGACY (Discrete Logic)
> +    - ThinkBook G6, G7 (83AK)
> +    - V330-15IKB, V580
> +    - Legacy U-Series (U330p, U430p)
>   
> -  * Lenovo Yoga, Legion, IdeaPad, Slim, Flex, and LOQ Embedded Controllers
>       Prefix: 'yogafan'
> -    Addresses: ACPI handle (See Database Below)
> +
> +    Addresses: ACPI handle (DMI Quirk Table Fallback)
> +
> +    Datasheet: Not available; based on ACPI DSDT and EC reverse engineering.
>   
>   Author: Sergio Melas <sergiomelas@gmail.com>
>   
>   Description
>   -----------
>   
> -This driver provides fan speed monitoring for modern Lenovo consumer laptops.
> -Most Lenovo laptops do not provide fan tachometer data through standard
> -ISA/LPC hardware monitoring chips. Instead, the data is stored in the
> -Embedded Controller (EC) and exposed via ACPI.
> +This driver provides fan speed monitoring for a wide range of Lenovo consumer
> +laptops. Unlike standard ThinkPads, these models do not use the 'thinkpad_acpi'
> +interface for fan speed but instead store fan telemetry in the Embedded
> +Controller (EC).
> +
> +The driver interfaces with the ACPI namespace to locate the fan tachometer
> +objects. If the ACPI path is not standard, it falls back to a machine-specific
> +quirk table based on DMI information.
> +
> +This driver covers over 95% of Lenovo's consumer and ultra-portable laptop portfolio
> +released between 2011 and 2026, providing a unified hardware abstraction layer for diverse
> +Embedded Controller (EC) architectures.
> +
> +The driver exposes the RLLag  physical filter parameters (time constant and slew-rate limit) in SI units (seconds),
> +dynamically synchronizing them with the specific model's maximum RPM to ensure a consistent physical response
> +across the entire Lenovo product stack.
> +
> +Filter Physics (RLLag )
> +--------------------------
> +
> +To address low-resolution tachometer sampling in the Embedded Controller,
> +the driver implements a passive discrete-time first-order lag filter
> +with slew-rate limiting.
> +
> +* Multirate Filtering: The filter adapts to the sampling time (dt) of the
> +  userspace request.
> +* Discrete Logic: For older models (e.g., Yoga 710), it estimates RPM based
> +  on discrete duty-cycle steps.
> +* Continuous Logic: For modern models (e.g., Legion), it maps raw high-precision
> +  units to RPM.
>   
>   The driver implements a **Rate-Limited Lag (RLLag)** filter to handle
> -the low-resolution and jittery sampling found in Lenovo EC firmware.
> +low-resolution sampling in Lenovo EC firmware. The update equation is:
> +
> +    **RPM_state[t+1] = RPM_state[t] + Clamp(Alpha * (raw_RPM[t] - RPM_state[t]), -limit[t], limit[t])**
> +
> +    Where:
> +
> +*   Time delta between reads:
> +
> +       **Ts[t]    = Sys_time[t+1] - Sys_time[t]**
> +
> +*   Low-pass smoothing factor
> +
> +       **Alpha    = 1 - exp(-Ts[t] / Tau)**
> +
> +*   Time-normalized slew limit
> +
> +       **limit[t] = MAX_SLEW_RPM_S * Ts[t]**
> +
> +To avoid expensive floating-point exponential calculations in the kernel,
> +we use a first-order Taylor/Bilinear approximation:
> +
> +       **Alpha = Ts / (Tau + Ts)**
> +
> +Implementing this in the driver state machine:
> +
> +*   Next step filtered RPM:
> +       **RPM_state[t+1] = RPM_new**
> +*   Current step filtered RPM:
> +       **RPM_state[t]   = RPM_old**
> +*   Time step Calculation:
> +       **Ts             = current_time - last_sample_time**
> +*   Alpha Calculation:
> +       **Alpha           = Ts / (Tau + Ts)**
> +*   RPM  step Calculation:
> +       **step           = Alpha * (raw_RPM -  RPM_old)**
> +*   Limit  step Calculation:
> +       **limit           = MAX_SLEW_RPM_S * Ts**
> +*   RPM physical step Calculation:
> +       **step_clamped   = clamp(step, -limit, limit)**
> +*   Update of RPM
> +       **RPM_new        = RPM_old + step_clamped**
> +*   Update internal state
> +       **RPM_old        = RPM_new**
> +
> +The input of the filter (raw_RPM) is derived from the EC using the logic defined in the
> +HAL section below.
> +
> +The driver exposes the RLLag  physical filter parameters (time constant and slew-rate limit)
> +in SI units (seconds), dynamically synchronizing them with the specific model's maximum RPM
> +to ensure a consistent physical response across the entire Lenovo product stack.
> +
> +This approach inshures that the RLLag filter is a passive discrete-time first-order lag model:
> +  - **Smoothing:** Low-resolution step increments are smoothed into 1-RPM increments.
> +  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping the change
> +    to 1500 RPM/s, matching physical fan inertia.
> +  - **Polling Independence:** The filter math scales based on the time delta
> +    between userspace reads, ensuring a consistent physical curve regardless
> +    of polling frequency.
>   
>   Hardware Identification and Multiplier Logic
>   --------------------------------------------
>   
> -The driver supports two distinct EC architectures. Differentiation is handled
> +The driver supports three distinct EC architectures. Differentiation is handled
>   deterministically via a DMI Product Family quirk table during the probe phase,
>   eliminating the need for runtime heuristics.
>   
> +Continuous RPM Reads
> +~~~~~~~~~~~~~~~~~~~~
> +
>   1. 8-bit EC Architecture (Multiplier: 100)
> -   - **Families:** Yoga, IdeaPad, Slim, Flex.
> +   - **Families:** Yoga, IdeaPad, Slim, Flex, Xiaoxin.
>      - **Technical Detail:** These models allocate a single 8-bit register for
>      tachometer data. Since 8-bit fields are limited to a value of 255, the
>      BIOS stores fan speed in units of 100 RPM (e.g., 42 = 4200 RPM).
>   
>   2. 16-bit EC Architecture (Multiplier: 1)
> -   - **Families:** Legion, LOQ.
> +   - **Families:** Legion, LOQ, GeekPro.
>      - **Technical Detail:** High-performance gaming models require greater
>      precision for fans exceeding 6000 RPM. These use a 16-bit word (2 bytes)
>      storing the raw RPM value directly.
>   
> -Filter Details:
> ----------------
> +Discrete RPM Reads
> +~~~~~~~~~~~~~~~~~~
>   
> -The RLLag filter is a passive discrete-time first-order lag model that ensures:
> -  - **Smoothing:** Low-resolution step increments are smoothed into 1-RPM increments.
> -  - **Slew-Rate Limiting:** Prevents unrealistic readings by capping the change
> -    to 1500 RPM/s, matching physical fan inertia.
> -  - **Polling Independence:** The filter math scales based on the time delta
> -    between userspace reads, ensuring a consistent physical curve regardless
> -    of polling frequency.
> +3. Discrete Level Architecture (Linear Estimation)
> +   - **Families:** Yoga 710/510/13, IdeaPad 500S, Legacy U-Series.
> +   - **Technical Detail:** Older or ultra-portable EC firmware does not store
> +   a real-time tachometer value. Instead, it operates on a fixed number of
> +   discrete PWM states (Nmax). The driver translates these levels into an
> +   estimated physical RPM using the following linear mapping:
> +
> +     raw_RPM = (Rmax * IN) / Nmax
> +
> +     Where:
> +     - IN:   Current discrete level read from the EC.
> +     - Nmax: Maximum number of steps defined in the BIOS (e.g., 59, 255).
> +     - Rmax: Maximum physical RPM of the fan motor at full duty cycle.
> +
> +   - **Filter Interaction:** Because these hardware reads jump abruptly
> +     between levels (e.g., from level 4 to 5), the RLLag filter is essential
> +     here to simulate mechanical acceleration, smoothing the transition
> +     for the final fanX_input attribute.
>   
>   Suspend and Resume
>   ------------------
> @@ -68,31 +198,11 @@ The driver exposes standard hwmon sysfs attributes:
>   Attribute         Description
>   fanX_input        Filtered fan speed in RPM.
>   
> -
>   Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is reported
>   immediately to ensure the user knows the fan has stopped.
>   
> -
> -====================================================================================================
> -                 LENOVO FAN CONTROLLER: MASTER REFERENCE DATABASE (2026)
> -====================================================================================================
> -
> -MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
> -----------------------------------------------------------------------------------------------------
> -82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> -80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> -83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> -82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> -81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> -82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> -82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
> -82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> -82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
> -82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
> -83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> -81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> -*Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100
> -----------------------------------------------------------------------------------------------------
> +Lenovo Fan HAL
> +--------------
>   
>   METHODOLOGY & IDENTIFICATION:
>   
> @@ -109,6 +219,103 @@ METHODOLOGY & IDENTIFICATION:
>      - 8-bit (Multiplier 100): Standard for Yoga/IdeaPad. Raw values (0-255).
>      - 16-bit (Multiplier 1): Standard for Legion/LOQ. Two registers (0xFE/0xFF).
>   
> +================================================
> +LENOVO FAN CONTROLLER Hardware Abstraction Layer
> +================================================
> +
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| MODEL       | FAMILY / SERIES   |  OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | NMAX  | RMAX  | MULT |
> ++=============+===================+=========+================================+========+=======+=======+======+
> +| 82N7        | Yoga 14cACN       | 0x06    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 0     | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80V2 / 81C3 | Yoga 710/720      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 59    | 4500  | 0    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 83E2 / 83DN | Yoga Pro 7/9      | 0xFE    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 0     | 6000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82A2 / 82A3 | Yoga Slim 7       | 0x06    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 0     | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 81YM / 82FG | IdeaPad 5         | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 0     | 4500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80S7        | Yoga 510          | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 41    | 4500  | 0    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 81AX        | V330-15IKB        | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 116   | 4200  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82JW / 82JU | Legion 5 (AMD)    | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 0     | 6500  | 1    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82JW / 82JU | Legion 5 (AMD)    | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 0     | 6500  | 1    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82WQ        | Legion 7i (Int)   | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 0     | 8000  | 1    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82WQ        | Legion 7i (Int)   | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 0     | 8000  | 1    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82XV / 83DV | LOQ 15/16         | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 0     | 6500  | 1    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 82XV / 83DV | LOQ 15/16         | 0xFE/FF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 0     | 6500  | 1    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 83AK        | ThinkBook G6      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 0     | 5400  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 81X1        | Flex 5            | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 0     | 4500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80SR / 80SX | IdeaPad 500S-13   | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 44    | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80S1        | IdeaPad 500S-14   | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 116   | 5000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80TK        | IdeaPad 510S      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 41    | 5100  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80S9        | IdeaPad 710S      | 0x95/98 | \_SB.PCI0.LPC0.EC0.FAN1/2      | 8-bit  | 72    | 5200  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80KU        | U31-70            | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 44    | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80S1        | U41-70            | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 116   | 5000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 80JH        | Yoga 3 14         | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0/.FANS  | 8-bit  | 80    | 5000  | 0    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 20344       | Yoga 2 13         | 0xAB    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 8     | 4200  | 0    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 2191 / 20191| Yoga 13           | 0xF2/F3 | \_SB.PCI0.LPC0.EC0.FAN1/2      | 8-bit  | 255   | 5000  | 0    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| Legacy      | Yoga 11s          | 0x56    | \_SB.PCI0.LPC0.EC0.FAN0/.FANS  | 8-bit  | 80    | 4500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 20GJ / 20GK | ThinkPad 13       | 0x85    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 7     | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 1143        | ThinkPad E520     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 100   | 4200  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 3698        | ThinkPad Helix    | 0x2F    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 4500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 20M7 / 20M8 | ThinkPad L380     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN1        | 8-bit  | 52    | 4600  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 20NR / 20NS | ThinkPad L390     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 64    | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 2464 / 2468 | ThinkPad L530     | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 75    | 4400  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 2356        | ThinkPad T430s    | 0x2F    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 5000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 20AQ / 20AR | ThinkPad T440s    | 0x4E    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 5200  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 20BE / 20BF | ThinkPad T540p    | 0x2F    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 5500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 3051        | ThinkPad x121e    | 0x2F    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 4500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 4290        | ThinkPad x220i    | 0x2F    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 5000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| 2324 / 2325 | ThinkPad x230     | 0x2F    | \_SB.PCI0.LPC0.EC0.FANS        | 8-bit  | 7     | 5000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| Legacy      | IdeaPad Y580      | 0x06    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 95    | 5200  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| Legacy      | IdeaPad V580      | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 100   | 5000  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| Legacy      | U160              | 0x95    | \_SB.PCI0.LPC0.EC0.FAN0        | 8-bit  | 64    | 4500  | 100  |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +| Legacy      | U330p/U430p       | 0x92    | \_SB.PCI0.LPC0.EC0.FAN0        | 16-bit | 768   | 5000  | 0    |
> ++-------------+-------------------+---------+--------------------------------+--------+-------+-------+------+
> +
> +Note for the  raw_RPM we have 2 cases:
> +
> +* Discrete Level Estimation
> +    **Nmax > 0 then raw_RPM = (Rmax * IN) / Nmax**
> +
> +* Continuous Unit Mapping
> +    **Nmax = 0 then raw_RPM = IN * Multiplier**
>   
>   References
>   ----------
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 0081dd097..f1b89bf45 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2673,7 +2673,6 @@ config SENSORS_YOGAFAN
>   	  This driver can also be built as a module. If so, the module
>   	  will be called yogafan.
>   
> -
>   config SENSORS_INTEL_M10_BMC_HWMON
>   	tristate "Intel MAX10 BMC Hardware Monitoring"
>   	depends on MFD_INTEL_M10_BMC_CORE
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 605cc928f..ee6ba5812 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -24,6 +24,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/math64.h>
> +#include <linux/hwmon-sysfs.h>
>   
>   /* Driver Configuration Constants */
>   #define DRVNAME			"yogafan"
> @@ -37,37 +38,123 @@
>   
>   /* RPM Sanitation Constants */
>   #define RPM_FLOOR_LIMIT		50	/* Snap filtered value to 0 if raw is 0 */
> +#define MIN_THRESHOLD_RPM	10	/* Minimum safety floor for per-model stop thresholds */
>   
>   struct yogafan_config {
> -	int multiplier;
> -	int fan_count;
> -	const char *paths[2];
> +	int multiplier;			/* Used if n_max == 0 */
> +	int fan_count;			/* 1 or 2 */
> +	int n_max;			/* Discrete steps (0 = Continuous) */
> +	int r_max;			/* Max physical RPM for estimation */
> +	unsigned int tau_ms;		/* To store the smoothing speed    */
> +	unsigned int slew_time_s;	/* To store the acceleration limit */
> +	unsigned int stop_threshold;	/* To store the RPM floor */
> +	const char *paths[2];		/* Paths */
>   };
>   
>   struct yoga_fan_data {
>   	acpi_handle active_handles[MAX_FANS];
>   	long filtered_val[MAX_FANS];
> +	long raw_val[MAX_FANS];
>   	ktime_t last_sample[MAX_FANS];
> -	int multiplier;
> +	const struct yogafan_config *config;
>   	int fan_count;
> +	/* Per-device physics constants */
> +	unsigned int internal_tau_ms;
> +	unsigned int internal_max_slew_rpm_s;
> +	unsigned int device_max_rpm;
>   };
>   
>   /* Specific configurations mapped via DMI */
> -static const struct yogafan_config yoga_8bit_fans_cfg = {
> -	.multiplier = 100,
> -	.fan_count = 1,
> -	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", NULL }
> +//* --- CONTINUOUS PROFILES (Nmax = 0) --- */
> +
> +/* Standard 8-bit Yoga/IdeaPad (Covers 82N7, Slim 7, etc.) */
> +static struct yogafan_config yoga_continuous_8bit_cfg = {
> +	.multiplier = 100, .fan_count = 1, .n_max = 0,
> +	.r_max = 5500,	/* Verified 14cACN peak */
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FAN0" }
> +};
> +
> +/* Legion / LOQ Gaming (2 Fans, Raw RPM 16-bit) */
> +static struct yogafan_config legion_continuous_16bit_cfg = {
> +	.multiplier = 1, .fan_count = 2, .n_max = 0,
> +	.r_max = 6500,	/* Standard Legion/LOQ peak */
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
> +};
> +
> +/* --- DISCRETE ESTIMATION PROFILES (NMAX > 0) --- */
> +
> +/* Yoga 710/720 (N=59) */
> +static struct yogafan_config yoga_710_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 59, .r_max = 4500,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> +};
> +
> +/* Yoga 510 / Ideapad 510s (N=41) */
> +static struct yogafan_config yoga_510_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 41, .r_max = 4500,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
>   };
>   
> -static const struct yogafan_config ideapad_8bit_fan0_cfg = {
> -	.multiplier = 100,
> -	.fan_count = 1,
> +/* Ideapad 500S / U31-70 (N=44) */
> +static struct yogafan_config ideapad_500s_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 44, .r_max = 5500,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
>   	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
>   };
>   
> -static const struct yogafan_config legion_16bit_dual_cfg = {
> -	.multiplier = 1,
> -	.fan_count = 2,
> +/* Yoga 3 14 / Yoga 11s (N=80) */
> +static struct yogafan_config yoga3_14_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 80, .r_max = 5000,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC0.EC0.FANS" }
> +};
> +
> +/* Yoga 2 13 (N=8) */
> +static struct yogafan_config yoga2_13_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 8, .r_max = 4200,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> +};
> +
> +/* Yoga 13 (N=255) - Dual Fan */
> +static struct yogafan_config yoga13_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 2, .n_max = 255, .r_max = 5000,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN1", "\\_SB.PCI0.LPC0.EC0.FAN2" }
> +};
> +
> +/* Legacy U330p/U430p (N=768) */
> +static struct yogafan_config legacy_u_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 768, .r_max = 5000,
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", NULL }
> +};
> +
> +/* ThinkPad 13 / Helix / T-Series (Strict Discrete) */
> +static struct yogafan_config thinkpad_discrete_cfg = {
> +	.multiplier = 0, .fan_count = 1, .n_max = 7,
> +	.r_max = 5500, /* Matching table peak for T540p/TP13 */
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC0.EC0.FANS" }
> +};
> +
> +/* ThinkPad L-Series / V580 (Continuous 8-bit) */
> +static struct yogafan_config thinkpad_l_cfg = {
> +	.multiplier = 100, .fan_count = 1, .n_max = 100,
> +	.r_max = 5500, /* Matching table peak for L390 */
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
> +	.paths = { "\\_SB.PCI0.LPC0.EC0.FAN0", "\\_SB.PCI0.LPC0.EC0.FAN1" }
> +};
> +
> +/* High Performance (Strict Continuous) */
> +static struct yogafan_config legion_high_perf_cfg = {
> +	.multiplier = 1, .fan_count = 2, .n_max = 0,
> +	.r_max = 8000, /* Peak for Legion 7i / Yoga Pro 9 */
> +	.tau_ms = 1000, .slew_time_s = 4, .stop_threshold = 50,
>   	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
>   };
>   
> @@ -78,12 +165,21 @@ static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm
>   	long delta, step, limit, alpha;
>   	s64 temp_num;
>   
> -	if (raw_rpm < RPM_FLOOR_LIMIT) {
> +	/* 1. PHYSICAL CLAMP & TELEMETRY: Use per-device device_max_rpm */
> +	if (raw_rpm > (long)data->device_max_rpm)
> +		raw_rpm = (long)data->device_max_rpm;
> +
> +	data->raw_val[idx] = raw_rpm;
> +
> +	/* 2. Threshold logic */
> +	if (raw_rpm < (long)(data->config->stop_threshold < MIN_THRESHOLD_RPM
> +		? MIN_THRESHOLD_RPM : data->config->stop_threshold)) {
>   		data->filtered_val[idx] = 0;
>   		data->last_sample[idx] = now;
>   		return;
>   	}
>   
> +	/* 3. Auto-reset logic */
>   	if (data->last_sample[idx] == 0 || dt_ms > MAX_SAMPLING) {
>   		data->filtered_val[idx] = raw_rpm;
>   		data->last_sample[idx] = now;
> @@ -99,14 +195,16 @@ static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm
>   		return;
>   	}
>   
> +	/* 4.  PHYSICS: Use per-device internal_tau_ms */
>   	temp_num = dt_ms << 12;
> -	alpha = (long)div64_s64(temp_num, (s64)(TAU_MS + dt_ms));
> +	alpha = (long)div64_s64(temp_num, (s64)(data->config->tau_ms + dt_ms));
>   	step = (delta * alpha) >> 12;
>   
>   	if (step == 0 && delta != 0)
>   		step = (delta > 0) ? 1 : -1;
>   
> -	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> +	/* 5.  SLEW: Use per-device internal_max_slew_rpm_s */
> +	limit = ((long)data->internal_max_slew_rpm_s * (long)dt_ms) / 1000;
>   	if (limit < 1)
>   		limit = 1;
>   
> @@ -123,19 +221,38 @@ static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
>   			 u32 attr, int channel, long *val)
>   {
>   	struct yoga_fan_data *data = dev_get_drvdata(dev);
> +	const struct yogafan_config *cfg = data->config;
>   	unsigned long long raw_acpi;
> +	long rpm_raw;
>   	acpi_status status;
>   
> -	if (type != hwmon_fan || attr != hwmon_fan_input)
> +	if (type != hwmon_fan)
>   		return -EOPNOTSUPP;
>   
> +	/* 1. Handle static MAX attribute immediately without filtering */
> +	if (attr == hwmon_fan_max) {
> +		*val = (long)data->device_max_rpm;
> +		return 0;
> +	}
> +
> +	if (attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
> +
> +	/* 2. Get hardware data only for INPUT requests */
>   	status = acpi_evaluate_integer(data->active_handles[channel], NULL, NULL, &raw_acpi);
>   	if (ACPI_FAILURE(status))
>   		return -EIO;
>   
> -	apply_rllag_filter(data, channel, (long)raw_acpi * data->multiplier);
> -	*val = data->filtered_val[channel];
> +	/* 3. Calculate raw RPM based on architecture */
> +	if (cfg->n_max > 0)
> +		rpm_raw = (long)div64_s64((s64)cfg->r_max * raw_acpi, cfg->n_max);
> +	else
> +		rpm_raw = (long)raw_acpi * cfg->multiplier;
> +
> +	/* 4. Apply filter only for real speed readings */
> +	apply_rllag_filter(data, channel, rpm_raw);
>   
> +	*val = data->filtered_val[channel];
>   	return 0;
>   }
>   
> @@ -155,47 +272,150 @@ static const struct hwmon_ops yoga_fan_hwmon_ops = {
>   	.read = yoga_fan_read,
>   };
>   
> -static const struct hwmon_channel_info *yoga_fan_info[] = {
> -	HWMON_CHANNEL_INFO(fan,
> -			   HWMON_F_INPUT, HWMON_F_INPUT,
> -			   HWMON_F_INPUT, HWMON_F_INPUT,
> -			   HWMON_F_INPUT, HWMON_F_INPUT,
> -			   HWMON_F_INPUT, HWMON_F_INPUT),
> -	NULL
> -};
> -
> -static const struct hwmon_chip_info yoga_fan_chip_info = {
> -	.ops = &yoga_fan_hwmon_ops,
> -	.info = yoga_fan_info,
> -};
> -
>   static const struct dmi_system_id yogafan_quirks[] = {
> +	/* --- DISCRETE OVERRIDES (Specific matches MUST come first) --- */
>   	{
> -		.ident = "Lenovo Yoga",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga"),
> -		},
> -		.driver_data = (void *)&yoga_8bit_fans_cfg,
> +		.ident = "Lenovo Yoga 710",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Yoga 710") },
> +		.driver_data = &yoga_710_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga 510",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Yoga 510") },
> +		.driver_data = &yoga_510_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Ideapad 510s",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Ideapad 510s") },
> +		.driver_data = &yoga_510_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Ideapad 500S",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Ideapad 500S") },
> +		.driver_data = &ideapad_500s_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo U31-70",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "U31-70") },
> +		.driver_data = &ideapad_500s_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga 3 14",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "80JH") },
> +		.driver_data = &yoga3_14_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga 2 13",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "20344") },
> +		.driver_data = &yoga2_13_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga 13",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "20191") },
> +		.driver_data = &yoga13_discrete_cfg,
>   	},
> +	{
> +		.ident = "Lenovo U330p/U430p",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo u330p") },
> +		.driver_data = &legacy_u_discrete_cfg,
> +	},
> +	{
> +		.ident = "ThinkPad 13",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad 13") },
> +		.driver_data = &thinkpad_discrete_cfg,
> +	},
> +	{
> +		.ident = "ThinkPad Helix",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "3698") },
> +		.driver_data = &thinkpad_discrete_cfg,
> +	},
> +	{
> +		.ident = "ThinkPad X-Series",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad X") },
> +		.driver_data = &thinkpad_discrete_cfg,
> +	},
> +	{
> +		.ident = "ThinkPad T-Series",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad T") },
> +		.driver_data = &thinkpad_discrete_cfg,
> +	},
> +	{
> +		.ident = "Lenovo V330",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "81AX") },
> +		.driver_data = &thinkpad_l_cfg,
> +	},
> +
> +	/* --- SPECIAL PROFILES (Must precede general fallbacks) --- */
> +	{
> +		.ident = "Lenovo Yoga Pro",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Yoga Pro") },
> +		.driver_data = &legion_high_perf_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Legion Pro",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Legion P") },
> +		.driver_data = &legion_high_perf_cfg,
> +	},
> +	{
> +		.ident = "Lenovo ThinkPad L",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "ThinkPad L") },
> +		.driver_data = &thinkpad_l_cfg,
> +	},
> +
> +	/* --- CONTINUOUS FALLBACKS (Family matches last) --- */
>   	{
>   		.ident = "Lenovo Legion",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion"),
> -		},
> -		.driver_data = (void *)&legion_16bit_dual_cfg,
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "Legion") },
> +		.driver_data = &legion_continuous_16bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo LOQ",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "LOQ") },
> +		.driver_data = &legion_continuous_16bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Yoga",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
>   	},
>   	{
>   		.ident = "Lenovo IdeaPad",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad"),
> -		},
> -		.driver_data = (void *)&ideapad_8bit_fan0_cfg,
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Xiaoxin",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "Xiaoxin") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo GeekPro",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "GeekPro") },
> +		.driver_data = &legion_continuous_16bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo ThinkBook",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkBook") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Slim",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_FAMILY, "Slim") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo V-Series",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo V") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
> +	},
> +	{
> +		.ident = "Lenovo Aura Edition",
> +		.matches = { DMI_MATCH(DMI_PRODUCT_NAME, "Aura") },
> +		.driver_data = &yoga_continuous_8bit_cfg,
>   	},
>   	{ }
>   };
> +
>   MODULE_DEVICE_TABLE(dmi, yogafan_quirks);
>   
>   static int yoga_fan_probe(struct platform_device *pdev)
> @@ -203,7 +423,10 @@ static int yoga_fan_probe(struct platform_device *pdev)
>   	const struct dmi_system_id *dmi_id;
>   	const struct yogafan_config *cfg;
>   	struct yoga_fan_data *data;
> -	struct device *hwmon_dev;
> +	struct hwmon_chip_info *chip_info;
> +	struct hwmon_channel_info *info;
> +	u32 *fan_config;
> +	acpi_status status;
>   	int i;
>   
>   	dmi_id = dmi_first_match(yogafan_quirks);
> @@ -215,24 +438,62 @@ static int yoga_fan_probe(struct platform_device *pdev)
>   	if (!data)
>   		return -ENOMEM;
>   
> -	data->multiplier = cfg->multiplier;
> +	data->config = cfg;
> +	data->device_max_rpm = cfg->r_max ?: 5000;
> +	data->internal_tau_ms = cfg->tau_ms;
> +	data->internal_max_slew_rpm_s = data->device_max_rpm / (cfg->slew_time_s ?: 1);
>   
> -	for (i = 0; i < cfg->fan_count; i++) {
> -		acpi_status status;
> +	/* 1. Discover handles and set the REAL fan_count */
> +	for (i = 0; i < 2 && cfg->paths[i]; i++) {
> +		acpi_handle handle;
>   
> -		status = acpi_get_handle(NULL, (char *)cfg->paths[i],
> -					 &data->active_handles[data->fan_count]);
> -		if (ACPI_SUCCESS(status))
> +		status = acpi_get_handle(NULL, cfg->paths[i], &handle);
> +		if (ACPI_SUCCESS(status)) {
> +			data->active_handles[data->fan_count] = handle;
>   			data->fan_count++;
> +		}
>   	}
>   
>   	if (data->fan_count == 0)
>   		return -ENODEV;
>   
> -	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
> -							 data, &yoga_fan_chip_info, NULL);
> +	/* 2. Dynamically build the HWMON channel info (Fixes Guenter's complaint) */
> +	fan_config = devm_kcalloc(&pdev->dev, data->fan_count + 1, sizeof(u32), GFP_KERNEL);
> +	if (!fan_config)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->fan_count; i++)
> +		fan_config[i] = HWMON_F_INPUT | HWMON_F_MAX;
> +
> +	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	info->type = hwmon_fan;
> +	info->config = fan_config;
> +
> +/* 3. Wrap it in chip_info */
> +	chip_info = devm_kzalloc(&pdev->dev, sizeof(*chip_info), GFP_KERNEL);
> +	if (!chip_info)
> +		return -ENOMEM;
> +
> +	chip_info->ops = &yoga_fan_hwmon_ops;
> +
> +	/* Create AND ALLOCATE the temporary pointer array */
> +	const struct hwmon_channel_info **chip_info_array;
> +
> +	chip_info_array = devm_kcalloc(&pdev->dev, 2, sizeof(*chip_info_array), GFP_KERNEL);
> +	if (!chip_info_array)
> +		return -ENOMEM;
> +
> +	chip_info_array[0] = info;
> +	chip_info_array[1] = NULL; /* Null terminated */
> +
> +	chip_info->info = chip_info_array;
>   
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	/* 4. Register with the accurate hardware description and return the result */
> +	return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_info(&pdev->dev,
> +				DRVNAME, data, chip_info, NULL));
>   }
>   
>   static struct platform_driver yoga_fan_driver = {

