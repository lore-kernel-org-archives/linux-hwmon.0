Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CD63CA4A0
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019111; cv=none; b=NcnPo85ECj1Sm6YIKCbFjc5X/Qmnvqt6W24HIeqVCn+2O8mrC7jigUBLzPQhLxZsnVcbZAqtK5PLEPmCy5dENx4cAQfXR9yN3meOdGA7qKt4VDD5EvtIiU3/JcSiLz3sGYgZIUe4soCiAq2fQvxBnT2RsU8c4dVfooHo4onfLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019111; c=relaxed/simple;
	bh=BJmpszAVUgMa2fCtYXv8n0YghEBIN+j6vj6SGyKCCkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOd+Zk9B6VVaswLoBwy2djeVe6Cr0I6mFRiIi0Tz0FSHb2WXa9shnuyv5+b3+MkRjV578fW81UjL3zffq58FaPrX7yIBt6ZAXvEVtKLRBdJRM/HI7q44RdGX+VA10f209DhD2aqJMvNg4faxpWo61PQHIGZfEWvIHMJs+AwG1ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IebLFYJk; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IebLFYJk"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2157020a12.2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 08:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788019091; x=1788623891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf6G640r6g2kWcuN1r9tsGekDWw+N72hsYzercLFMd8=;
        b=IebLFYJkfNsgrWEfiYgyQN8OLUHJP1+LK382EEbYX0emAXATZk0ziB4RBlH2WLRFs1
         eRkQplTFE2nLwBaiZMckXFvm+QxR/P8aBCAntLRywgN3mZzC63sx177qsee9xyjxsR0X
         iuhOQ8jXhUGQmEtkvQQkbfmK4dgUqhovrxibwpjcsI6Uoeuafrgvw4gMSlsE7BZB4Wky
         eMGacMmMe7I/bhJlRn0N/tqvxt9LjjHMwD335W0pp9DOe1oObeFEUk9AGo+kh2ec5Pjj
         QbuiMpvAARVdwtBJAXuOc+UcLm9d7TM1BVkO4+OUjR4tVoudZPv+I4TlWx87vp+aAEFe
         Txyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788019091; x=1788623891;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nf6G640r6g2kWcuN1r9tsGekDWw+N72hsYzercLFMd8=;
        b=EsXV6W3bOJNAJnQrV4XASmfVhPFVb58bVgx2ejcI5ckErurqCiN79yhnZilFjApa1U
         ohIe1jyi3nYwKjss2H8Tpc7aY444AanTGeT5fZufF70gfKOy4D+oV7CpveZwdxlPUTEc
         bWqJ0IalJGYWrfDQbVCULiNUULSyGii5XfS0AvNNQdbuQ7o3HAN4H1/mDEMVfyg6HjxM
         5YcZuV3mKYtZKZHQZCctmxWcXo9PVCz8zZFvEBzgF8LIrwxtmwRVKoxykD4iIPKDdWAo
         8Rtl/p41miia1xztXzBNHCMtRzUh5D+97e+g9X7j7LhsCydoeWcL/+0Gu5lCI+34wvQZ
         61AA==
X-Gm-Message-State: AFuF++mRLOo9D8HpC4I4vQdnpWDeftw++eg73mccjPnrD1gsTepfdn/q
	2FLkJkhpDctMBJnhh1h7IMrytJCZKLGIow9MWJL4ymPsQLdQF0FdAvVn
X-Gm-Gg: AYBFou0BufrPf2OfqjaYcMrDsK6NDdcBbqqe1Pw7JM3Ry/hQIHHQXKCfaiu1PBclF0L
	2GOfrwc0CGvCI3vQTm7mlPfroKG4Gutji2JODeEmJdLUs0KwqhlA+U9dKn40Ha9NE8GZ4s9M98J
	tvIPjMWPqr0N+p4Up1d5xKjHJQl6/IA+cibq1AZl9VCOZhzEpbwvglf+bIQ0PP8QmhAAPLljhen
	7kbAACioNKStL0YclRzE1w8j++xs+oWVk0dXBVbpvY/J2fnMBZoi1iGTL8xkLxRSY/sgpE7XZpu
	9y6fIHtof1vBnjuYujIqGBKceVtltxHhpc8t550oaiSFlapjyNe+8pQr8sZqXt8UasJEifZLYzo
	5jXR/99+kX3Ur4Re8FvcDfWjzyTO2PkNIQ5v3TfrFZtIjf463Oebby0fUm1IJYkN1/pJEftU9eR
	+CzrejKX/Vy6LlI1X+I1FX2iT+ZnawfNvfloZ+T3pRV87vFbOyTMMuC+A/uczV1WSiDx/8shtLD
	1zkvgxoK29IZtHauH1Ogpi4RBl4GaR2xRCzWw==
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-396d0d7b94bmr26730626a91.4.1788019091222;
        Sat, 29 Aug 2026 08:58:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc898dsm15761053c88.9.2026.08.29.08.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 08:58:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fac7741f-5bd6-428d-91f9-6dbd71343f76@roeck-us.net>
Date: Sat, 29 Aug 2026 08:58:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] hwmon: it87: Add basic IT8613E fan monitoring
 support
To: Jerome Tollet <jerome.tollet@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, Benoit Masson <yahoo@perenite.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260829113011.51290-1-jerome.tollet@gmail.com>
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
In-Reply-To: <20260829113011.51290-1-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 04:30, Jerome Tollet wrote:
> The IT8613E is not recognized by the in-tree it87 driver. Full
> support was proposed previously but withdrawn after problems were found
> in the temperature and PWM paths.
> 

Those problems should be fixed instead. Given the feedback in the link
that should not be too difficult.

Guenter

> Add conservative support limited to fan input monitoring. Detect device
> ID 0x8613, check the fan pin muxes, use the existing 16-bit tachometer
> layout, and expose enabled fan inputs read-only. Do not expose voltage,
> temperature, PWM, limit, beep, or alarm interfaces.
> 
> The device ID and fan pin-mux checks follow the earlier v4 proposal by
> Benoit Masson.
> 
> Tested on a system with an IT8613E at 0xa30, revision 12. Only
> fan2_input was exposed, with stable readings between 1268 and 1320 RPM.
> In a back-to-back comparison, the in-tree driver with force_id=0x8622
> reported 1483 RPM and the out-of-tree driver reported 1442 RPM.
> 
> Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@perenite.com/
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
> ---
> Changes in v2:
> - Skip PWM, limit, and voltage configuration for fan-input-only chips
>    in the resume path.
> - Link to v1: https://lore.kernel.org/linux-hwmon/20260829110829.34269-1-jerome.tollet@gmail.com/
> 
>   Documentation/hwmon/it87.rst | 10 +++++
>   drivers/hwmon/it87.c         | 73 +++++++++++++++++++++++++++++++-----
>   2 files changed, 73 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
> index fc1c90b02..d00238e7e 100644
> --- a/Documentation/hwmon/it87.rst
> +++ b/Documentation/hwmon/it87.rst
> @@ -11,6 +11,16 @@ Supported chips:
>   
>       Datasheet: Not publicly available
>   
> +  * IT8613E
> +
> +    Prefix: 'it8613'
> +
> +    Addresses scanned: from Super I/O config space (8 I/O ports)
> +
> +    Datasheet: Not publicly available
> +
> +    Only fan input monitoring is currently supported.
> +
>     * IT8620E
>   
>       Prefix: 'it8620'
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 87edb1b60..a60a68b62 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -12,6 +12,7 @@
>    *  similar parts.  The other devices are supported by different drivers.
>    *
>    *  Supports: IT8603E  Super I/O chip w/LPC interface
> + *            IT8613E  Super I/O chip w/LPC interface (fan inputs only)
>    *            IT8620E  Super I/O chip w/LPC interface
>    *            IT8622E  Super I/O chip w/LPC interface
>    *            IT8623E  Super I/O chip w/LPC interface
> @@ -65,7 +66,7 @@
>   
>   enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
>   	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
> -	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
> +	     it8792, it8603, it8613, it8620, it8622, it8628, it8689, it87952 };
>   
>   static struct platform_device *it87_pdev[2];
>   
> @@ -159,6 +160,7 @@ static inline void superio_exit(int ioreg, bool noexit)
>   #define IT8786E_DEVID 0x8786
>   #define IT8790E_DEVID 0x8790
>   #define IT8603E_DEVID 0x8603
> +#define IT8613E_DEVID 0x8613
>   #define IT8620E_DEVID 0x8620
>   #define IT8622E_DEVID 0x8622
>   #define IT8623E_DEVID 0x8623
> @@ -328,6 +330,7 @@ struct it87_devices {
>   #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
>   #define FEAT_FOUR_TEMP		BIT(22)
>   #define FEAT_FANCTL_ONOFF	BIT(23)	/* chip has FAN_CTL ON/OFF */
> +#define FEAT_FAN_INPUT_ONLY	BIT(24)	/* only fan inputs are supported */
>   
>   static const struct it87_devices it87_devices[] = {
>   	[it87] = {
> @@ -476,6 +479,12 @@ static const struct it87_devices it87_devices[] = {
>   		  | FEAT_AVCC3 | FEAT_PWM_FREQ2,
>   		.peci_mask = 0x07,
>   	},
> +	[it8613] = {
> +		.name = "it8613",
> +		.model = "IT8613E",
> +		.features = FEAT_16BIT_FANS | FEAT_FIVE_FANS
> +		  | FEAT_FAN_INPUT_ONLY,
> +	},
>   	[it8620] = {
>   		.name = "it8620",
>   		.model = "IT8620E",
> @@ -560,6 +569,7 @@ static const struct it87_devices it87_devices[] = {
>   #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
>   						     FEAT_10_9MV_ADC))
>   #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
> +#define has_fan_input_only(data)	((data)->features & FEAT_FAN_INPUT_ONLY)
>   
>   struct it87_sio_data {
>   	int sioaddr;
> @@ -2427,6 +2437,9 @@ static umode_t it87_is_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct it87_data *data = dev_get_drvdata(dev);
>   
> +	if (has_fan_input_only(data))
> +		return 0;
> +
>   	if ((index == 2 || index == 3) && !data->has_vid)
>   		return 0;
>   
> @@ -2469,6 +2482,9 @@ static umode_t it87_fan_is_visible(struct kobject *kobj,
>   	if (!(data->has_fan & BIT(i)))
>   		return 0;
>   
> +	if (has_fan_input_only(data) && a != 0)
> +		return 0;
> +
>   	if (a == 3) {				/* beep */
>   		if (!data->has_beep)
>   			return 0;
> @@ -2790,6 +2806,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   	case IT8623E_DEVID:
>   		sio_data->type = it8603;
>   		break;
> +	case IT8613E_DEVID:
> +		sio_data->type = it8613;
> +		break;
>   	case IT8620E_DEVID:
>   		sio_data->type = it8620;
>   		break;
> @@ -2944,6 +2963,28 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   
>   		sio_data->beep_pin = superio_inb(sioaddr,
>   						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
> +	} else if (sio_data->type == it8613) {
> +		int reg27, reg29, reg2a;
> +
> +		superio_select(sioaddr, GPIO);
> +
> +		reg27 = superio_inb(sioaddr, IT87_SIO_GPIO3_REG);
> +		reg29 = superio_inb(sioaddr, IT87_SIO_GPIO5_REG);
> +		reg2a = superio_inb(sioaddr, IT87_SIO_PINX1_REG);
> +
> +		/* fan1 is not available on IT8613E. */
> +		sio_data->skip_fan |= BIT(0);
> +		if (reg29 & BIT(2))
> +			sio_data->skip_fan |= BIT(1);
> +		if (reg27 & BIT(7))
> +			sio_data->skip_fan |= BIT(2);
> +		if (!(reg2a & BIT(0)) || (reg29 & BIT(7)))
> +			sio_data->skip_fan |= BIT(3);
> +		if (!(reg27 & BIT(1)))
> +			sio_data->skip_fan |= BIT(4);
> +
> +		/* PWM control is not yet supported. */
> +		sio_data->skip_pwm |= GENMASK(5, 0);
>   	} else if (sio_data->type == it8603) {
>   		int reg27, reg29;
>   
> @@ -3355,7 +3396,8 @@ static void it87_init_device(struct platform_device *pdev)
>   		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
>   	}
>   
> -	it87_check_limit_regs(data);
> +	if (!has_fan_input_only(data))
> +		it87_check_limit_regs(data);
>   
>   	/*
>   	 * Temperature channels are not forcibly enabled, as they can be
> @@ -3364,7 +3406,8 @@ static void it87_init_device(struct platform_device *pdev)
>   	 * run-time through the temp{1-3}_type sysfs accessors if needed.
>   	 */
>   
> -	it87_check_voltage_monitors_reset(data);
> +	if (!has_fan_input_only(data))
> +		it87_check_voltage_monitors_reset(data);
>   
>   	it87_check_tachometers_reset(pdev);
>   
> @@ -3525,10 +3568,14 @@ static int it87_probe(struct platform_device *pdev)
>   	}
>   
>   	/* Check PWM configuration */
> -	enable_pwm_interface = it87_check_pwm(dev);
> -	if (!enable_pwm_interface)
> -		dev_info(dev,
> -			 "Detected broken BIOS defaults, disabling PWM interface\n");
> +	if (has_fan_input_only(data)) {
> +		enable_pwm_interface = 0;
> +	} else {
> +		enable_pwm_interface = it87_check_pwm(dev);
> +		if (!enable_pwm_interface)
> +			dev_info(dev,
> +				 "Detected broken BIOS defaults, disabling PWM interface\n");
> +	}
>   
>   	/* Starting with IT8721F, we handle scaling of internal voltages */
>   	if (has_scaling(data)) {
> @@ -3580,6 +3627,10 @@ static int it87_probe(struct platform_device *pdev)
>   		if (((reg >> 4) & 0x03) == 0x01)
>   			data->has_in |= BIT(12);
>   	}
> +	if (has_fan_input_only(data)) {
> +		data->has_in = 0;
> +		data->has_temp = 0;
> +	}
>   
>   	data->has_beep = !!sio_data->beep_pin;
>   
> @@ -3660,9 +3711,11 @@ static int it87_resume(struct device *dev)
>   	if (err)
>   		return err;
>   
> -	it87_check_pwm(dev);
> -	it87_check_limit_regs(data);
> -	it87_check_voltage_monitors_reset(data);
> +	if (!has_fan_input_only(data)) {
> +		it87_check_pwm(dev);
> +		it87_check_limit_regs(data);
> +		it87_check_voltage_monitors_reset(data);
> +	}
>   	it87_check_tachometers_reset(pdev);
>   	it87_check_tachometers_16bit_mode(pdev);
>   
> 
> base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea

