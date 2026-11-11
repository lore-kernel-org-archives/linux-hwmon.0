Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395509;
	b=BrcX25IDFfeCNSkgd3oSnoFl8DCme9Zr11BDT2Jl3XNX174k/DLTl/dWTV+5d+thvmUr
	 xGlTdmtbFRy/nXgvYEB2DTDQd0XHhZaJ/BJ8zGDJg29pTH4/E+wakxWxWxg//FnTS/lCp
	 YPpA2h98mYVCHIsf5trCSKevbfAl3UChGYZG6Ef3LF8+8czdXmDFivFAZSokFVSSiXGZA
	 kEAwnRtYN6xbWLCMnvBen46Qxmtp/OWHqpN34DxCs28gqpLQ9FVDEHBBHiRBx34syaRUi
	 v7Mf2o5k0wz07K5Nu/kK2XPb3189GEBHc8gz6+gcVgqPQsOzJ3qWUmxmk6Jkt17wmgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iBpNRqjf3B1Ht4iTj3Q9e0CgVu4XAqb+Mm10Lehyyf8=;
	b=d9bSIqYeAcKXsiGHyj8c7z0HgLCMMNnLaPv9IsZW/iNX5POALI6NCFbt9AzZNbAgXRjN
	 7Hvj19YWtFEge5oEVkbocLx/AeNY4sLA79ZcRSR3cd6UdztpZyRpvTQGBx/jCYsDUrz37
	 cPqespCU3+C7KTiYvEuhp13mNHnYvS2csdCopi6sqjVL2DcGKjMLdZYg4j7Y5Ep2P9KA8
	 GABIGiTM22TMfk5WtC3BMIzoNnnnBLIiuw40TQ0IJKimr+3ETkSWtzB6G4n2nAF5s5tvI
	 FqNP4wbJ7owVYAZNCc6o767/AnXldZPGLrqN+0tLdlrhavKHpmxVk5mmt7KqAqJg37w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAUNCKAq;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7447606B40E
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 11:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7447606B40E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAUNCKAq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a215e64962so34371545e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 03:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395507; x=1795000307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBpNRqjf3B1Ht4iTj3Q9e0CgVu4XAqb+Mm10Lehyyf8=;
        b=mAUNCKAqk0zk1mcCkBWst6wKdlPAJsezh0gVaqTcZqgPZKfddTRMdoQgYrVbIaxxdK
         H8aXM0Hjd6rhROHdg602oog643ciU10gGgMHR78UhiXG9jSQ1CVnCSxgINEmn+jRYZnp
         rrnQChCkVGfi1Lvt5WiRpIHmZPawasBVKaHPJ7f1zSLMTOMEnmynzOk+h2+HmSDRss8w
         uDtkzbi/u0oVX66RhxBOIvZH6LK/MnoPjwiRvg53xdYCAFDuc65J27xVWN4udnLcv3RX
         E2aN+dfodDMj5+sFnjnJ++9wlgC+duW/tSGVBeBXKyYJpOPbGR2rQBGUZZ6grAz49D4m
         nsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395507; x=1795000307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBpNRqjf3B1Ht4iTj3Q9e0CgVu4XAqb+Mm10Lehyyf8=;
        b=ZaM3H6ulZKYJ1ciyOryLcJX3wAmoM2peWJOZuanG0bZCGgEd32ILDADSZ07d02jxEv
         nNSXDV6K4EDHTpx2GBHX+0xG7TDfQ1OE/Va8gIeH0jzZkbWZQAR7npHamzaclYD6Xhe4
         H1soUkUCul6kGevucH633rNS4eoSdV9zIpfXrWg/k3PbwAxU4qzYJ2BEqBfi9a+fkMlj
         2bTTmnQ5XKr+V6JSX8IaJCIQ5QLZDlRy3Lj5xKrPKsy3inLftfk9gRB5lC2N5EvIXqKi
         U6g6S1MgJO/ivJu6TZ6C8529O1x6wym9g2nYKzBf1zLUsi1wdMpb3mYGqnVPudm5O8zw
         prYw==
X-Forwarded-Encrypted: i=1; AL+hErGfA0dLIKXcFZ7CwTBsg7QL7/bJks7VImgZ29L8mijlFPwU9tOTVNMQIOMZygcQUptJECreM6tw2WxuRA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+0a+tCDHKoMG+3bsI7T85snKYTHQoXQN/3BtIRZItCByE40Ayw
	Y5X/xMytrepY5nWcuiSzom+Lua2r5ajuzFU2IwPZz4yIzTr2WnYk3BU2
X-Gm-Gg: AYBFou3QrEKJZjqfsU+sdu7QeYf/mJyswvkxaMWPbC7nuRPq/JDKrlW6f6gTzJEc/pU
	cFT4l7uYbH4286Xz0Z7krYEFZN9kGIE7ppkwkPtz1Sv1LBL2X/hXDwTdgAncvzn1/QTwbVVmmHs
	kgLSegfkuyrVrOmE4qK7rcMOntxpo3gzkudrAvDAjLvebL5KvVAx4t9MBjJBMN608/9XMqyhhB9
	R7Z3b+kNdWHiVwV7aYuGXIbVFztetavmiGpjTXiDHlGQCjij0RZ0v/9EqsH2E45xxQfWjHxDain
	l/dXN9l3JS9WfoLoTvSEbCu6A+/GFMByaJebOAtwleUGcrd0bRNY8dOdk31ibPxWIBdVkug3qbv
	KwJdo3u7nmpSAKfBEW8zWKe8mQeF8nC0r5pr8tJNx0LV+UhBOGZbwtrZyfp97YFRXUty7SWX8Dv
	NLKdepX2vEt08VtC90gcJ335fqJxwNP/8uCKaka+ecTeVM1++wlEgIPH56+apmwol5K7Cg4vS1w
	L4Hx9W8ZmC+Ftx1HwHmDMfBqy5WEasnEJLJjcdgaB3cJF+6hM29fxQAypvKXvidtLM3dpkdDqPX
	FPVOSm/2F/5OL+vE8OAYbQI3ruEPGqlB4TISXELy3q8P3RuER5K/r4+7W4i4BrgQoQ==
X-Received: by 2002:a05:600c:190a:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4ba0931da12mr35879275e9.4.1794395507065;
        Wed, 11 Nov 2026 03:11:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02043149sm125462185e9.8.2026.11.11.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:11:46 -0800 (PST)
Date: Wed, 11 Nov 2026 11:11:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
Message-ID: <20261111111145.1694eb70@pumpkin>
In-Reply-To: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
References: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 14:48:31 +0800
Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:

> in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
> before clamping. A large positive voltage limit can consequently be
> programmed as zero instead of the maximum; 4294967296 mV reproduces this
> on a 64-bit system.
> 
> Preserve the input width and clamp to the representable voltage range
> before multiplication.
> 
> Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/hwmon/w83627ehf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 9c08ab662dc6..5c04b9c52b76 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -293,8 +293,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scale_in)
>  	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
>  }
>  
> -static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
> +static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scale_in)
>  {
> +	val = min(val, 255UL * scale_in[nr] / 100);

You need to think about these more.
Either it really doesn't matter because no one would really try to write
an over large value unless they are trying to break things - and they can
just write zero, or you just need to stop the n * 100 + x overflowing.
So at least avoid the extra divide by using:
	val = min(val, (~0ul - 32768) / 100) 

>  	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);

Another clamp_val() that should never have been added.
The type checks are there for a reason, not to be killed by casts.

David

>  }
>  

