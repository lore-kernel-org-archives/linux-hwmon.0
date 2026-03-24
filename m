Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162803F075A
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774353727; cv=none; b=nspZAOUUev0mxR+IEpiWk5t4Gs8FXbbYZcWpHylkny4AHcxjYUHDWtK+h+anHNs6DhqZzu9SLyr8gLtlCk7FRxu503U/iYJcHfzE4LxgvuORMyW9qEBaRYuQSivthoUanm7eUgZVgzniz5xnxBLLP95Y5SHXTyDEAwaWeFQ6hdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774353727; c=relaxed/simple;
	bh=EUUQ8XnCoFxZc5Dgh6FndAK97NzbYP6VaYZ7nQS0BCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmErOAoD+U5jGCkEcQdmnsp12SW11pJL7CYzcbRteA/mitvD7JLTdXUNqIpXYsvpbXk1y82hYiuPlNBjFr5Agzl80VTfJG6ztMAhHwROllTQesbj0S5O2F3QcDa/RbPY30+6WkJ+pBrA+a3GybMEmiP7hHraXc/9bFzsT0DKYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJnODxpr; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJnODxpr"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0f754e756so1396067eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774353722; x=1774958522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=r7Cvw7CMASLC6B/r3+cukkHse/ycf7d5uQq99RiEAg0=;
        b=NJnODxpr5gUfK5SIDrxtARgXCMUiWVVaMJIgqPKKPrS10tjFobAlXGQWdfZw3N1Swg
         veyQnM7vahPwd2K/prXjeg+M+ydTeq6YLDOcZxyHsyeMq3c9JcrIie1jXOI1F2Xlt/NN
         pmZuaekEfKWHS6tCYcirlzOGbrzrBnT4pjxKAcX2tK5a1ipBhttZ8Q8O7+MVx3c1i4P/
         HZcZbrJu3YLPtuQB8SG9UDEUNH0pToi+VV0Gu2PAQrTch/Hm/aCalzOzNH6eTIy7Iedv
         +pHYtxxA//c9/lyt/gVRwzC+Ia+1gO+r81oWCVl0WGAC0KuaCsQ6+fFfXWP1XxLc4zPV
         y4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353722; x=1774958522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Cvw7CMASLC6B/r3+cukkHse/ycf7d5uQq99RiEAg0=;
        b=dsvOk4UWlFvuYaCTecj9YmUKjnz5WDXddk1Y58ZcBKED65JM/goAMHVmG6j9wbBh36
         tgooybqWdVIMp7fNIItgqMW94Zcipcaq3yhJFQludbIkSkJtUOSceqsu80ElDSJWkS/M
         hk84+Huj3eiYflpIcNnecpPUQVvO6FUYF/KXr0EKK05+wTWsQ2AJRcmgZ0GcnTGYWunR
         w26Ybw0wBiIWY1jknkQuQiuItR+vcH3LVUDE7O1uN/dpYDIRbW5RP3IkVL6+ieRsdcVu
         xERgaJJ5bdXHotLfiyrjKGCGX6vmCCVbDvR9KLCLj57EmQWAcpolu6ODxuNmvF2QVOm+
         zCvg==
X-Forwarded-Encrypted: i=1; AJvYcCVMt1CM0qUJSTLckUgikuDVDUX0oNOwaYXjpSd6IfyszRbdK/u8HtasEl3JpPvn1MWdecfKaMbZo43OMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznPUCPB+vZxjyaF1+qj3YED/WF/A719FYsvKE115MDFtBurckV
	z2zZaTGN+kUzAFwV2XSOqpv8oB1E/UdE9KBZWJ8ZQax2nnYrVpO6Qk7b
X-Gm-Gg: ATEYQzz5y6UugWhBT+0MmPmnGU/6+JzecvFIZa+bfTpsORj+jyG45Hz/hOKQAWtZov/
	Ze7Uc8VffQsIKXf5bET/887q9gWBQEENPwFWeWnScG3IpiD/f/btgAaIAf2B3XhzUilrmlnN7fo
	GOAh7422V0uUnyLUloHsdvL+98z2PGQJ+fgjirFYm0dHRATlyKIuY16xMtjUqw/QZNyh8uM1/NY
	P996UekqICT+rxjp1lv//Oj1Uu1Z4SeEjhk17oNUmBnHWcjPrB1xp9fGlsICoOcQLiqzgR+GpIL
	EytxMfkhATeL/wZtUwLcIIuM/01drpkxkE7PsRtFqDZgod9l3ebC9jMIdsF7HdyHy4pXWjbcrbA
	fYVaAiVb0ZuqVWW6cqe2tOBQ27WGqFiVO43sR+z1uoaO/5WZCvHdJ6V2ys/l6lREIrgrxVgQrqL
	2bfn01/ihLKFgFxS7usFAbLavm5Odl863zDKmFPeq5gEv0XvzKzalgbRPCWruG00SSWVBvVpazK
	I4qdA9k3Qg=
X-Received: by 2002:a05:7300:548:b0:2c0:fd7c:ddf4 with SMTP id 5a478bee46e88-2c109752dd0mr7204385eec.21.1774353721366;
        Tue, 24 Mar 2026 05:02:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm18999251eec.26.2026.03.24.05.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:02:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77e59d08-841f-40fd-a18e-f57271a395df@roeck-us.net>
Date: Tue, 24 Mar 2026 05:01:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: (tmp108) Add support for NXP P3T1084UK
To: Anshika Gupta <guptaanshika.ag@gmail.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
 <20260323162252.15508-3-guptaanshika.ag@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323162252.15508-3-guptaanshika.ag@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/23/26 09:22, Anshika Gupta wrote:
> The NXP P3T1084UK is a ±0.4°C accurate digital temperature sensor with
> a 12-bit temperature register, configuration register, and alert
> functionality over I²C/I3C. Its register interface matches the TMP108
> programming model, so the existing tmp108 driver can bind it without
> functional changes.
> 
> Add "nxp,p3t1084uk" to the OF match table and "p3t1084" to the I²C

This does not match the code (added "uk").

Also (from Sashiko's review):

The commit message mentions the device supports functionality over I2C/I3C.
However, the driver's I3C device ID match table doesn't seem to be updated
for this new device.

Will the driver be able to bind to the device on an I3C bus without an
entry in p3t1085_i3c_ids?

static const struct i3c_device_id p3t1085_i3c_ids[] = {
	I3C_DEVICE(0x011B, 0x1529, &tmp108_data),
	I3C_DEVICE(0x011B, 0x152B, &p3t1035_data),
	{}
};

... which is actually also a concern/question for P3T1085. As far as
I can see from the datasheet, both use 0x1529. This should be mentioned
somewhere, maybe as comment in p3t1085_i3c_ids.

> device-id table so the driver probes the device via both devicetree and
> board data.
> 
> Datasheet: https://www.nxp.com/part/P3T1084UK
>             https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
> 
> Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
> Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>

Per this sequence, Lakshay would be the author, which is not reflected
by the e-mail itself. That suggests that Signed-off-by: Lakshay ... might
not be appropriate.

> ---
>   drivers/hwmon/tmp108.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index 3ea5f6485744..db46961a31d3 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -538,6 +538,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume
>   
>   static const struct i2c_device_id tmp108_i2c_ids[] = {
>   	{ "p3t1035", (unsigned long)&p3t1035_data },
> +        { "p3t1084", (unsigned long)&tmp108_data },

Indentation seems off here.

>   	{ "p3t1085", (unsigned long)&tmp108_data },
>   	{ "tmp108", (unsigned long)&tmp108_data },
>   	{}
> @@ -546,6 +547,7 @@ MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
>   
>   static const struct of_device_id tmp108_of_ids[] = {
>   	{ .compatible = "nxp,p3t1035", .data = &p3t1035_data },
> +	{ .compatible = "nxp,p3t1084", .data = &tmp108_data },
>   	{ .compatible = "nxp,p3t1085", .data = &tmp108_data },
>   	{ .compatible = "ti,tmp108", .data = &tmp108_data },
>   	{}

