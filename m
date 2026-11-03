Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705515;
	b=o0G8mVojYtrwAu0mX+egXqOZLziD0IanGjsQ3yjbZv9gLDeIOwnLOeTGw7MYqrXrivm0
	 5o3lQxZiXvUnM/CGLVI92x3tR+GABUUtLXjXTLiLmtflKLpCBL9HpNPBUqRY90pn5urL8
	 8hOk1N3np7A/UQjiILVIPX0r23H2DTKeGmg749nhGqGyxaNjdKxAu2Omy+Y6GqmQAd1OS
	 py3+55xFjUR4sy53tjQFIqWAHkL8xk0+OUMQHzjRcENR1R+pvv0bBJzBYZoJoRYDgzXgU
	 JbMFZrHguS5aM00J528cnLN/wb7dQlvfWaTjUtj5d/9TvhYWmQ/BhvqvCi/PpmmrM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705515;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/XDUORTo6ICEm3omVPg+5RFKOWB3eRUh5MNNqHqY5ow=;
	b=woyjJ+ymhxQpUbAuo3yPUYH47JZe5g7nlttOr2SX4SUgVL+y26OiPGJQrpaYTbdGfanI
	 iNqx82IqAyETdTu9lep9ncdERXkq1/oaQr/YZoHjXxKge6fksnCwyJUNsRJ7pwOdNuheA
	 9J4ied7IwgKNqDZUTh+l1tmcs+1scRdT5W6WtOgidnJOtipylolZXLAyakZrSTurwyYIx
	 kavjmsDvaw3dyZxCwSe7x5jtREq/u6sUYeMpgd6eaLh9kFBYRSrhCXQhOwZwUYcYBBz4L
	 fLbz1eIW39autPmWw48pK1aNp22/yZMY5iUftQJXag8XQJxy6A0v3tH4ZzIFdF3plQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="G/mVQm+m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F847606A33F;
	Tue,  3 Nov 2026 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G/mVQm+m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122881F000C1;
	Tue,  3 Nov 2026 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793705515;
	bh=/XDUORTo6ICEm3omVPg+5RFKOWB3eRUh5MNNqHqY5ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G/mVQm+mpyGultETH7//uk+IsRwAGDgytaHe7IXA2bKsZsSx3o45Xwaop/b/J6Rl0
	 908lN17gSA3rNwUVgb8zCGc6DAKOuYTEQiCudpFb9ULfaM3dda9+kG9iyuEeFSssn/
	 6dIatCTrLtKGIr/RPNtNZ4JpENVgpNyG26Ji3kHP6O4Y+I9uNs7zDCuQzckDnv4cAR
	 49aKIgb7VMFRQI6ihRq9sOaLvqmd9YaESqAEuJXuxZRfnfujKPbUyfWoNgJ76otArW
	 w2QGhxekkhgqBUoyAgNuXViWFkTzRbt63hwxvZNqtlPFfAbjvnqozvOGl6wOEf5qkH
	 CDy9l72AQ4OTg==
Date: Tue, 3 Nov 2026 12:31:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
Message-ID: <20261103-colorful-roadrunner-of-serendipity-2d6f85@quoll>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
 <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
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
In-Reply-To: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>

On Fri, Oct 30, 2026 at 08:35:37PM +0000, Kevin Jia wrote:
> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
> no ID register, so each part and factory preset has its own compatible,
> including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
> and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
> to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
> an output current correction, so neither has a fallback.
> 
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>
> ---
>  .../devicetree/bindings/hwmon/tdk,fs1603.yaml      | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

