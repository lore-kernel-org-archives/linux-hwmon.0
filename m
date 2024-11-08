Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4A1DEFC2
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Nov 2024 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731055661; cv=none; b=ZjgVCu6kCk5Yy3caKtYHkZJSZjWRTdJsce7aeagKuXPU6E0foAgTR0MVhpECCi8+Dy3PFJydTdudax1IAYmGdFGBXYxTwFelTOdETK3hgcqYIRPDFYfc6MuzgkdQO2z2M1zLPFqpDqe2v89sLwYVR4+SdgoEGpco9JN9aeID+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731055661; c=relaxed/simple;
	bh=Kw5vsWimu0DEEJoOvAz3DPc5YUBq+0ME6wv92iHkafY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k2GLdm1xGX+rtyAc1ZRlf+RBhaboSi3BbB/PXlYdfAQJOIHQAiZOduRmWEiBVug6qQgkoFyalfksa/cNmg4Zf+9rmS0lDi9FHYLIkomFqqQDKDos0Cz2ManMNMgaQeVH4HmgpNKSyKyC6REbAPWHosd9LYVagAwuY7x0H5gq48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uuGbqETA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uuGbqETA"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so1131213f8f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Nov 2024 00:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731055658; x=1731660458; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9AD8kCT+nT+KZ2MXqSRYTX2q6sk9d7vkvCTtFjV2TU=;
        b=uuGbqETA371S6SHpohC0xK3YcB5FlvBkXXCwMnvgs2IxyBSKc/dM2wgbrbxhtSV745
         +SdrlLisixi8yis2r3mmxfRxlTNeGxNnAvyvorKa21ue2p0IvieF2sKG3EAeJxxwsNLX
         uD9kRGbXKAXIcu9qenHA/4xF+CMmWHIQsuWbJ52fkDZU7+PkXcKtfCtvdAohO7dV8lZM
         vJOKw2sLHfp/Pdj827FjGwckhAL1Y0s/NMbYMfMMjS15rfIMwUmoAn2efOLku/vGf/ZO
         3i7yM7aVOQNbBGTt8yImhG2/ueR/jeGgiFhPPn2nW80LrY7NOU8IW5vSDByrXiVBFtd3
         ngJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731055658; x=1731660458;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A9AD8kCT+nT+KZ2MXqSRYTX2q6sk9d7vkvCTtFjV2TU=;
        b=m0hcU+PJfUbiu8FLPzvv0pv2vUiccuHeNkXY60lFhPIeNpLeo6D/55mQuGL1yqqWpn
         7cfxirJCcIitADvG32wTF604SlY4gtJDES0I3DCjstOszpYor9R0rXLsJ6FFyvthw/VX
         Ak1q21CiITxcM0gZf+IqU2lx6KVedweVPXZxxEtzkYQLkcqZHU8Mh/vJGGOIdSAvuoFI
         QJRKbFxffdNkPg800kGuuNJ3bc5iOxvYSsFEVqvYUmtGk8sSkSvPSsZYC3ag0Lu07k/q
         37D76QhKdLpdEoEHMgVHfA0NsZSdtU6LPatmwERkr/ASPaQJYw8V73xWfbarDOa+pM/K
         tPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVk8lufuyLHUoZ5yIHURuiQnHnSm73s7SkFfuRh1VILEXHQ6Xfcck9VRUFNT0yefwytcqOvBhfaTnkoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJlg4TRNGeQCkyqVnuxRA2dlfhugG1YjOu809rsCcRogqzCqTa
	9dUy1Tl2TkK2myAag52dbrnhBTfkYzN17qx7zZe4uUJm4AvW3sux2nrpSa6XBMs=
X-Google-Smtp-Source: AGHT+IEGxCmPOWLzM0bzj/TXKrnSrKDuB1/okZ3cbyLHE4zCDXwSir+KcCmZbuM3Pt/+K5DFnkIxNg==
X-Received: by 2002:a05:6000:2aa:b0:37e:f1ed:67e8 with SMTP id ffacd0b85a97d-381f186dd5cmr1454470f8f.35.1731055658002;
        Fri, 08 Nov 2024 00:47:38 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:ecfd:9f8d:62a3:6ba8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970e23sm3930442f8f.18.2024.11.08.00.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 00:47:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  Patrick Rudolph <patrick.rudolph@9elements.com>,  Naresh Solanki
 <naresh.solanki@9elements.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
  linux-hwmon@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-i2c@vger.kernel.org,  Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v4 7/7] hwmon: (pmbus/tps25990): add initial support
In-Reply-To: <df0db75a-b5e1-4bd8-8a59-de85b0a77fa5@roeck-us.net> (Guenter
	Roeck's message of "Wed, 6 Nov 2024 10:59:11 -0800")
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
	<20241105-tps25990-v4-7-0e312ac70b62@baylibre.com>
	<df0db75a-b5e1-4bd8-8a59-de85b0a77fa5@roeck-us.net>
Date: Fri, 08 Nov 2024 09:47:36 +0100
Message-ID: <1jpln62jtj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 06 Nov 2024 at 10:59, Guenter Roeck <linux@roeck-us.net> wrote:

>> +
>> +static int tps25990_mfr_write_protect_set(struct i2c_client *client,
>> +					  u8 protect)
>> +{
>> +	/*
>> +	 * The chip has a single protection mode, set it regardless of
>> +	 * the specific protection requested
>> +	 */
>> +	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
>> +				     protect ? 0x0 : 0xa2);
>
> After some thought, I think it would be better to reject all protect values
> other than 0 (no write protection) and PB_WP_ALL because that is what the chip
> supports. Something like

Since operation would not be allowed, it's maps the closest indeed.

>
> 	if (protect & ~PB_WP_ALL)
> 		return -ENXIO;		// or -EINVAL ? Not really sure.

The command is supported but the argument would not be, so -EINVAL seems
appropriate to me.

>
> Thanks,
> Guenter

-- 
Jerome
