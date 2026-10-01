Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F9488D8F;
	Thu,  1 Oct 2026 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842801; cv=none; b=F1cq43o5Qqm0WLwit8onEQTQTNuoJkKriL4aYu6ibzOBOBLmj0x5ZJgHob2GOofKcEat/JIXwvdDrMnXoOVICrzt+5o3jfqKjd6kz68AaPe4CSpQ/5me0Sod2Xj4UwnJ1cKXthR2yJYR5o/Z7YXhwBnjFQhYZTgrSjdiUEbXvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842801; c=relaxed/simple;
	bh=zlyFFjejngvXF1ave2mJfMXwAVP3aKiXUf5dCuQCpOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYJlwxrKWYlZeb7CKdEH8PLOaZ90krboKlF+YqdGP0k0mc5jrQa0pxi6ESskuNgGIiCuj8t3nXao3j60Exrn0laXjE2rePMD9q3aLFuUXIpCAdymjCVWRgRl5WuGXUSarBAVrrUoAUlgo7PrELoZemWx1qJNvDQaG5NKYrJmTSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ahDjnw4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahDjnw4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250C31F000FF;
	Thu,  1 Oct 2026 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842799;
	bh=uWlRlKwjmnD4I6cyH0/2gWNn9Gk9MgEpVZ167tZzQ2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ahDjnw4lIzjXojP3kLolkzopA3KR0nbOAojHgJeMpIW+02EOekuvLqXyp2vqp1sed
	 37vbqE0qMY5Fx2hqsOiBFPxVVrQOWwL4hY1eSka2B0aKNzoK5Lwbh8LuLnziAS1HyJ
	 Sui5ezjAnzGqS3uIRdmS9WclNx1tw25baKLcvnPg7zNWHWH5KP5+Wr2KEFqMAaz1+H
	 AICiBa9a2Dwg/qRux2d4OW8iJ845bMnZhtngaCIo7IDjWkaTvAjVk6Bswmp4+uKgjI
	 qTiZ43gwsq7B2PtBB3gB++rEPXTuXRZRUge5nWTezshaujLzISQPfiSU/7RExKu3Xz
	 IhiH78rFYMH9g==
Date: Thu, 1 Oct 2026 10:19:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luna Hart <lhart.opensource@witekio.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (tps38900x) Add driver for TI
 TPS389004/TPS389006/TPS389008
Message-ID: <20261001-judicious-oyster-from-atlantis-ec18aa@quoll>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929-lhart-dev-tps38900x-v1-2-7045c5894152@witekio.com>

On Tue, Sep 29, 2026 at 04:04:05PM -0700, Luna Hart wrote:
> +static const struct i2c_device_id tps38900x_id[] = {
> +	{ .name = "tps389004", .driver_data = 4 },
> +	{ .name = "tps389006", .driver_data = 6 },
> +	{ .name = "tps389008", .driver_data = 8 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps38900x_id);
> +
> +static const struct of_device_id tps38900x_of_match[] = {
> +	{ .compatible = "ti,tps389004", .data = (void *)4 },
> +	{ .compatible = "ti,tps389006", .data = (void *)6 },
> +	{ .compatible = "ti,tps389008", .data = (void *)8 },

Does this mean programming model is exactly the same for all of them,
just additional channels?

If so, then these could be made compatible in the binding - use
fallback, to the ti,tps389004. I don't insist, though.

Best regards,
Krzysztof

