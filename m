Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22AF3D565B;
	Thu,  6 Aug 2026 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786003367; cv=none; b=KoqvQKxCfO7l0e05RX263ljMIYMFcVAl/Frz2MRzfip/w7GDTVrn0ttRasN3p/qbuZVENnOJCyyNuPmFIENLiY+6+nJc2Bu9Px2d+s5dGVYas9uDWj20QYZS0uNv6rhDP8zoWho+sorpwCVimzacbrCsvE3JF77LrZIz6dv3Wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786003367; c=relaxed/simple;
	bh=Jlqf/4D/E01mv0gqEGNnwsvtcn2BaBtu80ou9NYd0aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rClT4z9sUv8EAGQa+UdioElLQUU9lmYjMeNwHlyWkrDTDSsO3BXO9TbH2sknlXU0r5qKQNZ0BZ7nkfEcZKCeZ5NuVFjw5C/qRWc+gkYN8rox5TvmZl45xSnSvrLJMey/CcRE4tlmVcnCNu6+IsmupF2uiU/fZIlJByTuJVlf+M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gapas08f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gapas08f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CAD1F000E9;
	Thu,  6 Aug 2026 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786003366;
	bh=idcwp6KHbiBQ5C7uiDAZRyemXBi5Ek9ZsWuxuZ5Hl0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gapas08fqJU5eV6gWBXgoDj7GB5a/rJ5Da2PZkKOWcQ2wsdi1DhHWXna4lhCe/bnq
	 uXEszbe0uLxDd0ppBwe8ErstloA7eReluB96Hw7M/V3afBhVt5538IRlGN3En7vgLC
	 Z2s32EQMMb39DK4iRb50dx3kixFDubznh+nHYiJWf5mTVFe2xM6EyFD0vAW/AwpfED
	 By/8vfqOD5dtqkUTFYy7oeI6J+USyAqtzGhV7SpqyStlyvmi9+8rDk0p/vjPDURYZY
	 i7/mfEfjTbQR4+hwXPtnskSis0Ldxew4IK8A1QJ6m+PL7XqAK4ODnKoblo1yHYZOuZ
	 qMaLJZd4zo+iw==
Date: Thu, 6 Aug 2026 10:02:42 +0200
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
Subject: Re: [PATCH v3 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Message-ID: <20260806-fair-bright-leopard-afbe1e@quoll>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>

On Wed, Aug 05, 2026 at 02:00:53AM -0700, Troy Mitchell wrote:
> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
> 
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/devicetree/bindings/hwmon/national,lm63.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

