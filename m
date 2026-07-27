Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687C23DAAAD;
	Mon, 27 Jul 2026 07:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137200; cv=none; b=UBv8KdmO4L2u97kteGPTw3KbF7zkjqrOXfAfp6VkZhub5kjekRbhsPMxNbUV0X5mHD4eADTsGj22I2EZ7cHxSiHWvYC8L8U560ZJDOe6HyRYbv0SX2p6iSakXPd2kRJ1sBI2GtFBQtQU2k9p1YnFe2qSS7NKN5ybLK6i+9hUVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137200; c=relaxed/simple;
	bh=OSMOMMdhr3sgJudgtPi3Zf5hGhHVJV2Gi7WpSc6PQUc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=kcGePcx8yk3AiJdO6asGhlDhuQlOeQaHo0nT0fJ1JMTKbRhSNwZhmd3x4ZvK0uPdFXIvobsDihKRPFJG279LYdg3it81ABRpLzj/FPgePZfoerjpS5Rh2U92JP49dQLzsQbwtYV4DV1iYuWFDI/WhB0pCX7bKFlK+htCMieOHXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=To1h0LPG; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="To1h0LPG"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785137197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmJ8uGmDc0hqwz3dbUX6RW8a5ofURnJwzsVN39eibdM=;
	b=To1h0LPGWVHT/8VQA8oTLB+BbCw2hm9pD82X8CxV1puWY/GYeNwhPv9NBXOvSyjgPNlvcr
	ou9uK0WGT+tiVM9nOTEfuw69UitfFjB50ncPBaNf2MIwXe/bYRuQ31dRkXP9CKQQPd97HU
	qJHuPjMtDX74mnUjSu4Q4n1ROcbQ0Gk=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:26:29 -0700
Message-Id: <DK96BJJI4EKH.3FO6NPOTYTY0V@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <20260721-handbook-dancing-0c6805fbc94e@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-3-ef5fb342872a@linux.dev>
	<20260721-handbook-dancing-0c6805fbc94e@spud>
X-Migadu-Flow: FLOW_OUT

> On Tue, Jul 21, 2026 at 02:48:29AM -0700, Troy Mitchell wrote:
>> Add the Sensylink CTF2301 temperature sensor and fan controller to the
>> LM63 family binding. The chip follows the LM63 register model and can
>> provide a thermal cooling device when #cooling-cells is present.
>
> Commit message should explain why a fallback compatible is not suitable.

The CTF2301 shares the overall register layout with LM63, but it is
not fully compatible. In particular, it uses different conversion-rate
encodings, extended local-temperature registers, additional fan lookup
table entries, and device-specific PWM and ALERT/TACH configuration. An
older driver matching the "national,lm63" fallback would therefore not
operate the device correctly.

I will explain why a fallback compatible is not suitable in the commit
message in the next version.

                                            - Troy
