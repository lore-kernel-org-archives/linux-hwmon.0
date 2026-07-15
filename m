Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73242BC34;
	Wed, 15 Jul 2026 05:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095077; cv=none; b=jgVozBkpTY2K3x4HXQzLNlpq4Af/B1CqipH6C6SczHdpeku3qdTkhyh01bde5/busuEt0m634nZJ6bJwVZMNVrbD6ehfTaDbnHRpLWp+j/DTEBei+hm4jAZK2MZZ2DkzokJFpwNDei2oDSMzwqPpIn38Bj/9rHYA4ZvphE7N1jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095077; c=relaxed/simple;
	bh=LUXYr2BEt6lg0VUZjSOzmcJbv0iAi9kIXKiwtQOsYIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2n1o9VxCYgHHtF7ExaS24bqlamZccTwj5Ch6BCXOoEypLpXkVpmVDORf+Mg8em7FvaNl37QoxGfg5t4eFYeSR+Haw7T7VabOx10v3YN3pqDfWl3AG+CmcdP3I3mo1g+OwVR6/Ord/sJMnWnGXx97cQUnVWYPwPY3ojyPCZxi6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndZDDIyn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndZDDIyn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38361F000E9;
	Wed, 15 Jul 2026 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784095074;
	bh=orFyLvQLl8Saq4bd7BnHZEcBY5GU646cOzMnRrc0st0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndZDDIyn7juc6Fw15RmmjYRdCe5BmrLo2L10z2jVOLWyTEYrgB2rF6D1Ieg1YzRDj
	 /QgI3bGnCafhchZqZ6ySlllrmAwDYcUNWz0ESx3fgByJIDf90+A6pmkl/5uZtHj6Sx
	 GoKGqbYgcFR0va6r0PQ8JIZteHykpjae9I9twCbVkYdXGZbidqrgVW2Bvby6jAGJK0
	 qscCbMRHTBRzUbvHfMP51gQ0C6ZDpOUcED1RnmpcsJO0ctXuDGkFeJFxZXYilXva4S
	 zfvrZkT8f2rCgaPnm7bkRzJcaArNJhs0bqHzfVUzXXqUu7bxW3vDuSzAFZ6BDfFiDH
	 0UA3Ji1Pycf9Q==
Date: Wed, 15 Jul 2026 07:57:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <20260715-hasty-crafty-marmoset-86d08a@quoll>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:57PM +0800, Zaixiang Xu wrote:
> Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
> family and the compatible GXCAS GXHT30, with the ALERT interrupt,
> nRESET GPIO and VDD supply as optional properties.
> 
> The SHT30, SHT31, SHT35 and SHT85 measure humidity and temperature
> and differ only in accuracy and packaging, while the STS30, STS31,
> STS32 and STS35 are temperature-only parts. Within each group the
> parts share the same software interface, so model them with a
> fallback to the base part of their group: "sensirion,sht30" for the
> SHT parts and "sensirion,sts30" for the STS parts.
> 
> The GXCAS GXHT30 is a drop-in replacement for the SHT30 and uses it
> as fallback as well.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> ---
>  .../bindings/hwmon/sensirion,sht30.yaml       | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

