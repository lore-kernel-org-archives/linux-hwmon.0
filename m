Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69E4C10F7;
	Fri,  9 Oct 2026 10:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542866; cv=none; b=XFsiwQqu2rQ36TwJMfPsdVfXa6QPzKrM+GvK3A3n1N7AQ43bz2lgZmzY1rtQZ4Pi56eXbSslQ+dGCLh2nSZ750ufJZPo1ysYjXxwQEZkfbJ25Gs05RQstaBKf7lTTLKIwo5tCBllbKyPZBeN+KclboxPM9eMsnkyYcxBUy4hhWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542866; c=relaxed/simple;
	bh=ylULkrpgAWeXNslY94k8ycylLjhAxvfwZBKME9NRzE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWwMF9O6RhYHlFzzerEtnDWrz1LletgJWbyoZpoIPMQF4n+mpQYOS2NHvhNancuIHNy78dfCDKZxumM4+Pl87EzRS9+syInR1qKPjlDUwOwyxyhU3brLwVnLLlaS/A8ieJgvWbJc2Q5wXS19i6NfGXqOI60vyojvDLv5Fmf4eiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IueHLKsY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IueHLKsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFC11F000FF;
	Fri,  9 Oct 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542858;
	bh=zKerr0FX9/TEUUMoq6+3Hew/hjlzTQEY7QDXvKwB0rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IueHLKsYQPiPnEBmyXML4wvVU/If8AORkQEh9OFpXe5hULxH/5Ktnxy3+E/iLCmVi
	 KLKrWunvSe8PYoS8XxZwhOUUJ/AgGnrOsNlp8lRfvCXIRS6EzEV10pVB2ssyYhW7rf
	 pCPLHVxVV5jwwHvyPl4w6paBeYwiHbXygiTS4TtPRxKN97GNlOhzwIbhiGWq3qQC6Z
	 Y10T7l+alKtGvuJGe+1An4TMOn8vnBFsZz2B5bEq0GUO8usUVMX18724io6MBHMBmW
	 M5pHdzzRqB8J0lQEI0VdvtGDVq5iGjpn3nGGPCuUgImDlBqSLshVDkzS590KjId5kA
	 iAzkCXGVysWiw==
Date: Fri, 9 Oct 2026 12:47:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add TDK Corporation
Message-ID: <20261009-broad-formidable-collie-7f0f6e@quoll>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-1-0ae7e5ee4e41@nexthop.ai>

On Thu, Oct 08, 2026 at 05:56:02PM -0700, Abdurrahman Hussain wrote:
> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

