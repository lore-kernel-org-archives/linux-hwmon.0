Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D761F2727ED;
	Thu, 20 Nov 2025 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763619111; cv=none; b=VU0iNA96MRcUWsssJTnuH0L2n59H3Et5bxh7cVQrNvyQu/HKzDtHNS4qaFnVyqQI6ZiCN3GLdapm/TW2AckOV1swcSId3rug0hRKP3ty+E4gCg2vxlkjvRzsxPhkwCtpxp7ZQZCA5dc/fzJ8ES3BIPwCKechm1gR2p6wNorltNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763619111; c=relaxed/simple;
	bh=FGWFkdPYYzdHSb2lKHDtfUbyVPVahp0RsoYg5BuzjqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=L5LhaOAGoJKvB54mGpfraDa4HEh1Sfkbgkm2X9feLYot6TVnSUzTK0VNer7LbSlqacuaL76UQ687ahvx2hkUD4VV8pUhY2xZUg+dC7fXtlR3OmYmvhz5Dwr9uBfWmZolFTSZTnkGErwqzTaGqlFpRr9bAgSpc3qTSamFeWwoEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UGTBIufp; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UGTBIufp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=RZXjnAXMxAR80y5
	LKejzGO3brtx1NbXpAEkaTA/2rv4=; b=UGTBIufpWEWgxXsH38Lf7Q7+Eqb2DLx
	NSYm5JJV7mkEdM+Fp1zOT3yoyLwa2nYxph1X8V+3Se//RG7MQW7JttQKYL3XYpRi
	piSzT7z+Ab6GJuLNsU7KM4i7wtGJMxWFtimKdA33PMC30H/7M9dtuRgLQm+R5BkE
	DIapE9Q2rne4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD35XLhsB5puNGOEg--.3505S2;
	Thu, 20 Nov 2025 14:10:43 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	wenliang202407@163.com
Subject: Re: [PATCH v2 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
Date: Thu, 20 Nov 2025 01:10:37 -0500
Message-Id: <20251120061037.112097-1-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b37737fc-5e43-4599-ad20-73fb37c2ff7e@kernel.org>
References: <b37737fc-5e43-4599-ad20-73fb37c2ff7e@kernel.org>
X-CM-TRANSID:QCgvCgD35XLhsB5puNGOEg--.3505S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWfurWfXFyUGw47Gr47CFg_yoW8XF1kpa
	yUGFyqk3Z3Ar1fZr4Iya1FvFWYvan3Jr98Wrn8K3WrZw4qkFyFqF48Ka1ruF909r1fur4S
	vF40q3sFgrsrZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JjTc_fUUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/1tbiGQgM02keqWO3swAAs3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

At 2025-11-19 17:17:18, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>On 19/11/2025 10:06, Wenliang Yan wrote:
>> At 2025-11-19 15:22:38, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>>> On Tue, Nov 18, 2025 at 07:51:41AM -0500, Wenliang Yan wrote:
>>>> Add a compatible string for sq52210. The sq52210 is forward compatible
>>>
>>> forward?
>>>
>>>> with INA3221 and incorporates alert registers to implement four
>>>
>>> But this suggests opposite.
>>>
>>> Your driver changes confirm that even more - it is not forward
>>> compatible. And in other way why wouldn't compatibility be expressed in
>>> the bindings?
>>>
>>> Best regards,
>>> Krzysztof
>> 
>> Perhaps my use of "forward" was inaccurate. I only meant to express that
>> at the hardware level, the SQ52210 contains all the registers and
>> functions of the INA3221, and builds upon them by adding current, power,
>> and alert registers. However, these additional registers don't require
>> adding more specific properties in the binding file.
>> Are you suggesting that I'm missing the description of SQ52210's
>> characteristics in the documentation?
>
>This is backwards compatibility and if that's the case - driver can bind
>via old compatible and work correctly with previous functionality - why
>not expressing it in the bindings as compatible devices? See writing
>bindings.
>
>Best regards,
>Krzysztof

Okay, I will use oneOf to express the compatibility relationship in the
v3 version.

Thanks,
Wenlaing Yan

