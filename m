Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C128C2DD
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778718974; cv=none; b=VI7m692vGLWr04Ok52+jA4fa8ZrGKsqf2s+6z1EiYETpvlX+qAuBzIOD5o2w5M/hFeW+7Vki28pfwMOTq0UYxBHQwiSfv80T9crhgdWV2jkA1cUuh+PVwIbqDxDF6DKHGnOdU3XfsePtHDduUCGJl4JYzXK9vKRM39l+8D0tnf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778718974; c=relaxed/simple;
	bh=hKEzkWQOglLU6cByh2LmsHajF98FBytJqpKxeYHfBNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fI1tkXxzpWi0h7pyA1WUtrv5Ac0J+wTCfwZnne6LFf+xC6XJQrZLRr18qGDN6NedrPJXmv06wdpq7hDMue/SfUPk33knUZh/B9h1y86sBSmQUZG/ZsCI/K+Dok0IAwiX7uRmgPfX7BHQqxsGKV/u024pQESZc312UAsbhHJG8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=h3mk7wRf; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="h3mk7wRf"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4DA8E2C0666;
	Thu, 14 May 2026 12:36:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778718970;
	bh=hKEzkWQOglLU6cByh2LmsHajF98FBytJqpKxeYHfBNk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=h3mk7wRf1A1TFslZK6RGrgRoxrO0/F6Ye55JQAwHySFiJ+lUCAoGLOq5TFrPGDCNt
	 2ZggYuDFTWVjBB8gYX7XY2u0BMgDvUw3dA71BPUYOM4patvKdyFJ0MILtafpTx4NiJ
	 9zXb6rgzk/0BMD+0ELu8E+3BMoPnx5Qhs+FejwxdWmq6rxW+04iQjJP8pMih171IsR
	 Oy2JOn+KXcrCQKp3jxm+dH3YsdJsIdU7F9aeOkc4Sb1EYzs954IEjpwy/j6UHRpPtO
	 GPF7D1fzGQTtivqzN6C85zD0K4DHqtkfr1vClvVTsxvjXXxqjZGG3cRJIj8rjxCdNg
	 5wtkNlmSU/Y7w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a0518fa0001>; Thu, 14 May 2026 12:36:10 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.39; Thu, 14 May 2026 12:36:10 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.039; Thu, 14 May 2026 12:36:10 +1200
From: Ronan Dalton <Ronan.Dalton@alliedtelesis.co.nz>
To: "linux@roeck-us.net" <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Packham
	<Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking
 responsiveness
Thread-Topic: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking
 responsiveness
Thread-Index: AQHc4zcUuc9evSL/uk+yq2ZvjD3IabYL47eA
Date: Thu, 14 May 2026 00:36:09 +0000
Message-ID: <9bf867c1bef8166705182a73f664d2d2313fc684.camel@alliedtelesis.co.nz>
References: <20260514001701.1533275-2-ronan.dalton@alliedtelesis.co.nz>
In-Reply-To: <20260514001701.1533275-2-ronan.dalton@alliedtelesis.co.nz>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Es1xrjcA c=1 sm=1 tr=0 ts=6a0518fa a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=BhaoXNk7gXQA:10 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=XFHmKnU1uVBh4PVQG0MA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=UzISIztuOb4A:10
X-SEG-SpamProfiler-Score: 0

Oops, I accidentally sent the patch without (v2).

Please disregard.

