Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5F3B6348;
	Sat, 11 Apr 2026 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775927545; cv=pass; b=RRw5q9NvgR7D+AsNsru4ZCpKboKGD/cs30Yog8/b1DZp2pI0wz0JUQISpqv506CWEEOqI7wnX7a+0iE+HhqPK2fCnCMf0OZBzT6MMLZNpzcbjQb6wjwPZLCNZIgpxnpNqd6tQQMRo0R2aso3C4dwyqvCf4haT8j4abCxcATNdIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775927545; c=relaxed/simple;
	bh=QzTyzfgwJmX5l6gOtBshZqepdzh53YMTwugDRTceRFg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=t7wmUdXlCLqH1dT+KWiyOGWV8E2beP/rb0DlQzhcMuX2uVS7JYLWoVSZYoRK0q63m3oj4DWd93CSlH6n8h7r5Sh8REJGI1hF1RfSyqqgCIVzxVMrnOzYSfSiGF5g++Xt/GQthaGiD8fSSyfpPD9rWLA2gf0jvbkFP+gjjdCjy/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=FNjSH2Mz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="FNjSH2Mz"
ARC-Seal: i=1; a=rsa-sha256; t=1775927513; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GBNN3vih+kevB5woGNSFLOURU1fiJRof/a0dGcioKGBfwrOrNViZW4IsW4r4Wct/y79s5GH6XvBp7GwWli3lKTyXM+HdayUEQBhUcSImPjX4Trg+6R30YtMXxc4Om5ciTsaUvt05PNBz0Je8korcxak6+J2V8baJMxkaqCqk14I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775927513; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QzTyzfgwJmX5l6gOtBshZqepdzh53YMTwugDRTceRFg=; 
	b=PFNVTY/v15wvjPCwcgnZ9Svs2BFSfFiATY6oAGyUzzsXktQMJPj7A9JgPG/hoRUaAzLCXl9/r2NwZfBOaLTp//NoccLRjbjBRj/PLQtX2tA3kVRLcF4bmw5LZSnajoEvo4/axCk/JWCKXsKsyCfbFjIIngafMVENRrHH/ifvA5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775927513;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=QzTyzfgwJmX5l6gOtBshZqepdzh53YMTwugDRTceRFg=;
	b=FNjSH2Mz7Y6LMgfgLqUrJwHgSNAkog6YZ19G2uxTx+h0bLPDXVpY+kR4WEjTHybT
	Fl6TTLKWD1Yjx93Qciz/+RoNoO1LbCxd2NE9H/pewyRh1WcuK6tiM1V/kbTn8LLBony
	t18PbDLlqyhYG1sj48X0tp87GFFYkwPnKt4UT9qU4Qrg+uKodkOXojRnDQOe1cCuh1C
	V4ZD0IKCL2dX0CPwBYONwpUKdr0ao0bzv1I3zRpgAkhoL8A1GTsAN69qV9VtgOw+1dT
	cAxonDgboM9MkW/qiHTENilx2asmrQDOyBJjuwrhqz4/Z7e1BUlZOaP2cweh+B/YSSU
	rpNhz8SeGA==
Received: by mx.zohomail.com with SMTPS id 1775927512784127.39999269271095;
	Sat, 11 Apr 2026 10:11:52 -0700 (PDT)
Message-ID: <39680cd5d1211cd0f0e944ebc7c831f5607ee9c7.camel@rong.moe>
Subject: Re: [PATCH v14] Subject: [PATCH v14] hwmon: (yogafan) Extend
 support to more Lenovo consumer models
From: Rong Zhang <i@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Sergio Melas <sergiomelas@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	ibm-acpi-devel@lists.sourceforge.net, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, Jean Delvare	
 <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <8f7812ec-3c8a-4673-8222-28ba22796e22@roeck-us.net>
References: <20260404164339.119023-1-sergiomelas@gmail.com>
	 <ae53b7783787975caa973dcde337f20aee9b0b40.camel@rong.moe>
	 <CAP8e=s+TcnikqHtTaXdsDUmOreLP5MYNQN1gDWvrQa-smbh_9w@mail.gmail.com>
	 <4c627b63e40d1a3b2923ebe8b42fedde176f35cd.camel@rong.moe>
	 <8f7812ec-3c8a-4673-8222-28ba22796e22@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Apr 2026 01:06:47 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Guenter,

On Sat, 2026-04-11 at 08:56 -0700, Guenter Roeck wrote:
> On 4/11/26 07:31, Rong Zhang wrote:
> > Hi Sergio,
> >=20
> > On Fri, 2026-04-10 at 22:14 +0200, Sergio Melas wrote:
> > > Hi Rong, Hi Guenter,
> > >=20
> > > Thank you for the review and for pointing out the overlap with lenovo=
-wmi-other.
> > >=20
> > > 1. WMI Coexistence and Bogus Fans
> > > I completely agree that double-reporting is suboptimal. I will
> > > implement a check in the probe function using
> > > wmi_has_guid(LENOVO_WMI_FAN_GUID). If the WMI interface is present,
> > > yogafan will return -ENODEV and yield to your driver. This ensures my
> > > driver only covers models where WMI reporting is unavailable.
> > >=20
> >=20
> > You may also want to add a module parameter to override the WMI GUID
> > check as some devices do not support the fan reporting/tuning interface
> > despite having the WMI GUIDs.
> >=20
>=20
> Please, no new module parameters. If there are devices not supporting thi=
s,
> add them to an exclude list.=C2=A0Or make sure that only devices supporti=
ng
> the functionality are instantiated in the first place.

Fine. I will no longer request for a module parameter then. Relying on
WMI GUID checks with an exclude list to determine if lenovo-wmi-other is
preferred over yogafan is OK for us.

BTW,=C2=A0I just noticed that thinkpad_acpi also provides fan reporting and
tuning support for some ThinkPad devices when I saw a patch on the pdx86
list. So, +CC ibm-acpi-devel, Henrique.

Thanks,
Rong

>=20
> Thanks,
> Guenter
