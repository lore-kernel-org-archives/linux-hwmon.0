Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A236D51D;
	Fri, 31 Jul 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481323; cv=none; b=iEheVotpvwAsCuD88N4191wqoQaxuQLHMsk539LTxblyYFKUH4kmgxxnTanOmoGhEastcHKQ/MnyS/Bkj/+neAOvMDqIUmU0bjF/RH3EWMhLzf7mF9xNwZ/U2ESOC1rUQNCjC20tNjeJPZlq+eC9eiLFxCzeOuhzw+/OBea/08Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481323; c=relaxed/simple;
	bh=ZM34SGoud+tyHMjyD2SOSKXqg458yGC7QV1pgJNAlSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXTrJgNGpBrBYXRWwMYQdFQxcdjUAdf/j9RMzozE5PXE2w97HPptzcAaZmAgOhOqKjQHibpITSBh+/qPKp7OwV3Fm6Z3N89oGb+xiOXI7POLdh+wT2y//+uv81AmNuOPbPT9T6JNCQ5dUJQ5/2bOAeuc344TlF/NnQJc+SvRO94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRc392al; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRc392al"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534521F000E9;
	Fri, 31 Jul 2026 07:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785481318;
	bh=H2gVs8e8RRxWUuRMbbmcgUYW6FAvg7C21I5nA+QGbhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRc392alicYObfzU0UxSIafYPbuFCoWqfOjemILE9KB6hvPBpfIsmFywnYxFFg+ui
	 QPiXhSScD2mG+y4Xx+GRSj6QEy5QDhNhHQQBNFm5+Xe094Hf9K5CT/FnnGnmeMFx4U
	 l0XHxNanW74rI9UKavUqhT8FlIsWOPrXa+sGwaegjPB21ayilKswlKs/E2sMmKHBud
	 33SPdtAiAvkt76DLosTQYnoYUfpaSMYDkbmK/jjZq6+A2xR2debghl7BIX7QfXhHHm
	 pZyHquSE8IMKCmoBVHMltoiO9xdpHillpUW1WoUfMb2BiS5r7bENWL9CHQtSqglGqX
	 altxqik4Uf3tA==
Date: Fri, 31 Jul 2026 09:01:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Charles Hsu <ythsu0511@gmail.com>, Markus Elfring <Markus.Elfring@web.de>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Message-ID: <20260731-pompous-private-tarantula-442c20@quoll>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:44:00PM +0200, Vincent Jardin wrote:
> The MPS MPQ8646 PMBus step-down converter uses the same
> mps,vout-fb-divider-ratio-permille property with the same constraints
> (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
> to the existing schema.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

