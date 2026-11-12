Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445554;
	b=pJkcLrItGNIlGBvZNh/BuZ3yv5olFDAj5NoN04cQqPWJ+mSNuJAyb7bX+uTEG9UW5rUQ
	 h437UPVHPPCFpl1cDnn6qfKNlb9ls24VEalUeSKV1O5huIg7uVK2q4+nXtv84C6PjI4ZP
	 pjjIc2QlzLUsnhRRo7JqtI+JVV+iI93EFRLS9qc923no0R/F+yNyfuw4GuLnd4rpsa7Il
	 AFaR6PRrYky1WqwW4BoW2ZUyqe3857AT97FNiv/9uq6DOialn2s1rc8HekoL2W9+LQNef
	 DuYlsUt7u+KEw02kXL8IrpFWkR9SPw0qiTYlTPzgHM4eYrYQoKwKb0KEdOiuF44adgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445554;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/sWknFzfkMJCdtQdCu8LZdg8fGGk1yHJo48gozQsrso=;
	b=leZAh9vPFIyNlzCFLv5xLxXFFB0PQwCYCVrZNySS8kyPN6bEyOMep0qsvf+mh3bNNgvO
	 VDf9OsbTvN/w5Cyua++PErpylhVO7Tjpjuz59OXl/ytI4dltcs3145TsHMT1kwdAJzVqa
	 sbmz4GvsviCVOq/BU2GlPUqe+bV0x4Wah0/yOftJPG8Q06YOb8LbXsOx6AMoX93STZHwm
	 /uBzki6VIyHKupj+mi5+7yf5/IunUTm4plZApwG+l0W5n1NkTrIXGldbFxQ3C6roHG8Kj
	 3Alq8sQ5l67elBTZ9Ball2vQNPXz0dsfBJuSj8isJIJ1+e8i4PZnuty9L7LhioKxl0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdIFbPdo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E4606A324;
	Thu, 12 Nov 2026 01:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdIFbPdo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B297F1F00A05;
	Thu, 12 Nov 2026 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445554;
	bh=/sWknFzfkMJCdtQdCu8LZdg8fGGk1yHJo48gozQsrso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PdIFbPdoz9GfgBcwbEO6KMOrWh8knP51XkN0XpNrfpXqoQuZEHesZmKpqQ/vS90TQ
	 TEt/QHibTiRztdr7fqM6giXyEqUVmRNvmqSqG9kcuILRUQ3MYc32ey+OSK2dfG00Xe
	 apxPjIMeSBxIgi30plBUeaeFgY+1yBWzlBVSiiKDgE191ofWpSklbF4j/VoC9C3tj6
	 1bsVFSB8xgwt6dlp4UKQE1r934cJmvM+Q3MEjTMba7+xTJejpChXIRP9bdfzBipk/v
	 41AHUHvKOKg7C2ZXcZ/ShoxOwsELLv6+rEp2ZeU77pgHwKaaxmHfMesuDNyi+bNE0F
	 Tou/U3CLPHT6g==
Date: Wed, 11 Nov 2026 19:05:51 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 1/4] dt-bindings: hwmon: fan-common: reject zero
 pulses per revolution
Message-ID: <20261112010551.GA3769976-robh@kernel.org>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>

On Wed, Nov 11, 2026 at 05:12:45PM +0100, Robert Marko wrote:
> A fan sensor cannot produce zero tachometer pulses per revolution.
> Add a minimum of one to the shared fan schema so every user rejects
> this invalid value.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> - New patch: require at least one pulse per revolution in fan-common.
> 
>  Documentation/devicetree/bindings/hwmon/fan-common.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
