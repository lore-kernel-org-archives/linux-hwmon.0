Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780B6406290;
	Thu, 28 May 2026 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991459; cv=none; b=gAD40Iims/CDJ4BgXNs+TmDzIEmRGQVRJX/4iiux0DtecDZQdHVaN3ZJhfesyOZLEa6vBdcJsgZ7Tk4xxo/1AZQudaL7azHCLaxaMkYO6XGr4HFWr26+XjMtVS9iHQA/jduXsJun5Ar7veiyZ0j1sZJN1GFyKbSEIbN28KLpvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991459; c=relaxed/simple;
	bh=t6RDpDDxcNoZAAmXu/8HFpc1mNtpoDRAiDdeeLDmsfI=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EHMbro1bfm4MxTDXDUDtqzTVPVUsFB2FkvyA/1o1FuYI5VxsskICmsHuLow64iK2kwJ01Cg5wyI/eiuy23+gD2COsG8or8JU0NT/7FELcXxB6ft8K789oIe65n6QVQJRTFBlgbyGgY3krVJyJdywRh4KUguPvhyff6xeREQ8ILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cNwN0+Cv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cNwN0+Cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1A11F000E9;
	Thu, 28 May 2026 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779991458;
	bh=t6RDpDDxcNoZAAmXu/8HFpc1mNtpoDRAiDdeeLDmsfI=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=cNwN0+CvvZwrfne+xLI3r5G+/33tLmQKc10of/X/QnbJ/l7gqEkaBUw68e6YSUEkf
	 HKRcxqOz1YAm23RNy0CO+810+P8/nan6BDWxvzQsiYYYn0sm7PQflNXrfwgZuxhXh4
	 7JHZNXzrKCpzhgtZuy8RxqqXnDIKAVJKGzi4B0V6bLrEEM8psR8z92Db8e2htxb1qw
	 uAfLYSyGDUCXXgOjPNSayNwsOzEIK3athvm7odz3eEyIFGGMxpSrm0WLtHPs8chdDq
	 XKnZ640O2SVz5rblHezOdvSPvc6ie0d5xTZBMLatxaUd2V3Zb6buKQEFrWdR+OSBtw
	 S9ew3CsmZM3jA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528173424.87503-3-sanman.pradhan@hpe.com>
References: <20260528173424.87503-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 18:04:17 +0000
Message-Id: <20260528180418.2F1A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Syed Arif <arif.syed@hpe.com>
>=20
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format.
>=20
> Both "adi,max20860a" and "maxim,max20860a" compatible strings are
> supported for devicetree matching.
>=20
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528173424.8750=
3-1-sanman.pradhan@hpe.com?part=3D2

