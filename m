Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F79428473
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 14:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892526; cv=none; b=dmx4SuAnMVqMIwef7FsHsUiFcYp/bqFea2YyKRQAaF0t2iGil3+s/fcqHdYQ9sg5TTVWkDPCTrh+AHf341sHBYkzRKk6gZDm5VkTP8K01syptoXGJJaxYka/cXfLrERPcx+5NNs/2i7sMxpmpl4xxKCAzGPXr3LdoRwUTeUxZkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892526; c=relaxed/simple;
	bh=TWxFzk7O5xEuF0mHiNBBjmZM46S7a97bXD7ugdZfY7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFq7rqye92RNs0ROfp6A46H7Y8NFZZ/Vo8hetbSe3DtKzd4K8jNWCwyLk7jBQIqft18sqdeAXx/xMsSH5dzQ5pCeBnKRCnL0SossBv6P7MF3fQ/QQPl8Ig508RZ56Ss987mkJSw0Sth9s4emLob2jbrW78AOyf7Rz/kxgrkZKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHy5OeV6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHy5OeV6"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4585a116a4aso9848495f8f.3
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892523; x=1780497323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQu7+1RAsuU643B6dzPPjhrjJvzUIEjr3KyG0F7v8EI=;
        b=bHy5OeV6MF4SOz2duHxQt99C7W4tfNhjzpooUYmz0Ha6c6VkTheki4JTZwN+49dtX+
         +OOZHOcOCr7SZ/4BYyX210+iWh4pArgFOySYVOqpGJ7SSxovpRZvXsZF7WcOUAjjPTkO
         CtCDJC4sHBVgUXuZkjVwXRV83HmTntvleFxhEoMydOWMUw5ykHK9g5vnciRQKjxiK/tS
         lj5JLfj9KVwPGc+0hPo/8UiG3B1dYGbmAIz5ePrXJ61if4wm1xVYROG6ClS3qaE14LJ8
         GD77rHn9XkkxjwCQsi4XnVLwzvd9i+AaL/xuy9ZnJTwsKfq6jDTJ8+MKo33rKjMhSRJG
         0IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892523; x=1780497323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQu7+1RAsuU643B6dzPPjhrjJvzUIEjr3KyG0F7v8EI=;
        b=TdWNANo5/Ui2hM1kBvaJP9//+DFRHb/5dO1QuClX1U78Z/xpxrLbORFzBy6dn7Dyof
         nb7oLvRp5HXRZai3Em48HfbOEA4kiG5Smnk/c2Ty4F/yLEsV6CofwK3tD64xBDbdU3t4
         GRPwosSdF7J4o0FHNmj9G2Rcmt6Ko0HMviPfg6BwfiHUf0n6To1k5CP/OQAx7+NG/CHO
         7pRvlvbJabqpWzUkpgpzujfEJKHfRjQE3KkCgbtfr4EJunnjY4MPx+vXK6VZvEpBQ3i9
         kp1unESKf8Lg2E1qNghQ1MV/o+MaSVTqLCp+GiIvaBRR/cj1Onxei7dBwDfM5/66FXC1
         b4ww==
X-Forwarded-Encrypted: i=1; AFNElJ8eeP/rTfshIBnMIsKfOOhdS0v4vV2g+f8Zu9fjq0gTEopS+wMexILDnz4xLQnTpQUpnoUuhETqAfgOzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxveI/lr2WnXvd+FRj7S7EPPBzwa402Na86v/+lEu7H8b13RHq/
	pAWmnNXtlB03AtySSDvdAs7R+zG5qofQLms19t1jKfpXP1RhLXiRQzsN
X-Gm-Gg: Acq92OE0hzBfoqJRaiYG4TKl8rtVkst9rx5UYPRIqSGPgtILjLiczy4GvDFq7XV1XpG
	JmRdr1S+F6F1g3eo695x/dB5iHDpw9QAfoCaKpNUyE7453VnvUf6PtpZxQ8E3mUSb/NzX0f3rLD
	rydm6+BndemSqNB+KwNa4FzD6j70M0DY1lyZA9q5CHrw5lbrkXbQK3m0Jk9EVICkmkTw2/hojHU
	0uBl5wMXH06n5srvvVsbd7A7HkvttFLA7RgPVwkBp6TDFjQIDuuiVMp4lPYpC8qc5R42mwcw5v2
	Vq/uE4Sk/cRAxpCG0OugXxonBpeX3+yjUjUBeAkD+bP5tEMOmAwyIiGhb/3s7UQS00KtKOVRNPI
	fOgfVH9qyLEoHfYQxtiob3LW2D1PiVHvKgREcKmuI56NOi5EhhlvwyEohrHShe/DZxBitrxjTse
	2eN+3K
X-Received: by 2002:a05:6000:2f81:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-45eb368847bmr39696399f8f.18.1779892522921;
        Wed, 27 May 2026 07:35:22 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:22 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Date: Wed, 27 May 2026 16:35:03 +0200
Message-ID: <20260527143515.102794-6-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526171350.6fadc595@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-2-wafgo01@gmail.com> <20260526171350.6fadc595@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 17:13:50 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflow_raw
> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_raw
> > +KernelVersion:6.19
> > +Contact:linux-iio@vger.kernel.org
> > +Description:
> > +Raw (unscaled) volumetric flow rate reading from the channel.
> > +To convert to standard units (litres / second) apply the
> > +channel's _scale (and _offset, when present).  
> 
> Formatting doesn't match rest of file at all.

Done in v2.  The whitespace got lost when pasting from a wrapped
editor - v2 uses tabs and the same indent as the surrounding
blocks.

> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflow_scale
> > +What:/sys/bus/iio/devices/iio:deviceX/in_volumeflowY_scale
> > +KernelVersion:6.19
> > +Contact:linux-iio@vger.kernel.org
> > +Description:
> > +Scale factor applied to raw volumetric flow readings to obtain
> > +the value in litres per second (l/s).  
> I'd just add this to the big block of existing _scale.
> The units etc are all covered in _raw so we don't need to really say more than
> this exists.

Done in v2.  The separate _scale stanza is gone; the shared
_scale block at the top of the file now has one extra line:

  IIO_VOLUMEFLOW    litres per second

The _raw block stays for the per-channel-type description and
points at the shared _scale section for the units.

Thanks,
Wadim
