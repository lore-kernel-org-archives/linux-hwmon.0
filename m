Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA5A3C1F31;
	Mon,  6 Jul 2026 06:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319999; cv=none; b=LnHlLxRfeMLXXal9KYdqpDe3QYsuBILg0emHyrjXS8kw0Q117DiqhL9O/mRjKfLMpct8+UUwOoL8D+Tyfwc1ZKV4VShmTG2/+M46EzLo7c8NbM0nenAIyCWHi0RH87Q9xWryGAYi6Rev174RzHnxWU5/5TtnlSanudBMElGdFkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319999; c=relaxed/simple;
	bh=TWvNIAPJoRJ3h5Yg7IjYoMIc9ZzKFA+iTDZsTv8MmCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eimuIJgXvXJ6UsQTFbOHJNAsC++cIcCAUlL59rtYKmqk6VBV1uCHzvRG8MdxR6704MQD4jAr8x2nRntiXCfd10fG9Xrrwc4/Vfm+LOh9CvrLe2SVMnBIqja6+oJ3MGrL5LPPCWymi2Zjaoq5zABSth34ibjbMOiSEEWY6zW2ldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkTzxVUX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkTzxVUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57991F000E9;
	Mon,  6 Jul 2026 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783319984;
	bh=ZSfmgzJqUzafnlMglf59pNzAUe5at1F1XFmIZtR/UQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkTzxVUXp2ikvcelh71nsTvtvHl9bYuBao6M0T91kHpgSAAyOqe8WipXAC2bI38tq
	 fOTQnLAxhtXOWvjpw4ogjXI+zFpEWFpi1jZnbCiIGV23Ba46XJrhfTZTZNA+G7htFM
	 87CoMG0QSEgfLymXjElE4YSS1Ab13PL6PwWumSdj8OTTbMtkzKWL1fpvmQLCOdv9h2
	 5H+1jRACasckn6xAdyf1DdKhjzAmGxoSlxYR1TE9oXLF2TaF/FxtOvt+iPgdbulhG2
	 QyjQL8KbnlXFeDXhFsYwLl1FLhPzySTiES7ubEoj/KsIbUFpqVFfuu3uaP5NJnsW6F
	 uilfPwDIBoIOw==
Date: Mon, 6 Jul 2026 08:39:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Message-ID: <20260706-neat-perky-malamute-7518b7@quoll>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>

On Mon, Jul 06, 2026 at 10:08:41AM +0800, Alexis Czezar Torreno wrote:
> Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
> was not included before. Also edited examples entry to be more complete.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> ---
>  .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

How did you address previous feedback?

Best regards,
Krzysztof

