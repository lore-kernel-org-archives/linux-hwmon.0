Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBC1C433DB
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Mar 2021 15:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BED8A64F16
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Mar 2021 15:33:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhCMPdU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Mar 2021 10:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbhCMPcm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Mar 2021 10:32:42 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA125C061574
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Mar 2021 07:32:41 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id u62so14250325oib.6
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Mar 2021 07:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rWPfuNbbDjUzsMnIFby+9iypFpC/ZB5ambc73in0qFc=;
        b=VFhKlLyZZVCCUmrMMJaq3y0ghGKjk0ghu2gbvVpog1AhM4temLmBfch3sgThft2KnQ
         1sDKKbhE7DcTjGwGNOAuOlUL/NSbdKLaYZJOLZySoCZLqLOPqYFiZVt0nIRiY6VnsUsy
         1+DqJEjNZyjsFbkzuMUhnjqynQx2J5F4HclmzFzllGgkI20lMWW7qFzQZosv1EmT3Mfn
         GrrAD+fEOSJMIHqHc183BrdHa3xSV9sHiTxm2+2qeBGT9QoX+go/XQzClTF+D6csl7p4
         RpBLgVlbP5S3BGIPKGN9+pJB9e9VkpOBkby7PFsGrn5YMSczxDs2yVld8Amo9GyutF5D
         GYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rWPfuNbbDjUzsMnIFby+9iypFpC/ZB5ambc73in0qFc=;
        b=JNEanYnnq5t9ITNHQ9LsYslgGtfuIl35qwmJYBhL6MaW7ClfTKVyaN/C77jQXVQBqy
         pevd6boxDCo/3cSsDw9Lrbfdn7/0o0NG+FtQjpOJjpkSP9VQ7P7cYhdqrTBMUhB+L7WG
         9ipYB2bUlJO7DGBoYNL9ETtamJyBXLF1lCzu/9whsnax/BmPOJdP/Xl4/eDs8GHidBU9
         zaF2phKMLCKi/x0MtoQKSNws3qth4Pa64DK336MRSJ/TdsoIaArgaY9A7k+AeuPh5IQ3
         kBKYgumx+UsvWz7VpoGJnBRZvHfET9TAXbDHQUmo2/UwfudrR6Ok4zVzw2qu84Pcjq3H
         AJ3Q==
X-Gm-Message-State: AOAM530wKC3ToyXB64QbSLZaiYL1HxXUKoJhrCtmHYHW8DZ/CO2U6bAt
        oVW5DFh8rvGhsY8OFpBMRJhgEz/rPPQ=
X-Google-Smtp-Source: ABdhPJx/yFvAR62d7iaNst/K+FJ/O4OMUcjKhW5OVzBgAOtX1RIUWVUXdenef0BfS3iuM8w2qxDTjw==
X-Received: by 2002:a05:6808:341:: with SMTP id j1mr13314909oie.173.1615649561207;
        Sat, 13 Mar 2021 07:32:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3sm3525970oov.2.2021.03.13.07.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Mar 2021 07:32:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] nvme-hwmon: drop not common HWMON_T_MIN and HWMON_T_MAX
To:     wangyugui <wangyugui@e16-tech.com>, linux-hwmon@vger.kernel.org
Cc:     dwagner@suse.de, hare@suse.de
References: <20210313083256.68158-1-wangyugui@e16-tech.com>
From:   Guenter Roeck <linux@roeck-us.net>
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
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <adbcff5f-22d2-1d5d-fd61-978b03fce943@roeck-us.net>
Date:   Sat, 13 Mar 2021 07:32:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210313083256.68158-1-wangyugui@e16-tech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/13/21 12:32 AM, wangyugui wrote:
> HWMON_T_MIN is not common in NVMe SSD, so drop all of them in nvme-hwmon.
> 
> HWMON_T_MAX is only common in NVMe SSD Composite sensor, so drop them in other sensors.
> 
> Before this patch(SSD: PM1733):
> #sensors
> nvme-pci-4300
> Adapter: PCI adapter
> Composite:    +49.9°C  (low  = -273.1°C, high = +71.8°C)
>                        (crit = +84.8°C)
> Sensor 1:     +47.9°C  (low  = -273.1°C, high = +65261.8°C)
> ERROR: Can't get value of subfeature temp3_min: I/O error
> ERROR: Can't get value of subfeature temp3_max: I/O error
> Sensor 2:     +49.9°C  (low  =  +0.0°C, high =  +0.0°C)
> 
> # cat /sys/class/nvme/nvme0/hwmon1/temp3_min
> cat: /sys/class/nvme/nvme0/hwmon1/temp3_min: Input/output error
> # cat /sys/class/nvme/nvme0/hwmon1/temp3_max
> cat: /sys/class/nvme/nvme0/hwmon1/temp3_max: Input/output error
> 
> After this patch(SSD: PM1733):
> #sensors
> nvme-pci-4300
> Adapter: PCI adapter
> Composite:    +48.9°C  (high = +71.8°C, crit = +84.8°C)
> Sensor 1:     +46.9°C
> Sensor 2:     +48.9°C
> 

Signed-off-by: missing.

Either case, no.

On one of my NVMEs, after setting the limits:

nvme-pci-0100
Adapter: PCI adapter
Composite:    +29.9°C  (low  =  -0.1°C, high = +76.8°C)
                       (crit = +78.8°C)
Sensor 1:     +29.9°C  (low  =  -0.1°C, high = +254.8°C)
Sensor 2:     +37.9°C  (low  =  -0.1°C, high = +254.8°C)

That it doesn't work on yours doesn't mean it needs to be disabled for
all other NVMEs. Instead, we'll need to figure out how to correctly
identify that limits for the second subfeature sensor are not supported,
or what exactly the NVME complains about when trying to read the limits
for the second subsensor. One possible solution might be to call
nvme_get_temp_thresh() from nvme_hwmon_is_visible() and return 0 if the
call returns an error.

Also, the low/high limit readings on the composite sensor and on
Sensor 1 only mean that limits are not configured. That is not a reason
to disable the limit attributes entirely. One could instead write useful
limits into those attributes.

Guenter

> ---
>  drivers/nvme/host/hwmon.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/nvme/host/hwmon.c b/drivers/nvme/host/hwmon.c
> index 552dbc0..a93612f 100644
> --- a/drivers/nvme/host/hwmon.c
> +++ b/drivers/nvme/host/hwmon.c
> @@ -188,23 +188,23 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
>  static const struct hwmon_channel_info *nvme_hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>  	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT | HWMON_T_MAX |
>  				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
> +			   HWMON_T_INPUT |
>  				HWMON_T_LABEL),
>  	NULL
>  };
> 

