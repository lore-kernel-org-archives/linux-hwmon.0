Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378756;
	b=Py3UwiW/Y/YP0/qOWOxHreslO8V05CyZpjAtG+GyYNzR2FY6DujUPn1OUJZTVGAFtvIT
	 463EONoNWqWZTGjUtFEgSiL1d7F1fgfmI+18x9dMfOhqfQ/TNWPGJDWacwBUqi3OdYvQZ
	 dTlroX9kBOBjNMDIHU4VHm7NEFfL2es1wloCFKI1jbM4IObA7b3ys5aJuq1qkDrZQCwRA
	 E0zeVrVTBvxWgEf/kkNINs3pcFSqGU33kuwd6X2+gzrXKG0I3Jqh7Hw3zuyQK6pB9wXLW
	 YrZE8UUBFqdmoVfBH8zhP1k1Qv7mw/jZVOMqeYsu5c09dkZZ7jrDLNF1/KXFQXyXytQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378756;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=52xTTzrrbC1bMV9FtChgDxBJI5ySTBL3GYcsCBoyQKg=;
	b=2p+vk1gtyeEpsF7t31GTZGPtbgrFMkoObByyZRPofgWL49NWOsSve0UzHyb4lcbsaH75
	 1o/XbX5kIWDgv0xU0v2HsmD2+u6TnhZkitc7dpkyV4biCrmnkwf2hEIuCXT4ZbS4EKBIM
	 gWGh1JeUHayYRFld4QiIvYVdYahaw0C/KRwcjAcc26I9ukaM3S/o6S8cgg+MJ3e4nB54Z
	 dDi8h7Yxebu8ZfAiz1h3//GIFA0PahvgL6NlbO+mAHeGDYlmDMY6UYLSivFEVQt4fk9AM
	 HgF5rPn+QZc1MLmP+5WZJhZXLizlmTdTB4S9MvTG72QmeC1HLHMdlXXNCRZSA1gaGVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVzNbutF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D4606A31A;
	Fri, 30 Oct 2026 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bVzNbutF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34841F0093A;
	Fri, 30 Oct 2026 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793378755;
	bh=52xTTzrrbC1bMV9FtChgDxBJI5ySTBL3GYcsCBoyQKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bVzNbutFMnANPdYkbrUI56pS2HX2noR+FLh/AXMn0/doxaUOhkfZiC2RbvoooAlcx
	 2YVSjDrUVw/J78r1HgYDY0K5/UpBEuU2t5b4/kDbqFgXwj8dTxSyUpt+Lo12i9MVAY
	 Fqc+cPRg6Kg7V/T6SrMLvO6x7liI9IuCSkzHXfFNPYEAI8qxlCbF5y074pNpIZp/JA
	 U0/sz+kQcX1szwPJRhKXef+kvXpqxDZ8TR+9SgpSMLhGg3Xic+iODcP0FrE1UrxDLP
	 i9oGkPUN/FBHE9WNnov3mkNmxhbLYthi1Vj5IfXW55YBU/aWEYQ6EjIgOdY4vRbLR9
	 BEyajOTXOkFFQ==
Date: Fri, 30 Oct 2026 11:45:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kevin Jia <kjia@nexthop.ai>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: trivial-devices: Add TDK FS160x and
 FS1006
Message-ID: <179337875070.546916.6057991565347100078.robh@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-fs1603-v2-2-0986107a5cd2@nexthop.ai>


On Tue, 20 Oct 2026 16:48:15 +0000, Kevin Jia wrote:
> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. The
> FS1606-0600 and FS1606-2500 presets scale telemetry differently, so they
> get their own compatibles.
> 
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

