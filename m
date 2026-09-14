Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56660415B6E
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425601; cv=none; b=mM6AL1+IyqR/aGzSllSS65+E/NzhCJFpkdBVJ3wprd7P8aqNG8xZU0ww618kNPquiuFFjTQuw+ghTNNkZWNAk2JuE1fpvbGDNWsfxbcc/JGvSYgga2DN+52qtDc/TwJfI8v/MEruHbgVgAoeYGKFYTuOcYX2OmUZdJHkIE0cs/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425601; c=relaxed/simple;
	bh=6vuOdBUPd5G+oaN+uQpy+7AncmfJWnPT9oqPI8xxajs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUD85/EhJkU8yHpdjeDocb64FIDlslL1sbEQPbQS4QOklzs+p17D+ZSt2UyV+151SA7lMSjS3A4TLe0FNmpPJXvB48/4TkCoO98Q/2+NjbV02uQW+poInzXpOaM3IZwrjFd4CynXdnklfaRRJbk/CsADlvnNZZHxNEfR5sY1B9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaHSXWvB; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaHSXWvB"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-86309e1a213so1697979b3a.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789425597; x=1790030397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=55ZPEIobAI8M7Fm+VwCEC/Y+kuR1EOYykzBtVWqXCvw=;
        b=RaHSXWvBtuz64B6jaM/UnusVXmRiyW/ciZrwHd04dDth60iy2wH9hO2NyAjpE+5BMu
         QTVR+/fPfThKPx2q2Eza5MGP6hXIaJINl+33dhxdQhxculLPMU5ebhCveWXJ3jgLxEWX
         jGdoAhiGWKOkWMBDK+dh3ET0b81dvm6+H85avyHV2zWa2ppKl61cg550UzBTC6D1qATu
         zdzo63OEZ4+h0UjthnA3q3tOQQNqEAk2HU2EBaZoOMhFbdqvAtxEJ/9rPr6Fj6acjPXt
         R9yu967MNgu+8sEOI/ztzW2u8lIUkpJx5ic1a3YjwRVgJg2kjAaOuEuIIc/feyOOb07t
         i70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425597; x=1790030397;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=55ZPEIobAI8M7Fm+VwCEC/Y+kuR1EOYykzBtVWqXCvw=;
        b=SC/xHouYGGcnSCOJ+KCZsmIaMRktTuqgZBjMbmk41azIHZseBH6vqt0dfmKBuT+nJ4
         PmosU3af1ydOOvn/imL2lUl6+m2W/b10hoFl1Y0nJf3/8ecxidAIFUHIpK+hQ2j5IEQk
         yoFpqTkR6hSvVblGUH/KDFhiZ8S8+eLzkMOIV/thBBpK2RLV+dfv6chZLhqhMeOHnkiB
         aH51us+HgIzWb1IVoS3Ijp4aoO5kXDwNAS7ZntvpTU+UrOvPpwUkKkToxjOxe5bYm8xU
         TB0pPBiBx9smV5MUO8uSlM6dm4OMVsxr/G0sfD5SJCq7TT2JS+lzxtdEiZ6erdULytdY
         Z8kA==
X-Gm-Message-State: AFuF++lwCu/IaWsu/EF+w6W/EAf5SRbApNkMHo9pXsT2v0floAjIHagA
	eoPmdAM4ejFyPgKq2GV0dTc3yt1KV3+CX2RuHbYAzT3dZ4+Z9HwZ6niRr2YeFds6
X-Gm-Gg: AYBFou2Xos2XcYnnbbp89I5N47XIQ5MNLe0/S0LTsy54TfPYevC2+xryBoA+p7uPSOZ
	EyJt09YK65DuiDtMNeeH4bn866IzMTO7BXZi1hnjN1yGjeeflrglUGRFzyG6eWXkTBdLFkSA1u6
	J8WH4mUUcPYCOXBFxAYQkW+EskX/FJdpkYDGnn0v0wgAM2assQZGRRCAg7+vkQxHHKptrx32ce3
	JXi/Wu/36Qpkxn3mz6bamNRM0wBHzgcYGKDUchccjOAh1dKW7Y/OKKeCfPukf3JyseAsuIh6QWm
	pkDSt85K+hi2rAekZnkdfklXe+Dl2Q7cEgfa56VNG8bOVBSxAaHUEd7UmR4srsiczHJMokHTASw
	2qw3xfUw10frxaAJtSghLVGRJBbwx6aFtOPjxjnLUMOXa/hRaz7jZ/WTW0N5I78GtIHz1kRpo0G
	ndmbTLm+gEcEhuTyYtv85x9em61l1u1qnpqWuyHdBS3uP1255wEvYbYQgpoBaIWMaEj2uvC3Ddm
	E8XX65tYpPaN+9Dap/n/94JTkDglyn2KX0ZO13Pbs62d9pF
X-Received: by 2002:a05:6a20:7355:b0:3d3:ae1f:d7f6 with SMTP id adf61e73a8af0-3db40588cd5mr9476222637.22.1789425597391;
        Mon, 14 Sep 2026 15:39:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm28500239eec.25.2026.09.14.15.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 15:39:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <95148fda-ca3b-46ec-ab61-b94840f5daf4@roeck-us.net>
Date: Mon, 14 Sep 2026 15:39:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) Add AMPINEL support
To: Vas Zayarskiy <contact@vasily.cc>, Aleksa Savic
 <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
References: <20260914220128.287145-1-contact@vasily.cc>
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
In-Reply-To: <20260914220128.287145-1-contact@vasily.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 15:01, Vas Zayarskiy wrote:
> The Aquacomputer AMPINEL power monitor currently exposes no hwmon
> readings. Add read-only support for total power, total current, input

The first sentence is completely pointless.

> voltage, hotspot temperature, six channel currents and the device's
> reported current deviation.
> 
> Decode the unsolicited 544-byte input reports from USB interface 1.
> Validate the vendor collection, report length and ID, and use the
> existing two-second expiry check to reject missing or stale readings.
> Keep aggregate power and current in wire units in the existing caches
> and convert them on read to avoid overflowing those caches. Reject power
> values that cannot be represented by the hwmon long value on 32-bit
> systems.
> 
> Require the USB HID transport before accessing the USB interface; a UHID
> device can advertise BUS_USB without having a USB interface parent.
> 
> HID matching also claims the separate keyboard interface for this product
> ID. Preserve its input and hidraw handling, including reset-resume, while
> keeping it outside the sensor decoder.
> 
> Document the sensor mapping and update the Kconfig help. Channel labels
> follow report order. No vendor configuration requests are sent, and
> protection settings and alarm reporting are not implemented.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
> ---
> Changes in v2:
> - Reject AMPINEL devices not using the USB HID transport before
>    casting their parent, addressing the issue reported by Sashiko.
> - Add local probe-prefix regression coverage. The v1 code reaches
>    an instrumented invalid-parent cast when a UHID device advertises
>    BUS_USB; v2 returns -ENODEV first. Real-USB telemetry, malformed
>    descriptors and the keyboard branch are also checked. This runs
>    in a userspace harness; no crashing UHID device was created on
>    the host. The harness is not included in the kernel patch.
> 
> This initial support is based on passive USB captures compared with video
> of the device's own display at idle and under workload. It is intended
> to make the observed telemetry available through standard hwmon readers.
> The captures establish field scales and load response, not calibration
> or exact equivalence between USB and display averaging.
> 
> Testing:
> - Built and linked the module against Linux 7.2.5 with W=1.
> - Built the driver object on this hwmon-next base (7.3-rc3), x86_64 with
>    the driver configured as a module, and i386 built-in with SMP and PM
>    disabled. Both configurations pass W=1 and sparse without findings.
> - Replayed 995 reports through the actual C parser/read functions in a
>    userspace harness with ASan/UBSan, malformed reports, stale reads,
>    keyboard bypass, visibility and integer range checks. The harness
>    also simulates the 32-bit long conversion bound. All seven Python
>    capture/decoder tests pass, including filmed-display fixtures.
> - checkpatch --strict reports no findings with the pending sign-off
>    check excluded. The changed RST document renders without warnings.
> 
> Hardware testing used one AMPINEL (0c70:f015, USB bcdDevice 0100) connected
> from its small USB header to an internal motherboard USB header on NixOS.
> The v1 C implementation passed 72/72 simultaneous raw-USB/hwmon comparisons
> on 7.2.3 across module reload, USB-core unbind/rebind and deep suspend/
> resume. Both input registration and keyboard capabilities were preserved.
> Automatic loading and updating readings were subsequently verified after
> reboot to 7.2.5 and after desktop-session changes. The new transport check is the only executable C change from v1.
> The revised parser still passes all 995 captured reports. The v2 module
> has not been loaded on hardware. The 7.3-rc3 builds are compile/static
> checks, not hardware boots.
> 
> Review limits and questions:
> - Alarm flags and configurable limits are not decoded. Is this initial
>    telemetry-only scope acceptable? Their USB mappings are not established.
> - Channel numbers are report order, not verified connector pin numbers.
>    Current deviation is the reported value; its formula is unknown.
> - Hotspot temperature was validated only above zero. The existing
>    Aquacomputer 0x7fff unavailable convention is applied by analogy;
>    an unavailable hotspot and negative encodings were not observed.
> - USB bcdDevice is a descriptor value, not an independently verified
>    firmware version. Other firmware, alarm-generated keyboard events,
>    full power removal and physical unplug/replug remain untested. The
>    internal header connection is not ordinarily unplugged during use.
> 
> AI assistance: Codex assisted with capture/display analysis, the C
> implementation, tests and submission text in response to requests for
> read-only Linux telemetry through the existing Aquacomputer driver.
> Sparse was also used for static analysis.
> 
>   Documentation/hwmon/aquacomputer_d5next.rst |  14 ++
>   drivers/hwmon/Kconfig                       |   4 +-
>   drivers/hwmon/aquacomputer_d5next.c         | 149 +++++++++++++++++++-
>   3 files changed, 162 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/aquacomputer_d5next.rst b/Documentation/hwmon/aquacomputer_d5next.rst
> index 49163f387..0d44626cf 100644
> --- a/Documentation/hwmon/aquacomputer_d5next.rst
> +++ b/Documentation/hwmon/aquacomputer_d5next.rst
> @@ -13,6 +13,7 @@ Supported devices:
>   * Aquacomputer Quadro fan controller
>   * Aquacomputer High Flow Next sensor
>   * Aquacomputer Leakshield leak prevention system
> +* Aquacomputer AMPINEL power monitor
>   * Aquacomputer Aquastream XT watercooling pump
>   * Aquacomputer Aquastream Ultimate watercooling pump
>   * Aquacomputer Poweradjust 3 fan controller
> @@ -69,6 +70,19 @@ The Aquastream XT pump exposes temperature readings for the coolant, external se
>   and fan IC. It also exposes pump and fan speeds (in RPM), voltages, as well as pump
>   current.
>   
> +The AMPINEL exposes total power, total current, input voltage, hotspot
> +temperature, six channel currents and current deviation. Channel numbers follow
> +report order; their mapping to physical connector pins has not been verified.
> +The readings are received approximately twice per second. The device connects
> +to an internal motherboard USB header. Only sensor reads are supported; the
> +driver does not configure the device's protection settings or report alarms.
> +
> +For AMPINEL, ``power1_input`` is total power, ``in0_input`` is input voltage,
> +``temp1_input`` is hotspot temperature, ``curr1_input`` is total current,
> +``curr[2-7]_input`` are the six channel currents, and ``curr8_input`` is the
> +device-reported current deviation. The deviation formula is not known.

Why report something if not knowing what it is ?

> +Readings older than two seconds return an error instead of a cached value.
> +

Independent of this patch.

>   The Aquastream Ultimate pump exposes coolant temp and an external temp sensor, along
>   with speed, power, voltage and current of both the pump and optionally connected fan.
>   It also exposes pressure and flow speed readings.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 3d8b2c958..06cb246ff 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -257,14 +257,14 @@ config SENSORS_AHT10
>   	  will be called aht10.
>   
>   config SENSORS_AQUACOMPUTER_D5NEXT
> -	tristate "Aquacomputer D5 Next, Octo, Quadro, Farbwerk, Farbwerk 360, High Flow Next"
> +	tristate "Aquacomputer D5 Next and other USB devices"
>   	depends on USB_HID
>   	select CRC16
>   	help
>   	  If you say yes here you get support for sensors and fans of
>   	  the Aquacomputer D5 Next watercooling pump, Octo and Quadro fan
>   	  controllers, Farbwerk and Farbwerk 360 RGB controllers, High Flow
> -	  Next sensor, where available.
> +	  Next sensor and AMPINEL power monitor, where available.
>   
>   	  This driver can also be built as a module. If so, the module
>   	  will be called aquacomputer_d5next.
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 1ca70e726..72d0a3250 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -2,7 +2,7 @@
>   /*
>    * hwmon driver for Aquacomputer devices (D5 Next, Farbwerk, Farbwerk 360, Octo,
>    * Quadro, High Flow Next, Aquaero, Aquastream Ultimate, Leakshield,
> - * High Flow USB/MPS Flow family)
> + * High Flow USB/MPS Flow family, AMPINEL)
>    *
>    * Aquacomputer devices send HID reports (with ID 0x01) every second to report
>    * sensor values, except for devices that communicate through the
> @@ -19,9 +19,11 @@
>   #include <linux/hwmon.h>
>   #include <linux/jiffies.h>
>   #include <linux/ktime.h>
> +#include <linux/limits.h>
>   #include <linux/module.h>
>   #include <linux/seq_file.h>
>   #include <linux/unaligned.h>
> +#include <linux/usb.h>
>   
>   #define USB_VENDOR_ID_AQUACOMPUTER	0x0c70
>   #define USB_PRODUCT_ID_AQUAERO		0xf001
> @@ -32,6 +34,7 @@
>   #define USB_PRODUCT_ID_OCTO		0xf011
>   #define USB_PRODUCT_ID_HIGHFLOWNEXT	0xf012
>   #define USB_PRODUCT_ID_LEAKSHIELD	0xf014
> +#define USB_PRODUCT_ID_AMPINEL		0xf015
>   #define USB_PRODUCT_ID_AQUASTREAMXT	0xf0b6
>   #define USB_PRODUCT_ID_AQUASTREAMULT	0xf00b
>   #define USB_PRODUCT_ID_POWERADJUST3	0xf0bd
> @@ -40,7 +43,7 @@
>   enum kinds {
>   	d5next, farbwerk, farbwerk360, octo, quadro,
>   	highflownext, aquaero, poweradjust3, aquastreamult,
> -	aquastreamxt, leakshield, highflow
> +	aquastreamxt, leakshield, highflow, ampinel
>   };
>   
>   static const char *const aqc_device_names[] = {
> @@ -55,7 +58,8 @@ static const char *const aqc_device_names[] = {
>   	[aquaero] = "aquaero",
>   	[aquastreamult] = "aquastreamultimate",
>   	[poweradjust3] = "poweradjust3",
> -	[highflow] = "highflow" /* Covers MPS Flow devices */
> +	[highflow] = "highflow", /* Covers MPS Flow devices */
> +	[ampinel] = "ampinel"
>   };
>   
>   #define DRIVER_NAME			"aquacomputer_d5next"
> @@ -110,6 +114,17 @@ static u8 aquaero_secondary_ctrl_report[] = {
>   #define AQC_FAN_POWER_OFFSET		0x06
>   #define AQC_FAN_SPEED_OFFSET		0x08
>   
> +/* AMPINEL offsets include the report ID byte. */
> +#define AMPINEL_DATA_INTERFACE		1
> +#define AMPINEL_STATUS_REPORT_SIZE	544
> +#define AMPINEL_NUM_CHANNELS		6
> +#define AMPINEL_CHANNEL_CURRENT_START	0x6f
> +#define AMPINEL_POWER			0xc7
> +#define AMPINEL_CURRENT			0xc9
> +#define AMPINEL_CURRENT_DEVIATION		0xcb
> +#define AMPINEL_VOLTAGE			0xcf
> +#define AMPINEL_HOTSPOT			0xe1
> +
>   /* Specs of the Aquaero fan controllers */
>   #define AQUAERO_SERIAL_START			0x07
>   #define AQUAERO_FIRMWARE_VERSION		0x0B
> @@ -515,6 +530,25 @@ static const char *const label_highflow_speeds[] = {
>   	"Flow speed [dL/h]"
>   };
>   
> +static const char *const label_ampinel_temp[] = {
> +	"Hotspot"
> +};
> +
> +static const char *const label_ampinel_power[] = {
> +	"Total power"
> +};
> +
> +static const char *const label_ampinel_voltage[] = {
> +	"VCC In"
> +};
> +
> +static const char *const label_ampinel_current[] = {
> +	"Total current",
> +	"Channel 1", "Channel 2", "Channel 3",
> +	"Channel 4", "Channel 5", "Channel 6",
> +	"Current deviation"
> +};
> +
>   struct aqc_fan_structure_offsets {
>   	u8 voltage;
>   	u8 curr;
> @@ -868,6 +902,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
>   		break;
>   	case hwmon_power:
>   		switch (priv->kind) {
> +		case ampinel:
> +			if (channel == 0)
> +				return 0444;
> +			break;
>   		case aquastreamult:
>   			/* Special case to support pump and fan power */
>   			if (channel < 2)
> @@ -888,6 +926,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
>   		break;
>   	case hwmon_curr:
>   		switch (priv->kind) {
> +		case ampinel:
> +			if (channel < AMPINEL_NUM_CHANNELS + 2)
> +				return 0444;
> +			break;
>   		case aquastreamult:
>   			/* Special case to support pump and fan current */
>   			if (channel < 2)
> @@ -906,6 +948,10 @@ static umode_t aqc_is_visible(const void *data, enum hwmon_sensor_types type, u3
>   		break;
>   	case hwmon_in:
>   		switch (priv->kind) {
> +		case ampinel:
> +			if (channel == 0)
> +				return 0444;
> +			break;
>   		case d5next:
>   			/* Special case to support +5V and +12V voltage sensors */
>   			if (channel < priv->num_fans + 2)
> @@ -1071,6 +1117,12 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		break;
>   	case hwmon_power:
>   		*val = priv->power_input[channel];
> +		if (priv->kind == ampinel) {
> +			/* AMPINEL caches deciwatts to avoid overflowing u32. */
> +			if (*val > LONG_MAX / 100000)
> +				return -ERANGE;

Other devices do the same but store the adjusted value in power_input[]
anyway. I do not see a reason to handle this one differently.

If anything, prevent the overflow by declaring the cache variable
as long and clamp it to LONG_MAX (for all devices, in a separate patch).

Really, when using AI, tell it to fix such problems for all supported
devices, not just the one you are adding.

> +			*val *= 100000;
> +		}
>   		break;
>   	case hwmon_pwm:
>   		switch (priv->kind) {
> @@ -1097,6 +1149,9 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		break;
>   	case hwmon_curr:
>   		*val = priv->current_input[channel];
> +		/* AMPINEL caches total current in centiamperes to fit u16. */
> +		if (priv->kind == ampinel && channel == 0)
> +			*val *= 10;

Why not change priv->current_input to u32 instead ? Also,
does this really only affect channel 0 ?

Other devices potentially have a similar problem. Again,
no device specific fixes while leaving others unfixed,
please.

>   		break;
>   	default:
>   		return -EOPNOTSUPP;
> @@ -1324,6 +1379,34 @@ static const struct hwmon_chip_info aqc_chip_info = {
>   	.info = aqc_info,
>   };
>   
> +static int aqc_ampinel_raw_event(struct aqc_data *priv, const u8 *data, int size)
> +{
> +	int i, sensor_value;
> +
> +	if (size != AMPINEL_STATUS_REPORT_SIZE || data[0] != STATUS_REPORT_ID)
> +		return 0;
> +
> +	priv->serial_number[0] = get_unaligned_be16(data + AQC_SERIAL_START);
> +	priv->serial_number[1] = get_unaligned_be16(data + AQC_SERIAL_START + SERIAL_PART_OFFSET);
> +
> +	/* Keep aggregate power and current in wire units until aqc_read(). */
> +	priv->power_input[0] = get_unaligned_be16(data + AMPINEL_POWER);
> +	priv->current_input[0] = get_unaligned_be16(data + AMPINEL_CURRENT);
> +	for (i = 0; i < AMPINEL_NUM_CHANNELS; i++)
> +		priv->current_input[i + 1] =
> +			get_unaligned_be16(data + AMPINEL_CHANNEL_CURRENT_START +
> +					   i * AQC_SENSOR_SIZE);
> +	priv->current_input[AMPINEL_NUM_CHANNELS + 1] =
> +		get_unaligned_be16(data + AMPINEL_CURRENT_DEVIATION);
> +	priv->voltage_input[0] = get_unaligned_be16(data + AMPINEL_VOLTAGE);
> +
> +	sensor_value = get_unaligned_be16(data + AMPINEL_HOTSPOT);
> +	priv->temp_input[0] = sensor_value == AQC_SENSOR_NA ? -ENODATA : sensor_value * 10;
> +	priv->updated = jiffies;
> +

This warrants explanation: Why does this device not fit into the
event sequence used for all other devices from the same manufacturer ?

> +	return 0;
> +}
> +
>   static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
>   {
>   	int i, j, sensor_value;
> @@ -1333,6 +1416,14 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
>   		return 0;
>   
>   	priv = hid_get_drvdata(hdev);
> +	/* The AMPINEL keyboard interface has no hwmon device. */
> +	if (!priv->hwmon_dev)
> +		return 0;

How would this ever happen, or in other words why would the AMPINEL
keyboard interface instantiate this driver ?

> +	if (priv->kind == ampinel) {
> +		if (report->type != HID_INPUT_REPORT)
> +			return 0;
> +		return aqc_ampinel_raw_event(priv, data, size);
> +	}
>   
>   	/* Info provided with every report */
>   	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
> @@ -1517,6 +1608,8 @@ static void aqc_debugfs_init(struct aqc_data *priv)
>   
>   static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
> +	struct hid_report *report;
> +	struct usb_interface *intf;
>   	struct aqc_data *priv;
>   	int ret;
>   
> @@ -1533,6 +1626,30 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	if (ret)
>   		return ret;
>   
> +	if (hdev->product == USB_PRODUCT_ID_AMPINEL) {
> +		if (!hid_is_usb(hdev))
> +			return -ENODEV;
> +
> +		intf = to_usb_interface(hdev->dev.parent);
> +		/*
> +		 * hid-generic yields every interface matching our product ID.
> +		 * Preserve input and hidraw on the separate keyboard interface.
> +		 */
> +		if (intf->cur_altsetting->desc.bInterfaceNumber != AMPINEL_DATA_INTERFACE) {
> +			hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> +			return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +		}
> +

Why would this driver want to instantiate on the keyboard interface ?
This seems wrong.

> +		report = hdev->report_enum[HID_INPUT_REPORT].report_id_hash[STATUS_REPORT_ID];
> +		if (hdev->maxcollection != 1 ||
> +		    hdev->collection[0].usage != (HID_UP_MSVENDOR | 1) ||
> +		    !report || report->size != (AMPINEL_STATUS_REPORT_SIZE - 1) * 8)
> +			return -ENODEV;
> +
> +		/* Do not expose zero readings before the first complete report. */
> +		priv->updated--;

Why would this desirable for this and only this device ?

> +	}
> +
>   	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
>   	if (ret)
>   		return ret;
> @@ -1542,6 +1659,14 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   		goto fail_and_stop;
>   
>   	switch (hdev->product) {
> +	case USB_PRODUCT_ID_AMPINEL:
> +		priv->kind = ampinel;
> +		priv->num_temp_sensors = 1;
> +		priv->temp_label = label_ampinel_temp;
> +		priv->power_label = label_ampinel_power;
> +		priv->voltage_label = label_ampinel_voltage;
> +		priv->current_label = label_ampinel_current;
> +		break;
>   	case USB_PRODUCT_ID_AQUAERO:
>   		/*
>   		 * Aquaero presents itself as three HID devices under the same product ID:
> @@ -1791,6 +1916,9 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   	}
>   
>   	switch (priv->kind) {
> +	case ampinel:
> +		priv->serial_number_start_offset = AQC_SERIAL_START;
> +		break;
>   	case aquaero:
>   		priv->serial_number_start_offset = AQUAERO_SERIAL_START;
>   		priv->firmware_version_offset = AQUAERO_FIRMWARE_VERSION;
> @@ -1870,6 +1998,11 @@ static void aqc_remove(struct hid_device *hdev)
>   {
>   	struct aqc_data *priv = hid_get_drvdata(hdev);
>   
> +	if (!priv->hwmon_dev) {

Agai, how (and why) would this ever happen ? WHy does this driver
instantiate on a keyboard interface ?

> +		hid_hw_stop(hdev);
> +		return;
> +	}
> +
>   	debugfs_remove_recursive(priv->debugfs);
>   	hwmon_device_unregister(priv->hwmon_dev);
>   
> @@ -1877,6 +2010,14 @@ static void aqc_remove(struct hid_device *hdev)
>   	hid_hw_stop(hdev);
>   }
>   
> +static int aqc_reset_resume(struct hid_device *hdev)
> +{
> +	if (hdev->claimed & HID_CLAIMED_INPUT)
> +		hidinput_reset_resume(hdev);
> +
> +	return 0;
> +}
> +
>   static const struct hid_device_id aqc_table[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUAERO) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_D5NEXT) },
> @@ -1886,6 +2027,7 @@ static const struct hid_device_id aqc_table[] = {
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_QUADRO) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_HIGHFLOWNEXT) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_LEAKSHIELD) },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AMPINEL) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUASTREAMXT) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_AQUASTREAMULT) },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_AQUACOMPUTER, USB_PRODUCT_ID_POWERADJUST3) },
> @@ -1901,6 +2043,7 @@ static struct hid_driver aqc_driver = {
>   	.probe = aqc_probe,
>   	.remove = aqc_remove,
>   	.raw_event = aqc_raw_event,
> +	.reset_resume = aqc_reset_resume,
>   };
>   
>   static int __init aqc_init(void)
> 
> base-commit: 46fde107b4e881f179bf02bca69d8a0020561b3c

