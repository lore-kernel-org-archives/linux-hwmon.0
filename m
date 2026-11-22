Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364637;
	b=5DdC8QMJaa/987T02yRpXfFOZfiFSUPHjS3IruBZMXylBjQ3kB4H4KLiiFSlMEFv7LKn
	 xWbzI5fyEnl4XX7tzTIaj+gwwL3S0bjFmp/rJTpc6h0Rxt19E/IcQGCoHf1vBJy6jDXMG
	 hmOytlNbBoqcPRrGzAfk5sDbg8Ar3BD9BUDBRKcF2uUUN+VzKxa2971uzctO4PPW3hLDP
	 IoTpXnfm4Cv4Pcp8B1QVi47WknOrCkndc2WHrm41RKj72eNW8XC6gkORQQqzZMUjwYIlZ
	 HSRyJC/kegkZ/4FeUeCwtwaw9o9WRztVTWlwfHY1HQzPLRGhf8QuBD95RsIaEgGL5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364637;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w0h8pXKjzzF40BXUDPp8ZLdlZnZFp51wX4h/IVCKhvE=;
	b=FA4IehJpvyouKGtaCGVi1aTqko2yUSBwYpm5Hcg9EOuT7VI2DcAsMPLync2rSeS1BsbF
	 lqB5Awd3nrxU+Mt7ZtZtWjB9HbN9qaE8cjnL+LMR4sODhnnl8xiO/iQKEnhXCtlWf4l7d
	 AoL9cBi5SbrZvB4wBJMnsF6UgM+HTbg9DvypJPgmKw/XlLBfRjN9mxjOCoEdO8YmBc8v+
	 CqPBc5GSYL/wZO6t4hs5BYo9UGnyFq8FHzscnSYdrIS6dMTC+RWr6iTTD9fXpK3CGwOgm
	 LPL7R+GMh8fQOOPD0LENygEEhnxSLmDIilhKrsN4FSHDWM89jjjjTiQ9GaJgJIydogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj7DjY3F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F65606A320;
	Sun, 22 Nov 2026 16:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj7DjY3F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5863C1F000C0;
	Sun, 22 Nov 2026 16:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364637;
	bh=w0h8pXKjzzF40BXUDPp8ZLdlZnZFp51wX4h/IVCKhvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oj7DjY3F1FlhJApmsyADy75Ufeb4UkHvp3Sctdjw+dXz+4KeytXvLYfGIfWx0y+7z
	 /lNokWKlZTQabdWO60KoMOaOvaqsV+l4NuvpNb6C2WgI84IrkiK6nP6cgwx4i18dQ3
	 cBFyLLsiO4KjpLLgqRv8MV7UpnHx0Q4Fjxzsx3W5XF8CUJJy0skEBx0gVn0YWVhH/o
	 u9iIGrTc9qz0QmBJO0V/OuazD1yNM7e/CSV3gbEgOe2FMSOF/EHM3/Q+4nYIeXw8Wu
	 eyEHpr46FXi0P5QgZyx8X7xj1SU9IMy9Ht2oKmw+o7ckIFfEBhAafIDsckYrZ7zwyy
	 WjGfeFPXxTPtA==
Date: Sun, 22 Nov 2026 17:23:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Message-ID: <20261122-organic-tacky-chupacabra-5dff9c@quoll>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
 <20261117-staging-ltc4284-v3-1-326bb844e08c@analog.com>
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
In-Reply-To: <20261117-staging-ltc4284-v3-1-326bb844e08c@analog.com>

On Tue, Nov 17, 2026 at 04:26:48PM +0800, Alexis Czezar Torreno wrote:
> The LTC4284 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
> 
> Note that this device has a MODE pin that is determined by differing
> voltage levels (VEE, VIN, INTVCC, or left open) and cannot be
> controlled via software or GPIO.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 56 ++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
>

I don't see changes in the defaults. You said there are defaults, so you
need "default:".

Best regards,
Krzysztof

