Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A9C3DDAE4
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137185; cv=none; b=JNKI3xnWR5vtXV4ZtoNYGXzyLOG8pLqP/rmrzIohomH++BpDcu2Tj7Y3Ef0sqi1YcmPcRGqS3s2mPD0nVbR58AsJ/eGitOadXXSvf6iJY9Wj5Xf/X5vTrGWWShj6LzIgmIwnjPrIrfF7VVjhgiPVnQbkQB8FlrklSdGFF+RzM84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137185; c=relaxed/simple;
	bh=OSMOMMdhr3sgJudgtPi3Zf5hGhHVJV2Gi7WpSc6PQUc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 In-Reply-To:References; b=d5xeuPq57jYToBtuZIcNsrGJx46ILgOrIF2fQDflrctggNpcnht6t+Asy9WEPJG/0+iJoTCMpLpK0jE9wNUa5ykjfNKTIpGUntawhBG2Ba7FdzN6ELA5nPM6yR8W4rgC9Aook0FTdDVt5JvcQYwqhcbOvXg46ytHYSy5ZD/MSoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vK2cbbSs; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vK2cbbSs"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785137171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmJ8uGmDc0hqwz3dbUX6RW8a5ofURnJwzsVN39eibdM=;
	b=vK2cbbSs1DT5vRr9+SQd/GLIMXVCOOZW/EgtwXudjf1h519XwUU78l8B2/r/V10rbEFFjr
	0gBHz8Ht0x0AKJmO+lozdEzYmuV6iKDuVEUBLMAax/SUMTnpqCai2zt34S2/2J28HLDH01
	HhTpZW/I1hP3acxWKuHAZ+vOxi0d8l4=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:26:00 -0700
Message-Id: <DK96B6DQ9JJS.K5GR6MBAX8KP@linux.dev>
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
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
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
