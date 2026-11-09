Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221613;
	b=2XVi9RtmVJHuh4qQ6FEdj5NwJJJx+x5/4rYSpgThrj7NCFAynxpU+OSTSnZSEqfB6zw/
	 A0pmj+xaR1zpoMc88IZYUqxH/X0WOh98+OMj+D8fCM80KUvuR5/u/xrgoqdqLt5UrgyS0
	 PhDHhIAZ3DYntYr8rZ51n5FTCjaWhBmqlknaTcgXzL9QSLZqofQ1pekY91wXLmq3XaYi2
	 gDd9+aho6NNMlJX0+JzKPD/l0ypbDpISVsGNvSgy3cOuVgFi6xHvXJSFnO//SowE7uLV+
	 zP38Mtgac47l0g1liBnp2xD65GTV2N6LEyl6cC8jP5o/WDxYMO+6Ubahsi5qNfXNDrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3AIRpIljHbea+J/FTZVjneRc9bQbwWXEyjmRwJXb0x0=;
	b=rCS56ItneAFA8kaiVEKTd7D801Jht/1Akf+4rkeMraj1ZvdfY5AE+yMxtPzSthChhw23
	 TOkyd7A/MKYqAUX1csdRUKj9nNXpd2eyFa416wJPCm9Zmbp0wXxmbNCvaZLWuH7q+ObBz
	 CPWBF7PhqGuiR3PHa2IjJ7tlmdea74CTaap7330kIosK37XdZGCONc0fDHbV4yw31OgIO
	 a8SeHFgb6LVcMQ6nHZgJSXxxz1SyDMUS3vWsFOO+EqSqesXhiO6jm6DY1seNkkOe1f3tM
	 8HlY+tFm55igqPTwKUHg2tm480KakxlO3HDRXhsOg9T+nM8oLec8jPXta0bdhvusq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9mn+WfE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E620606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j9mn+WfE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751551F0089F;
	Mon,  9 Nov 2026 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794221612;
	bh=3AIRpIljHbea+J/FTZVjneRc9bQbwWXEyjmRwJXb0x0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j9mn+WfE2ls1OFjhivVrvECb4dpLeFfz776LbKFL+U5q2iiw0/EsdvKFYEELnWAFb
	 HUwKC8AqFp2F3jJ9/l0AjPsGw0V6MLmnkRhePz4UXRSXdEzqIP8DTT1QYkY1BPO6hf
	 lbknGkGXQYqURrt2WyVqZCFYxZiA0ib4gXfBYEn5xf5aYLUmkCiGT2IxEzSYs5iYdA
	 EUBANF9zg4CBpeoeMM7kkfQcAgjAkklLWFezcqxUxsOnkNlLQeS8ITsjxOewuJbZb+
	 NzV6qKHQ7YAJlrDbWuevf10WStieXipTSn1HfN35JX8neTjZ8i4geeUKbPeViEVA9/
	 7CH8n3XFcmsTg==
Message-ID: <sashiko-outbox-204853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: Add HP OmniBook 5
 16 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rahul Pon" <theflyingrahul@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109104914.1534-2-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
 <20261109104914.1534-2-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:53:32 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The HP OmniBook 5 16 (Snapdragon X2) has an embedded controller on I2C
> at address 0x76. It runs the fan and the keyboard backlight and reports
> the fan speed and its thermistor temperatures.
>=20
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109104914.1534=
-1-theflyingrahul@gmail.com?part=3D1

