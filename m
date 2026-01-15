Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9939C65B;
	Thu, 15 Jan 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482519; cv=pass; b=tqmB1/6amun68w+T3MYP3MoNc3W88skK37YTzjCrX1OZfwWJV3qzIkhYh96wtkUtvteTPAAIACM+/kvb7GTAGvKpaNd2+N2rTj2j7VgTpPwSgScHy+HoPn9lyWDYlEHDv+1CGU/LH1Ye1LsXO9Tu3jgXSwxHZDB9VZhft6pD3nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482519; c=relaxed/simple;
	bh=HKptvILYy8oTKuqHupdPHjBsG10nMu34+5SZ2UAqZXI=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DX8Po63eE8cEnpyBwncemfwLb698fQKa1HHRhxtMrK8tXgf67NlWQdoDU9rRDi5Z+QOs6qKvaA7mnbnlJssFOD8P+3T9WfSlAbSEatttNbEL2pFGdUheldmmrsvFPxTZFA+iVw2jxXndEwP4JsLjnc8VBBQvaPFijBeUlhySpYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=UWrskF6w; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="UWrskF6w"
ARC-Seal: i=1; a=rsa-sha256; t=1768482495; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XiLlE7IYSw2EMAQ3Ro+YXYV4C2xyTYcZjVdUX8KQllWMHWRdYvvPl9osBP4rYZE2UsGJ6kJLa+HQMcVwyoEqy4uxsaPRhaFMP2Im9b/HEdIBO/YS/sh1Gg/hZ66MzOFG8KYCG+cnopB4n9l01UkdG9dWF+1UxfA9PO+wCbM4CV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768482495; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oR+p2yGSr0JvJ1y3RFsMWh9RLp+XSaz8F0w2lvrVLfQ=; 
	b=V5xqust9LYBvhbBaUfRzSTLCb+6UrcnemPopPf0DbI8lDrR3l3B4h/rwzRngdpKVHCQ1m5aNW6dxM6WpFtK8X2EuCkuyH1WDmzn8iAMMM34rA68FDXK/IDDs/Bsjw2IPwh1hMRJK5fEQ/s+ZIh20QptviSi3GQ5gm8a1sum0rjM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768482495;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=oR+p2yGSr0JvJ1y3RFsMWh9RLp+XSaz8F0w2lvrVLfQ=;
	b=UWrskF6wi054gObZlLZ61bB2h37T7IiihYD0yF4ucj0IAVH6a6G1d/lMj4g2BVb4
	1XzLuQaOpcNNVPMwuOapcrUOSp8FcOQ4ByDt0q5k0kq2o9Zn7V/GVUNMg6a55dvJx97
	PxvyAmfIOmgx5MxHzSlskj1q9xbXawbDfcjCalqY=
Received: by mx.zohomail.com with SMTPS id 1768482493633354.59204872071734;
	Thu, 15 Jan 2026 05:08:13 -0800 (PST)
Message-ID: <1a9909f4083d85736a1e28067517ae0899e462f2.camel@rong.moe>
Subject: Re: [PATCH v9 7/7] platform/x86: lenovo-wmi-other: Add HWMON for
 fan reporting/tuning
From: Rong Zhang <i@rong.moe>
To: Kurt Borja <kuurtb@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Hans de Goede
	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
In-Reply-To: <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
References: <20260114122745.986699-1-i@rong.moe>
	 <20260114122745.986699-8-i@rong.moe> <DFOQB6DGBKBZ.39JQKPB7XDSJG@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jan 2026 21:03:04 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Kurt,

On Wed, 2026-01-14 at 19:16 -0500, Kurt Borja wrote:
> Hi Rong,
>=20
> On Wed Jan 14, 2026 at 7:27 AM -05, Rong Zhang wrote:
> > Register an HWMON device for fan reporting/tuning according to
> > Capability Data 00 (capdata00) and Fan Test Data (capdata_fan) provided
> > by lenovo-wmi-capdata. The corresponding HWMON nodes are:
> >=20
> >  - fanX_enable: enable/disable the fan (tunable)
> >  - fanX_input: current RPM
> >  - fanX_max: maximum RPM
> >  - fanX_min: minimum RPM
> >  - fanX_target: target RPM (tunable)
> >=20
> > Information from capdata00 and capdata_fan are used to control the
> > visibility and constraints of HWMON attributes. Fan info from capdata00
> > is collected on bind, while fan info from capdata_fan is collected in a
> > callback. Once all fan info is collected, register the HWMON device.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
>=20
> ...
>=20
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documenta=
tion/wmi/devices/lenovo-wmi-other.rst
> > index 821282e07d93c..bd1d733ff286d 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > @@ -31,6 +31,8 @@ under the following path:
> > =20
> >    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribut=
e>/
> > =20
> > +Additionally, this driver also exports attributes to HWMON.
> > +
> >  LENOVO_CAPABILITY_DATA_00
> >  -------------------------
> > =20
> > @@ -39,6 +41,11 @@ WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
> >  The LENOVO_CAPABILITY_DATA_00 interface provides various information t=
hat
> >  does not rely on the gamezone thermal mode.
> > =20
> > +The following HWMON attributes are implemented:
> > + - fanX_enable: enable/disable the fan (tunable)
>=20
> I was testing this series and I'm a bit confused about fanX_enable.

Thanks for testing!

> Judging by this comment and also by taking a quick look at the code, it
> looks like writting 0 to this attribute disables the fan.
>=20
> This is however (per hwmon ABI documentation [1]) not how this attribute
> should work. IIUC, it is intended for devices which can disable the fan
> sensor, not the actual fan.

Hmm, what a confusing name :-/

> I fail to see how this feature is useful and I also find it dangerous
> for this to be exposed by default, considering the same could be
> achieved with the relaxed module parameter, which at least tells the
> user to be careful.

Makes sense. I will remove the attribute and mention such behavior in
the module parameter.

> Apologies if I missed some previous discussion on this.
>=20
> [1] https://elixir.bootlin.com/linux/v6.19-rc5/source/Documentation/ABI/t=
esting/sysfs-class-hwmon#L279

Thanks,
Rong
