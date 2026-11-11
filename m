Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398732;
	b=rCUtt9I0s9/2mmDPyrE36Wr6vQ7IcRFfKt/LkxLvxvdCBymu0+/17uSiWgDiZB2Dr2hT
	 wYH/xDghO7+Og8IFir4YDiPPOPteIho1ZRdwFbOaCqsQ8+2e/oWTtNierAH/sZ6mbT2PV
	 HyzNmzr2GTCNjCy9BQYCsJZ/EIaS2xiomMnf8ZhRf4erCLwalASpp3lQM/ZKrbkdlw32g
	 O/Vte6Qp3QX7lp5jBGXZUIiWnGodxNl0YjiUw6uM9OO/us7OAUSJ+HaXEjE7GV/i1tU5r
	 yeMkKIPH1awcWlVxoh7rgyiw3RvSGRGLj6L8r0Vv4nQzYCYoS5GOpSaraffiBLlEV7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398732;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RB+v9kGjAfTy79oHEdctUyXDIbX8iDLKp/kTF8WJwCk=;
	b=2brXCbqVz5d4Wx2xzgH4W8MBa944AEcadx92GFRElewLxvGRsasA60xSEc4U/Y7HruLu
	 oAqdbBOI7Y1Y0TckMCdo0WHdaqmwRd4MmMltjXhy/7IpH1mLneOMw7I47+aitUZKanvbD
	 F5m1dm6ajAl+KO9N8WXPZ9pMfJE6DN1JJb+32x1m72ed/4OFFLnUgStfRaUSQBUHSPOZu
	 OrQcDTfKukmC7iOLJ+IVhhIaJtcbz/DtxVa6lJ1nJFjBlzPX+oGS279X137Q/fkvy/Z2V
	 mx0sPEyjkVU5hpog4ZJmRgAZmXmDAsmEWLewsNULyIWL4CUbZgnF6AlYaSg1q3ZSjIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADtVhjp3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4498606A31C;
	Wed, 11 Nov 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADtVhjp3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0D41F00A05;
	Wed, 11 Nov 2026 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794398732;
	bh=RB+v9kGjAfTy79oHEdctUyXDIbX8iDLKp/kTF8WJwCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ADtVhjp3pHegy9yFpy9X3VTLPr5TaYXbBpyU+LE3G4y+F4EJwGtEgCrHWUr61W1aA
	 ZS4v/Bnvyv+dmw8W/CUUTzfyGEra1vXaRrROSAgnY4IMMbTGTF1Q2aH6oGAOdlYrmZ
	 iEUz/geYKs2t11+3NWMkrOYMN3LDHZTfl1bFJ4nsRVoVeDHidgGID8PuEb78Fq+9o9
	 W7N8APrupvJWcP2lWYBtsj3mTaRJMv2zxx3CgV5/cFBG2F8bhZRoN+aHlR205I5Lsh
	 esYx7M1Gf6ZM8Yy65S/TLaEpBHo0KiifIa7bCISx1blx/AGMMYKRrDmkNV+m05Dn06
	 St34G20a7qUbQ==
Date: Wed, 11 Nov 2026 13:05:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: ltc2978: Add support for
 LT7175 and LT7176P
Message-ID: <20261111-amazing-saluki-of-bloom-b6ceaf@quoll>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>

On Tue, Nov 10, 2026 at 06:00:40PM +0800, Christopher de Guzman wrote:
> Document the compatible strings for the LT7175 and LT7176P PMBus buck
> regulators supported by the ltc2978 driver.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
> ---
>  Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

