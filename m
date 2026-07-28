Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4693A2D7DDB;
	Tue, 28 Jul 2026 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220875; cv=none; b=bleoUKdbRIF0qeU375St/uNLrqU1CemUyEXdTLMkFwnuvEdkRE3QOe+6yw1RzS7By+3hqe9kgcYlMAcVgP/q3cN7peX0ld+Zw+cDEeVMNGrDkMnUqB+qmFDZpcbt2xS9f++auScnGJnG+49eLXf/ftEqmOtp3QcQHQsVTJN5mGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220875; c=relaxed/simple;
	bh=Wgm7yJ4C81/wOmtJEvSCPgputfXRHnZqECUiRH7Cr4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQOd/eCGsFw706egiLCCTNOD46FBmJdKOjnTIbgHRvwMmIALHfXYBO/Sv9IruE+pyvjok0/Q7pmI55xYexUangMQn42CR2hEnIHOng+G4sESVTB8j8kCO/CWRLm7nuT2pr7oOcDPKBFUA0MH6RoS84sB3HIma+d4RMx03GRPmtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXUgAB2b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXUgAB2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24111F000E9;
	Tue, 28 Jul 2026 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785220874;
	bh=ZT8snYnUid31+/it8kT/ZoQZTmdw2Fv4Kr/sun5gJuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXUgAB2bDrdGWT1IOGRUXIyH7tytPfuae8bpisD7Od7PDdRi/Ad3kSp0pcoOvIYMR
	 MxdZ109lzmfsiJ6+OTalvF+gLCE2k9JXHnI3GbgSLQEVVMJupeTsR2eccrHKfVzqSi
	 VKXUYILI5tmwaGURj3wL7sHZGEF3G5530sgBealssermqwyr8r2ptGlUkFW/bKUdGV
	 Fre2Nvf/cRB98w5qg5aFQ4MBKMBqJJzcNHty+RMyvuu4j5y7m9bx7kIeQ+aSruzziM
	 cxD+PU6QkiagRLp9sV9FUkX+MA4prX8v8iy6BEgVL7qFJ9oRI02Y+GW/98lsk5LwLg
	 MrLiec/aiTxnA==
Date: Tue, 28 Jul 2026 08:41:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Message-ID: <20260728-industrious-cheerful-dogfish-a1fbb8@quoll>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-1-cec034298535@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-dev-max20830c-v4-1-cec034298535@analog.com>

On Tue, Jul 28, 2026 at 11:32:55AM +0800, Alexis Czezar Torreno wrote:
> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
> 
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
> 
> This patch also added missing entries in the examples.

"Add..."


> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../bindings/hwmon/pmbus/adi,max20830.yaml         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

