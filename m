Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A0E3BB13B;
	Mon, 17 Aug 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953606; cv=none; b=dXmqzlwl0AsL4d6qYD+fScNUw8PCyELYnAUYrieFIbaoetG/pZReiscE8lTLiP6Xa8rwkNLcpgpiWvp6rrUoXkaWwmx81sUHppITZnRRM0SS6TO95LVZQxSZdYhmTxDZR9jwpBY3xSxlodJztxLGmaO4nnPz2xXmYpDv7OD+cwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953606; c=relaxed/simple;
	bh=XpJ7H8T0lm5HxGMZaObot20HxUrZC+gPKqVSrSlkh2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7ElJd1Y2I/dHHDZi8ODtO0GFFSnT9y7N6DJIfgNLMEgkCrXfDXMpULw7M2/ir+7rebjO7YfImDYxtfVSGggwG4En0AwXNcqispx7uovdQcAjoxtuNrnoNjqNcKvNyvgyduMrRoUajT0y41q7IT9frnIqSz5ktAafroO38SwZgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UR0HvYm9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UR0HvYm9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986B31F000E9;
	Mon, 17 Aug 2026 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786953604;
	bh=Cdp5REbEZpBIsSPbIuIhwTX30Doutgm4dICLksV5v0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UR0HvYm9tCTojh/sVXpJCiZYVl1y3tS4AbbG2PFrDJ6d+8tT2ES0zdKTLdaOO+wzr
	 LzeZcQtNHyTIDiVWXsS1B0rq0IuR0qB1gBiqPwxpQvaTeudgZSbSIG0fxvpeII2He5
	 OKTfB5CDw3mfVXMh++mcuXlV3/sx35gyC+LMPd9if3obr/z8kL1L6U0ctgVa/ouxtd
	 Lcync96AD1QchDnFMfsWmSC38zuGAWcfbqKHoMYhpNO8YuZrI+th+TDt0mywiKpmbL
	 AOOtSnsMDHTMwdr2XfxxG6hzzDYrvM8c13xrBCoXFiUT7cnlBFcCNQkTaCgkHHqrMz
	 A7F0LKvbZU07g==
Date: Mon, 17 Aug 2026 10:00:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Flaviu Nistor <flaviu.nistor@gmail.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Document TMP110
Message-ID: <20260817-military-tomato-ringtail-6cbb23@quoll>
References: <20260812191021.65304-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812191021.65304-1-marex@nabladev.com>

On Wed, Aug 12, 2026 at 09:09:44PM +0200, Marek Vasut wrote:
> The TMP110 is register compatible with TMP102, document it using
> a fallback compatible.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/hwmon/ti,tmp102.yaml         | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

