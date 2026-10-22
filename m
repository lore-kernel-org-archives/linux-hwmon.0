Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666479;
	b=5WYoiQ8C6txyQVkMg1aQuvJmpPJ0ubCfg8xh6bKUE8rMn40WMt1Ml79JnEGzi48qWC9n
	 01xM/4M5Ua3yjBpSqs3zo3Kv6BkFKI7UPJLoFlx4jZyd9RAIH+mrbJbaCGBvNIrSl22gs
	 RWE1SNtF74c6KpdobIt+bIakab2elYgdhBk0/Lt7NgCgZm5BmJ3JtNOk0W/Gf9BvF/FBv
	 RY0ha2/uupTlCFwbbdHjdBNVPpoCFEw/JHHmYNqCJs2xM9FhleiCbvVHUEPFAZw4URGWr
	 nVg4LMIjDlnhbOzm4U4S2a4zUGgL5xZSwZTpjNezlZGd7KRZLCRQO4/UL6PtV2MelzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666479;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nUJ4Tk40fTnCV+Cy38QOMLqYzWns1s//G/M3kf5ajUo=;
	b=ciCvhgylLBiubE6ZpEgsCJ4ieSs2ZRXTv0oLbKd258GpD6ep7q+HEZKfcGEBhpb98+ka
	 sniNRkv5O7cAFT0gLj5rZ825Bh31zcr2unERps+5RN11A6WIrxvmvVStEx2BlTgr2hgXn
	 5ImNYXw3Pa2QxTd2zq0xYw4A5NyYvErWFZmShn0AHi/OQbvpq7Ctk1R5vLkL+cE5syb8z
	 qm1ysRZd+U4rrC/pCbBY1IEh9VMOiIKAQJkfOxp0bT2kLVc6Cw92dGE8IkBVk47+VzAD3
	 Jbi1BPQ/HIM0K9ak2OFhRhuxVLfv00hLQm4vn1KMyzWm8bFhHDN4dzxFRyuyON6nOMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNe2Ms0e;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EF3606A31B;
	Thu, 22 Oct 2026 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNe2Ms0e
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E371F000C6;
	Thu, 22 Oct 2026 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792666479;
	bh=nUJ4Tk40fTnCV+Cy38QOMLqYzWns1s//G/M3kf5ajUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lNe2Ms0ex2kgkREOuWz2izGMJvXHqgSoSnrefWCiqRLnGziin5BqCccq3zn+1atME
	 zZOUJWK7j5bJH8kg5YgvJe3dP8vhlFJ7IyhPH3AvJ97mC6QqCk1mScroWTK0y4kzFt
	 fzWsKG8KEvrGX+1zUA2da6kmYoHnfNkzTssiMzKZyPP1M6tfRzZv8v7PIy+xlNoNz/
	 KMotFlUwAi6TJC+2fDg6mjvIGmUHMV0fhFkV60QIIgFuhNzkDbIvyofd0anzTHOXSG
	 +Tf3gzudckWU1NLCSAEtaV7rZzIXPJlaSaePimqAiNDbidWdfGQU+WcjfU47Czk7ZI
	 vi7x6sVqeqpxA==
Date: Thu, 22 Oct 2026 12:54:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lars Petter Mostad <lars.petter.mostad@appear.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: trivial-devices: Add TDK FS1412 and
 FS1525
Message-ID: <20261022-translucent-slim-sheep-eee8f2@quoll>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-2-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:06PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 and FS1525 are 12A and 25A uPOL regulators with a PMBus
> interface. They need only a reg property, so document them as trivial
> devices.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

