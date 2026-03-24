Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324D29CE9
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 04:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774325971; cv=none; b=EwtYwsrTmScZj98JfWSvNvs0ws3wujGtD+N4gmzwrQQZP2fKpWgwch1u20dOF3Q/cAvB1giH8FrZt544WIV+HP7Mar5GmiagX4+Zfmm3ip0UuUj8/Gi9SlmO48ZLGgSs60kXNmcnxUP91lnJ+RpvsbAUveN6Oayq+s5I59581L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774325971; c=relaxed/simple;
	bh=LtKeaeWhtSREsGnxpuF8r6dPWg6iCfUxKs0Zla2NBzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghaPQPCp2tbh6e0vDyOR1IRY8+qVBRMa+cOGxjiXjBlEgRHIp69AA6M7NMa4NTuMVWDzh0c3SLaKII7OYVy8R7bFWsxn4jk+ZhNXvE8TiOMJEfEG7mIp5xpbCTnCZWfFLlUhmvCYkozTY6F9eUCmi6BBTBKPT+j/IobAaGeARQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWCOhzda; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWCOhzda"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b056b7f783so25043315ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 21:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774325969; x=1774930769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nl4AQqwl/h+VWpU+FwErtEVGrpTJ8Ryf5QIN4Rhp5uo=;
        b=YWCOhzdaF1YCGsNaQf6V364O2U2hJXFW8iAEHdtEezKrmwPUzoiCpUhsYfxuO69bEV
         OF6gL/apBY00pJhyl0Q22e8YswgSKyl63FuJXEvtysTclpJPB4FjDvS0SR46PTyHuAlO
         AjD5mgS19uxfB4ibv2PBGdWU5jiSsUibfKUQ/pFBrqQqLgYKg8EEi8fCsKh+dkIxdUOg
         xgPBFE7Di81V6bxHpb1yqosyynJQ4YJ37SfAmKJurc+Ec7WCtnD/25XGPGwVfv7BNcJs
         031lebph4KuVpRjbVeYGXYUqnQ7y9bcFOz1QnlZj/9BYh32FkK2AOqWgGSvnCMdvzVvE
         HYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325969; x=1774930769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nl4AQqwl/h+VWpU+FwErtEVGrpTJ8Ryf5QIN4Rhp5uo=;
        b=W8qGGED/y9V9aoeNExXumWlTkmx/WWHPrD6oKvJRF5rIa0Xyfrepi0RPIj9FNejUBe
         S1vgdcLciDiSuXnEmJnK31l13gqBAIltt91cD0dXCOVAGgx3Ka6qCmOG2uEHEGHCuQP/
         gwR5Yuq72MgsxCmbwv0kW/TvRd2rOCA9uCu4UniMshd7r2/C4uMt1RyTNKNrTqs5ulD/
         3fnbOpwodDLzcitGnMmotMZ8WroTjTvsqBnD3CBVrP2JXiM0W+NQvKIdhfB0VQkOIOWf
         OL3WTq2Yw/0dZX7QYP6LannUxm7RVkT/0spQBV538Ibm7DNeg+DiYuayQvmkZ08Irmbo
         SdoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXLvhA04Fcf6pfF47GsOS/6C1/wvvGGg1EOAJkGmIAyDUZ8cXM/mF6uwtWODms7/cgUCqGVXefwscLWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzakgZUKgVrTv1YwtWlBrz9Rh+vkQM6Za4Btgxm3IU3E2nJ2IlL
	fzhAvZfEzTJMwqHW8+ZKLfE73X3VNK6LwA50PSfMvltdAygTAjrR9nvHyhGPvg==
X-Gm-Gg: ATEYQzx6Qh0feKjnBGUcAy1CgEbPG9gdyLo5DcAR26OUP1cZqpXwRR5tdqGhKHOcJJJ
	sC/7TNhnEov0JqtBVFEKHlBKJtDLt3p1HEURGzudOgaYgEKosvnNwa7MNKNl9xVPl9xVaTu4WyP
	H2/A+68A2t63GdmYxk7LgRjQ+tYMqYRc3z5bBqYpkEJe/QbHNHmHZ2BSt1PzUcL2YDo1zjVbTcR
	mIT7MSX9AmWNXnrAGP+U9mVneZ/6zPrd0iBVRuZe+MvC761o3NZLC0bsPEwvYlKAB4/bDb2coZK
	u0YiU+5RM30mCsXcFGjQxRJTbfQ8jkjB9HjpH9Hg+ioNs2+f6RwuocMjzei3s4rt5ikVmJ3oKlL
	LV235OdN3VTiEG2SZQQ/Ug7jJswF1rMxsv1FJo14MuZF0AVgYgqbzfP2KFsuFQTQxLo8tNaF04j
	9at0+cYuMJcYojKwf9jSyGz2PnWwwy7Oy3Rsm1/81v89vHo5TLsMo4PoZ0yP8TOFSvBIwgOW+m
X-Received: by 2002:a17:903:8cd:b0:2b0:6068:4c5f with SMTP id d9443c01a7336-2b0a4da13f7mr17395695ad.8.1774325969064;
        Mon, 23 Mar 2026 21:19:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083656df5sm162934815ad.44.2026.03.23.21.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:19:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dbab620c-ba74-4c5e-904b-8e6536a5aaae@roeck-us.net>
Date: Mon, 23 Mar 2026 21:19:27 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] hwmon: (pmbus) Fix bugs in MPS MP2869, MP29502,
 MP2925, and MP9945 drivers
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "wenswang@yeah.net" <wenswang@yeah.net>,
 "chou.cosmo@gmail.com" <chou.cosmo@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260323233244.201294-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323233244.201294-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 16:33, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> This series fixes several bugs in the MPS PMBus drivers (mp2869,
> mp29502, mp2925, mp9945) recently added to hwmon-next.
> 
> Patch 1 fixes the default return value in read_word_data/write_word_data
> callbacks. These callbacks return -EINVAL for unhandled registers, but
> the PMBus core interprets any negative value other than -ENODATA as
> "register does not exist", silently hiding valid standard PMBus
> registers. Affects mp2869, mp29502, and mp2925.
> 
> Note: While I do not have physical access to every variant in this series,
> the safety justification for the -ENODATA fallback is based on the PMBus
> interface of these MPS families and the existing driver constraints
> (func[] flags).
> 
> Patch 2 fixes a return type truncation bug in the reg2data_linear11()
> helper used by mp2869 and mp29502. The function computes a signed 64-bit
> intermediate but returns u16, silently truncating negative or large
> values. The fix changes the return type to int and clamps to [0, 0xFFFF],
> keeping the conversion semantics local to the helper so all callers get
> the same bounded result.
> 
> Patches 3-4 replace raw i2c_smbus_*() calls with their corresponding
> PMBus core API helpers in mp9945 and mp29502. The raw writes to
> PMBUS_PAGE desynchronize the core's internal page cache, causing
> subsequent pmbus_read_word_data() calls to skip the page-select and
> potentially read from the wrong page. As a secondary benefit, the
> switch also routes post-probe accesses through the update_lock mutex.
> 
> Patch 5 adds zero-value guards for hardware-derived divisors in mp29502.
> These divisors feed DIV_ROUND_CLOSEST() calculations in the
> PMBUS_READ_VOUT, PMBUS_READ_POUT, and PMBUS_VOUT_UV_FAULT_LIMIT
> handlers as well as the OV-limit helpers. If the hardware returns zero,
> a division-by-zero exception occurs at runtime.
> 

Looks like the series does more harm than good. Please check

https://sashiko.dev/#/patchset/20260323233244.201294-1-sanman.pradhan%40hpe.com

Thanks,
Guenter

> Sanman Pradhan (5):
>    hwmon: (pmbus) Use -ENODATA for unhandled registers in MPS drivers
>    hwmon: (pmbus) Fix return type truncation in MPS reg2data_linear11()
>    hwmon: (pmbus/mp9945) Replace raw I2C calls with PMBus core API
>    hwmon: (pmbus/mp29502) Replace raw I2C calls with PMBus core API
>    hwmon: (pmbus/mp29502) Prevent division by zero from hardware register
> 
>   drivers/hwmon/pmbus/mp2869.c  |  8 ++--
>   drivers/hwmon/pmbus/mp2925.c  |  4 +-
>   drivers/hwmon/pmbus/mp29502.c | 80 +++++++++++------------------------
>   drivers/hwmon/pmbus/mp9945.c  | 21 +++------
>   4 files changed, 37 insertions(+), 76 deletions(-)
> 
> v2:
> - Patch 1: Folded explicit per-register -ENODATA cases into the
>    default case per review feedback. Added paragraph explaining why
>    returning -ENODATA is safe for these chips.
> - Patches 2-5: No changes.
> 

