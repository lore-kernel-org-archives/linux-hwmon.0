Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B737A836;
	Tue, 15 Sep 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481845; cv=none; b=NNN+lWfxY+Nbkif2GswU2GZCEFi3FUTXi8LhmMPNJ6YgfS7CGvHhzYF7miL5oUr0WPGLYR5L6NiHEOu8VEOBhJ9MoKK0WI+wHBwtxsrHhmaeZ6aSTJTF5qKgXwV11OPTCOfuvFUhlBcCN3ZaIxDC+BwGkHOaKue4Fp+bbIiNOlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481845; c=relaxed/simple;
	bh=5KS1EgjYzXRO/LGwHSnOnFkVf2f169ADWg9LUHRlUEg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tUDLb6m7H2PtHUuRcGzLyEQAa+0IGvUe7H0gEwkARrokRZJMjktx9Mdz7uHg0tIuO8Kon+w6XbJ57LkrmXljiQmMRjcafQ/ihqR0jU3pneD5iLGwkFMVbkM2zPsinEu2xWl2Sv6xqbwnLDBNYbt2HXIzR5K6/dNkMGzGjiiwoMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=oQ7avwCU; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="oQ7avwCU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789481841; x=1789741041;
	bh=YpZiKTdkBRV8HrUzJ48KBDYy9De2eBfD+hXdyRTErhs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oQ7avwCULkbth4nZNaY+DX9Jp/itRJAYGdH3wSuloaqeppukUvLeLAXgZrTEwMVUe
	 fPMKfqT0zWzE19I+pzKB6xS9aXrzKUTASoWqRQAgi84HB1hHJb/4WCQGLPVWrlFzsE
	 KmdFEcoYBo6k3LVAiMiyPTxbmh4WZD9e+uQD0RHplTTqMguAOWG13vtdKqWj7+XOKh
	 hAHAQ8O5bhghldL3VDLnP9pJlIB45gXQHwgAMaIm8zDTrmKCPc4fqCvvWPvEV0S5W2
	 y1TDanyWK1DZXlEXgU5zKCp6vWnwAcIi87LaWfOe+0mYtYJKl6n0zFi3R8+UbCAtk5
	 vGp49jxNF3BAw==
Date: Tue, 15 Sep 2026 14:17:16 +0000
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] Monitor Yoga Slim 7x EC sensors without taking over cooling
Message-ID: <dQbSKN-LtVryTrUiryOnW7ur2YSJe4nzHx4QAltRbJRgsDHxWBYVQI3H0SPzxlqlCOAZg5NJx2Fe8dpgr7KjQkxLrLPRZuc8ISiUY1-v66Y=@pm.me>
In-Reply-To: <73db10fb-7778-44be-aced-562aa1039404@oss.qualcomm.com>
References: <20260908135801.81436-1-birk.skyum@pm.me> <73db10fb-7778-44be-aced-562aa1039404@oss.qualcomm.com>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 328f6d94d1881f1cbc1d19fe2dea1636ba71f5dc
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Anvesh,

Thanks for the review and for raising the firmware comparison with Daniel.

Agreed on preserving the LUT match data. My v2 is based on
28924df2a08f440c73991b83028032c901de2ae4, which does not contain that
implementation, and I could not find it in the current mainline driver
either. Could you point me to the latest series or branch you would like
me to target? I can integrate the read-only variant with that match data
without changing the existing LUT behavior.

On your thermistor comment on patch 1, would a DT thermal sensor and a
monitoring-only thermal zone, without cooling maps, be the interface you
have in mind? I can keep fan RPM under hwmon and leave cooling under
firmware control.

I also agree that sharing the EC chip is not sufficient to justify the
qcom,hamoa-crd-ec fallback. I would like to compare firmware behavior
before treating the capability-query failure as a model-wide limitation,
then coordinate any binding adjustment with Daniel's series.

For that comparison, my existing September 8 test recorded:

  Yoga Slim 7x 14Q8X9 / 83ED
  BIOS NHCN62WW, EC 0.99.0
  Firmware query 0x0e: 03 00 63 00
  Capability query 0x42: 00 00 00, identical across three reads

The capability transfer completed with three bytes, but its count byte
was zero rather than two. The unmodified driver rejected it with EINVAL.
The separate read-only sensor test successfully read RPM and temperature
while firmware controlled the fans.

These are the earlier results, not a fresh test or evidence that a BIOS
update would or would not resolve it. Daniel, I am happy to compare your
versions and capability response, or repeat targeted read-only checks if
there is a useful difference to investigate.

Thanks,
Birk

