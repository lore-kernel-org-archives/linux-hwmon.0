Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EA94EDCB6
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168772; cv=pass; b=JWaioOA8mODX7Ld4TwnO5C6izbdGS2Z8rRoCkyHeMvB0pQf/g85to8FZEtm4qCGlITGIGCQ4BCHrMfgqED7nBnbG9SxaTBLRoEn4OUDUQsiHmHvOqsrPI0Fx9Uhnon2NxClo4q1alI1/gZkI13y88SCrU5Q7XNDNPfxK5AQUskk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168772; c=relaxed/simple;
	bh=GYZa+WYjfY4q7qD6twJL6utNn4fuZ9ttx5FDCieufDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMglxaUYxs3e3+1e9ywZbkEuUs0TB5u27FTQLUEzbmjT3LhMuw2fEkc2Hnba6SW3PQul8X2JJiaCueuUZyrdkRhRo4WLS0CQLDDKEbX+winX0zX1of0T73nluj1tw9xQcgL9NSZkU1oULXR244TlpKSpBq0kqHEH79YfRWHKUJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBLiA8Xl; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBLiA8Xl"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f1cd0b004so12013785a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 09:39:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168769; cv=none;
        d=google.com; s=arc-20260327;
        b=TzqFhxBiRoatlyteiaO0WK9mhBv1fXlS+4g7JP/FfQxuQ4SnvOevICOmLzvjgvfN4D
         9RjUv9YWi2sS3k3kwLP03xxzJdYE66tWSItDHfr7HgZGMQAyXdyMlhmj2V15Kf9/qkIO
         I3cyPnIQPxZ+gcPi5cnmfr1xl4GL4hSAZURjZKp/Grhl7QPuV0vuHUaeq9P4/eiqpnnD
         OwcOjU/7QUveIC97HgZftuLTwi1JhGkiIcK4ZJIZDsA0cCviOHeaDWcnpO7OPCC2pngL
         +gsMcUIr1vrsTczb8TKPqQpcoj7n78P4oQ21PVBvBKYy52SwT7vubDwB9d0Y7Oo+LPDA
         AqdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        fh=z/xBK7INOq0LaewjM2u/8ZJFVhDSYBp4UddsOlNKvIQ=;
        b=FxxaUtIEfcKr1MXpU9l1tVHYhEbhDRm36WC2EegdoEBMyotUcPIEMnxv/Qlwg1InnL
         I2XA5BeEdMJkO4iw4LSA6CavHIqMcM5JiFuzCOnNIclnQ4TpGWsscOIZV65FdDBf9prS
         WS4dMQz/62WyWjGnscnzjr3G0/ySorzmdEOyl1yRqoozj4W5KQk73PmtBtP41W2MVXQn
         O8sTqjPtmCPuLQ4daKnKu6A3xHnVnZ4+nkjwbNhwcs6L/1KRbAst9nvHt3ho5i4lsuC2
         u9gqTBkf0+G1xryXeIrzzL4+/jXmTr5uqCjWMgKO/1LTWoaupYN/ZDli4tl3Dq66xemR
         GNRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168769; x=1792773569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        b=XBLiA8XliZKkW3zJdWaMAxNTsvlCGvsyWdTYwW3nIJCs0bCr+uBm2maybYrtvNkvfd
         3aCMqBRIqnCcYiPP0wQqXniUENZsyxZekOY5B0nWfDoWs0VSMwHJSeyMuEI8pyhimfB/
         jyz6OgCHUJGJU2O5Paq/q1AfrY2aeHFnSJLdikiB1x9XYAwOyS8ON1tYx/7ZKCrOwJaC
         9xNf0Q9RTptQd+UOAkPD1UKo2VRCoDIEBWQeNOpHMIGjotfBHpO3hrOqUpvp0ejpQag1
         TNWHUcmgIWujwMTYg43NP1AuLDIuR+I6LCSZRu8J7W3pkv96n5UmJ08+YDJbAXbjrzLr
         8HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168769; x=1792773569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXnPIgMXiyBd1h2THh7HTsYWO/OramMboVGVD9BzIk8=;
        b=oT5cIBx8U36l8LpUAGvV7i4x0nvebnUKnlJQ0s4NXK3ioWiCaOj02eIQ83BUonrXPf
         LmgtPG2l7TMLVlIgyHZ20qnBc2qLt/mfnjRbDLhOkGv+KyFGRAZ4m8FQkRdg4xyRIPDd
         K52EjZ3m+yLvB98Rsd/1gL5vdlQpoLz+7dxe1StgYPlLPDsuy4nuw4y8qr6OunDAj0VZ
         HXWHXa1FPCOiiMtH0QRt8GNe7XFNkrCTE8749HufNzH9QP+agyvMX1ktSCM1Y7eKcbaf
         tt/SjiUylgiLyep0Wn44t1IJ6VCzD+EQUm8vVAxpRFMPFRSSgucHJ/a6CiEorAzr0H5x
         yMug==
X-Forwarded-Encrypted: i=1; AKwUvBy9LABwZhYizDN1sUNiI39g58hPvUHZw9CnIV8cr0d7WdN+SDQCY6S4SV34/W+h9kbCdK4kJXf/vFWsLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI074obc9P/5Z+8/XM6ooo96QJTkmiyUYlcsYilyj3+6vVqAk2V
	z5w8eNZS/ZsewKUCvtn2V4mWah2kzzwDua/k6dXz7J7yOq+MDsifwf+pjAvwF4XmKP1e9xhU8Qo
	r4XaNLFxzzofMFouZQXJB/cqMCinSCV8=
X-Gm-Gg: AYBFou1XYdIXgsVS+8t+0oHBB7ZgHUfpUpy2KGl8ixD8Qc/pvRDgINxDtNFu7i5Z/gj
	ze8d++D7pKw5DTE99Q/8qmgp3cZSheTh8JOgbXY6ui4hrmqL89+DXOLscrtc82bY+2A3CoJaVwD
	7Es1FZLbc38UjOTIMwcGNF4kgIIBLA2RPcSthkYEVVMOtR/8wL97/vxcObp0sHuWH8XJvIKFZDh
	lbAHsLQsEivVNQ1O/y7GScdKYHMxgUlZG/twFmdYGU7/D1bI8kG0mRTW83Ezr5MaqPmHhxMI/vt
	JfwEQDC8iGvX2vEHG/QpTnLnwltPdt70W4yQQtFafFWd9ANyEeKlQTuGKyoUEpOj+g==
X-Received: by 2002:a05:620a:258d:b0:93a:f9:614a with SMTP id
 af79cd13be357-93f29d3838cmr70178285a.34.1792168768959; Fri, 16 Oct 2026
 09:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014233318.34567-1-heyheyco@gmail.com> <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
In-Reply-To: <a0fb773d-dff3-46d0-9bc6-f408049ba12d@roeck-us.net>
From: Qian Xiao <heyheyco@gmail.com>
Date: Fri, 16 Oct 2026 09:38:51 -0700
X-Gm-Features: AclHuK_bv1MWXz6zynnaQJQy2jLr00--eLrquQDSSFo031ibxp4R7aAroGr5hV0
Message-ID: <CAFGXJCn6ODtgLtnCSgciVWCaXQCYHXbMfPKBCR+-XSjT31Do-Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) Drop misleading BIOS upgrade advice
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, that makes sense. Sent v2:
https://lore.kernel.org/linux-hwmon/20261016163509.249020-1-heyheyco@gmail.=
com/

On Fri, Oct 16, 2026 at 9:09=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 10/14/26 16:33, Qian Xiao wrote:
> > The Known Issues section suggests that upgrading to a BIOS with WMI
> > method version two or greater should rectify the problem. However, the
> > driver refuses to bind when the BIOS reports a version below two, so
> > every system using the driver already meets that condition and the
> > advice does not help.
> >
> > Remove the sentence. While at it, fix a typo in the preceding sentence.
> >
> > Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3=
nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> > Signed-off-by: Qian Xiao <heyheyco@gmail.com>
> > ---
> > For context, the fan issue has continued to be reported with the in-tre=
e
> > driver (which implies method version >=3D 2), e.g.:
> > https://www.reddit.com/r/archlinux/comments/tunnvb/psa_if_youre_experie=
ncing_weird_fan_behaviour_on/
> > https://forums.unraid.net/topic/131340-semi-solved-611x612x-bug-system-=
fans-stopped-after-a-few-hours-asus-mainboard-linux-517-driver-asus-wmi-dri=
ver-issue/
> >
>
> Then maybe the advice should be changed to "upgrading to a more recent BI=
OS
> version might help" instead of being dropped entirely.
>
> Guenter
>
>
> >   Documentation/hwmon/asus_wmi_sensors.rst | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/h=
wmon/asus_wmi_sensors.rst
> > index 8f2096c..f6fa66f 100644
> > --- a/Documentation/hwmon/asus_wmi_sensors.rst
> > +++ b/Documentation/hwmon/asus_wmi_sensors.rst
> > @@ -72,7 +72,5 @@ Known Issues:
> >      X470 Pro seems particularly bad for this. The more frequently the =
WMI
> >      interface is polled the greater the potential for this to happen. =
Until you
> >      have subjected your computer to an extended soak test while pollin=
g the
> > -   sensors frequently, don't leave you computer unattended. Upgrading =
to new
> > -   BIOS version with method version greater than or equal to two shoul=
d
> > -   rectify the issue.
> > +   sensors frequently, don't leave your computer unattended.
> >    * A few boards report 12v voltages to be ~10v.
>
