Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707F47885B;
	Tue, 20 Jan 2026 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768922793; cv=pass; b=J88Q7dusxFIPwGIKtV/Igz5sBymVtczr5t1W4uDo/hUtGFFo+ST627eu0iog6/qxZLi9vR/X0EK9yzispK990HyeEIET094PHSbcEpqpK9Ll9SVd04tSrgjnMFWtar1+Eug9AJZHv97id8BlUmlcRSMs+No0Df2+gphEN0WPGIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768922793; c=relaxed/simple;
	bh=/MEjD39Yv60OwnFERt0gJFnUej+jKaQNYPVjvXcpC0I=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=aVUqycplnKVBbuS8Wky6ha31Z8tZ0mWDhONMThJKy2tht+nBpa7ofj5d1jT2Zgd7ul3ubnSgDrQzAccA5E3nfCy+ojypS4t+19Qhk0BOtdd5RiQtKaQj2ZdeABGsMNEMydjN/oPiLWl/ao+63xOgEgP3/qMl9UHGObdNKhfHyxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=0PcacTF9; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="0PcacTF9"
ARC-Seal: i=1; a=rsa-sha256; t=1768922765; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bfQA4AIgthAz2rrJrn4oIzcOABrNM9XzVIf/JwaUR1bfK7sg0gy49EAGEnEckT5YJUJdVxuBMfs6tmf/q6HItv8SC6JseQ7ttr3gysP8KPTKICgmWEe9tPyO9WBBOvgWPxWxEtaBaSbEG2CZlhzckHGuMb+e1UoUmonWPqigKsc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768922765; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tDyi04yudMXP7atH5aP6ZBiVSMauESy3wEVpjLDBiXc=; 
	b=eXIyVscBFSFZMIn7v28tXlTXDLwK1atCVw7mqGj1BKgnmlb7nTsi3SuM2nD9y7qaDvFRjTu+Bl3cYXEbBaPFphUq13OIpqF6StJrmmY+bHUhXHwnFVD55tfB6I3DbZxOjJeyJbS1nFaJALZBw1wist3aYH68wBOoLnrTH4PhMJQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768922765;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=tDyi04yudMXP7atH5aP6ZBiVSMauESy3wEVpjLDBiXc=;
	b=0PcacTF9ThtgEMaNOblSO+iqGQwtb5CHXFPslaWJzTUcnDluk+nJGCgb+YF0ktTN
	Vff/sJkeod7E9kMykkfehQFKp1yaH3CNSbQ+q2epgfJFAa7uBlOXxVJq1D64n9qLsWJ
	fkT1KDZZA78y090JbMsZewfLr+dhEzI5BwksfSsw=
Received: by mx.zohomail.com with SMTPS id 1768922763922761.8704965565253;
	Tue, 20 Jan 2026 07:26:03 -0800 (PST)
Message-ID: <c437e6e73d74b7aedd269328e1b0411a110444d3.camel@rong.moe>
Subject: Re: [PATCH v10 2/7] platform/x86: Rename lenovo-wmi-capdata01 to
 lenovo-wmi-capdata
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Kurt
 Borja <kuurtb@gmail.com>, 	platform-driver-x86@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, 	linux-hwmon@vger.kernel.org
In-Reply-To: <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com>
References: <20260117210051.108988-1-i@rong.moe>
	 <20260117210051.108988-3-i@rong.moe>
	 <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Jan 2026 23:20:56 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

On Tue, 2026-01-20 at 16:48 +0200, Ilpo J=C3=A4rvinen wrote:
> On Sun, 18 Jan 2026, Rong Zhang wrote:
>=20
> > Prepare for the upcoming changes to make it suitable to retrieve
> > and provide other Capability Data as well.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> >  drivers/platform/x86/lenovo/Kconfig           |   4 +-
> >  drivers/platform/x86/lenovo/Makefile          |   2 +-
> >  .../lenovo/{wmi-capdata01.c =3D> wmi-capdata.c} | 124 +++++++++-------=
--
> >  .../lenovo/{wmi-capdata01.h =3D> wmi-capdata.h} |  10 +-
> >  drivers/platform/x86/lenovo/wmi-other.c       |  11 +-
> >  5 files changed, 78 insertions(+), 73 deletions(-)
> >  rename drivers/platform/x86/lenovo/{wmi-capdata01.c =3D> wmi-capdata.c=
} (60%)
> >  rename drivers/platform/x86/lenovo/{wmi-capdata01.h =3D> wmi-capdata.h=
} (60%)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
> > index d22b774e0236f..fb96a0f908f03 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -233,7 +233,7 @@ config YT2_1380
> >  	  To compile this driver as a module, choose M here: the module will
> >  	  be called lenovo-yogabook.
> > =20
> > -config LENOVO_WMI_DATA01
> > +config LENOVO_WMI_DATA
> >  	tristate
> >  	depends on ACPI_WMI
>=20
> This series is in the review-ilpo-next branch now. Thanks to all who have=
=20
> participated in getting it into shape!

Thank you for review and merging too! And thanks to Armin, Derek and
Kurt for review and testing! ;-)

> While reading it through once again while applying, I start to wonder if=
=20
> this config would be better named as LENOVO_WMI_CAPDATA ?

I didn't thought of that when I substituted all occurrences of
data01/cd01 with data/cd, but it's definitely a better name for me when
it pops out.

Hmm... Wait, we have

 	.driver =3D {
-		.name =3D "lenovo_wmi_cd01",
+		.name =3D "lenovo_wmi_cd",
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
 	},

What about adopting the same name here to make everything more
consistent? Having a unified name will be neater. @Derek, what do you
think?

Thank you all,
Rong
