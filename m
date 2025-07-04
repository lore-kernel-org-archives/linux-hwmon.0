Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650B229A2
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Jul 2025 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611655; cv=none; b=Ga26bX1oQZ66zT81WJKuk7OTqufh1W+fDlUk+yCFgJtwnrrxBSr4oMS4XEhfp94uDMvZTSQjCjojqhxNE6VJLQh9Pqs8J0tnB4ukQPMkwShpvjwvMON9jsNdiocasBkXv8ZNDq9P1Ulv9UIgiuDSRcEwGNDX2RtFcbheb3ezxzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611655; c=relaxed/simple;
	bh=3+UD+kPMi4hv04FmdZPQdTX40a7pnz5ukudpwwM8z0c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yz7UZbdjdKEhVJIbl150OPKOFdopk2OmwOPK0ujjP+OB8Fnf6uG9k/wI5VrbVbE0Kt8ZaUZsWjOLGiuRq2edwp/b4WDaW+/fUEi7u5pkCHnkZwEpSFDIMm9SYEWnKB5VK8QA4ZrWZAQI322Mup1pLU5y+2B2k90OMAiYQoOqPyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=hkCMGQxa; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="hkCMGQxa"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A6ADE240028
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Jul 2025 08:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1751611205;
	bh=4JOsCC05GT5Z9OUaSdE832KYppoPiqwtQVkDaD87Xo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=hkCMGQxaqH47b/Vx5p3jHT+0354xm7dVs3CAxY8aMgjuTu8LkIVR+sj+x7W+BRC/J
	 X2hU46dmCBb2SbiGCCVN/WpERakg5LWJi4mScD6MxTTmeW8xsBZtJVX40nA69vvCeo
	 xLAyWOLVaATN7ZYpNudivhKaBgzbrv90vmgZQgN+99/lzanCchdhBciL2gu0ynadhA
	 ELWN8wCpW7J19iZelgP6QIxJp/uhuLPnM2Gou/tBfEFbABFd/AqV3Rb1AYQFHrw7Lt
	 lY7K52lAzLGtYOlbwdmfCBaUlkwQATuroofjP9+cB4eJ3OFHqndBbrsRbQUA5ZwLaj
	 BsWZFGkzb/UDgZ2ZTj3oIeSyVupJ1JfGdL1umoQtxIp0IrW/8oXp5iAZMXniA/VRnv
	 zRrhSIoLAoX38Ix3iXSvcILizSQuuMb3jlsF7X+SK75YU6dlw9XWXXOG0DbDG3/LCv
	 XF+kPTnfT6E4seWFnslOBemb/S939+sIuXrtK+s9X+ZB3+YC5oZ
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bYPBr58Pvz6v0D;
	Fri,  4 Jul 2025 08:40:04 +0200 (CEST)
Date: Fri,  4 Jul 2025 06:40:03 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Shantanu Tushar <shantanu@kde.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series
 2025
Message-ID: <20250704084003.21256f66@posteo.net>
In-Reply-To: <CABQ4Km_Ot1097OjNvvKNyYhxjqu5cD4JTZ0NoaQv9SOcWyE8=w@mail.gmail.com>
References: <20250630201444.210420-1-shantanu@kde.org>
	<20250701055337.14e2f5da@posteo.net>
	<CABQ4Km_Ot1097OjNvvKNyYhxjqu5cD4JTZ0NoaQv9SOcWyE8=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Shantanu,

don't worry. That was only a comment/mental note for me. Looks like Corsair does
a lot of refreshs of that hardware. Hmm, but Guenter seems to be a bit slow on
this one.

greetings

On Fri, 4 Jul 2025 08:23:45 +0200
Shantanu Tushar <shantanu@kde.org> wrote:

> Hi Wilken,
> 
> Thanks for the review. Unfortunately I only have access to a HXi 1200
> PSU to test. Maybe support for the new HXi 1500 can come later?
> 
> Regards,
> Shantanu Tushar
> 
> On Tue, 1 Jul 2025 at 05:53, Wilken Gottwalt <wilken.gottwalt@posteo.net> wrote:
> >
> > Yeah, looks fine to me. And it looks like there is also a HXi 1500 Series
> > 2025 now.
> >
> > Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> >
> > On Mon, 30 Jun 2025 22:14:44 +0200
> > Shantanu Tushar <shantanu@kde.org> wrote:
> >
> > > Add the USB ID of the Corsair HXi Series 2025 HX1200i PSU (CP-9020307).
> > > Update the documentation to mention this.
> > >
> > > Signed-off-by: Shantanu Tushar <shantanu@kde.org>
> > > ---
> > >  Documentation/hwmon/corsair-psu.rst | 2 +-
> > >  drivers/hwmon/corsair-psu.c         | 1 +
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
> > > index 7ed794087f84..2e99cfd556a0 100644
> > > --- a/Documentation/hwmon/corsair-psu.rst
> > > +++ b/Documentation/hwmon/corsair-psu.rst
> > > @@ -17,7 +17,7 @@ Supported devices:
> > >
> > >    Corsair HX1000i (Legacy and Series 2023)
> > >
> > > -  Corsair HX1200i (Legacy and Series 2023)
> > > +  Corsair HX1200i (Legacy, Series 2023 and Series 2025)
> > >
> > >    Corsair HX1500i (Legacy and Series 2023)
> > >
> > > diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> > > index f8f22b8a67cd..6b5c8f200780 100644
> > > --- a/drivers/hwmon/corsair-psu.c
> > > +++ b/drivers/hwmon/corsair-psu.c
> > > @@ -885,6 +885,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
> > >       { HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
> > >       { HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
> > >       { HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
> > > +     { HID_USB_DEVICE(0x1b1c, 0x1c27) }, /* Corsair HX1200i Series 2025 */
> > >       { },
> > >  };
> > >  MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
> >

