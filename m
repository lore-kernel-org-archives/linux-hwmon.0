Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025327;
	b=I9PhEE6AW06Yh4AIhGuhaulDPjB155UgtpzDNnUeiDVdW02u2bWoswgIIb0Tk1AEw9ve
	 CIvzbcp5pv06hGRzmqjG3fzRGK5Yfd6lOmIk0tAOI/dG8ngHMoPvVZpYzmwBpyr5YWsZZ
	 yim4YK5Ey+FYDxklCGJl7p7jjFOPVoALzCVMoNbWz99t8AV8b+Ba9yGOkutOjeIFKpGB9
	 8jxUr/FlahxRg0lnNTlOjc25WjWrZUsqPzND0Xy0dgtxTkaZUhqzuUDlTj/jHtKQfkIxZ
	 MPZMQKXnZrS9rgH2A74ooOA2ZB5zxUZdQcJpgli4fcx1O8dltBrV3Nv9yR4XchctITw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
	b=Ab53PSVsp/2+LOrgkM9YwCVb/bQaOj83mdn19RQDbogSPsf23fzDTgbWhJ3ToTL6JK4Y
	 uacm+gAPFiUV7Ed7TxLGnICdjM8m8TLOU0oVdJwzK5RT+tH2FEgLCC/TKhmqE7hnN8wKm
	 LoHmNV9gBszUnMbc0NZzlW3TcAZHsiCvrVA7hvW4d8goG7rOu8lcgYZefT1ZM+pTAEySA
	 v4zKgGrueERHmQr8szr43VjEtF57GJLwRAhvYbgXeEVqEsiR4gSA/Kuq7Nwrhe0mDezQo
	 GR/TOKhUYwIC6EBf8onGHl5XX8IYEKSDjJlBjM2r5VfWIh9ryLpE73kY9TEl45YkIXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xr29qaEW;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42604606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 14:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42604606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xr29qaEW
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2090272a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025327; x=1793630127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
        b=Xr29qaEW9taLTBbnUhkAw6vv5m5lSMnIu5ELG5jiyxneo3tXFas5X7jNdaXsrNbMe0
         gSoyn8jzPH5unOZQLYVGoiHpgON9Cs/NgrQfPsoR+o20os9K3nskmJMeazUgamyQIeYx
         oA0ty4rUOZp2+HRBcM1UcbX71kfgg6L0JxQHe7QUesS+R0eCRMcFo6VqNEwI2eSwqJNe
         QEBdyRQgIBZbSO7JpMhW5I0tWjFv3qSRKYbsNkVf2ernB3DtRlKhDU+hZg1eObSo4tcA
         j3CCnWesfhY8TxIrlCFaY6eJhMzrzvlc49SOhxZ41yZqPQSAH9RP+Tryr0eb7eG3VQis
         e7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025327; x=1793630127;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nXYf+vZdz1X4ceYTBG7b3k1LMVkfZE8bc94nKl4oNc=;
        b=nNvKlQxasMi0Rv1XJoJTwZFzw9vJVwkJ7VmGfLWrUqE6hIj1a2+9KsvDmkeJZOOYr6
         tvUIxV7fn2/Q9KGab8o/OfkoxA5KShnecOoZcJ3IwB6igm987dBs1yrQWl4C1n6O7Kf0
         daqtuejamQ/E/h1JA6SbA3QrqGNzfeJiE32sdpfNEx04uvFVXryqZX9rYUiGnUV6qw2X
         hit8b88+l2St6uB+w9gz+RVBPPlNNFS2hf18nwZY1HHG6n/zipmz8iAzAf8soIzNSo+T
         74cmKNvtQTUwnASBL85kwzUMqxTK/wCKSaFD1sBhJLs9J5Av509lttmFU8wERGPxrgRC
         OeUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxsnD5p4tpu4dM2vdfLVPbg7nvvqsSj7LMfCTtOgIrQrATKL4YlTZlnIZ9Dnm9OGtCijxdNS9ynoEIJQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI0tWykFHDV/wo0FXTkbBa9N4ZUY3kFReBkquWgzzs6B98dCWm9
	YoqekT/yihn2Nf+5v8L9kAJ6kJ8KYZ01rwzmaGJn/7OurUEC0lUoxfR11qBPpw==
X-Gm-Gg: AYBFou33qw5jujcBwu4vkbuWuOH770emH3lkbCLBDJZ5COf4JL6sMOiQOO5eR8w94ch
	Kt2wA5N1IQK+ceeKK7i0g8Ls8xiHBC1qQ8dnFoyHTSq66d9NmNfPgAdb5qVQ5Pp6bcKyzMv2aey
	SHeYwVOQsd3A93vk5vDoRHYoW5Qq+mBmdbq0X+3azB3BIf0haf9merkUvh/WIk8maKSvdOaRUGn
	JlsN0JC/qT0uMkHHin+mk5Rmx6RNZs+7DO1fYSqYH69GEoHtWJzpQW8FRVGUWJjnnf+hng9FND5
	KpOQv6noKCXZEKVhyZH1vV1cYa63nuuG5cWEpufELRBMGqoEJUmE7/8gCpAkumSScGumU4p4+NW
	uJrvZVweF2MdXchh6SMxJjOfbX3Qx+PZkWe2/aHhh2c3mLH8cGAC9KXMbpaJwmLBvWefF58OFU6
	9zUm8u5PXDlYs0O/45L+ljeKc9Z4gNuipCnSKR7pzr/CPrpk99Sh9890/eYH3hsJVhPM/8gbFxx
	I5SAy7n4pglCY+zPaGjpwVeAeIaozujfsI+4SOKTLYSvKDqTvwaf0nI6Sk+OLFS/XjNTp4=
X-Received: by 2002:a17:90b:280c:b0:3ad:818f:3daf with SMTP id 98e67ed59e1d1-3adeac05c76mr5804256a91.14.1793025326567;
        Mon, 26 Oct 2026 07:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32e38sm9259927a91.2.2026.10.26.07.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:35:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 07:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
References: <20261026003918.155321-1-pmazzini@gmail.com>
 <20261026003918.155321-6-pmazzini@gmail.com>
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
In-Reply-To: <20261026003918.155321-6-pmazzini@gmail.com>

On Mon, Oct 26, 2026 at 12:39:16AM +0000, Pablo Mazzini wrote:
> The separate hwmon cell enables VCOM at probe. Report the temperature
> from here, as the TPS65185 and FP9931 drivers do, and under the chip
> name as they do: read it while the rails are on and return -ENODATA
> otherwise. Boards that need the rails on mark VCOM always-on. Drop the
> hwmon driver.

This is going the wrong way. The correct solution would be to convert
the hwmon driver to an auxiliary driver. I am not going to approve
this patch. I am not giving an official NACK (yet).

"Other drivers do the same wrong thing" is not an argument.

Guenter
