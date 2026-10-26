Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975171;
	b=EucCvuCLj3xWm8e+OXltncM4YPDQOYRWZI5Skk/8I8SK2d/TMfY9lo/uKZ0V0sdHMMnp
	 nesZlbISr6Zh6Fu4Um8yG6U/nvN/VecVOaQSyB6mmOcZ1rgfuB0BbYMvhJsn3WVhQBcGN
	 4YmgNHFkN1QFxKb8tL5tjgv3ySKYtk4LeSSyZlCq8hkzzOzAiJO/on2dIZecEnjXKdEbr
	 pTe2oQDJFi8FhWVExnbE60lek2Kyc/LyLwWUOBtr02HXwNyztdEBKgjWVP7iv3bPYEFXc
	 l4RUxuaYbWqo4iWaRsKGNFUqkbJftMfNwS8GRXkUHLoUTd4Q6gLzeJTNTcp2pFvVUgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
	b=E7w5Ls/Oaj0P6VphTLH0nnKxdKj5kkYYXcF+79Q8/cfq3+JHt/6ZNNTowzIjrcylnWcT
	 c+gRgbg7OkhUsH+RA/5PuQfzTn2bhEuuNc/7jKKoo6CIiXNFsFU1zph8WniTSz5XQtzWo
	 Dg9UWr8Kft2W6eY/HTDa666l1VmObvUE2/G7j5qKZQUPlZVHyiHolbWFICeXBVVYAGCNf
	 MXK+yCADWK8xOMQRXk0NlcRYxSGA1kgtGayCMpUzcnHMNs5jAsCMUStTtQdiW8fllyQvX
	 WE58STnSrkWOIQCHwQc58cNjEPgtgDiCBDXRlnxm1WI/CNEMH3hzOj5ObaaX2W+PcpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517B606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3517B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aev6FLvq
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so14514245ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975170; x=1793579970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=aev6FLvqhWFM+boOuyY03GGCoU/Ug5rjw0gLbtxXmNUylCWl3wfkL0WbSaldF+nyfU
         dfvFllTQm0hL30ZePD2Ddt7E+oAVnPt7EGStphncddpuBymNNzzifiJ/WLUb8DrTIRgG
         ZXVC/L8JOm4bcf1k4qgbqW4CYmDzr+xkq++Ken+oidKtaNs5J/htPXy/l06AQ1RNQ7Hr
         xPrXeywuSwCRiP7EIwWcIIf7GN7gxO/pwvyd6dEOpAn14aIv5TlzkyZOg6AZSo4E5TwF
         3J4DdskYcOlJo7zmRe60MwRo6qiNpgTbJkU1gkhiWxDHzAd4pEqSUHY0mFMbK9fzjCrE
         hEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975170; x=1793579970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8SfPrv2RlnRbia3emcvDOga6vE1rIcfI15DHeIm71RE=;
        b=ZNx/1x5n1wUSO1RykrQTkM8aatHvkJgeQ8LPx6iYoMfS85D+nuxAbV1aHcTeceplzI
         BSKO0FxA6IyhHS+NVTb2ET9LiySXWMhf/LLe27lO3FkzgpBy++iSTnPSYxAvvWRPsR5Q
         gWbQnqBxUN1yTMxDtP7WUv0imm0wUnBK+p05qPhu3qWauV0jhEIGODDK0hYBEqhCMjGg
         HCfAQA4Nxo7Mb2CskhEXb3JTKUaHG9F5g+hW2hraHFfWcQ/Hbcwog2mrqPAHebm20snh
         uIGTCRUoYBy8ND4UCII78A6GQGz60FzRJ23xR6W3vxGTCv+mfmvgRz+JlxDJK+F1u6aX
         zWyg==
X-Forwarded-Encrypted: i=1; AKwUvBxYrk9EuU6MkA0YWU0Ib8SpNbIntgD2El2Ptmw1Eq0S0vCS3ozJWJMuqhe/0fjLeY6IEqxiclijZEvZ9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIkM/mWlS+HJ0XM1gqFngEfVz+EVZfVJKV0sYQHLVwjnGFXde3b
	UsRhHMkXtfoiY7Aw9b7MdznkLTqfwixQVLezNMfqYcYmjzW5uYxJPNtG
X-Gm-Gg: AYBFou1Au1/LjYmSOPdByJ8MM0ygL5mJ/KNgDYj5KNPv7XVbKQ1DCHYMmhZZuqVuHq2
	EmQKLPg+SkRB3rDQPSJKeVQw4RnjNdfrzNnX9xNo4Xq/uyq7UWGPGfzabdj9CsLH9Z1Q2hp63jn
	m1mSoPFqHxYRUXeG1eAlByNuYAsnjupOOAozPuuzn4FCEJBeASpA9+zLhFBGub5wP4LH/7h40D3
	2yORl73qa/GUOsGd5XFMFT2yGWnl35Vx2P+Ku05YMDYX1wsFGPTRgzdg5fec0dOIRSKUVLVzhgJ
	x4H5IsJ0ieXvGLn512EVDcqyUW8By5CF1cuhhHSA6wmfhFQmdTQCXc9CLfMWOORNp2y+yjgIdjS
	ZPJ2jG4l4b28piDA5AsENEzqEQgo+884Y1fG5AEMYobT9q7nOc/aMfaToi7Murs1FJA2KGBh9Hd
	0D8wMl39HF1QbG+HsMHd2/DPbrGXb28kQtSkBtv4N7aZiyAKO34F7tT18heFLcdVavLsODc5e8/
	0J6nz+gw4ioaSzM0Y/zA3GP5T/hwq8J87h1BOs4kjxqWii0A+TTyvHYpOk+EWOkEBopag==
X-Received: by 2002:a17:90b:5647:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3adead4c290mr4014353a91.34.1792975170550;
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa96sm6135134a91.7.2026.10.25.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:39:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:39:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus/fs1412) Add TDK FS1412 and FS1525
 driver
Message-ID: <87895a38-c819-4193-96ac-69be7f548e8c@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-4-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:08PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with PMBus
> telemetry for input voltage, output voltage and temperature, plus the
> matching status registers. The FS1525 also reports output current and
> has an over-temperature warning limit. The FS1412 has neither:
> READ_IOUT and OT_WARN_LIMIT are not in its command table. Both read
> "KDT" from MFR_ID, which the driver checks before binding, and are
> told apart by IC_DEVICE_ID (0x0c for the FS1412, 0x19 for the FS1525).
> 
> VOUT_MODE is read-only and has bit 7 set on both: 0x98 on the FS1412
> (exponent -8) and 0x96 on the FS1525 (exponent -10). Their output
> voltage limits are relative to VOUT_COMMAND, so 0x0133 against a 0.6V
> command is a 120% over-voltage limit on the FS1412. The PMBus core
> converts them now that it supports relative VOUT encoding.
> 
> On the FS1412, OT_WARN_LIMIT answers although it is not in the command
> table, but the part reports OT_WARNING at room temperature, so the
> driver hides the register from the core and only the OT_FAULT_LIMIT
> based attributes are provided.
> 
> When the output is set with an external divider, the FS1412 reports
> READ_VOUT at the feedback pin, so in2_input and its limits all scale
> with the divider in user space. The FS1525 reports READ_VOUT as the
> output voltage and compares it against its warning and under-voltage
> limits as they are, relative to VOUT_COMMAND. Its over-voltage fault
> is an analog comparison at the feedback pin, which would read below
> in2_input on such boards, so the driver hides VOUT_OV_FAULT_LIMIT on
> the FS1525.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
