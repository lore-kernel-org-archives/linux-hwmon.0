Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C19347BDF
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569155; cv=none; b=MAYWY4dtUyL+rwSNgY87P3tKh6s7lbBRVejg1WKLJg6lnM7csC04tDXGa7FDgFPCpF3D/oGaM1qUWiY78SrIBwjlVFIQWc+t8rFzFLFSM/vvGvi5qI/4Dd+mM8+IENLzSMLyqJrs5ZL8PANssbwxz+oKHOssXZsiRQd7+lx3EZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569155; c=relaxed/simple;
	bh=TA2fn/MPowLU/Otx4A+G3fody4U0W0BzBMJVKJEuXbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+VqNBqRdL2QqwwRy4O8MRqzSQRsZeOiqd16Q8i0gmQCANGJL8xPYaDbqFFNg2R8dJFaHyanDvK9XZKG78tQng6VTf8iZF990fTQGJUi4XAXsjLNI9ZDh35AY6jtDd0Hq0Ue06SrU6FSbj23m+QHyAxOPl+NjSEIF4zWGa9/JWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G10a9wMa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G10a9wMa"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298144fb9bcso73171105ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 08:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763569152; x=1764173952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+6HDqJUm16rryB8P6WaTAzJpsQ5pMTyvGVVzWJ0edS8=;
        b=G10a9wMabq+2glmFGtjKKzgI3URJ7uhoeNCPvP08hwHPcL0bLpGxWakJ53soG6KVTp
         DxrXHJW/qqfNdWny1zaYsfLKBn2H8LBQu9qG1JD6jQ8cZL9CaVFA4yJU7XqZu6JU/pxN
         68r5A33Ogq1ylkOO1iFA+oKV9FY0Ks57F83SCYh+B55WpdYtEmYGwOyVu1D4cOdCeqtM
         304V9/OhrNVDlVkZ2y3qs11IgqAgOPEGk91/W1CccVPuaup0WvdlEO/i+GSXxM2Q74Ng
         xZ26XHd3igi3ozyJABH0gmsdyerlD6bC0uT0ISi60Twh/TKgizubPBXtbRs4s+nIo8sZ
         jBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569152; x=1764173952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6HDqJUm16rryB8P6WaTAzJpsQ5pMTyvGVVzWJ0edS8=;
        b=ul5FJ6rfG+50NuP5HY8owNOeSIY9YYkHdel1+meFsQSBfhy3FHfHTWb1l6fUELrkDr
         0KP7aIqLK17qx1mnKqxR4Mha7lJHwxP9HHMAH126wYThIpyQbom2zpPI2fXol6fkMytp
         vQbPT/bvQKUkevBCzf3WikXw0eVx8Ga3U2X86yTwlS4wGonWRVNI0z9bK1VXv0bphNWJ
         anYJjQF+utdWDzU5hCpT8MJGXbL5+wVRxZzmMGp5VOBTChLs+9yZoRwnv5A3KO2vLH6F
         uWAM08E7sqqtEDEjgs+2rqUslgxy21DUs6L5C18JpoS4OWYsj87kmQsFeXQSkI2EIKO1
         LoPw==
X-Forwarded-Encrypted: i=1; AJvYcCUlUh5B2WM9RZ9g6qD343S+FXnXUGySHail9X/aXX5LMJSspmxsyJAiM7HdptJ9TP80IYpTuXPBXYR8Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySD1VRvY8+EIxBKsV30AoVs6qFV6TZRbvLoXp/+GhOPeCcrul2
	3Wvq9ocW3efrv62okXGxZQbHM+xIXSZPxtAuMm+nJaPdkZafbtag3F5d
X-Gm-Gg: ASbGnctARbpm5y0HbBlfVYnrrrZ4wWkPLOVv6tO7fr/YRhmDnG5kI1mox2PoWg7+/dj
	uF+fr/6jfgKqm5ztj0rT453sp0olFC7kCAas9kDQDA8rGUbd54sX40l/SEv6h5aidFr7qwPH/Na
	BLn1cEB3mSmrgcwwTakNhXpVsMXxMTtbYgHFUDptrdMD/L5D5xy5Eujepp7dtogpBFGkbFGtQ8y
	+EtmBTcFHSbeEG/pZXCC5KXlnk4q7xrvGmkIf9vArr4DOAORc7ni+FZjFDTyE8OSIWn7ZbOd6cP
	U50Gv6hbr2x4wzRbdKCZxu4VzHoDU0NFCsq0qi5g53lL5HLVWk9ocaeWJjzT/CIHGsENFMm/cgt
	qrqKkoaFgeoz2VgBEIX8x7/n+km7PBXVK5VWwFyLQnrojPWjqdWXeQdCChN4cyICHVH9A1V/WxM
	EHu4DfKxEsFB9qDhmpsTzGlpwkih68WKJ8ui754jHtmrr7Ke+83m9k0qITdl2WNXTrB9EDO/cMN
	sNLcWSD
X-Google-Smtp-Source: AGHT+IE30doPMpAYBt7MYn70T78ZfSqhQ5JpdF8FnEk1gF/jJn1jAtJCRLq4lC+btIz3WcyY9hL+jQ==
X-Received: by 2002:a17:903:3c2b:b0:295:6d30:e25f with SMTP id d9443c01a7336-2986a75e7b9mr230173205ad.53.1763569152013;
        Wed, 19 Nov 2025 08:19:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d24b9sm20095126b3a.17.2025.11.19.08.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:19:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9f3e270b-f17f-4442-83ad-40d51ac27598@roeck-us.net>
Date: Wed, 19 Nov 2025 08:19:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hwmon: documentation: add tids
To: Thomas Marangoni <Thomas.Marangoni@becom-group.com>,
 linux-hwmon@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 Jonathan.Cameron@huawei.com, michal.simek@amd.com, nuno.sa@analog.com,
 Frank.Li@nxp.com, wenswang@yeah.net, apokusinski01@gmail.com,
 dixitparmar19@gmail.com, vassilisamir@gmail.com, paweldembicki@gmail.com,
 heiko@sntech.de, neil.armstrong@linaro.org, kever.yang@rock-chips.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, mani@kernel.org, dev@kael-k.io,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251119125145.2402620-1-Thomas.Marangoni@becom-group.com>
 <20251119125145.2402620-5-Thomas.Marangoni@becom-group.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251119125145.2402620-5-Thomas.Marangoni@becom-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 04:51, Thomas Marangoni wrote:
> Add tids driver documentation
> 
> Signed-off-by: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
> ---
>   Documentation/hwmon/tids.rst | 61 ++++++++++++++++++++++++++++++++++++

Needs to be added to Documentation/hwmon/index.rst.

I'd suggest to combine patches 2, 3, and 4 into a single patch.

>   1 file changed, 61 insertions(+)
>   create mode 100644 Documentation/hwmon/tids.rst
> 
> diff --git a/Documentation/hwmon/tids.rst b/Documentation/hwmon/tids.rst
> new file mode 100644
> index 000000000000..254c4a90e6f8
> --- /dev/null
> +++ b/Documentation/hwmon/tids.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver tids
> +===================
> +
> +Supported Chips:
> +
> +  * WSEN TIDS
> +
> +    Prefix: 'tids'
> +
> +    Addresses scanned: None
> +
> +    Datasheet:
> +
> +      English: https://www.we-online.com/components/products/manual/Manual-um-wsen-tids-2521020222501%20(rev1.2).pdf
> +
> +Author: Thomas Marangoni <Thomas.Marangoni@becom-group.com>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for the WSEN TIDS chip, a temperature

This driver implements support -> This driver supports

> +sensor. Temperature is measured in degree celsius. In sysfs interface,
> +all values are scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
> +

This is per ABI and does not need to be mentioned. If you want to mention any
details, the operating temperature and range and the current consumption (from the
introduction in the datasheet) would be acceptable.

> +Usage Notes
> +-----------
> +
> +The device communicates with the I2C protocol. Sensors can have the I2C
> +address 0x38 or 0x3F. See Documentation/i2c/instantiating-devices.rst for methods
> +to instantiate the device.
> +
> +Sysfs entries
> +-------------
> +
> +=============== ============================================
> +temp1_input     Measured temperature in millidegrees Celsius
> +update_interval The interval for polling the sensor, in
> +                milliseconds. Writable. Supported values are
> +                5, 10, 20 or 40.
> +temp1_max       The temperature in millidegrees Celsius, that
> +                is triggering the temp1_max_alarm. Writable.
> +                The lowest supported value is -39680 and the
> +                highest supported value is 122880. Values are
> +                saved in steps of 640.
> +temp1_min       The temperature in millidegrees Celsius, that
> +                is triggering the temp1_min_alarm. Writable.
> +                The lowest supported value is -39680 and the
> +                highest supported value is 122880. Values are
> +                saved in steps of 640.
> +temp1_max_alarm The alarm will be triggered when the level
> +                reaches the value specified in
> +                temp1_max. It will reset automatically
> +                once it has been read.

The datasheet suggests that it should be "exceeds", not "reaches".
I'd suggest to use "temperature", not "level".

> +temp1_min_alarm The alarm will be triggered when the level
> +                reaches the value specified in

Same here. Per datasheet: "Temperature is lower than low limit".
The datasheet says "exceeds the low limit", but that isn't technically
correct, because that means "higher than". "when the temperature is
lower than" should work.

> +                temp1_min. It will reset automatically
> +                once it has been read.
> +=============== ============================================

