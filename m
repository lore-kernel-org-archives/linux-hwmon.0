Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287A930C617
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 17:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769535558; cv=none; b=A+lJIf+d4cbqQHLuRCFFpCvfQetn3898Rqsk+oFQbFXGXwkBs8YgJl5JuDKi5MYkrED9QLukMmKLLVyhWvT87HjMUoAZDEfHxUQpyozyJk1lwD2xxtAQReFdS0Kf6gGFX4iF3pO8hR05V53iYqSXWFB2/6aMUcVEqlHvbpXXaYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769535558; c=relaxed/simple;
	bh=8UVLLIrsHUqOxlqfwM0sGO/TY65ZyUp+76xPFVVS7yQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsHJLNqOqxeAPS61bkVnP10XjjCKgqh1FfVyCHlo4L2HPyHM2BwxPuORg7sq7zGW3hsptZjjhJ0yjQ9VfW0NMOzVXHRLI9RFZpkheJRhI2QFQbA81eae8H6b7SZkcsF0ij9U1UwoqzWKeHadqU+kQs4g+s7wTuQtYmZUUNfqKkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb1E4br9; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb1E4br9"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233c155a42so8498913c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 09:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535556; x=1770140356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kr+iveQN+RoO7r/9SZpPd7B6TCre3+xXPMNTBTcaVrg=;
        b=eb1E4br9qfXoTQhb5RSfPn4iDWVdaWn0IXsxV0deyiy6XleMuMBIiRg1753yYFg3HQ
         huPUHu/6un10eSik237teps958qM3uMIVlZoCWajQG0WNS8ad6FA/Zj+O8USXKiVae9J
         lgKIWDAtnP3gZrAUD6P8atKOJhF60HumdYCayt13LKjBV0b7KaJ1d6M2ow8fh+UE84fZ
         oR/Y9ERWeIJcl/eLK1KgBQk+hUNewyTXwp96BiU4V095yGeZtJmV3r5zbRfMHQKJgOi8
         4joUKtxGC28FFBOO4qvN2MB4VD7SjVWoqXB1iL1UYbbO0HhnBdqORrvgrQJaOhlvdE2K
         Buvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535556; x=1770140356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr+iveQN+RoO7r/9SZpPd7B6TCre3+xXPMNTBTcaVrg=;
        b=Gs8po1Fk++h0leuYMa9nPTEVIKyJ2vBeimADHMPewsqzHFKGPit+Ll064DA4NC1Ddw
         zb09x6502YBo7GYLH3hPpOFPO/DGteOMun1ejhulNxiDDDCV9yYq/Kc/LwYiRtITnKhO
         dd5To/5p/nDDfqT11LY8dJVEl4vEJgZc4O9krQVVBrnDL5P73A0iGRMtiyLemkiIdgmn
         YJM98aTWap7SK48NDg706DLyu6jGuyATf5cFpdxVpClvganbP0sc6KQK7veXjOKNWhOv
         CmxTaM5n36BbZG+m3sI/RydQu6ONOMHN8Y2qMNchjHLwfLov3mbyr5cEJQg/n600Pb3x
         5Opw==
X-Forwarded-Encrypted: i=1; AJvYcCUlEf/r20qWK9rQLpuM3rCJPbfHjXUb8ZYTMez8OaTSw1luKsuuBkTrjdTjehuadv54Ar7aHXynN1MIaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCEKNxctQhrppA1nQM6oSHUuYWn+QGFuDYXeMX3xgxnjsPUlUq
	LQr5rl9Kp6y5VcJBbvPqsWrYCwmt/pM+I0Q56Anbe6vADVcWL4B7D7XS
X-Gm-Gg: AZuq6aI8qxewpIZi1FwJjtpbTeOm4CrY9GgC4iuXyj1QXVACloQwuPu8+s8PJa7Kn0t
	jnft2gKTeHdUD6kZOs1R2bgxOJSUmDxLo0T8/k6EcjD0SYL4GRnM6k91N45Si4B1qiJbmuDSJ4T
	8t58LTD8sXqhbqPmYYaV9nflWQsi/oCRGuKabkLrSFvwB7ojxwxPDzA5BVOrX/VLQ5ohVYzXZbO
	P+tKviFYrnXVCA1YXMRWaUmA9LwLJcY8uiaDtDh0+UtCBHgJ1r8f9F3QDpHrHOvTPk35EIJ7DAr
	Vh/x7IzopH0j5V6auLMtR3EXKiX8ymXXgviChI6DOwrvqDwHCOtFEwsiOnrA0fJjcWIDnURdIbl
	zzac9Se+iCf5lomfMCkLQjUQyIx8GeijUCvBacQew7uMn+Xk6SDi6FrYNtidoNJrIU2NsHsIl7M
	JsKjQ/fXPSNT57hLk/UnmJHWwfNLELPgfb7AeonOdJneR3/JpYQ3uA6JMul1I6GUJx1/U0Wz8=
X-Received: by 2002:a05:7022:6ba5:b0:119:e56b:9899 with SMTP id a92af1059eb24-1249ffe4d33mr1398672c88.0.1769535555975;
        Tue, 27 Jan 2026 09:39:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a7c62819sm339772c88.12.2026.01.27.09.39.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 09:39:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
Date: Tue, 27 Jan 2026 09:39:12 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
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
In-Reply-To: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nuno,

On 12/23/25 04:21, Nuno Sá via B4 Relay wrote:
> This is v3 for the LTC4283 how swap controller. Main change is that I'm
> now using the auxiliary bus for adding the GPIO device (done depending
> on FW properties).
> 
> Similar to the LTC4282 device, we're clearing some fault logs in the
> reset_history attributes.
> 

I ran the patch series through an AI review. Results are below.
Please take a look.

Thanks,
Guenter

---
# Deep Dive Regression Analysis Log
Date: 2026-01-27

## Commit 5998c620fbd8: gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

**Context**:
- Adds a new GPIO driver `drivers/gpio/gpio-ltc4283.c`.
- Depends on `drivers/hwmon/ltc4283.c` for regmap and MFD instantiation.

**Findings**:
1.  **Typo/Naming Issue**:
     - File `drivers/gpio/gpio-ltc4283.c` uses `LTC42823_ADIO_CONFIG` definition.
     - `LTC42823` appears to be a typo for `LTC4283`.
     - `drivers/gpio/gpio-ltc4283.c:26`: `#define LTC42823_ADIO_CONFIG 0x12`

2.  **Logic Verification**:
     - GPIO direction and value setting logic appears consistent with bitmasks provided, assuming register `0x12` and `0x11` layout is correct as inferred.

3.  **Regressions**:
     - No critical functional regressions found in this commit alone.
     - Code quality: Typo in macro name.

## Commit 82433332ce16: hwmon: ltc4283: Add support for the LTC4283 Swap Controller

**Context**:
- Adds core HWMON driver `drivers/hwmon/ltc4283.c`.
- Handles I2C communication, regmap initialization, and MFD child creation.

**Findings**:
1.  **Critical Regression: DebugFS Use-After-Free**:
     - `ltc4283_probe` calls `ltc4283_debugfs_init`.
     - `ltc4283_debugfs_init` calls `debugfs_create_file_unsafe` creating files associated with `st`.
     - `st` is allocated with `devm_kzalloc`.
     - **Issue**: There is no explicit cleanup of debugfs entries (e.g., `debugfs_remove_recursive`) and no `devm_add_action` to handle it.
     - **Consequence**: When the driver is unbound/unloaded, `st` is freed by devm. The debugfs entries remain. Accessing them triggers a Use-After-Free on `st`.
     - **Fix Required**: Use `devm_add_action_or_reset` to remove debugfs directory/entries on driver detach.

2.  **Typo**:
     - `drivers/hwmon/ltc4283.c:1765`: `MODULE_DESCRIPTION("LTC4283 How Swap Controller driver");`
     - "How Swap" should be "Hot Swap".

3.  **Property Handling**:
     - Driver respects "missing property" by keeping hardware/EEPROM defaults, while Bindings document specific defaults. This is a minor consistency issue but likely acceptable if EEPROM usually matches defaults.

## Commit a175d04e5900: dt-bindings: hwmon: Document the LTC4283 Swap Controller

**Context**:
- Adds DT bindings.

**Findings**:
- Bindings appear correct and consistent with driver usage.
- Dependencies logic (`adi,external-fault-retry-enable` requiring `adi,pgio4-func` to not be `gpio`) is enforced in both YAML and Driver.

## Summary

**Final Regressions Found**: 1 Major (DebugFS UAF), 2 Minor (Typos).

1.  **Major**: `drivers/hwmon/ltc4283.c`: DebugFS entries are not removed on driver unload, leading to UAF.
2.  **Minor**: `drivers/gpio/gpio-ltc4283.c`: `LTC42823_ADIO_CONFIG` typo.
3.  **Minor**: `drivers/hwmon/ltc4283.c`: `MODULE_DESCRIPTION` "How Swap" typo.

