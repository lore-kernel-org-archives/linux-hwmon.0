Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731721427A
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 00:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774397594; cv=none; b=ZJparcK/vVGU3lRoRZVJ0L6/p4jC7GQv4qtLRDfxZQBWrlg2j5J5BHSJow0gWlg+1cn/hMMIPxaaXvdFwAX8jcD0ibJWHXUmTyoUj3SgYYjxq9IS+MpfKJJRalMT6IA80IFtNaSpTd4nt+ar5uU17e0Xj+++CnKF/tEalJ1OVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774397594; c=relaxed/simple;
	bh=u4CD05kz8wy02T5Vstyx2kSj4MSHJBFwhcwjOm7Crkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gS9/IJYsOVIpS81uMUVvgNrtJoFCBnMQ79gxFYrD/PXNpiccJqsh/PfV2LbFcxm9RLrR5k+5xNyMwuIdlllvJWjHrZ1rECmRWmBUQ5ss+Xc9nlIQxC1tlZ8FZgRnTbRi2sEYnxYLPrdKDfSfZO9mf3aohqaBRk7J9wtGGlWdo1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dj5MrZY/; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dj5MrZY/"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4284849eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 17:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774397591; x=1775002391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9+x6SDY/cv5l6PhbCSMz1KEq25HexNGIncHSrlPLgzI=;
        b=dj5MrZY/8Mot976Dx74yqi25OipRkf5OushGK+UEpWRd4VpFzma/HNhF9G3BY+EpBT
         bZenxicnBoJKe83y3/amYmBw+OnxA9dAK5ofZ9ooMPM78mr7w9uRRd17/IEQtS9ayTmI
         c/q3rsXIWloV8tQMBwQqTB6y1h7rhTaE6/RE/DPdujle2vX7BzXbrW/YnTeCGmCggKXW
         TUuk+jt0ArhR39sTVLMVw9WxiJXLfM3Qw//hjg9IwsjtQBuuGC5088iGS+nM95ExihGb
         hCenKVsQeqnW2BJNiwEs5k02echbB1zvtdwtEFCdjmJcA/tdpPpNzQ6+CP1wH7+16NND
         Mx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774397591; x=1775002391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+x6SDY/cv5l6PhbCSMz1KEq25HexNGIncHSrlPLgzI=;
        b=YRSFLXxLIqQLIe3JvYId/8VT4alQCgFwIQOE/NqS8tiGQQEfb5iHWcm5ayqIiPA8PS
         Zj+K2ERiH1YldmCH35nz1XAxhza+cezFa0R033hiBHi+8S7542oAUBTM9nNDIQe3XbkU
         6gZB8iHqxFyNkWPd/7AXBLWccJCZJL52CJkW18MLu9ZejzAXKNjb0Cbr6PCBZ8EWI4KW
         Dhw3A531lSPsGpYeoqp3fueLQIv3DDtNCbAAGg5jcUT+Gq9EIiebsnNutA5mWSz997hZ
         qt345JKk0BBdfmzvRmjOVcn1xGa6sO4V+IJfj1Nvz1UEv/F38LMOmirgUOhYRYG/WxSx
         0/SA==
X-Forwarded-Encrypted: i=1; AJvYcCXAMjZVj5E1jBEWFlIK5V42un5X+/4Bteag+moPaNJ1NfuTxNiMSX4KF8T9CAz33U0E17lgdeWUjVdc/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9MNBtTNbnuTflnBj0PS8vbo+GVdIpXsp7oG+5f5nZKeEsRZO7
	F8pdyPK1cuKfJdWD0A5Pbrlg14bmxyVcYJomU2r85lrzqwTKFdO/UzXSgJvojg==
X-Gm-Gg: ATEYQzy5Iu84DB1OoQ00srODUIX223G6K/I5EAx3pfzv/g9KAU4FxF153d32glD085x
	2kjbc8x9WthBmyCf/EavCbB75yX5sZjjbOJWJE9nKVhwVkDqHX8WOO6dugQtwDIqdSu/CvYH2u6
	VjwpVT3Dg3KjJYu7Ce+y39Cz8kOqJvpJij6VIFogw0p0IGOhKCuBTWKPzm7V/mHlza+MHqpKa6X
	7aj4SKmGRlO9oEXC2gem8HzPnbDNXDXHYeg3aHJjg/V9fkLsfnIaJC8gzeRjxJYv8dLjNH5xkco
	tmgdvFUIjjAO2xaAwZ3hbKsBmOT+T9+rWueF/5pFxRK1W97V0qbfL8fnsWFxjywzufbeafoc8at
	nEN4pfRYt+/REaCTgWhZVjlRmLIkm6CsUIjXkq5GRer+Mn9TPDa2ZAKmEUjyIjH6//v98z6IBwM
	rDTJYR+5Ws/f6VYjI3wLBnAWRsC6hKpDPMniV5IKDphGjHy38XmAJm+RDMe9Cz3NoXiuVC4M2E
X-Received: by 2002:a05:7301:4196:b0:2be:2f62:8bb6 with SMTP id 5a478bee46e88-2c15d4b0268mr590059eec.30.1774397591311;
        Tue, 24 Mar 2026 17:13:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c15517eaf6sm4434668eec.28.2026.03.24.17.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 17:13:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7ac0d696-327d-4dfe-8ee3-73242255ad32@roeck-us.net>
Date: Tue, 24 Mar 2026 17:13:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5d771a2a-3c82-4d79-8ccd-a67b9d7461e4@roeck-us.net>
 <20260324221008.212753-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260324221008.212753-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/26 15:10, Sergio Melas wrote:
> This driver provides fan speed monitoring for modern Lenovo Yoga,
> Legion, and IdeaPad laptops. It interfaces with the Embedded
> Controller (EC) via ACPI to retrieve tachometer data.
> 
> To address low-resolution sampling in the Lenovo EC firmware, the
> driver implements a Rate-Limited Lag (RLLag) filter using a passive
> discrete-time first-order model. This ensures physical consistency
> of the RPM signal regardless of userspace polling rates.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> 
One more:

https://sashiko.dev/#/patchset/20260324221008.212753-1-sergiomelas%40gmail.com

In short, there is no "MATH64" config symbol, and RPM_FLOOR_LIMIT is unused.

Thanks,
Guenter

> ---
> v6:
>    - Unified patch structure (6 files changed).

Side note: I have no idea what this means ??

>    - Verified FOPTD (First-Order Plus Time Delay) model against hardware
>       traces (Yoga 14c) to ensure physical accuracy of the 1000ms time constant.
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
>    - Implemented RLLag (Rate-Limited Lag) first-order modeling.
>    - Used 10-bit fixed-point math for alpha calculation to avoid
>      floating point overhead in the kernel.
>    - Added 5000ms filter reset for resume/long-polling sanitation.
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
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/yogafan.rst |  48 +++++++
>   MAINTAINERS                     |   8 ++
>   drivers/hwmon/Kconfig           |   9 ++
>   drivers/hwmon/Makefile          |   1 +
>   drivers/hwmon/yogafan.c         | 225 ++++++++++++++++++++++++++++++++
>   6 files changed, 292 insertions(+)
>   create mode 100644 Documentation/hwmon/yogafan.rst
>   create mode 100644 drivers/hwmon/yogafan.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 559c32344cd3..199f35a75282 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -282,4 +282,5 @@ Hardware Monitoring Kernel Drivers
>      xdp710
>      xdpe12284
>      xdpe152c4
> +   yogafan
>      zl6100
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> new file mode 100644
> index 000000000000..e0f2b060aabc
> --- /dev/null
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver yogafan
> +=====================
> +
> +Supported chips:
> +
> +  * Lenovo Yoga, Legion, and IdeaPad Embedded Controllers
> +    Prefix: 'yogafan'
> +    Addresses: ACPI handle (see probe list in driver)
> +
> +Author: Sergio Melas <sergiomelas@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver provides fan speed monitoring for modern Lenovo laptops.
> +Most Lenovo laptops do not provide fan tachometer data through standard
> +ISA/LPC hardware monitoring chips. Instead, the data is stored in the
> +Embedded Controller (EC) and exposed via ACPI.
> +
> +The driver implements a **Rate-Limited Lag (RLLag)** filter to handle
> +the low-resolution and jittery sampling found in Lenovo EC firmware.
> +
> +Filter Details:
> +---------------
> +
> +The RLLag filter is a discrete-time first-order lag model that ensures:
> +  - **Smoothing:** Jittery 1000-RPM step increments are smoothed into 1-RPM increments.
> +  - **Slew-Rate Limiting:** Prevents "teleporting" readings by capping the change
> +    to 1500 RPM/s, matching physical fan inertia.
> +  - **Polling Independence:** The filter math scales based on the time delta
> +    between userspace reads, ensuring the same physical curve regardless
> +    of whether you poll at 1Hz or 1000Hz.
> +
> +Usage
> +-----
> +
> +The driver exposes standard hwmon sysfs attributes:
> +
> +================  =============================================================
> +Attribute         Description
> +================  =============================================================
> +fanX_input        Filtered fan speed in RPM.
> +================  =============================================================
> +
> +Note: If the hardware reports 0 RPM, the filter is bypassed and 0 is reported
> +immediately to ensure the user knows the fan has stopped.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 830c6f076b00..94416af57b28 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14873,6 +14873,14 @@ W:	https://linuxtv.org
>   Q:	http://patchwork.linuxtv.org/project/linux-media/list/
>   F:	drivers/media/usb/dvb-usb-v2/lmedm04*
>   
> +LENOVO YOGA FAN DRIVER
> +M:	Sergio Melas <sergiomelas@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +W:	https://github.com/sergiomelas
> +S:	Maintained
> +F:	Documentation/hwmon/yogafan.rst
> +F:	drivers/hwmon/yogafan.c
> +
>   LOADPIN SECURITY MODULE
>   M:	Kees Cook <kees@kernel.org>
>   S:	Supported
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 7dd8381ba0d0..f87023a0066e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2653,6 +2653,15 @@ config SENSORS_XGENE
>   	  If you say yes here you get support for the temperature
>   	  and power sensors for APM X-Gene SoC.
>   
> +config SENSORS_YOGAFAN
> +	tristate "Lenovo Yoga Fan Hardware Monitoring"
> +	depends on ACPI && HWMON
> +	select MATH64
> +	help
> +	  Say Y here if you want to monitor fan speeds on Lenovo Yoga
> +	  and Legion laptops.
> +
> +
>   config SENSORS_INTEL_M10_BMC_HWMON
>   	tristate "Intel MAX10 BMC Hardware Monitoring"
>   	depends on MFD_INTEL_M10_BMC_CORE
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 556e86d277b1..0fce31b43eb1 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -245,6 +245,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
>   obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
>   obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
>   obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
> +obj-$(CONFIG_SENSORS_YOGAFAN)	+= yogafan.o
>   
>   obj-$(CONFIG_SENSORS_OCC)	+= occ/
>   obj-$(CONFIG_SENSORS_PECI)	+= peci/
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> new file mode 100644
> index 000000000000..44b6a7fd2deb
> --- /dev/null
> +++ b/drivers/hwmon/yogafan.c
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/**
> + * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
> + *
> + * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
> + * laptops by interfacing with the Embedded Controller (EC) via ACPI.
> + *
> + * The driver implements a passive discrete-time first-order lag filter
> + * with slew-rate limiting (RLLag). This addresses low-resolution
> + * tachometer sampling in the EC by smoothing RPM readings based on
> + * the time delta (dt) between userspace requests, ensuring physical
> + * consistency without background task overhead or race conditions.
> + * The filter implements multirate filtering with autoreset in case
> + * of large sampling time.
> + *
> + * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
> + */
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/ktime.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/math64.h>
> +/* Driver Configuration Constants */
> +#define DRVNAME "yogafan"
> +#define MAX_FANS 8
> +/* Filter Configuration Constants */
> +#define TAU_MS          1000    /* Time constant for the first-order lag (ms) */
> +#define MAX_SLEW_RPM_S  1500     /* Maximum allowed change in RPM per second */
> +#define MAX_SAMPLING    5000    /* Maximum allowed Ts for reset (ms) */
> +/* RPM Heuristic and Sanitation Constants */
> +#define RPM_UNIT_THRESHOLD 500  /* Values below this treated as units of 100 */
> +#define RPM_UNIT_MULT      100  /* Multiplier for low-res EC readings */
> +#define RPM_FLOOR_LIMIT    50   /* Snap filtered value to 0 if raw is 0 */
> +
> +struct yoga_fan_data {
> +	const char *active_paths[MAX_FANS];
> +	long filtered_val[MAX_FANS];
> +	ktime_t last_sample[MAX_FANS]; /* Renamed from last_update for consistency */
> +	int fan_count;
> +};
> +/**
> + * apply_rllag_filter - Discrete-time filter update (Passive Multirate)
> + * @data: pointer to driver data
> + * @idx: fan index
> + * @raw_rpm: new raw value from ACPI
> + */
> +static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
> +{
> +	ktime_t now = ktime_get();
> +	s64 dt_ms = ktime_to_ms(ktime_sub(now, data->last_sample[idx]));
> +	long delta, step, limit, alpha;
> +	s64 temp_num;
> +
> +	/* Initialize on first run or after long sleep/stall */
> +	if (data->last_sample[idx] == 0 || dt_ms > MAX_SAMPLING) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_sample[idx] = now;
> +		return;
> +	}
> +	if (dt_ms <= 0) return;
> +
> +	delta = raw_rpm - data->filtered_val[idx];
> +	if (delta == 0) {
> +		data->last_sample[idx] = now;
> +		return;
> +	}
> +	/* Alpha with 12-bit precision to prevent alpha=0 on fast polls */
> +	temp_num = dt_ms << 12;
> +	alpha = (long)div64_s64(temp_num, (s64)(TAU_MS + dt_ms));
> +	step = (delta * alpha) >> 12;
> +	/* FIX THE STALL: Force a move of 1 RPM if alpha*delta rounds to zero */
> +	if (step == 0 && delta != 0)
> +		step = (delta > 0) ? 1 : -1;
> +	/* SLEW RATE LIMITING: Scaled by time delta */
> +	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> +	if (limit < 1) limit = 1;
> +	/* Clamp step to physical slew rate */
> +	if (step > limit)
> +		step = limit;
> +	else if (step < -limit)
> +		step = -limit;
> +	data->filtered_val[idx] += step;
> +	data->last_sample[idx] = now;
> +}
> +
> +static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct yoga_fan_data *data = dev_get_drvdata(dev);
> +	unsigned long long raw_acpi;
> +	acpi_status status;
> +	long rpm;
> +
> +	if (type != hwmon_fan || attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
> +	status = acpi_evaluate_integer(NULL, (acpi_string)data->active_paths[channel],
> +					NULL, &raw_acpi);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +	/* * Heuristic: Convert units-of-100 to raw RPM.
> +	 * Most Yoga/Legion ECs return a single byte (0-255).
> +	 * We use 500 as a safety threshold to distinguish from raw 16-bit RPM.
> +	 */
> +	rpm = (long)raw_acpi;
> +	if (rpm > 0 && rpm < RPM_UNIT_THRESHOLD)
> +		rpm *= RPM_UNIT_MULT;
> +	apply_rllag_filter(data, channel, rpm);
> +	*val = data->filtered_val[channel];
> +	return 0;
> +}
> +
> +static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	const struct yoga_fan_data *fan_data = data;
> +
> +	if (type == hwmon_fan && channel < fan_data->fan_count)
> +		return 0444;
> +	return 0;
> +}
> +
> +static const struct hwmon_ops yoga_fan_hwmon_ops = {
> +	.is_visible = yoga_fan_is_visible,
> +	.read = yoga_fan_read,
> +};
> +
> +static const struct hwmon_channel_info *yoga_fan_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info yoga_fan_chip_info = {
> +	.ops = &yoga_fan_hwmon_ops,
> +	.info = yoga_fan_info,
> +};
> +
> +static int yoga_fan_probe(struct platform_device *pdev)
> +{
> +	struct yoga_fan_data *data;
> +	struct device *hwmon_dev;
> +	acpi_handle handle;
> +	int i;
> +	static const char * const fan_paths[] = {
> +		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga 14c) */
> +		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion) */
> +		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim */
> +		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy */
> +		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate */
> +	};
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	data->fan_count = 0;
> +	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
> +		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
> +			data->active_paths[data->fan_count] = fan_paths[i];
> +			data->fan_count++;
> +			if (data->fan_count >= MAX_FANS)
> +				break;
> +		}
> +	}
> +
> +	if (data->fan_count == 0)
> +		return -ENODEV;
> +	platform_set_drvdata(pdev, data);
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
> +							 data, &yoga_fan_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver yoga_fan_driver = {
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +	.probe = yoga_fan_probe,
> +};
> +
> +static struct platform_device *yoga_fan_device;
> +
> +static const struct dmi_system_id yoga_dmi_table[] __initconst = {
> +	{
> +		.ident = "Lenovo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, yoga_dmi_table);
> +
> +static int __init yoga_fan_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(yoga_dmi_table))
> +		return -ENODEV;
> +	ret = platform_driver_register(&yoga_fan_driver);
> +	if (ret)
> +		return ret;
> +	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
> +	if (IS_ERR(yoga_fan_device)) {
> +		platform_driver_unregister(&yoga_fan_driver);
> +		return PTR_ERR(yoga_fan_device);
> +	}
> +	return 0;
> +}
> +
> +static void __exit yoga_fan_exit(void)
> +{
> +	platform_device_unregister(yoga_fan_device);
> +	platform_driver_unregister(&yoga_fan_driver);
> +}
> +
> +module_init(yoga_fan_init);
> +module_exit(yoga_fan_exit);
> +MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
> +MODULE_LICENSE("GPL");

