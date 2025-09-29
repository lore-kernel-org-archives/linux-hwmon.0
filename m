Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8555A1F5827
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Sep 2025 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759165668; cv=none; b=KOCK3jcS/Uf2/NxbEFHMq0W7gZmEbaf51lBkJhmaIcgXe9+CSey5NlApsnO8yPW3ZY6ZNYqedKQGXcVIYdzqdcMmAXdC/jEvFDTLS3O07kQ/s0yQDRmyfgK+5a0UNpMIA0qp/isBucvjWldICBm5OVcuAp2cau3ehAe/fePN+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759165668; c=relaxed/simple;
	bh=GHaH6xHVSsfmMOhc3Q4Uv4imU4pJ//tOMuXYRsOMut8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B23sDNIg/ENXfwIc5WK7AsdUxRuEn2RAu9pPdiHDOxhFvem2VMG4ImP6LTzfDpmeVBsNmrmNTgJkHeyPeXbk2wxRsJiAoXSUTwjuxq2JuPcqcblwAPKaQfv88pi8wV+pspQIv8tL9pgY8iqTr3s5yTZhpILUmEVxeUBK+TPVWTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewfAFgJH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewfAFgJH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso2815874f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Sep 2025 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759165665; x=1759770465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj9JtujIrCASOTxrqaUt0QRKvTAm0yHb0MuPSQjc/js=;
        b=ewfAFgJHx40FBB5cQCI13U9paQma0tclOSnUjz4eo7r1yCwJRaNwKOw5H88HdSUKem
         PVck37GzfTxOlPQd2Eet7e4yJLzIT4OhlDN9CmfWIcFyT4sMtdXA5+N17o3jHrZ5N8ix
         GYQbgw2kutnIic0UklpUwoQlPUdIxBETC6/f30ksnFpPZ8ZPXGATBpRWJW4WTEG9KApb
         +CHGDcNsYhiVvuVMW6KZ96BlsEmPHmbsw7Dg+LL8V7cNG8Whqh6z6wd3EKFzGP5drK7c
         BB+qLJrFR66bzrZjOVuJzJgZZIUFeCtd97IPt7IaMQOSk1lzHn3oU+73yiPqYm1T8dvf
         uzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759165665; x=1759770465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj9JtujIrCASOTxrqaUt0QRKvTAm0yHb0MuPSQjc/js=;
        b=XLzVrfvXMXfAf9vUQsYpCMADe2wTTt6D2pIxQdIWcn5WV+p2ARDAPlLk29Qsyc/Sr5
         emwlJkMi4rif5+K9+IqgWRzhHfV3fCTrRiwtk43ERZyFWwNd2BMd7vP/oTc0VpzdS8ZZ
         ttgSITTCIFaeEXvpbyOlgJzNJa7LkFAumY3sT2cuqOXOw5uEmExSicfk9XqtQyrgBspS
         TNF9ck8X0g7oE7UodHt5MihBiLdyVpYf+gxrE4oYS2L4yJmXW6s16i/6m2ge//QcOWg9
         A8tgG5XL4KW0CtqQ8WqU1cvKwvDhbHCt2h2bhYJLiR0yWiowlLbyDWXi6duK7A6Zps8n
         SIVA==
X-Forwarded-Encrypted: i=1; AJvYcCUCHON2WAtYhFYnAhToMxszhYiw9LKXctslcw09MS99noZiX+Tv1Ni4F8opI2CSB9kQ4kGyKjzFif0OSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU1JmU6bouYTZTKr2gDUCzjPXyz8ZfP2z78KfqQ3BrTHUceKM0
	QccjQoSHFXgq8ss0t7YJMeCifS/H0H88Pqww/EvTrwVdsWurSV9RS4do
X-Gm-Gg: ASbGncvHADb9nXLhkz1mP6UmRAncAnphbwBBtOQEDDQKq7+Jwqyk6uSqB7MHv9uEwPj
	WBiV8XJ3gXfO1SD6mkYEPcHykqIb6sOswVZ3FVDtv+kDrFj+0M6V56u2bT+bPu5S37nvtnHyekX
	0dl7SjjAKJZmxxSjGkmt5lMd9tssPk0liR4+4/9TuLOe/3ft4NtUjP17igwq/8e8/1atOdDaTdw
	n4oxLqanYLKxvzdFs2AOnP5soK15CcdZH9mRKba6q3qb9nZme4JLCgV7aEoByxBggAr3MZedVgG
	VoGgnbFY4WWb3m6I82mBPJxSdUP9f4Niimbc9iZAVXzbHCqCz63x3M1DztMaahQ9pOWX4huBqRx
	tikegU1TxBpxHX+X1euzy9c12RotXpIOFEEvP/ElZt62tmrtrloJXeNSqDT9l79ozynwVeZhACw
	MMi77W
X-Google-Smtp-Source: AGHT+IE8a0TuB4O+ROJaTBK4jhGL6wAS75qWcIM1U4/kmaIwGYyni0pYeoJGRjfNbkPbKaoBFbyg2Q==
X-Received: by 2002:a05:6000:2307:b0:408:ffb9:9f62 with SMTP id ffacd0b85a97d-40e47ee07eamr13272578f8f.29.1759165664670;
        Mon, 29 Sep 2025 10:07:44 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.71.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab61eecsm232769755e9.20.2025.09.29.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 10:07:43 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Add TMP110 and TMP113 devices
Date: Mon, 29 Sep 2025 20:07:30 +0300
Message-ID: <20250929170730.8285-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924-grievance-crisply-8c7da95946f1@spud>
References: <20250924-grievance-crisply-8c7da95946f1@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 24, 2025 at 19:12:26 +0100, Conor Dooley wrote:
>On Wed, Sep 24, 2025 at 08:55:39AM -0700, Guenter Roeck wrote:
>> On 9/15/25 10:18, Conor Dooley wrote:
>> > On Mon, Sep 15, 2025 at 08:08:18PM +0300, Flaviu Nistor wrote:
>> > > Add a compatible string for TMP110 and TMP113 devices.
>> > > 
>> > > Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> > > ---
>> > >   Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 2 ++
>> > >   1 file changed, 2 insertions(+)
>> > > 
>> > > diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>> > > index 96b2e4969f78..840b5306a8cf 100644
>> > > --- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>> > > +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>> > > @@ -13,6 +13,8 @@ properties:
>> > >     compatible:
>> > >       enum:
>> > >         - ti,tmp102
>> > > +      - ti,tmp110
>> > > +      - ti,tmp113
>> > 
>> > The driver has no match data and no compatible based decisions added in
>> > your patch. Why is a fallback to tmp102 not suitable?
>> > 
>> 
>> That should work for tmp110. However, tmp113 does have additional registers, and it
>> might be desirable to report the content of those using debugfs. Fallback for that chip
>> would work for now, but that might have to change later if support for the additional
>> registers is added to the driver.
>
>In that case, only the driver would need to change not the binding.
>That's fine though, of course.
>

I am a little confused and I would appreciate some advice if I should leave
the series as it is or send a v2 only for documentation and Kconfig updates,
droping the binding update?

>> 
>> Guenter
>> 
>> > >     interrupts:
>> > >       maxItems: 1
>> > > -- 
>> > > 2.43.0
>> > > 
>> 
