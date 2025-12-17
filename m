Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833D8F7D;
	Wed, 17 Dec 2025 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765933477; cv=none; b=XVWasUDM7ifabGrAg/bTVMfAow6nPzl4TA4jeHGXfePtV6+UEimAhN9bfrnIym2OPQpEthzzCXjHibcKgaCckxrxprpd/CV3ikE9diu6NOX8TeOvSKtq9MXbDyzWCYvvSGcNE9z/eN5CFFKMTPtUcrOKkjL5JahQKxSceCtnSNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765933477; c=relaxed/simple;
	bh=ixKtfeI0ji4C5NFVPZEQx+AG/PUyyFjqBAuKeZkf5cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZb7FzhhSzHq1Z9GzhGj5sfYWrLP59f+NcE9QeiaXso8QqTThmBhr33/Zyj5LZYXh3Myik6Fc+srXajwCiw3RXAgl+ql0IzPvZU6BzZyUipuzftolNZO2n68XJALvq1ZO4kZnnZEaUTNyW26FFKSBzX9qs5nlz3RguK00913Z4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OToaw9PV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OToaw9PV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A299FC4CEF1;
	Wed, 17 Dec 2025 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765933476;
	bh=ixKtfeI0ji4C5NFVPZEQx+AG/PUyyFjqBAuKeZkf5cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OToaw9PVYV58sKDwl8dMNNDdd3Gt4aKIs2HEzUU/mDkSrf39ddkQPF+5e+94Y71P1
	 /Oh8aOJgV9nk3KpJOXGuhnHMnmn1oBYlevIHEftUAQfVt4S4IPTDxryeny0uiHf8JS
	 x/+q6TbTwKffREyJcUMuE2KMAj+Q2Sb+0od+izxUErbtnQFIR+hN1mNHd95XfZvF1Q
	 m32HPowCAM25ZgIFXkKuiiJvX2Jj5wyboGp16fasbxFfPkbZHZysh9sIJrXiigzMY/
	 nq+cSYLdYWkEq45NrHvdjZYZFosWu7IDik8MHa1DARY2g/DmXI59Et954PYO43xWtr
	 kGk9UqGaNK9OQ==
Date: Tue, 16 Dec 2025 19:04:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: wyx137120466@gmail.com, linux-kernel@vger.kernel.org,
	linux@roeck-us.net, corbet@lwn.net, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/2] dt-bindings: hwmon: Add mps mp5926 driver
 bindings
Message-ID: <176593347346.3476686.2888126677750880798.robh@kernel.org>
References: <20251215022505.1602-1-Yuxi.Wang@monolithicpower.com>
 <20251215022505.1602-2-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215022505.1602-2-Yuxi.Wang@monolithicpower.com>


On Mon, 15 Dec 2025 10:25:04 +0800, Yuxi Wang wrote:
> Add a device tree bindings for mp5926 device.
> 
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

