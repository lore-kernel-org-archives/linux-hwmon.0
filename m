Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048247;
	b=Xid1QuMs4QHHtSq8HlV/A5vwOJeIoYYgIMI3zS6aLfCsQwV6ipsqqkZwjdAJOyYPi0MP
	 jM6RTYnWW7Lz/fwfY+9boIG9HTO9k9fHGx8A+ON8wtvLAB/Cgfs2sT5VdpQku2RqWwx18
	 VhgXIWxXRVlMH0GMy6P+5rVPEPZ7QXYJQQerLXnFdV4VJ0fR/gOYi8o6eAUemXRJzlQII
	 MTBMjHnZoYZbVKOOr9crimOaDLGympHT43mBzLELKm0FIMSoRDQr8EguwV2v0Iv8SPgBo
	 a1qac4NsuDCAHuHFzae6aShq5KOyF6vPw/zyCmo5mcx4A8lz+Hza79JYk80GpnoCb0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
	b=jkPVyfyaQFUQHkFj4U2oLCVCppDhdvdCYny11tX2zwo4UZMHV58ePJmQd7B3FxPkrR1N
	 FwvQ+J9aPNP3av239OZhYucXd/wp995B3KOgBGCFfh8Y+iVXSPgzcgltf9YE+a6s3GYT8
	 1y99ITsM9izhiWwoTYI8hcsWjYWn0HLy1RpDhM5Zh6azWN2JTvsVSzJi2P+uePO4Co8+i
	 O/zjfQJHhqoqurstwfOBfMZC4/yqDxiOFZimvm00GtjrRoeNJmLJjXOu9elA6ia1K54UD
	 LcRuHWbQqLtVDrHpBPkdi591PBo9q/e88lvQ+2RiK4TFNYwNBB7jD4JMSn0i/CXlcdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SVKvyrXn;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4AA606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4AA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SVKvyrXn
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5636858eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048246; x=1793653046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
        b=SVKvyrXnxaxe3wPPZZ1ORnZQD+FmJn3puBBneOzZPNYO1atUqVpzFkYCg0tlekPSbq
         oec7KSDZC2EmgC2lgU2WejVpB0D1owomNjdecD7/lAIj5RSVH9xPNz7fZcUWPdhhgcqk
         PQn4cR2OpyfjawPUs5XnarLKpLJpSsqe2j6y+MUvVNDbhocTXH47tMn0EtKJXoqHUHpq
         fqrQPAFSOLCDcF3MZ4MuoMas2Yf1nPqkcZDJFzxIxs4Jb5pedpVbtzQWyYM3Kl3QEJKe
         V9wjgLUNbTDJGYc2bUBb13eU4CKy+/VYxoR1Vy2zn5cFPEHNvcXgvkfpmLN3YR9LItaC
         w0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048246; x=1793653046;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVaw9mrhCO1RVtyfenFMqeXyg1oQSWJjgFw7LeR7BOI=;
        b=b1P8fdKNOkVqNuUbJ42O0AstdWXOj8k7hcSHCVBXYMPK8vLazOtpbQV7XJaZrxThpn
         t58vCseG1dB7/KZ9R38mZa/ET9A9DCADGWDMnArwi2uMB4ZJbJRQ3FD7WX4ZFnNgHq4s
         0YvWKlGn1zpxC3/6Pvjrlo0zSaMU+QN3duINsM4EZ1+gKMYdEnpQmnzBKGQt14xn8TUR
         G/RGw6JAL6k6h76wgD1t9mCfxsVkbO7gm4ONif+AQY9Eq0Ct8WyubEHaXxbDUhDNYDuY
         SbAIFhk59v92rUHqAAc0i8Kio8is1myhpH29gRBpOncOQzhBNObc4XTm1qt0q5SkRG4r
         boxg==
X-Forwarded-Encrypted: i=1; AKwUvBzT63fVOjf2U7QlwS4lxUGaMTBoE+EVP4GjzjLVeZVgTliOlaiUYB9WwEdQdH+KdDsLkUpeKlMrqw8IOg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJIscI42NQaUTc5mr4x8VWGKvTWwYMlxBXKuDfOaJY9ndFRu/43
	SabR5JbsKRdNrmdtiO+AlSkCkp5GgjfSP3uG0AO7Fw4245j7l/9cWQK7
X-Gm-Gg: AYBFou37Of5jAZ0YcgIY/jFUqIKHoslXsX6cdCcH/T4hh7QK5fA6BeEIFpKCJSG+k3g
	0fNXHYhtaGnVY63fDnXE5Z8vLasf8vHnJdmzotJyMqnDHI33J4/dCrWY5Yy3ipCOtVA8CY+uAMj
	ALFx0CqqLirag56tdxlw5phOhlVXO7r6UoYIe/N3aNOOxlyYlVzflOdNXCLjWOeBxK1Lqj0QFgl
	Xqlbuu0uV94FwW/2/KpArJwTSjXaYrrfzpDQaqF9RT7XxJddbwpCfvbDtWRBEO6a46w/mPxMD9g
	7bv44Y51vuf1W7Ft4hSBSnvT7csUeH0ApKDc3y1TGQ2RoczUDJE6+0x5uIGIkjL+IOf6xMxyBeS
	FMmAGw+7JZPU2dlPFMg6QZAsQe7TA/wq5EzKMOPaQ9l8bDAmyF3yNotaL8I4DrX0Qmy5C5u2rcw
	evX+9b4jLLH2CCMy1iApaZBhqdpP+NzmFKTNunf3DScnPfaAw1Ni5HkdnZaGSrrLMMJ0QLE0swG
	GJ44PG5LSoOa5v2kYcfm5VifSWxJOXHTNavM9kEMxa50GFgnIvMpj/EGk0WgthRUvNBtux2X+0e
	5m4sSoXkqJiSLko=
X-Received: by 2002:a05:7300:7fa3:b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a0fecda6emr1183915eec.25.1793048246156;
        Mon, 26 Oct 2026 13:57:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm10004470eec.2.2026.10.26.13.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:57:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: Re: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
Message-ID: <481ec234-15a1-45df-9e7b-9c280ddde9a3@roeck-us.net>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
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
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>

On Sat, Sep 26, 2026 at 04:11:20PM -0400, Alexei Solcanu wrote:
> From: Alexei Solcanu <alexei.solcanu@pm.me>
> 
> On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
> pwm1_enable=2 only returns the first fan to EC control. The second fan
> keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
> fan control tool that exits leaves it running at that speed.
> 
> gpd_duo_write_pwm() writes both fan registers (pwm_write and
> pwm_write + 1), but switching to automatic only clears pwm_write.
> Also clear pwm_write + 1, so both fans return to EC control.
> 
> Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Assisted-by: LLM
> Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
> Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Applied.

Thanks,
Guenter
