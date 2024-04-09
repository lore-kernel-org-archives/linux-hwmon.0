Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6086242
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Apr 2024 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712663422; cv=none; b=pzL8WKUPuAO/tl9eRkXtbiK/1uHqMhWpJ7o8yFS3fsaDtBCiiHfxm4v8t82/QmDBuhyoMbeDqwVK5nOhr8vVrcPhJOv1weDGTzvq6S9vtW/Q8uQpgVsbXloVRGJqjZa8tt/IUbNsuPhY8Lqupi2qE0onqAYNvxp7m5UsmYthf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712663422; c=relaxed/simple;
	bh=9rFyK612cM1jcvl4RRwfyaHfPNb98GyAZs3roT0Nqd4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NsNxUIn3g4O0AyqEwIkP8KBhXGvF5vnPMkh51l87riBNP6aYKpAbjDrD7SskSqSpB9qP47TdhlHcUlEEeqi9WiilyzU7DTZAYq8oVq7Taa2AIaPZFbBVzlru+JABOISRijfb4DZ7Lzlnls0dbtaH11XGHGDfRvSZ6p+Ye5dub9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=N+uFcisz; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="N+uFcisz"
Received: from [192.168.68.112] (ppp118-210-182-70.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7BB1B2012B;
	Tue,  9 Apr 2024 19:50:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1712663417;
	bh=9rFyK612cM1jcvl4RRwfyaHfPNb98GyAZs3roT0Nqd4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N+uFciszbuJ6UrT+j6I0JFGCdyohCGr6NMFYXkkHFuP4OdBUppqNzgghaiYqP8oP7
	 ae8kZsO3KXHZYAgUp/VxiJuYEbjGqI8cGzmjPddmNPG09WZjoPHJVFr+9pl0xK04DM
	 RPsa5tn+NtLy+EOzEQDyK5hexBA2J6gcjL3f4diyZBMeC2OJ0onMJGxPLul2zL49z1
	 KXz8A7/hzdGRjkQxgp29llG9zoTyFvybqWIcsqyDrgfLrUmHEAHO09rI67t/HUqzUH
	 8d7DxvPVnLp1UDjIGhkFbVcx4aIC7hnuAj81biu28y3SFWs3+TWMSQ2Y/7KQ53ODl9
	 y6xSMR6Ac+vyw==
Message-ID: <26cd92fbbd4fdb519434dc5420714b1b20b0a94d.camel@codeconstruct.com.au>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Convert to platform remove
 callback returning void
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Billy Tsai
	 <billy_tsai@aspeedtech.com>
Date: Tue, 09 Apr 2024 21:20:14 +0930
In-Reply-To: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
References: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-04-09 at 10:55 +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
