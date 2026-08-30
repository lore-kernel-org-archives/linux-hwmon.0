Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3013BA244;
	Sun, 30 Aug 2026 18:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113991; cv=none; b=Cz893PnVDDLfEXcVufcZwZZLpkCfafJm1V2UY0Fo4YwT8pNoqknQUJgBUF+W25SgRlTEc3U0+G/8XYrJ7/DxKm/QHej5959CQyHZeWq0jt1lI9TS2A0ISTmPc0GFfxL1UlwXC34Q35qe2HEBICVS7I5Bmlkf3fDZZeB1vVrOT88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113991; c=relaxed/simple;
	bh=jcUIUYZ5aGvgeUTxmAdH651O9yNjJJbI7/peW56ZGxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARj1rXE5Blm7Gm8ed73tWkbNUykTJykV1Gk4OZtrbrourGQtTBKzuNt/wOFEVH/C5ZSsK5e9M/DhQDe//7Uo8OjZhs3iuXpplk2P7vbee+3q9yRuUKbZmrgCyWj53TwYhO6pO8UW7KhuRHufHF+ETAUayy0V86ivtZEKhqI8vy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwQUATdX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwQUATdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503391F000E9;
	Sun, 30 Aug 2026 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788113989;
	bh=5SqRNdRyE2iHbo2TY2yUhpUaws7xCw/1k9HypViG8yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fwQUATdXvyneRvcpE998axXTNOdIwX0pJsd9DSnQ9/NvdO6YXYQSppRxogA2E4iXj
	 86Hn4lsBL/itQcF5BZO33tWWCP9px2fSW2SYV3a8h17/fqxrsrDa2sHpIl26SSl1MR
	 z4RSLxathv/3j0dRYlYKVctudLSh8N0Q7+kjWLVZf2WWYX4KYx+UIZrpxRNXR5wflG
	 Vv15MOuOm33P6f91nZDa9QJ6QeKzQFeFNeeuGPiSo4wlT1HlllSdfQ7nUOD1YsDHns
	 8GqJsWLzpqNGg8XJIpiQQrKXLuOfXXEcIIgEWFT4weKC9yQogT1dY1W0JykYlgz1EF
	 Szss5ORW0d/Xg==
Date: Sun, 30 Aug 2026 13:19:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Zhijian Han <hanzhijian1991@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: fix typos in various bindings
Message-ID: <178811398752.106276.7299870239024792960.robh@kernel.org>
References: <20260821105605.1967718-1-hanzhijian1991@gmail.com>
 <20260828095459.834657-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828095459.834657-1-hanzhijian1991@gmail.com>


On Fri, 28 Aug 2026 17:54:59 +0800, Zhijian Han wrote:
> Fix spelling errors found by the kernel's scripts/spelling.txt
> and codespell in several devicetree binding documents:
> 
>   - "curent" -> "current" in adi,ltc2991.yaml
>   - "deivce" -> "device" in zii,rave-sp-eeprom.yaml
>   - "ouput" -> "output" in delta,tn48m-gpio.yaml
>   - "redudant" -> "redundant" in trivial-devices.yaml
> 
> Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
> ---
> v2:
> - Use consistent identity "Zhijian Han" instead of the login-style name
>   "hanzhijian"
> 
>  Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml    | 2 +-
>  Documentation/devicetree/bindings/hwmon/adi,ltc2991.yaml        | 2 +-
>  Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml | 2 +-
>  Documentation/devicetree/bindings/trivial-devices.yaml          | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!

