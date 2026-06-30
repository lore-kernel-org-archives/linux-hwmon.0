Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0BB1F4C8E
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 05:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795874; cv=none; b=s5GJBACVqBrt57CLSgWNnfmMj+rp06jZzlRuh7gL/lgVGsvUWpZ92R+dteqGIOSdf0dichKQCaqD9YcjAifVoM8ndMG1o4fsPG74WL38vB5zTJiQhI8oP/RB1D+4B/miVlG3SMTt09h1yl/8AVV/Z3NTBB1jaPaz8L44XvtOoyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795874; c=relaxed/simple;
	bh=oLiLe4rx+Q5f373XGeZr4pcxa1TG1augvZwC0q0DbCA=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=X8CiibrNHiQYO6ISFxF00mm4Zh1qXGQH52D6WX+8S+jLLehpCuJC+XnqT7B/vthpJt/kARG5VzlWsKCCcptQ+nfML31QIDN6d4olxwB4liI7geA+tWnJDg2+rZmsRn3XQ9m/dWdV3KUjM+5Lvx+R8y5Kn142a107l3dA+MjcxuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jXXy9+AX; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jXXy9+AX"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782795869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8s2YeDUx0Qv3/b/dt4dd4mg2f8BCEcXqYgsrZFplxbU=;
	b=jXXy9+AXwN/uWmNq0926AoEypWoadZwqDWpU4AsWHtGp8Y45Q3AXiXULeKseMz0/CEo6ap
	fIVXVujT4sjMKo7T0zNVwRjsWiSEihob5VE3ZjQTYlooJxcVQHCqX9sWMI9g5YCQBFqPzN
	1r8YDLrppsEJza0/TJlz32jaBGck17Y=
Date: Tue, 30 Jun 2026 05:04:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Message-ID: <de7f3cf69c1fcea85dbb1ab58dd75b2a90191aca@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Matti Vaittinen" <matti.vaittinen@fi.rohmeurope.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, "Wensheng Wang" <wenswang@yeah.net>,
 "Ashish Yadav" <ashish.yadav@infineon.com>, "Vasileios Amoiridis"
 <vasileios.amoiridis@cern.ch>, "Kim Seer Paller"
 <kimseer.paller@analog.com>, "ChiShih Tsai" <tomtsai764@gmail.com>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>, "Robert Coulson"
 <robert.coulson@ericsson.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
In-Reply-To: <2cf72420-8513-4856-a3cb-fe2629588d1b@roeck-us.net>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
 <2cf72420-8513-4856-a3cb-fe2629588d1b@roeck-us.net>
X-Migadu-Flow: FLOW_OUT

June 30, 2026 at 12:08 AM, "Guenter Roeck" <linux@roeck-us.net mailto:lin=
ux@roeck-us.net?to=3D%22Guenter%20Roeck%22%20%3Clinux%40roeck-us.net%3E >=
 wrote:


>=20
>=20On Fri, Jun 26, 2026 at 10:26:02AM +0300, Matti Vaittinen wrote:
>=20
>=20>=20
>=20> From: Matti Vaittinen <mazziesaccount@gmail.com>
> >=20=20
>=20>  Add support for ROHM BD12790 hot-swap controller which is largely
> >  similar to Analog Devices adm1272.
> >=20=20
>=20>  The BD12790 uses the same selectable 60V/100V voltage ranges and
> >  15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
> >  (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
> >  a dedicated coefficient table that mirrors adm1272_coefficients, wit=
h
> >  the following differences derived from BD12790 datasheet Table 1 (p.=
18):
> >  - power 60V/30mV: m=3D17560 (vs. 17561)
> >  - power 100V/30mV: m=3D10536 (vs. 10535)
> >  - temperature: b=3D31880 (vs. 31871, reflecting T[11:0] =3D 4.2*T + =
3188)
> >=20=20
>=20>  Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> >  Assisted-by: GitHub Copilot:claude-sonnet-4.6
> >=20
>=20Applied, after fixing the comment about BD12790 coefficients as sugge=
sted.

Thanks for going the extra mile and fixing while applying. I am glad I di=
dn't need to re-spin for this! :)

And it seems gmail is getting more and more useless :( This (and couple o=
f other replies) never emerged in my gmail inbox. So, just as a heads-up =
- gmail may silently drop some messages when reveiving. :(

Yours,
  -- Matti
