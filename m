Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F07D3E6DD5;
	Thu,  6 Aug 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003232; cv=none; b=I10cv/suG/flHRr2L7acncS1/IqBpYwNuw72HcAnYsr8kvsm3P5GxJsJSu9vElL64kdK5scxCnalxaZuY74Ktc8PhKXMvWigTUE3mwau3MBailnxfOGaCSrpe72YzodT8zFCVOPibt90oJm0D1rKJyH/WYHCaN8QSgW9KiEhpbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003232; c=relaxed/simple;
	bh=Zbxem7sqIFcYhPkxE+pQWcYOKQPvFzkrmKRzuU744yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z1Dc53eLmNa7a8+GDlBI8abLw6fEb2TTtvR2zRhPtdQz6UbMBe5z05+EzJA/F/j71FkeJR5OpVrmft83oOdw6T07QBp+QA69hzFZn4maZDxdfo3gbWock0a54QUHFmXXC3ItSJjH6IZCRe/JgEctWhwZVhNuCiOlUuUg4x9POD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiyFEnBW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiyFEnBW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D631F00A3A;
	Thu,  6 Aug 2026 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003230;
	bh=wCsDbqJXdF2IQW6rHcMJA+Tn4gj7AL4ZApX0eWn5Liw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jiyFEnBWGE8JqbmRSBDoPS5pELh0vKTSSkfC2e2wnxazZojEw1MCf1nMmKzEIMdAt
	 UVzEudlRArvxEZ4+xwtwaucEERn2DI30ghSta7qwlaCtH3LgXms2+BnZavhWWo/qge
	 m+CzdzLpV21LL4tKwgQPs7D0G4h9ELzYNQfdo8ox07b40LnoWc+qL4Y7tIkk2+lzRb
	 jIBowazZL1qq/CwfbHqDFauftUnjmfqpx6z0PXPZKUxKFrmrMKrN4uIlzxymgxkac4
	 6xB9gyMTWcbQEZucjTPaYf6Ahp5XKZ82FdNPP3aTbSc6OMJWja/ibcOVUeudR3QuxU
	 aKNjfnGTGUctA==
Date: Thu, 6 Aug 2026 10:00:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <20260806-futuristic-outgoing-gecko-5cd90b@quoll>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-1-b86c75d1c552@linux.dev>

On Wed, Aug 05, 2026 at 02:00:51AM -0700, Troy Mitchell wrote:
> Add the vendor prefix for Sensylink Microelectronics.
> 
> Link: https://en.sensylink.com/
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

