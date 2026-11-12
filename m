Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445567;
	b=tp8kZQIyA33ZEFIdRbCl2scMX7hG/46Elmn07yE85kp+NptzTc2LihIFiFaW2n5Z4PJO
	 tIFwyWDvFzkTYFHYfCUbGc21x9tlqZH9LAnoizeUWruL2srEFX8tcDzAXLwphVXTpLDwa
	 cBxDUf9LPZZEz+4mfgZ2M46p+X2/I5tjVTDZKYM966pzRKOwOrD8Xb8K0PzqdlMETjXmt
	 ZCPzqDeaLiDFLPVCycYzMTBj/KkRADz3CdABdrPnU8GjP/NevCV2TDw9djEMR/PmXbR72
	 oiAp1WR73D6SAktnOCC5B3xHmXwWyvPtcm7lhuR5XYz02eoqt8Jq7+PYPZkhg7qJ1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445567;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+QKWNF013aDPSU8lbGBlKzPWdu+x0Ycm3WsJvLZrms8=;
	b=IjfgWvzXr9K0ZrnmP08RenkfE6LzFPS+3qarKAQHCYSTqmSA5lV5uuR4y4VP3U5+tMF1
	 Zl0wtK3R61JujRErfYhRL1KuzeFTIVOStImGMDsjxrMn5idc4ceWZbqReuFRZzKwz/uUJ
	 0ZAp8a9RE0PEw/LLKKEsLg/KfIEF2IgEdwicUbTLNE2Pq2P6FIQbjn+noZtklO9LfhGAD
	 Gos8XwZKJzvtBVi5rWFAnab6PLOKXHmY8JX5Ad4tAlRS9IYVWKXaxyJI18eVgfV5OQxni
	 eZh9r8XguXkPME3FkR3pPE3hxEwYE72e/UhVsbDhqaAQVsVTLY+MszYAegZHnh6VD+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xr5LkQl2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC279606A32E;
	Thu, 12 Nov 2026 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xr5LkQl2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989F31F00A05;
	Thu, 12 Nov 2026 01:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794445566;
	bh=+QKWNF013aDPSU8lbGBlKzPWdu+x0Ycm3WsJvLZrms8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xr5LkQl2U7rG6JJ19orlIuMeBIBDVBPqEamKTFx5FdpJfFV7p83X5m56Qc9lwbArh
	 xbLVzrcTWQiBqbGY4jAe6NV/c/M4svGGW6PaRJLY9KN53tqkLqYFOuxjcVY++D4Qod
	 1LV+LmJwg8tUCSIW9X+5Trji+AEga7caRPAef6/o3WwyL+yDcqYZc8duOtA3Bg+vGT
	 sl2MlY0/J1EQ/VLvnzK8vw5SNi/Z5JN+bfLaPii8jIA5ijegNvPPnL/2JPGmkZbcCv
	 kT8v2f07fg8pYJNmUgMxRAZak1e8mscoRf2iHiYD2Lk68w+S4JOlhaXkF5Gqur/it6
	 6oRjzY53W78QA==
Date: Wed, 11 Nov 2026 19:06:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: skhan@linuxfoundation.org, rdunlap@infradead.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	Conor Dooley <conor.dooley@microchip.com>, conor+dt@kernel.org,
	luka.perkov@sartura.hr, linux@roeck-us.net,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, corbet@lwn.net, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <179444556456.3829380.4513786084250860193.robh@kernel.org>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
 <20261111161619.232141-2-robert.marko@sartura.hr>
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
In-Reply-To: <20261111161619.232141-2-robert.marko@sartura.hr>


On Wed, 11 Nov 2026 17:12:46 +0100, Robert Marko wrote:
> The LAN969x fan controller has a PWM output and tachometer input in a
> register block separate from the Sparx5-compatible temperature sensor.
> Describe it with its own compatible and binding.
> 
> The optional fan child specifies PWM period and polarity, tachometer
> pulses per revolution, and thermal cooling levels.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> - Drop the unnecessary literal-style description marker.
> - Inherit pulse-count bounds from fan-common.yaml.
> - Require cooling-levels only when #cooling-cells is present.
> - Add Conor Dooley's Acked-by tag.
> 
> Changes in v2:
> - Describe the fan controller in a separate binding and compatible.
> - Keep the existing temperature-sensor binding unchanged.
> 
>  .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

