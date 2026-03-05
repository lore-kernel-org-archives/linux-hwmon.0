Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB1B335546;
	Thu,  5 Mar 2026 18:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772736012; cv=pass; b=P4CaRICjgMZ5SW8I7CNc/twhNSmGCJAbiI4Jp0h9IqAaprLfCZ/QRrCLtmavY1HYvblWAiDvjdozFDNpTEgN11ThMIh04F2L+U0yqJOQMlNshuDHMv5fG67UMRf+YArIkIrDP5eFJlLIQVVm7uEIkX3pXPGAePLLtnD+KM/toh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772736012; c=relaxed/simple;
	bh=JLvdkRD0v4LKaFHQ/l7/pYm3shGTD09NvVwR1bSsk0s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=usSkwYixAPt8MgXBknfdJiL7le0Kf4dO2SeHy8CacsImWP8FTkN3sr8kSKWWcV4MKynRtBA86yDZJt4QhUN4BIEyhxZuOlzXyLSnXElfT5a2dX2Y1dNFFFUVNjNA5M4vpn04lB8+RNwKyHEOZPmLjHNmY1WFriOze9PqvnZr8kM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=L4C/bYeE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="L4C/bYeE"
ARC-Seal: i=1; a=rsa-sha256; t=1772735988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TCVDMS5l7/JU8614v0x4xbc3VFbhNGd+zjSLmQN4mbjMaReyx6S4kMNk79U/YdgFvPONMfk+mSlRzL8CBVrpoSJ91k2jFYFZz7vTbEmj6iDUhHPODiz1vcRMsnX1Jc7TNoqSvxmaM9ERnyk5zIAxVVCAlWs4O9Yw9ctDcFlBoz4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772735988; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JLvdkRD0v4LKaFHQ/l7/pYm3shGTD09NvVwR1bSsk0s=; 
	b=AGpMCStqSSezeDBF1Rde2eCUDZhMKp5ttqp821cWuWyJWUqpKonk4+WSw1UDeakc79WHOhQQLnE7CUU/ICZQKNPf/lYh/G0orxNhw4BGLD0zIVmUTJlq05kmlFEmigX75CDOXBhQWX978Nmq0eqxS3acTbYNpmDoKV2oqJRZGp0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772735987;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=JLvdkRD0v4LKaFHQ/l7/pYm3shGTD09NvVwR1bSsk0s=;
	b=L4C/bYeEZPzuHjU8iiuW/htnr6e5A9jbZxPn6MYzYdnCjGDe2cnX58V2I01JElqq
	5B8s6jkPJKurH0E8pZ4QD0NBVRPD4sJrP/DPne1MHSZyHlJpQ952GATW09vSlsCj6RE
	Ua88RNIkF+zZAXcDU6nP9KPwY3cQ4ByBcxJoGe3UqUnbAk3/E+zpivORyGoFJ0favUm
	Qv8Wz01NfHimNx/pcaDyfOlxCwHq4p2l0TLI7MhdNle6EWMJH6cGODiNbLPajwVYJdX
	KKJFqZhtSQuklWIEOXoPs0jvpAG8oRa1WXSi4sinYm3oFJFzxqFLz7heFi7XiGdsOCF
	GhPWZJ9M+Q==
Received: by mx.zohomail.com with SMTPS id 1772735986441202.47650338489473;
	Thu, 5 Mar 2026 10:39:46 -0800 (PST)
Message-ID: <94d742d9ace2ce58ed31525a58973b3a13257577.camel@icenowy.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren
	 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rahul Tanwar
	 <rtanwar@maxlinear.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Fri, 06 Mar 2026 02:39:40 +0800
In-Reply-To: <aanNQSHxLh2OsbvK@x1>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
	 <20260305144044.44208-2-zhengxingda@iscas.ac.cn> <aanNQSHxLh2OsbvK@x1>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-03-05=E5=9B=9B=E7=9A=84 10:36 -0800=EF=BC=8CDrew Fustini=E5=
=86=99=E9=81=93=EF=BC=9A
> On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> > The G and J coefficients provided by T-Head TH1520 manual (which
> > calls
> > them A and C coefficients and calls H coefficient in the binding as
> > B)
> > has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> > correspondingly), however the binding currently only allows
> > cofficients
> > as precise as 100 milli-Celsius (1/10 degree Celsius).
> >=20
> > Change the multipleOf value of these two cofficients to 10 (in the
> > unit
> > of milli-Celsius) to satisfy the need of TH1520.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > New patch in v2.
> >=20
> > =C2=A0Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4
> > ++--
> > =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > index 56db2292f062d..7d57c2934a8a1 100644
> > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > @@ -105,7 +105,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 G coefficient for temperature equa=
tion.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 5 =3D 60000
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 6 =3D 57400
> > -=C2=A0=C2=A0=C2=A0 multipleOf: 100
> > +=C2=A0=C2=A0=C2=A0 multipleOf: 10
> > =C2=A0=C2=A0=C2=A0=C2=A0 minimum: 1000
> > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > =C2=A0
> > @@ -131,7 +131,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 J coefficient for temperature equa=
tion.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 5 =3D -100
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Default for series 6 =3D 0
> > -=C2=A0=C2=A0=C2=A0 multipleOf: 100
> > +=C2=A0=C2=A0=C2=A0 multipleOf: 10
> > =C2=A0=C2=A0=C2=A0=C2=A0 maximum: 0
> > =C2=A0=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/int32
> > =C2=A0
> > --=20
> > 2.52.0
> >=20
>=20
> I am wondering if there is any backwards compatibility issue but
> there
> are no other users of this compatible in mainline other than th1520.
> There is also the precendent 030d2a0ce5dc ("dt-bindings: hwmon:
> moortec,mr75203: fix multipleOf for coefficients") having change the
> property. I suppose it is a not a problem unless other people on the
> list raise an objection.

Well mathematically any number that is a multiple of 100 is a multiple
of 10?

So theoretically there should be no compatibility issue.

Thanks
Icenowy

>=20
> Thanks,
> Drew
