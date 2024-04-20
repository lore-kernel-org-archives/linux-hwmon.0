Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70034205E36
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2024 20:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713645512; cv=none; b=D6xRqJtyvj8kpkj/c7a3Vw391Zvf46RwJ+WvDCbmyLPIeDwqV/pHStj015JRqXaMN0rntABqCTO9c7zHm7bE4NrT/66zbK9D3rIq4EFf7b4Pd2skvGcrAEkIWmMrm0NOXMZyW0CLZA6zjBQL4SnhG4SdSRW8iSF28Fd45rnX15Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713645512; c=relaxed/simple;
	bh=WcHnP8DN/i6QyyO8+Ml12f64qj6Jmvul+7hc2xfBzmA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qp3sf7kUJWebnGrpvhtX7bT11685DVLMLRF3PK86Egej1esCBvQey7oIE1sv7yWOKDYI2So/ZIoKKnPLykAwrhb0VWimvB/SLUG3z9r9rV/Ybbw4j82xEymw8I2j7wyvPz8u3gHQIvuwf6F6XhrUAVZGr/Go16QY+iRq6ubTshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b=eclxvua8; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b="eclxvua8"
Received: (wp-smtpd smtp.wp.pl 15402 invoked from network); 20 Apr 2024 22:38:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1713645506; bh=BegMrUloxAxivw3P4kTfBykCUzTH2Cy/NX9jNm1iuIc=;
          h=From:To:Cc:Subject;
          b=eclxvua8DPyK9yiR3eCV747vuoQFrbormdkuOluctEbcEcn5oKGgfGm2lbfaE6x/M
           AqhUJzL1D8lS+gK0hRFK//f3jNJvB1CMCe6kZmC8SBsGXen7jFrJk/6fL5Gfbourdz
           y3d/ccIOx/Qybyq71AgUnhyUIApWqCilPF1keCBQ=
Received: from public-gprs181069.centertel.pl (HELO mocarz) (deweloper@wp.pl@[46.134.46.142])
          (envelope-sender <deweloper@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux@roeck-us.net>; 20 Apr 2024 22:38:26 +0200
Date: Sat, 20 Apr 2024 22:38:24 +0200
From: Aleksander Mazur <deweloper@wp.pl>
To: Guenter Roeck <linux@roeck-us.net>, Matti Vaittinen
 <mazziesaccount@gmail.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: Regression in lm90 driver regarding GMT g781
Message-ID: <20240420223824.624e725b@mocarz>
In-Reply-To: <abc624f1-e1cf-4933-b2e8-a6f3d46d38ef@roeck-us.net>
References: <20240420183427.0d3fda27@mocarz>
	<abc624f1-e1cf-4933-b2e8-a6f3d46d38ef@roeck-us.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-WP-MailID: 84b68a96ede36948db27817de95cd796
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [sWJ1]                               

Dnia 2024-04-20, o godz. 11:14:06
Guenter Roeck <linux@roeck-us.net> napisa=C5=82(a):

> On Sat, Apr 20, 2024 at 06:34:27PM +0200, Aleksander Mazur wrote:
> > Hello,
> >=20
> > I have a Wyse C00X thin client which is apparently equipped with GMT g7=
81.
> > It is (or used to be) supported by lm90 driver. (I have a log from 2020
> > where it was simply working fine; it was kernel version 5.6.0 then.)
> > Now, with 6.8.7, I get following error:
> >  =20
> > > lm90 0-004c: Failed to enable regulator: -ENODEV =20
> >=20
> > However, when I just turned this message into a warning and let the dri=
ver
> > continue, it seems to work fine, providing temp1 and temp2 as previousl=
y.
> >=20
> > Do you have an idea what could cause such a regression, and if this cha=
nge
> > (I mean: simply not returning error from devm_regulator_get_enable) is =
safe?
> >  =20
>=20
> Do you have CONFIG_REGULATOR enabled in your system ?
>=20
> Guenter

No, it's disabled (and it was disabled in 5.6.0 as well).

Shouldn't devm_regulator_get_enable*() stubs return success instead of -ENO=
DEV?

--=20
Aleksander Mazur
