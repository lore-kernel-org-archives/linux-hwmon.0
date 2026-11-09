Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215526;
	b=jqwDP2dd9eln/NuDV4EbvXUvVxQQhbJGEhkOTWNgESYYBMkCZ90NzJQ9M/CoKBzAHsHc
	 pkSFRhueGSET87AfOEWIeAFRdnkkvA5CiV3ywlW64ohM2Mms9RK9stQRC/YC6uFaBBGxe
	 eCvtvW/AzibTpySYVxZZPVbyrjhAtm8vuQQrRbcgI+vcJW+q078GbrK3hLSbTBGB1CGGj
	 xi2L30tHFqifgxEGFQSPbPU/7nESgOgCA9pLWUzPVkpsRP02ZcwxOCw8sh/kxLTzgR1IC
	 k98UYYO7x8ZAHdHBVfmm3Bg8JU6ooRQi+CIeyjC0fjhGkEYhmHWsJAphAgULFWDwpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215526;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=zBPWhDnaDeGMYRci6A1TaJ3pR5WRujzO+eZr4MALPHg=;
	b=aaYgDF6HfkLi8Zmn9F/LiloCadixHNdVboW7TFvolIkjSeX5/6w6WrXLXReW4Tmms1iT
	 12ufPZTjTmsOTHiOUi5/dMCTYggpCfm5Mi6KipiiZFJfVRhoZGjEtrcOhGEA8omm0GILi
	 DxxGHABQO/d6bGtWDAsqkICcGD1VRiVo0NwYrFEvlfnSqOxDmqrk0iUrgd6f+OO2gS7Ga
	 jB7dWz2B8p3QXZCxvIjIQnmRWIAxTUOuDT8AwNbjyTXvCFv1VYkSyS1GUoNYIx7JaVPZO
	 3Gq9oZQDOPD2TQfEKMO3cnr7CjGbhkO7AZaRFj6+QVEqnT1KI+l/w8HFrNt1GmBeAyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vkufifu6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 13BDD606A326;
	Mon,  9 Nov 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vkufifu6
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BC31F1F008A1;
	Mon,  9 Nov 2026 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794215525;
	bh=zBPWhDnaDeGMYRci6A1TaJ3pR5WRujzO+eZr4MALPHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vkufifu60WwY3l83DEMFqhiUHcT+Oc1F81Q7S/bW9MluBjHGqxmgXfIwkrl7Duxha
	 qZXHKMyB31tbzH+BHrJOFvucY/p37rrFyPIVrQkj5JliH4Rb+Pg2A6cE5m9AlEUV4z
	 TiWOHLc28EbhvY93scGIG5JKvaLL2VX4R3qrmLDcsGEZZBd/wTYCsv6Nks32umlLPX
	 Ypug72Xixz1idf9H35Vc/8QMzmyK1UilazA5+txGWME6OdCrrrgRgP+30pneEI5QBq
	 Ra7jYsaXq4PQ10iZ9MfRiRzmuHnA6OQ2ctSgXTFM4yABDqeu645fgeHLBi6YrJ4pv1
	 eMmEKBgBHsTXw==
Date: Mon, 9 Nov 2026 10:12:01 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4284
 Swap Controller
Message-ID: <gwgt3gujrjko74b72kwb7ywtpc4ffphx4bimkzmwx6nz3gbvis@4zsojuype6mv>
References: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
 <20261109-staging-ltc4284-v2-3-14a270a38f7b@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261109-staging-ltc4284-v2-3-14a270a38f7b@analog.com>

On Mon, Nov 09, 2026 at 08:56:19AM +0800, Alexis Czezar Torreno wrote:
> LTC4284 shares the same GPIO hardware as LTC4283 — same pin count, names,
> and registers. It is already handled by the existing gpio-ltc4283 driver.
> Updates Kconfig description to reflect this.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---

The commit subject is still wrong. This does not "add support" for
anything. Say: "update Kconfig description" or something similar.

Bart
