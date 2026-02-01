Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3975A2222A0
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Feb 2026 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769931049; cv=pass; b=Hnin2yMWwXpm4n2WdQZ3w0NVHlwaopvcSl1KjLXPkKC89eMzg0+b1MSVOxlxcs1dWLTuy8wWc83WkDV0kH/CWa1d4vguGQkYFzgQciehUhqJZCG9fdU5XGvFUv4z865DZIdihsBdZfO1fo2u/tUJclyctZZa/R0v5qJtOJKP5tM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769931049; c=relaxed/simple;
	bh=fpcKV5L6UMcjDR6INHIB5Ix+yBRnl9aBwoK6mk8a17g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gulA5RW/G3+mAzcfuwzPtKT6bMKz2ZHeFFkzjVpSnwa82urICGExly+NDqrC/j9cwEE6RBg1/n01vJ0TmYIis/BDvsp0/HMRG7cWNWVUVojf3HX6SYiw0h91C7j33lMtIXQDsIQRJFNL7NG5Hci90TN6piuaHvQcd6c7Ncqxg/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNTMoS4G; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNTMoS4G"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233b953bebso5708087c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 23:30:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769931047; cv=none;
        d=google.com; s=arc-20240605;
        b=YO65wra5+QJc7DjuKFMGDJwV15qTXryL9G+N50BBSWt+egjP0btJNEUHznZStUL4jQ
         cfLQsmvg+5rsY9BA1XDKuEFOF9LDxDM4PxLTSX73/bN7qR9TBUxLDdaFhb0kinaRMeyz
         gqQI2iJCAiDnildFM2M/CZzyvqiNN3KI+EzgXGqDAqhEZ00FK16O4gKg5GLOwAnS+DqP
         UMOvPs/lTIBUmNJuGFsnT6e6lIHklW1r7tzjrMpCAwvPNgUJYLzJE245n4LHnxN1hYf7
         CCmFcKTEgPTkLA6VjdwWY74hAZod6+ru53nNUHiSpfdrkRJJ3E33HxEIvv8P46bQalhF
         c9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eaZnqqcnyj1jerlpd2ktSowMmm6K8QjyaYay6IFVlgg=;
        fh=bF4eR3KygHnM7JYQ7xDNlvTcJmJsbdJDg0tnTEthcJw=;
        b=UFz+adckddhoCSofnYEKAqeOAMapB7a1VOIADeElwAbUmxnVEjGKsrIvkSf2fYzf+N
         JkJ6M2gVvL55DxMU6714SnimJEHZl3qcSf21/uCH+YLQmEzItrnviuOk7MxHj5r3RfGA
         R6RYKE0rw8RfX4URKfBKJ6aUzwI3FuSdyoffW+7h8rTY13JUWWAVgRqWQ+U8k5YZpraY
         tgVlMOVerKc0p6ntRKcsjF9leucx08cU3i1Mp+IYsjJ/iJqnIuLTKjx41pnNrWPJ7xcf
         hYup2ldUovwE/UN/1rllwqV/byqbHAObsJSKFJgX19sqbBqf+16e9epHtnkF2hbqO9qj
         zFJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769931047; x=1770535847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaZnqqcnyj1jerlpd2ktSowMmm6K8QjyaYay6IFVlgg=;
        b=KNTMoS4GDzxJeewVdvuopkyGxP2rUvnWhYd1k/g9VPIopf4C0TgEqCeP7c1vQYluXZ
         B+WL53g4piABr3p6cfcTifAlMXHMGajPZPWFXu9X2UbrTTtaF6wxN7cYntHjxOouUzOu
         U/9JeOWr+1cZv1Am5890rZ3jj3jQXNqwjnbhAL3SPgM22o1ifYmbqa/a4jc5GONbQVDx
         kcoxehzZ5jyZqSuljkbUEVbacG1lwxhKWys5E4v/4Y1LmgPJwQcy2/Hmx5f417y1pzPa
         2w0FiauflxVwjrA6rcnnUP6Srg6XUDsUOgVg3s3qpEOp9ltgWY1EgVDSc0ei4bZOvhrL
         ZOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769931047; x=1770535847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaZnqqcnyj1jerlpd2ktSowMmm6K8QjyaYay6IFVlgg=;
        b=xElAiyMpyGM+h212G4+oRmi86TgofNhy+WgZidDfS7eyAXERa7gm1hhwAae2NJGKsk
         iyWi92ApmFZISvhxlfFGgQ+FVS3agTY7rpXnb5sJiujMWW4GMTnlQdwGYOA4MvygJX6i
         pInVuqAdSXQqC3GVoXtHRUvg+gfHE9wbMUZ9DQmZHfY9psmI8toQNsPvrGqPwtNjP4r4
         1KudghJ25NR5LqOe+LLuGvG3/MLsJZTAeKytCwF5cIjDlD0QgjMxcy7v+5YikDofMOuq
         VI9SZ3pd8bwRDd3t3ri1woxOR4cN7HmNfxrzgMfUZpwPGRbMfy0vAyMlFl6fRr1JGrem
         2XQg==
X-Forwarded-Encrypted: i=1; AJvYcCXl24fur9AzcwpIStfOTHOGdF9BFh71l4Fjz7obRlgc3owkXCQIMQHQ+e5tKoGlQywiH/RvuVw9xfimcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKCxD1bt3vsiH/9vNISHVbaXH0bY9LmCkiY5Uwa1Pm70J+/I7k
	TCisPGJIZ0zxFvsf1mZ6z9+qRtTUxUEMA7DOFKgiBt7UasNEjd/Sm6OR8/QMWNURrW9acSf+dwi
	Iqufjm9eshW2qXL45L369JeAYE2jP72E=
X-Gm-Gg: AZuq6aJMTO1XLo2SDf5fxvtUvP83f/B8yRhxExwpNazhbYVvqTzlOpxzh+vefWz1Qjl
	TGFkyIN95mhFc3MMSYNGv2N20OP+rucbG8RVw4g7Urgx8R+R+c9WaZtVYKZBsAJPqeqWg9h7Auw
	1mqW+9r8gKrrYiZAB/J61JhLVJ62CggTJktjb9TXVTvUKRKCmxT0xB1dhW/LMtKwuW1ZvwuvGc8
	EjLTgh0DaH3JaulCys5P1lwZuHyA2D6Rjdr5jPVaz+/w397U2E4AmoTj14MrTl/4xkt7yGBnA==
X-Received: by 2002:a05:7022:b97:b0:11e:353:57af with SMTP id
 a92af1059eb24-125c1029d93mr4272957c88.49.1769931047171; Sat, 31 Jan 2026
 23:30:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <c36306c5-2426-4a9c-9abd-9f3cdab17ed5@roeck-us.net> <CAJ12PfNkde6__QQXMiyBbEoHMbY3efmtsqgbyiKBtBmyfpX5Jw@mail.gmail.com>
 <2740c3ab-7cb0-4931-81a2-30b85e8615f9@roeck-us.net> <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net> <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net> <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de> <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <CAJ12PfM5xf0+Qy07S5OoLPkpnhZz+bj5a+hTSGTfrEFN2R6PCw@mail.gmail.com> <fb688a65-b2cd-4223-ae04-130b5657712d@roeck-us.net>
In-Reply-To: <fb688a65-b2cd-4223-ae04-130b5657712d@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Sun, 1 Feb 2026 10:30:29 +0300
X-Gm-Features: AZwV_QjfVJhCiwhy1i6TU9CmpDEA8HsKE8mN5nIiMA74vBNxnnNeHKUDNRRbVrs
Message-ID: <CAJ12PfOvDe5-tsuZGeGpOZh61MztorK08NFfDMV3mkP8dNpDfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000058647b0649be2fce"

--00000000000058647b0649be2fce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 4:25=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 1/31/26 11:50, TINSAE TADESSE wrote:
> ...
> >
> > Hi Guenter,
> >
> > While investigating this issue, I previously mentioned
> > about a flow where SPD write disabled state can be
> > exported as a capability from the i801 controller, so
> > that the SPD5118 hwmon driver consumes it.
> >
> > The SPD write disabled state is known to the controller
> > driver (i2c-i801), but this information is not
> > propagated to client drivers. As a result, auto-detected
> > devices may be instantiated and probed even though the
> > controller cannot support the required access model.
> >
> > This raises a major architectural question:
> >
> > Should SMBus / I2C controller drivers be able to
> > advertise bus-level capability constraints (such as SPD
> > write disabled state) to client drivers, so that clients can
> > make an informed decision during probe?
> >
> > A capability-based approach would allow:
> > * controller drivers to expose what is possible on a given bus
> > * client drivers to decide whether they can operate correctly
> > * avoidance of device-specific policy in controller drivers
> > * consistent handling across different SPD-capable devices
> >
> > I actually tested the possibility of detecting, propagating,
> > and consuming the SPD write disabled state using an I2C
> > adapter capability flag. Using this approach, I was able to
> > fix the issue even with the CONFIG_SENSORS_SPD5118_DETECT
> > kernel configuration enabled.
> >
> > At this stage, I am not proposing a specific implementation.
> > The goal of this RFC is to get agreement on whether this type
> > of problem should be solved through capability propagation,
> > and if so, what mechanism would be preferred.
> >
> > Any feedback on design direction, or existing infrastructure
> > that could be reused would be very welcome.
> >
>
> I think it is a good idea, but how would the flag look like ?
> The i801 controller only write protects a range of addresses;
> I think it is 0x50..0x57. So any I2C_FUNC flag would presumably
> have to be address range specific. You could try adding
> something like I2C_FUNC_SPD_WRITE_PROTECTED. Either case,
> you'll have to ask the I2C subsystem maintainers for advice.
> I would suggest to give it a try.
>
> Thanks,
> Guenter
>

Hello Guenter,

Thanks for the feedback.
I have attached one implementation that I tested and confirmed to
resolve the issue.
I will forward an RFC to the i2c maintainers, and if you don't mind,
I will also add you to the email list.

Thanks again for the guidance.

--00000000000058647b0649be2fce
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-PATCH-2-2-hwmon-spd5118-Fail-probe-if-SPD-writes-are.patch"
Content-Disposition: attachment; 
	filename="0002-PATCH-2-2-hwmon-spd5118-Fail-probe-if-SPD-writes-are.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ml3f2qrw0>
X-Attachment-Id: f_ml3f2qrw0

RnJvbSBlNGZhMTVkOWE2NjdiNDYwNTdmOTgwOTJhNDZkYzYwYTk5ZjU0N2ZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21h
aWwuY29tPgpEYXRlOiBTdW4sIDEgRmViIDIwMjYgMDk6NDA6MjQgKzAzMDAKU3ViamVjdDogW1BB
VENIIDIvMl0gW1BBVENIIDIvMl0gaHdtb246IHNwZDUxMTg6IEZhaWwgcHJvYmUgaWYgU1BEIHdy
aXRlcyBhcmUKIGRpc2FibGVkCgpTUEQ1MTE4IHJlcXVpcmVzIHdyaXRlIGFjY2VzcyBmb3IgcGFn
ZSBzZWxlY3Rpb24sIGNvbmZpZ3VyYXRpb24sCmFuZCBjYWNoZSBzeW5jaHJvbml6YXRpb24gZHVy
aW5nIHN1c3BlbmQvcmVzdW1lLiBJZiB0aGUgaG9zdApjb250cm9sbGVyIGRvZXMgbm90IGFsbG93
IFNQRCB3cml0ZXMsIHRoZSBkcml2ZXIgY2Fubm90IGZ1bmN0aW9uCnByb3Blcmx5LgoKRGV0ZWN0
IHRoaXMgc3RhdGUgdXNpbmcgYWRhcHRlciBxdWlya3MgYW5kIGRldGVybWluZSB3aGV0aGVyIHRv
CnN0b3AgdGhlIHByb2JlLgoKU2lnbmVkLW9mZi1ieTogVGluc2FlIFRhZGVzc2UgPHRpbnNhZXRh
ZGVzc2UyMDE1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2h3bW9uL3NwZDUxMTguYyB8IDE2ICsr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9od21vbi9zcGQ1MTE4LmMgYi9kcml2ZXJzL2h3bW9uL3NwZDUxMTguYwpp
bmRleCA1ZGE0NDU3MWI2YTAuLjEwYTZkZmIzMDk4NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9od21v
bi9zcGQ1MTE4LmMKKysrIGIvZHJpdmVycy9od21vbi9zcGQ1MTE4LmMKQEAgLTUyNSw2ICs1MjUs
OCBAQCBzdGF0aWMgaW50IHNwZDUxMThfY29tbW9uX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHJlZ21hcCAqcmVnbWFwLAogCXVuc2lnbmVkIGludCBjYXBhYmlsaXR5LCByZXZpc2lv
biwgdmVuZG9yLCBiYW5rOwogCXN0cnVjdCBzcGQ1MTE4X2RhdGEgKmRhdGE7CiAJc3RydWN0IGRl
dmljZSAqaHdtb25fZGV2OworCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQ7CisJY29uc3Qgc3Ry
dWN0IGkyY19hZGFwdGVyX3F1aXJrcyAqcXVpcmtzOwogCWludCBlcnI7CiAKIAlkYXRhID0gZGV2
bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkYXRhKSwgR0ZQX0tFUk5FTCk7CkBAIC01NTIsNiArNTU0
LDIwIEBAIHN0YXRpYyBpbnQgc3BkNTExOF9jb21tb25fcHJvYmUoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgcmVnbWFwICpyZWdtYXAsCiAJaWYgKCFzcGQ1MTE4X3ZlbmRvcl92YWxpZChiYW5r
LCB2ZW5kb3IpKQogCQlyZXR1cm4gLUVOT0RFVjsKIAorCS8qCisJICogU1BENTExOCByZXF1aXJl
cyB3cml0ZSBhY2Nlc3MgZm9yIGNvcnJlY3Qgb3BlcmF0aW9uCisJICogKHBhZ2Ugc2VsZWN0aW9u
LCBjb25maWd1cmF0aW9uLCBhbmQgc3VzcGVuZC9yZXN1bWUgY2FjaGUgc3luYykuCisJICogSWYg
dGhlIFNQRCB3cml0ZXMgYXJlIGJsb2NrZWQgYnkgdGhlIFNNQnVzIGNvbnRyb2xsZXIsIHRoZQor
CSAqIHByb2JlIGZhaWxzLgorCSAqLworCWNsaWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsKKwlx
dWlya3MgPSBjbGllbnQtPmFkYXB0ZXItPnF1aXJrczsKKwlpZiAocXVpcmtzICYmIChxdWlya3Mt
PmZsYWdzICYgSTJDX0FRX1NQRF9XUklURV9ESVNBQkxFRCkpIHsKKwkJZGV2X2Vycl9wcm9iZShk
ZXYsIC1FTk9ERVYsICJTUEQgV3JpdGUgRGlzYWJsZSBpcyBzZXQgb24gYWRhcHRlcjsgcmVmdXNp
bmcgcHJvYmVcbiIpOworCQlyZXR1cm4gLUVOT0RFVjsKKwl9CisKKwogCWRhdGEtPnJlZ21hcCA9
IHJlZ21hcDsKIAltdXRleF9pbml0KCZkYXRhLT5udm1lbV9sb2NrKTsKIAlkZXZfc2V0X2RydmRh
dGEoZGV2LCBkYXRhKTsKLS0gCjIuNDcuMwoK
--00000000000058647b0649be2fce
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-PATCH-1-2-i2c-i801-Detect-SPD-Write-Disable-and-expo.patch"
Content-Disposition: attachment; 
	filename="0001-PATCH-1-2-i2c-i801-Detect-SPD-Write-Disable-and-expo.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ml3f2qsj1>
X-Attachment-Id: f_ml3f2qsj1

RnJvbSBmMjMyZDk3MTBiZDBkMWNmMjkwYTI4MjM0YmM5OGU0MjI0MTAxOTE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21h
aWwuY29tPgpEYXRlOiBTdW4sIDEgRmViIDIwMjYgMDg6MTQ6MDQgKzAzMDAKU3ViamVjdDogW1BB
VENIIDEvMl0gW1BBVENIIDEvMl0gaTJjOiBpODAxOiBEZXRlY3QgU1BEIFdyaXRlIERpc2FibGUg
YW5kCiBleHBvc2UgYXMgYWRhcHRlciBxdWlyawoKRGV0ZWN0IFNQRCBXcml0ZSBEaXNhYmxlIGlu
IFNNQkhTVENGRyBhbmQgZXhwb3NlIGl0IHRocm91Z2gKSTJDIGFkYXB0ZXIgcXVpcmsuIFRoZSBJ
MkMgY2xpZW50IGRyaXZlciBtYXkgZGVjaWRlIHdoZXRoZXIKU1BEIHdyaXRlIG9wZXJhdGlvbnMg
YXJlIHN1cHBvcnRlZCB3aXRob3V0IGltcGxlbWVudGluZwpkZXZpY2Utc3BlY2lmaWMgcG9saWNp
ZXMgaW4gdGhlIFNNQnVzIGNvbnRyb2xsZXIgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogVGluc2Fl
IFRhZGVzc2UgPHRpbnNhZXRhZGVzc2UyMDE1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWk4MDEuYyB8IDE2ICsrKysrKysrKysrKysrKy0KIGluY2x1ZGUvbGludXgvaTJj
LmggICAgICAgICAgIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEu
YyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaTgwMS5jCmluZGV4IDllMTc4OTcyNWVkZi4uZDc3
MWU5ZjVmODJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYworKysg
Yi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYwpAQCAtMTUzMyw2ICsxNTMzLDExIEBAIHN0
YXRpYyBpbnQgaTgwMV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNp
X2RldmljZV9pZCAqaWQpCiB7CiAJaW50IGVyciwgaSwgYmFyID0gU01CQkFSOwogCXN0cnVjdCBp
ODAxX3ByaXYgKnByaXY7CisJc3RydWN0IGkyY19hZGFwdGVyX3F1aXJrcyAqcXVpcmtzOworCisJ
cXVpcmtzID0gZGV2bV9remFsbG9jKCZkZXYtPmRldiwgc2l6ZW9mKCpxdWlya3MpLCBHRlBfS0VS
TkVMKTsKKwlpZiAoIXF1aXJrcykKKwkJcmV0dXJuIC1FTk9NRU07CiAKIAlwcml2ID0gZGV2bV9r
emFsbG9jKCZkZXYtPmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwcml2
KQpAQCAtMTYwMCw4ICsxNjA1LDE3IEBAIHN0YXRpYyBpbnQgaTgwMV9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJCS8qIERpc2FibGUg
U01CdXMgaW50ZXJydXB0IGZlYXR1cmUgaWYgU01CdXMgdXNpbmcgU01JIyAqLwogCQlwcml2LT5m
ZWF0dXJlcyAmPSB+RkVBVFVSRV9JUlE7CiAJfQotCWlmIChwcml2LT5vcmlnaW5hbF9oc3RjZmcg
JiBTTUJIU1RDRkdfU1BEX1dEKQorCisJLyoKKwkgKiBEZXRlY3QgdGhlIFNQRCBXcml0ZSBEaXNh
YmxlZCBzdGF0dXMuIE1hcmsgdGhlIGFkYXB0ZXIKKwkgKiBhcyB1bmFibGUgdG8gcGVyZm9ybSBT
UEQgd3JpdGVzLCB3aGljaCBhbGxvd3MgY29uc3VtaW5nCisJICogZHJpdmVycyB0byBkZWNpZGUg
b24gc2FmZSBvcGVyYXRpb24uCisJICovCisJaWYgKHByaXYtPm9yaWdpbmFsX2hzdGNmZyAmIFNN
QkhTVENGR19TUERfV0QpIHsKIAkJcGNpX2luZm8oZGV2LCAiU1BEIFdyaXRlIERpc2FibGUgaXMg
c2V0XG4iKTsKKwkJcXVpcmtzLT5mbGFncyB8PSBJMkNfQVFfU1BEX1dSSVRFX0RJU0FCTEVEOwor
CX0KKwlwcml2LT5hZGFwdGVyLnF1aXJrcyA9IHF1aXJrczsKIAogCS8qIENsZWFyIHNwZWNpYWwg
bW9kZSBiaXRzICovCiAJaWYgKHByaXYtPmZlYXR1cmVzICYgKEZFQVRVUkVfU01CVVNfUEVDIHwg
RkVBVFVSRV9CTE9DS19CVUZGRVIpKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pMmMuaCBi
L2luY2x1ZGUvbGludXgvaTJjLmgKaW5kZXggMjBmZDQxYjUxZDVjLi40Yjg5ZjBiZjYyYTEgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaTJjLmgKKysrIGIvaW5jbHVkZS9saW51eC9pMmMuaApA
QCAtNzI2LDYgKzcyNiw5IEBAIHN0cnVjdCBpMmNfYWRhcHRlcl9xdWlya3MgewogLyogYWRhcHRl
ciBjYW5ub3QgZG8gcmVwZWF0ZWQgU1RBUlQgKi8KICNkZWZpbmUgSTJDX0FRX05PX1JFUF9TVEFS
VAkJQklUKDcpCiAKKy8qIFNQRCB3cml0ZXMgYXJlIGJsb2NrZWQgYnkgaG9zdCBjb250cm9sbGVy
ICovCisjZGVmaW5lIEkyQ19BUV9TUERfV1JJVEVfRElTQUJMRUQJQklUKDgpCisKIC8qCiAgKiBp
MmNfYWRhcHRlciBpcyB0aGUgc3RydWN0dXJlIHVzZWQgdG8gaWRlbnRpZnkgYSBwaHlzaWNhbCBp
MmMgYnVzIGFsb25nCiAgKiB3aXRoIHRoZSBhY2Nlc3MgYWxnb3JpdGhtcyBuZWNlc3NhcnkgdG8g
YWNjZXNzIGl0LgotLSAKMi40Ny4zCgo=
--00000000000058647b0649be2fce--
