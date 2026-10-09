Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E264BE42D;
	Fri,  9 Oct 2026 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542885; cv=none; b=X/BuBbQFDGasU5MBKeoZ1eQ151l+uwXt07eCvjTqHmZFyV4o+9wNKG1HnAnPy/hOuX94Ygg3CueqNzWJh3TiAsePNMzuu0ZAFROm8+I/4EYhLHN/zpEi8iBx/oWNAisdkbIxc3RnobNZ7P4QbCdUdk0xnFFqDI8S1PGwpPPyXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542885; c=relaxed/simple;
	bh=aql4I9UZwEWxKHoWagg5l4f2jMD6V1hwycvbf5YcU5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOGuV3c3C9n0MMnLFNAwdUSFFfUJEj40N3BrnN06H0KqfHoVGgW9X0eWJJ2qzrvD24NFx+6mwTE+s+lz+4sePHHZFP39SZtvBjmmxkzh8ekpeB49G2jlKVb3H/62wwe4SFDKq0v8uUR9lTVTg+itIEiwB0ox+jR91CoXysaZW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcQjwWFS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcQjwWFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107D51F000FF;
	Fri,  9 Oct 2026 10:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542877;
	bh=RWlrQZBcvRMSkE4/pIBKrRGpI8zJ/34S5i3WLpzkREg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcQjwWFS4+DdJc9PE0uLa+2N2YccBGNoYVMrR5Qu09SW1YDCXaDjz/fQYG8076wMC
	 36uAJfg3pB3wOOG766/+I4PRnZI4z8lqVXUpf1LJlQvrQoVlN5c5bm6Rd1mDUoFcnu
	 qFmyJydsaLCGZlI7Hf++KLWRid7lZoUX7XvIePFCaF8kVqRct+mchMdvHIk1Brxye9
	 yDsD73+VRpU2+2Sxos30U5YyRny2tPnopCDbur0FJr64Cf5xaoVVyGs4Yp5koCRXjj
	 bSYXrv9IR5/OfZdLrrgjd3P3Tw+j2RkPn13w/Yt8PrmX47LWWV/YkRAqHjhOD+u7XV
	 f2wyUm2eo0YAQ==
Date: Fri, 9 Oct 2026 12:47:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add TDK FS1412
Message-ID: <20261009-modern-ultra-kiwi-bf0954@quoll>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-2-0ae7e5ee4e41@nexthop.ai>

On Thu, Oct 08, 2026 at 05:56:03PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 is a 12A uPOL regulator with a PMBus interface. It needs
> only a reg property, so document it as a trivial device.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

