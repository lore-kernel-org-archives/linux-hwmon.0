Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266122D23A6
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787380891; cv=none; b=AYJmICDTvZbP7am3/jt+VCW39SJvXsZJeuHSm4XX2qyXtrlWaO1nGuHm3/4QKrMz6I0epNqWT9SyCXtgG2ONOSNqcsD1YIM8g1QTSzFR7HEHyhoUzyrifJH6i4Tr45wkPVVANkFPVsbZ8Jd1AU2rfRHMPAe1qDiAET3pa8N3JAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787380891; c=relaxed/simple;
	bh=YVESCf53Dri2xvlCXdT41rLz5OnYtPY6IBylHezXqtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WeViRMtBOkWhMI5QjY+0E14bfYiohkdZqOMencs+TotfmE4jZd28xh/VMSYuPW9sGr+BGWb1tSaltCcG0SjEygtZNbUIvEzST96qyiIk0maF+M8qDB+hKIZV9f+A+YaFSl9aY91sh8TzoITNM5k4+e4BxuY3KpN9oc0W30ugNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfEDRwn5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfEDRwn5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so14989705ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 23:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787380889; x=1787985689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hT272b+xP/3P06nzY+sRl9xegCb5CD+byjSp3zmNmGg=;
        b=NfEDRwn5dqFamYnNV1FrRp4S9tIEBt4frat4j5oMP+cjnisnfLtiX1YW/ihnzhQQxX
         YUaJCSoQEJX3eMNdE3+nOxTh0jO/Wl6a3pqWNaesuKi+r2ztFU3VbNzEuSeJX4uhBUdY
         hQmy5j/suiCXV+QVdVwKi93FZek1Lyix2bCRzPgmz+hI2cAO5kWALjuui8sOGidz633x
         1wPsGCmsDvFV6N92bc9RQe10hUlYJEc/Sew6pBdH6li2mVwgh43rsEUNVKD9RFHa/Zjr
         n/eqGSy2wm3V6ipZSRoZS8Wq9e+PP1kDz1OVV2cQ21HrDsVxC4yb+52/SOoclUCigj9M
         Agsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787380889; x=1787985689;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hT272b+xP/3P06nzY+sRl9xegCb5CD+byjSp3zmNmGg=;
        b=dyWejlChuFG+ZITqtBppRSOxZfOXxut8HUQOlqpCi7C0r4g9Zw+Cz2TkwPWxur3gtl
         S3t8qthDiktGWYz0wUz5HHOrE/aFHhRAiFB2DKnJP16iQqjZ5fFU+EJBzEAqeKMXXVAg
         edYWaeCdiOzMh7N91NrQDhzgVjXjO0M3hGvri9XAYpqP1TNg9IbMxVGX3NXPja4WuDYw
         9QxADxlmil5rpNHDAa94OmA19EIfnL8Rh+Gg1CR8p8AR+iIZUz0A9951Z5hy+asT1Ql3
         XwufyzfyzQK91p4nOELkxYpGARglcXIbKYC0+QDKlnZGg5zKJvUoZ6nGFhS0FMLrOZJK
         R+Tg==
X-Gm-Message-State: AFuF++lOiUJSXjDUPxCurh0uU0YaAAFtW+5A6Amy60cM9Awv3BabF74r
	wbyF5n5tTIH/UoY6rNe0t5mxC46F/TqxWHWo2Ghb4JjxdCJ3tCEQ/o4k
X-Gm-Gg: AR+sD12QdADVVTqbhF1y+iyRNS2J2dqFLY85eO+r0PuMAYTjEnRFUuPc4lglV1gpl6Z
	Vicb+kgWnvwJTChDhfonyb0oGVtx1TjVPCtZnolaSMLgJF11K21j7kdm2N4fyjAK49CM1nf7EfZ
	VGtqFeC8JzmgjgV3cPeIVuxXpvMsK4zQ0M0t8Qx5n9ib2rL+jaP7zbyFoDLUBe+trX1yHRGkVaT
	po5vXICP2iSP+upuH6vzxuNfXukzdJRGoWRI/hYilZbN3cfP/gy2bYQlUdaGUCGXTEyr80XwNO7
	kSikcLSAD+W+57panv2hyJgzjssb7DG9poqKirXREZRFn7rRGjw70spx3YlPsNuGf4Dzg+CmWzJ
	vYP0roXyV5C6himj2f78Xh6NmYUfZeeS0MrP1s/jaKIc5LRdIrRYhtm0a0B4xOCpgS/We8h4Oum
	axQku6IczRo5JWkhMEoNIOZcv84ATzFHTvaFgAwioi+kj1ACSUdfTrx2fMpZIwP8XwDhb2iaRiV
	uE3WwxVbsWCsXTI41XPNJlWgmJlR0jmk+P+aQ==
X-Received: by 2002:a17:90b:3dc5:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-395dee7e2dfmr7910740a91.2.1787380889381;
        Fri, 21 Aug 2026 23:41:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9209743sm5110372eec.21.2026.08.21.23.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 23:41:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <31df411d-e257-458d-98e5-c2920915294d@roeck-us.net>
Date: Fri, 21 Aug 2026 23:41:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: valid the data size before reading the sensor data
To: Edward Adam Davis <eadavis@qq.com>,
 syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, me@jackdoan.com, savicaleksa83@gmail.com,
 syzkaller-bugs@googlegroups.com
References: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
 <tencent_8FCF9A8DDF25A10DCC12265DF45DBE995307@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_8FCF9A8DDF25A10DCC12265DF45DBE995307@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Subject is supposed to be "hwmon: (driver) Description".

On 8/21/26 22:34, Edward Adam Davis wrote:
> The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> fails to handle cases where the sensor data length is smaller than the buffer
> size when reading the data, resulting in [1] during the read process.
> 

The device simulated by syzbot is D5 next, and its control buffer size is
0x329 or 809. I _asked_ earlier if that is the value to check against,
but did not claim that this is actually the case.

We know that the report must be much longer than 65 bytes. D5NEXT_PUMP_OFFSET
is 0x6c = 108, and the field is two bytes long, meaning the report size
must be at least 110 bytes long. What we do not know is its actual length.

> Add a check for the data size, if it less than the buffer size, the sensor
> data read is aborted.
>

Apparently Sashiko is aware that this is wrong - not only is the report size
smaller than 809 bytes, but apparently buffer_size is not even set for all
supported devices.

Please do not submit a patch to fix this problem if you can not test if
the code actually works.

Thanks,
Guenter

> [1]
> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
> Read of size 2 at addr ffff888108aba257 by task swapper/1/0
> Call Trace:
>   get_unaligned_be16 include/linux/unaligned.h:48 [inline]
>   aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
>   aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
>   __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
>   hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
>   __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
>   usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
> 
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>   drivers/hwmon/aquacomputer_d5next.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 1ca70e726298..1cc6c220ffe9 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1334,6 +1334,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
>   
>   	priv = hid_get_drvdata(hdev);
>   
> +	if (size < priv->buffer_size)
> +		return 0;
> +
>   	/* Info provided with every report */
>   	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
>   	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +

