Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504827;
	b=jCKF6SPmrz9N8LoFmY2wtaO9S4buZvrxTsvoDT8Jp4z11Yy849zN9T2GOvfKRDkRxH9S
	 Z3GLQ8Qzg4fi6nfi4RRcqeECCJ58z+VDA4j4hT0PN89Bu9nYD7/jo6IHI2UGxgnIKzu6c
	 JFufuTYj9gwBEjnQ+XG83hPdxHSN9sxMzhJDgpnK+m0Lwy38dp1IU/tnNX+REBj1KsGE0
	 T54EiAbw4BI97GwFDu2LD8kXBsoa3u1YAmnXubYmR36AVErgxPcGKW93WDkOoGvDf7dCD
	 ktsGHr+Xgd3dzZ3GLF+4s1NIk9alf94a+tqa312CE0P/DVgDsnR4J9oZyo9IKbxvhIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504827;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=pqndyXhGyd///inlh0bkz/2p43DOaMxpS7qbXPG20i4=;
	b=b2uWVkN1Q4iXNz1jj8885ktOIFHn5ILv/ZBCh3SKe8d63sTfznCCaH0CfoQEFtbtl4HG
	 h4GkdpCARcyPxZmzslnKoWYB0CxRdcaW98o8FL+EdYoTsucAKxk4JpE4qJdDIB0/w6/a8
	 WH4YjsYtAvK6kpyowqpSJfUYZ+StgLoitWbxbeEtdtBWm861+Qi99C2/2ZBDnRO+NqJyU
	 56tYDjtoXAxxsAWSQ5BK90YmXmhyOfaAAvu03eTEEKXFsfkx9ff3JkxDTY0TexCHx/zp5
	 W9IDsXXCQBzqdDQe9sRPEd6tdspMClJ+Bdj06Oh/ZELei0Y9hZQx+f/rkkuhOkm6qkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ket4zHcd;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D8B60A2604;
	Tue, 20 Oct 2026 14:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1D8B60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ket4zHcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792504827; x=1824040827;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wJfw+SjnP2KfsvDNTTW1Xxp3qYfSeKM1wTGt3vvNVYM=;
  b=Ket4zHcdX3XU2AvwyF84vH3LWJvKSmhoJkmG1TlQWEhmhu+yZtoF1RE2
   mJDJofX/9+PoiMDNcu5rmmjvV0lGIhES+1VnKSbawzF3HEi/jEcTBPoWp
   II7q95HlJUYaVZQhJgQ6ns2oCCOOUCwXHA6Bq3t9zuCs44jm+SPj6gFGQ
   ajfRnENmgp+BR8JieRuNPYBiiMx13MwQ1/zke1xX1VQTe1t1xuujkNfQB
   0tAlSM2F3/w/MypznxyuiOpBtfphuOm55Kk9GPaz/EXvPdYLefbpoUffe
   QJuM5+OcYeV2GkFPuFcH9PFVT+wqaKidkPKsG1kyCPSYcTD7hmN5/1sMy
   w==;
X-CSE-ConnectionGUID: n2XlDbJmTtSVRWQTFDDIhw==
X-CSE-MsgGUID: CD7VAZMnRCOLcmqUuimR/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1110863"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1110863"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 07:00:26 -0700
X-CSE-ConnectionGUID: VJW2Z/XeQM++p1KDLJfaeg==
X-CSE-MsgGUID: gCgnx/cDQq2Tv+cBbg4IhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4633700"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 07:00:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 17:00:16 +0300 (EEST)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
    Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
In-Reply-To: <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
Message-ID: <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com> <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com> <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
 <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1940865088-1792504816=:1177"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1940865088-1792504816=:1177
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 16 Oct 2026, Ilpo J=C3=A4rvinen wrote:

> On Thu, 15 Oct 2026, Konrad Dybcio wrote:
>=20
> > On 10/15/26 4:24 PM, Ilpo J=C3=A4rvinen wrote:
> > > On Thu, 15 Oct 2026, Konrad Dybcio wrote:
> > >=20
> > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > >>
> > >> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> > >> least the Zenbook A14 and A16) expose a custom, somewhat
> > >> Qualcomm reference-derived EC interface. Introduce a driver to
> > >> communicate with said EC, allowing for fan speed reporting, keyboard
> > >> backlight setting and receiving of a number of miscellaneous sideban=
d
> > >> events.
> >=20
> > [...]
> >=20
> > >> +/* RAM addresses are sent MSB first, while returned data is LSB fir=
st. */
> > >> +struct asus_qcom_ec_ram_request {
> > >> +=09__be16 addr;
> > >> +=09u8 count;
> > >> +=09u8 reserved[2];
> > >> +} __packed;
> > >> +
> > >> +struct asus_qcom_ec_ram_response {
> > >> +=09__le16 data;
> > >> +=09u8 unused[3];
> > >> +} __packed;
> > >=20
> > > Endianness stuff looks sane now but __packed also needs an include.
> >=20
> > Some fun statistics:
> >=20
> > $ rg compiler_attributes.h drivers -l | wc -l
> > 30
>=20
> You didn't consider compiler.h -> compiler_types.h ->=20
> compiler_attributes.h that seems a guaranteed include path to me. The=20
> numbers would be slightly better with that.
>=20
> > $ rg __packed drivers -l | wc -l
> > 1228
> >=20
> > [...]
>=20
> So lets not add another mine to what is already a scary minefield. :-)
>=20
> The indirect include paths are a minefield if somebody ever wants to=20
> refactor a header. I know some maintainers may be more lax on this but=20
> here we try to follow include-what-you-use principle to extent that is=20
> reasonable (when the include path is guaranteed such as=20
> platform_device.h -> device.h or linux/x.h -> asm.h you can only include=
=20
> the former ones).
>=20
> > >> +static int asus_qcom_ec_read_ram(struct asus_ec *ec, u16 addr, u8 c=
ount, u16 *out)
> > >> +{
> > >> +=09struct asus_qcom_ec_ram_request req =3D {
> > >> +=09=09.addr =3D cpu_to_be16(addr),
> > >> +=09=09.count =3D count,
> > >> +=09=09.reserved =3D { 0 },
> > >=20
> > > 0 is the default init value so generally =3D {} should be enough but =
I think=20
> > > it's not necessary to add the reserved member at all because the enti=
re=20
> > > struct should be initialized anyway by the surrounding construct.
> > >=20
> > > With these fixed,
> > >=20
> > > Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> >=20
> > Yeah I know. I still left it in deliberately so that in case anyone
> > wants to audit the format here and compare it to the DSDT it's more
> > obvious that this wasn't an oversight. Do you still prefer I resend
> > (or maybe you'd like to fix that up while applying, which I don't
> > mind either)?
>=20
> We can keep the member there but I'll change it to {}.
>=20
> I can try to remember to fix these while applying (I'm good in=20
> forgetting though :-)). But I at least try to check all the comments made=
=20
> to the last version.

This patch 2 has been applied to the review-ilpo-next branch. The rest of=
=20
series will have to go through some other tree.

Thanks.

--=20
 i.

--8323328-1940865088-1792504816=:1177--
