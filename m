Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745830;
	b=PZ9+th8Xp0qCWCyUME4SCR4e0PgZOrqtyc9bwKbkD6xFCkcvY6s1aKAnum64XA+LBK0z
	 fZ8bzzavUXwZIAbjBQ8AoCZeeUTh4xBv39rG6JOTqdc4NBuFztXFk05Ia96hNH5+bZXWJ
	 d0Ysixcto+1E04iTo48DIEiyvn0grfzQ4tSRhA7c2JNWnZX52F3zLDll/pzlafo3+rqpD
	 Ay2piz7qml9HcfHJq24lsqzVLJIsLpz5xcrmwDc2TxuBIZgDop4JjziDP31VWO76X8+RD
	 pjJiKTzOj86LuZyTI15mYzjFtXW++3jVayO3iB4cWlOjMAzNOJHI5hsgtWTFhQ1v17A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745830;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FET2MsIaJQv/J73rhufSmasNyUG7hRh7WlYtAcREj7g=;
	b=W4BCd6sQ0X/PYYBmPjg1AHwtXDELEbEAuijQAPeejyzkU8J57VcknnJPKaS1HI2J3+nb
	 Yqueb9XQ+TrNOfjZkRvPS/u9u3Rl/e/W/wj/kL0XeW2GrO+C9qAmpDN4X4QoTlDKIRIfY
	 mBJkBWHegxUoakVuTs3jECm+LDNWoC80x5LAsWPtP9soZmc0deG41JnGBNtTsRK85lPJh
	 3yYt6LX0Cz8pqKwkoOj2U5oOwE1gE/NEkGCpJi1/fxqxHhq+zzY2YQtz7deko8R1FZJ0W
	 1nCSCLkdy3S9jB4KeBpWIbuCvUDGrQ2Ii8BVLxTCCtTzDddm2JfvjzFCnvTZjAuuKmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YtqP9J/g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413C606A31A;
	Fri, 23 Oct 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YtqP9J/g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB781F01825;
	Fri, 23 Oct 2026 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792745829;
	bh=FET2MsIaJQv/J73rhufSmasNyUG7hRh7WlYtAcREj7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtqP9J/gtHUhsLrsNG0IaE50cdudU3yX3uFFyJxOEbxCLfzPmM54GkJam5UxEl0XP
	 oz/AJqTd49nGZsb9DZ3duURVPe3+tkFatoh4Dzkbrw+FY0dPFQBO8/0vrw2YDUKpCM
	 2CwmT2xj1maCpK9EhmIE7nVTNhag5FbfJtvH3TAFEvD3EuaoPKJmPCFgsi4HVZ04UH
	 rhirxauIbxinD+Jqa56W2TzcUZPAC06laAkBXmH2VqfgBXsK9DHTrxSErKdLwmvesF
	 AKwq/Ui90BwXg0lrr5a4Ua+aqksMIdOQ19duaXAF2SimJTNCB1cwNMWHOf62bNLvuD
	 h2Utwz43+F/zA==
Date: Fri, 23 Oct 2026 10:57:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
Message-ID: <20261023-deft-tentacled-seriema-daa339@quoll>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
 <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>
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
In-Reply-To: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>

On Tue, Oct 20, 2026 at 04:48:15PM +0000, Kevin Jia wrote:
> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
> FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
> get their own compatibles.

And why tdk,fs1006 has multiple variants? Are they actually different?

> 
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Best regards,
Krzysztof

