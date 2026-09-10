Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397A1496D37;
	Thu, 10 Sep 2026 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070942; cv=pass; b=tZIFrbjKRM/ivA4YEPfS4VfIBf+IEOQyRaXkgJXvvNMg7IFN3Uty/bt4wxN4A5gVZ+4JFM3vRcn2mMPRl72nxxU8TJ+D3IL9RhOc1kpDNH3yHRK75AhbNXFdTZSxNpYygz6EnqsqaqZljtnRCg1HU4pcL2u4qbdPwEUfjQoxKHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070942; c=relaxed/simple;
	bh=XMxpG9iAPdg0+hMCZskbc/CZruxQJW5ugKlBJSiu/4Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OiV7/pMIgY+cYwdojtkNrJVVDWLyPs0N7ov6hnFxh+/qxcjmUd6Z/DogOPeDFIpM7vLr/3+SUqJiNgrFxuWDZnCrvv+zfUTo5ICCxJR5Xoy4bR7KNsCTNMakLEXnOl4myFAYdK6U1zRy1Ok2V6ECdZiiJlV2nMQb2w6jFc/JPXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=l1hiqpOT; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="l1hiqpOT"
ARC-Seal: i=1; a=rsa-sha256; t=1789070909; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TZr/MqxeO+RPrnxMU8acxsErDbW0kzwYW50+jb8y8WPpzMkiKtjlzCZpvi0wQK+4pSJA7Ln42c+DcqIW00HqOG7+oKaa+Cb3YOSK/cNZD06/tBn0l2l6wU6HCGD/qzpqn40kvWwImuKwsMbhILIsNmcufkuHyl5Yktsyf9IgHz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789070909; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7xF/bvGmmgfKjp7IFSUVBBDJnWnSnz1VJawArGtXiI4=; 
	b=CGtwW3B1TMb9OT9d+Sn5cmtsNP4XOuee2gdxUgfBOX4m7XDt24DkotZWlgY4Lrt3s6br8CaZSfO85QTkgQgV0+cQgNFF6cgyYg6js0SnKi9RBrwekCZNlyDRykpCqET8UI0VQTqQkk5NQmMcDuNr542dRByErKBzyOrzfq4HPS0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789070909;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=7xF/bvGmmgfKjp7IFSUVBBDJnWnSnz1VJawArGtXiI4=;
	b=l1hiqpOTywFVBjt9qWrrToVmN5Rn8oO0ssv+jQLph63ELk/A9PZq0QKhr6PmBBpg
	5K1OacgbhFSBI+5S2g359fysF31hb76ReeLhXe7RqGQG5U9NUIHGprgI0igj0YSdcDv
	th0QOr0GfUfg6ABNm3GaJLmHWwnkh2iXx6n3OyrJ/Fk0iLZd9YNupTXHmSNfupvDb/v
	NbLPa9ml8LAH96SUcIHovqD4Uqgoj4MaqpFCPbL+MGcQym+O1pa8lEXEnL3/cVVmDOy
	g6L6s2U3VDnjjqp8A5UhJWSqNrVjNA4LNYkeUtlnG3n2L50V6tmwqSFJaI3y+xrVvQl
	o5FIAL6Buw==
Received: by smtp.zohomail.com with SMTPS id 1789070906809196.12110273373378;
	Thu, 10 Sep 2026 13:08:26 -0700 (PDT)
Date: Fri, 11 Sep 2026 04:07:13 +0800
From: Rong Zhang <i@rong.moe>
To: Guenter Roeck <linux@roeck-us.net>, Clemens Ladisch <clemens@ladisch.de>,
 Gabriel Ford <gabriel@gford.dev>
CC: Mario Limonciello <mario.limonciello@amd.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
User-Agent: Thunderbird for Android
In-Reply-To: <54a5620c-36cb-4dc1-bbd8-9647ff7cb708@roeck-us.net>
References: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe> <54a5620c-36cb-4dc1-bbd8-9647ff7cb708@roeck-us.net>
Message-ID: <9334E4DA-5389-49BE-A9FF-48A7FF5C1C35@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Guenter,

Thanks for your review=2E


=E4=BA=8E 2026=E5=B9=B49=E6=9C=8811=E6=97=A5 GMT+08:00 03:00:13=EF=BC=8CGu=
enter Roeck <linux@roeck-us=2Enet> =E5=86=99=E9=81=93=EF=BC=9A
> On 9/10/26 11:39, Rong Zhang wrote:
> > Model 20h-2Fh are mobile processors with single CCD=2E For example, mo=
del
> > 24h is Strix Point, i=2Ee=2E, Ryzen AI 7 (PRO) (H/HX) 360/365/370=2E
> >=20
> > Including mobile processors in the model id range of Zen5 Turin
> > processors leads to bogus reporting:
> >=20
> >    k10temp-pci-00c3
> >    Adapter: PCI adapter
> >    Tctl:         +54=2E1=C2=B0C
> >    Tccd4:       +148=2E6=C2=B0C
> >    Tccd6:       +148=2E4=C2=B0C
> >    Tccd7:       +149=2E1=C2=B0C
> >    Tccd8:       +149=2E2=C2=B0C
> >    Tccd9:       +149=2E2=C2=B0C
> >    Tccd12:      +149=2E1=C2=B0C
> >    Tccd14:       +22=2E0=C2=B0C
> >    Tccd15:       +22=2E0=C2=B0C
> >    Tccd16:       +22=2E0=C2=B0C
> >=20
> > Fix it by removing the said range=2E
> >=20
> > Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitor=
ing for Zen5 Turin")
> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
> > ---
> >   drivers/hwmon/k10temp=2Ec | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/k10temp=2Ec b/drivers/hwmon/k10temp=2Ec
> > index 75a45010d687=2E=2E3e7e63edc6a3 100644
> > --- a/drivers/hwmon/k10temp=2Ec
> > +++ b/drivers/hwmon/k10temp=2Ec
> > @@ -523,7 +523,7 @@ static int k10temp_probe(struct pci_dev *pdev, con=
st struct pci_device_id *id)
> >   		}
> >   	} else if (boot_cpu_data=2Ex86 =3D=3D 0x1a) {
> >   		switch (boot_cpu_data=2Ex86_model) {
> > -		case 0x00 =2E=2E=2E 0x2f:	/* Zen5 Turin */
> > +		case 0x00 =2E=2E=2E 0x1f:	/* Zen5 Turin */
>=20
> Doesn't that drop _all_ CCD temperature reporting for those chips ?

Yes, it's intentional=2E Mobile processors don't support Tccd at all, and
Tctl is the only available temperature metric on such processors=2E
In the commit message there is an example of bogus Tccd reporting=2E

Thanks,
Rong

>=20
> Guenter
>=20
> >   			data->ccd_offset =3D 0x1F0;
> >   			k10temp_get_ccd_support(data, 16);
> >   			break;
> >=20
> > ---
> > base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> > change-id: 7b515a4b-k10temp-fix-zen5-epyc-14334e85a3b9
> >=20
> > Thanks,
> > Rong
>=20
