Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF530AD0A
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Feb 2026 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770015810; cv=pass; b=sC8HsLAUTkLRJwP8CXFY9B5XwbVuuQH9NnRRuTiqfUPwWdUBB4Ze9aUI+lUEulvf/NB4v7EhygSmozLnQvWdsZPeawljL+yPeJuKYzmdbZmXul8mi8NUjR/zjprc42+OnbAaq2egbavmdB3/5+psU60E78efHDOFJLHXNBK/78Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770015810; c=relaxed/simple;
	bh=HNAJ+pGHRazqEhH9FmzNtS/WbWLjvfH3T16cgzPg9yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3PSnLZQRffXw5lPMGLG4TgvHxpWvdec7J5B10XX/OVU9HQfn08l9VqsLBu7nUGsCfXSv2V35v7PRMeJT8lrnl/OPVmiDkgY6g8vLjPeW5KBnWJuAgIeNhE8fCisW2ScHASR3F/c01zvdnby1WBE4pTHeXH+6jVk1F91SQbQCa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPV1N49t; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPV1N49t"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124566b6693so6766147c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Feb 2026 23:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770015808; cv=none;
        d=google.com; s=arc-20240605;
        b=DRupWwxmLakckr+hOy9xRUFZHlvdqpN3UFf3CReXvWq/WoG/iEGG9Acg/1boLuvmI1
         Kf3R0eJpqjuWb3+M8fJPGcebKfzu1Nxpw2FUp3m8EIT9SlChkHB9ccyc7aZKzncjyVoC
         s1SvZjtSWc0xm7WoN4IosUmQfFFEOWSijAEp/FDKSY8Je9fNZhSAa/ogr33kVyavCO0H
         xWa0O/3DAsMKpP7ix1r4EkMKW49BCEc3CTEt9elGCqh1DdR0zh77+s/LjvUbhwpD1uZ0
         HOumLjuZRVwqxy9KTr3pF8ufOK7XBaPXbreIalXo3VK0UHsAzF5O2DVvmEm1Tgg6z5N9
         Vzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ICbfX1OsG5PCbupn3f0cjGlfY41ZBX7Y2aMdJ+yJ58E=;
        fh=nNiZlEkYjH8HDeQglGMTBimdU84Tz/OPYD8gPbpqErg=;
        b=S0NoM16uL8PAom9hzt/8OsSKfGtVkNB+q1T3tRGoL99krlBD6hblWGq96o74GSdLpT
         vSanSlpgfcSYA+UjN3bZ6gR+a/k03pIo1YhXhsHtqv3wcucSBy3gjxto2OU5wukuSG52
         PUqaUrpO8nTq2UX6QStsLdtNUSK+bLZVwQui/REBSdTS8EU1AP/ui/UWPUf+oi8eZ50F
         +SOonfY9EA5eR1sc8/KIGUL9LgfUXOLMEBk0nZ3uDtC+Qdt64W0ePTj9m8rDEju4nQPw
         gaoUgyBS1Efa7nyEYhr5ZGB/pt/JqcVi/XZ/DS4Gq9baw0eF0TaGqMJnTQd+jtWvTwiI
         LfTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770015808; x=1770620608; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ICbfX1OsG5PCbupn3f0cjGlfY41ZBX7Y2aMdJ+yJ58E=;
        b=YPV1N49tfV8Pyfvf5X7pVZN1HexOLXN+3Ln9gdvGR6kdaCg9QEAw5vz6Xjti/8MWMf
         2mVZ7S6uGGkEbEo1f3S8iFFCHgpKLPiMVr5o28RJgcFXnG5UQYYddKwq8ibjt35oLp1i
         1jWDUze87381n3/Ou+XqH0ePPACCH4euagHDutPIWJWhf585PfRrmHOZX5nG/TAXagjT
         S5x3I6UjRkezbSYASFcoPGQm0CDAb+bWtF0gW+Ysy1dXy8Wg/8tFAuUFakSp3t8JSHyS
         ruut/CQm7GFjtigS2ezY037zs2mpxOi1nGdpn23GbQye7/3amy+9REZZt5trBvQAq7dP
         wl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770015808; x=1770620608;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICbfX1OsG5PCbupn3f0cjGlfY41ZBX7Y2aMdJ+yJ58E=;
        b=P8BvlHXGjwNGHJInfqaxMhX5YaGaWQ5/OR+KCX+KA11QGXSM1J0cYU0R/aShouCvTR
         pGLQj1yORm1Ph+Q6esurNce3pj2MEEy80eMH20m2wv/fVq4NM86SkaMoXniTDySg7BrB
         NL1SdM7hXMaiy978d4zRdjXAPd1mJMsantpiXh26KwVWsV4OjTfXQ8ojfgldOiKafvXR
         mOlgFysdI4Gw49TwQNQiv5+SPCxBMMJ+s3ZECeI72wcKyhlzRQ9Huad+mIbej9f405yF
         VWdiHeI6wnVOun8nFI93hJ9JXedFyIF17LT+BoAVfdCt7HGPGzpEasaB7Y7IxbCGtGOq
         /rgA==
X-Forwarded-Encrypted: i=1; AJvYcCXJA4COXNceeg/UQNO5PnrmZQbSHSvnOtG43rXYKd+hjlUb9QHEZjEVsR4qjPcd/znALCqdK7gcTDieMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7suZ4QpB4DOq4cskrNkDr7oYK3ieCgWMG0qi+NG31ODiVBd9
	ry891laVTPVOfxbKo9cxTfPH3ruRQz/QyY8WBSBWulPdlEdj+ebBMUodgbe3CbOQUnd2sFUth38
	c9m5KMnEIBG2sCH40PMcmHlMSpVeT78E=
X-Gm-Gg: AZuq6aJHA+2AJJKjcB2aocn9fZuQpuq0Txy8+1eff4GAcqU7FAneweO3oBdywixSRFm
	SnoievV7+Uqqy6+NmS+9FvyVVC9rOqSmU9yLNnJ8d5tk5SwAHz9vSJ6PKLZfIppR5EaAZfYlyRM
	7r4W5/nEIElzv0+rJ9ZTPu1aqzEUfps2u17/VZfIc/9Iaf/SdDxJiT37DDMo0ROuQfYw31a/UAJ
	izLf5tiWgGZyY6S6Is74Dv/49jZjY1S5U1dsnY7DJUQkHoS71VLD++GxERYXqht+U5L39PP08Fm
	FGCfGiyn
X-Received: by 2002:a05:7022:124:b0:11d:f890:6751 with SMTP id
 a92af1059eb24-125c0fa4763mr4861440c88.10.1770015807443; Sun, 01 Feb 2026
 23:03:27 -0800 (PST)
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
 <CAJ12PfM5xf0+Qy07S5OoLPkpnhZz+bj5a+hTSGTfrEFN2R6PCw@mail.gmail.com>
 <fb688a65-b2cd-4223-ae04-130b5657712d@roeck-us.net> <CAJ12PfOvDe5-tsuZGeGpOZh61MztorK08NFfDMV3mkP8dNpDfA@mail.gmail.com>
 <2e6f0437-0dca-41e9-ac80-f0843120cf52@roeck-us.net>
In-Reply-To: <2e6f0437-0dca-41e9-ac80-f0843120cf52@roeck-us.net>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Mon, 2 Feb 2026 10:03:08 +0300
X-Gm-Features: AZwV_QhKtPR-QchlXezAOqyUyiOKxbatmmyhrr8KzdPFSYOev_c3_JStBCZpXcw
Message-ID: <CAJ12PfPPNaM0LoCPdjLB9oRwL08CVpKcDgi7H4jd439CuxgGQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C errors
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000738c0d0649d1eb01"

--000000000000738c0d0649d1eb01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 6:21=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 1/31/26 23:30, TINSAE TADESSE wrote:
> > On Sun, Feb 1, 2026 at 4:25=E2=80=AFAM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 1/31/26 11:50, TINSAE TADESSE wrote:
> >> ...
> >>>
> >>> Hi Guenter,
> >>>
> >>> While investigating this issue, I previously mentioned
> >>> about a flow where SPD write disabled state can be
> >>> exported as a capability from the i801 controller, so
> >>> that the SPD5118 hwmon driver consumes it.
> >>>
> >>> The SPD write disabled state is known to the controller
> >>> driver (i2c-i801), but this information is not
> >>> propagated to client drivers. As a result, auto-detected
> >>> devices may be instantiated and probed even though the
> >>> controller cannot support the required access model.
> >>>
> >>> This raises a major architectural question:
> >>>
> >>> Should SMBus / I2C controller drivers be able to
> >>> advertise bus-level capability constraints (such as SPD
> >>> write disabled state) to client drivers, so that clients can
> >>> make an informed decision during probe?
> >>>
> >>> A capability-based approach would allow:
> >>> * controller drivers to expose what is possible on a given bus
> >>> * client drivers to decide whether they can operate correctly
> >>> * avoidance of device-specific policy in controller drivers
> >>> * consistent handling across different SPD-capable devices
> >>>
> >>> I actually tested the possibility of detecting, propagating,
> >>> and consuming the SPD write disabled state using an I2C
> >>> adapter capability flag. Using this approach, I was able to
> >>> fix the issue even with the CONFIG_SENSORS_SPD5118_DETECT
> >>> kernel configuration enabled.
> >>>
> >>> At this stage, I am not proposing a specific implementation.
> >>> The goal of this RFC is to get agreement on whether this type
> >>> of problem should be solved through capability propagation,
> >>> and if so, what mechanism would be preferred.
> >>>
> >>> Any feedback on design direction, or existing infrastructure
> >>> that could be reused would be very welcome.
> >>>
> >>
> >> I think it is a good idea, but how would the flag look like ?
> >> The i801 controller only write protects a range of addresses;
> >> I think it is 0x50..0x57. So any I2C_FUNC flag would presumably
> >> have to be address range specific. You could try adding
> >> something like I2C_FUNC_SPD_WRITE_PROTECTED. Either case,
> >> you'll have to ask the I2C subsystem maintainers for advice.
> >> I would suggest to give it a try.
> >>
> >> Thanks,
> >> Guenter
> >>
> >
> > Hello Guenter,
> >
> > Thanks for the feedback.
> > I have attached one implementation that I tested and confirmed to
> > resolve the issue.
> > I will forward an RFC to the i2c maintainers, and if you don't mind,
> > I will also add you to the email list.
> >
> > Thanks again for the guidance.
>
> Looks good. I didn't know about the quirks, and that drivers are allowed =
to use them.
> We live and learn. Go ahead, and please copy the hardware monitoring mail=
ing list.
> I'll hold off sending my patch upstream until we get a response; your sol=
ution is
> much cleaner.
>
> Thanks,
> Guenter
>


Hi I2C maintainers,

I am working on a platform where the Intel i801 SMBus controller
exposes a hardware feature called "SPD Write Disable". When
enabled, the controller blocks all write transactions to the
SPD EEPROM address range (typically 0x50=E2=80=930x57), while still
allowing reads.

This creates a problem for the spd5118 hwmon driver, as SPD5118
requires write access for correct operation (page selection,
configuration, suspend/resume cache synchronization). If the controller
silently rejects writes, the driver can misbehave and generate
repeated SMBus DEV_ERR storms.

Currently, the I2C core does not provide a mechanism to expose
write restrictions. Rather than embedding SPD5118-specific policy
in the i801 driver, we are exploring a __bus-level capability/quirk__
that allows consumer drivers to decide whether they can operate safely.

Conceptually:
1. The SMBus controller (i801) detects SPD-WD in hardware
2. The controller exposes this as an adapter-level quirk or capability
3. The I2C core propagates this to I2C clients (already handled by i2c-core=
)
4. Drivers such as `spd5118` can refuse probe if write access is required

We have implemented and tested this approach (open to guidance) using
a newly defined 'I2C_AQ_SPD_WRITE_DISABLED' quirk flag. The goal is
to keep controller drivers free of device-specific policy, while giving cli=
ent
drivers enough information to fail probe cleanly instead of
misbehaving at runtime.

If this approach sounds reasonable, please review the attached patch series=
.

Thanks for your time and guidance.

--000000000000738c0d0649d1eb01
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-hwmon-spd5118-Fail-probe-if-SPD-writes-are-disabled.patch"
Content-Disposition: attachment; 
	filename="0002-hwmon-spd5118-Fail-probe-if-SPD-writes-are-disabled.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ml4tfe0b0>
X-Attachment-Id: f_ml4tfe0b0

RnJvbSBhN2E2ZjZlNzI1YjAyYzJiZjk5ZGIzYzY1YWJiMjJkMzkwMTQ2NzIzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21h
aWwuY29tPgpEYXRlOiBNb24sIDIgRmViIDIwMjYgMDk6NDE6MzcgKzAzMDAKU3ViamVjdDogW1BB
VENIIDIvMl0gaHdtb246IHNwZDUxMTg6IEZhaWwgcHJvYmUgaWYgU1BEIHdyaXRlcyBhcmUgZGlz
YWJsZWQKClNQRDUxMTggcmVxdWlyZXMgd3JpdGUgYWNjZXNzIGZvciBwYWdlIHNlbGVjdGlvbiwg
Y29uZmlndXJhdGlvbiwKYW5kIGNhY2hlIHN5bmNocm9uaXphdGlvbiBkdXJpbmcgc3VzcGVuZC9y
ZXN1bWUuIElmIHRoZSBob3N0CmNvbnRyb2xsZXIgZG9lcyBub3QgYWxsb3cgU1BEIHdyaXRlcywg
dGhlIGRyaXZlciBjYW5ub3QgZnVuY3Rpb24KcHJvcGVybHkuCgpEZXRlY3QgdGhpcyBzdGF0ZSB1
c2luZyBhZGFwdGVyIHF1aXJrcyBhbmQgZGV0ZXJtaW5lIHdoZXRoZXIgdG8Kc3RvcCB0aGUgcHJv
YmUuCgpTaWduZWQtb2ZmLWJ5OiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvaHdtb24vc3BkNTExOC5jIHwgMTUgKysrKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aHdtb24vc3BkNTExOC5jIGIvZHJpdmVycy9od21vbi9zcGQ1MTE4LmMKaW5kZXggNWRhNDQ1NzFi
NmEwLi4wOTRkMDU0NzI1NjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jCisr
KyBiL2RyaXZlcnMvaHdtb24vc3BkNTExOC5jCkBAIC01MjUsNiArNTI1LDggQEAgc3RhdGljIGlu
dCBzcGQ1MTE4X2NvbW1vbl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCByZWdtYXAg
KnJlZ21hcCwKIAl1bnNpZ25lZCBpbnQgY2FwYWJpbGl0eSwgcmV2aXNpb24sIHZlbmRvciwgYmFu
azsKIAlzdHJ1Y3Qgc3BkNTExOF9kYXRhICpkYXRhOwogCXN0cnVjdCBkZXZpY2UgKmh3bW9uX2Rl
djsKKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50OworCWNvbnN0IHN0cnVjdCBpMmNfYWRhcHRl
cl9xdWlya3MgKnF1aXJrczsKIAlpbnQgZXJyOwogCiAJZGF0YSA9IGRldm1fa3phbGxvYyhkZXYs
IHNpemVvZigqZGF0YSksIEdGUF9LRVJORUwpOwpAQCAtNTUyLDYgKzU1NCwxOSBAQCBzdGF0aWMg
aW50IHNwZDUxMThfY29tbW9uX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJlZ21h
cCAqcmVnbWFwLAogCWlmICghc3BkNTExOF92ZW5kb3JfdmFsaWQoYmFuaywgdmVuZG9yKSkKIAkJ
cmV0dXJuIC1FTk9ERVY7CiAKKwkvKgorCSAqIFNQRDUxMTggcmVxdWlyZXMgd3JpdGUgYWNjZXNz
IGZvciBjb3JyZWN0IG9wZXJhdGlvbgorCSAqIChwYWdlIHNlbGVjdGlvbiwgY29uZmlndXJhdGlv
biwgYW5kIHN1c3BlbmQvcmVzdW1lIGNhY2hlIHN5bmMpLgorCSAqIElmIHRoZSBTUEQgd3JpdGVz
IGFyZSBibG9ja2VkIGJ5IHRoZSBTTUJ1cyBjb250cm9sbGVyLCB0aGUKKwkgKiBwcm9iZSBmYWls
cy4KKwkgKi8KKwljbGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7CisJcXVpcmtzID0gY2xpZW50
LT5hZGFwdGVyLT5xdWlya3M7CisJaWYgKHF1aXJrcyAmJiAocXVpcmtzLT5mbGFncyAmIEkyQ19B
UV9TUERfV1JJVEVfRElTQUJMRUQpKSB7CisJCWRldl9lcnJfcHJvYmUoZGV2LCAtRU5PREVWLCAi
U1BEIFdyaXRlIERpc2FibGUgaXMgc2V0IG9uIGFkYXB0ZXI7IHJlZnVzaW5nIHByb2JlXG4iKTsK
KwkJcmV0dXJuIC1FTk9ERVY7CisJfQorCiAJZGF0YS0+cmVnbWFwID0gcmVnbWFwOwogCW11dGV4
X2luaXQoJmRhdGEtPm52bWVtX2xvY2spOwogCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRhdGEpOwot
LSAKMi40Ny4zCgo=
--000000000000738c0d0649d1eb01
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-i2c-i801-Detect-SPD-Write-Disable-and-expose-as-adap.patch"
Content-Disposition: attachment; 
	filename="0001-i2c-i801-Detect-SPD-Write-Disable-and-expose-as-adap.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ml4tfe1b1>
X-Attachment-Id: f_ml4tfe1b1

RnJvbSA2ZDkzY2M1ODFiZWNmOWIwYzZhYzhjMWJkMzVhZDJjZDk5M2E4MmQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaW5zYWUgVGFkZXNzZSA8dGluc2FldGFkZXNzZTIwMTVAZ21h
aWwuY29tPgpEYXRlOiBNb24sIDIgRmViIDIwMjYgMDk6NDA6MzIgKzAzMDAKU3ViamVjdDogW1BB
VENIIDEvMl0gaTJjOiBpODAxOiBEZXRlY3QgU1BEIFdyaXRlIERpc2FibGUgYW5kIGV4cG9zZSBh
cyBhZGFwdGVyCiBxdWlyawoKRGV0ZWN0IFNQRCBXcml0ZSBEaXNhYmxlIGluIFNNQkhTVENGRyBh
bmQgZXhwb3NlIGl0IHRocm91Z2gKSTJDIGFkYXB0ZXIgcXVpcmsuIFRoZSBJMkMgY2xpZW50IGRy
aXZlciBtYXkgZGVjaWRlIHdoZXRoZXIKU1BEIHdyaXRlIG9wZXJhdGlvbnMgYXJlIHN1cHBvcnRl
ZCB3aXRob3V0IGltcGxlbWVudGluZwpkZXZpY2Utc3BlY2lmaWMgcG9saWNpZXMgaW4gdGhlIFNN
QnVzIGNvbnRyb2xsZXIgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogVGluc2FlIFRhZGVzc2UgPHRp
bnNhZXRhZGVzc2UyMDE1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4
MDEuYyB8IDE2ICsrKysrKysrKysrKysrKy0KIGluY2x1ZGUvbGludXgvaTJjLmggICAgICAgICAg
IHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYyBiL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtaTgwMS5jCmluZGV4IDllMTc4OTcyNWVkZi4uZDc3MWU5ZjVmODJmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWk4MDEuYworKysgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWk4MDEuYwpAQCAtMTUzMyw2ICsxNTMzLDExIEBAIHN0YXRpYyBpbnQgaTgw
MV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAq
aWQpCiB7CiAJaW50IGVyciwgaSwgYmFyID0gU01CQkFSOwogCXN0cnVjdCBpODAxX3ByaXYgKnBy
aXY7CisJc3RydWN0IGkyY19hZGFwdGVyX3F1aXJrcyAqcXVpcmtzOworCisJcXVpcmtzID0gZGV2
bV9remFsbG9jKCZkZXYtPmRldiwgc2l6ZW9mKCpxdWlya3MpLCBHRlBfS0VSTkVMKTsKKwlpZiAo
IXF1aXJrcykKKwkJcmV0dXJuIC1FTk9NRU07CiAKIAlwcml2ID0gZGV2bV9remFsbG9jKCZkZXYt
PmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFwcml2KQpAQCAtMTYwMCw4
ICsxNjA1LDE3IEBAIHN0YXRpYyBpbnQgaTgwMV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqZGV2LCBj
b25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJCS8qIERpc2FibGUgU01CdXMgaW50ZXJy
dXB0IGZlYXR1cmUgaWYgU01CdXMgdXNpbmcgU01JIyAqLwogCQlwcml2LT5mZWF0dXJlcyAmPSB+
RkVBVFVSRV9JUlE7CiAJfQotCWlmIChwcml2LT5vcmlnaW5hbF9oc3RjZmcgJiBTTUJIU1RDRkdf
U1BEX1dEKQorCisJLyoKKwkgKiBEZXRlY3QgdGhlIFNQRCBXcml0ZSBEaXNhYmxlZCBzdGF0dXMu
IE1hcmsgdGhlIGFkYXB0ZXIKKwkgKiBhcyB1bmFibGUgdG8gcGVyZm9ybSBTUEQgd3JpdGVzLCB3
aGljaCBhbGxvd3MgY29uc3VtaW5nCisJICogZHJpdmVycyB0byBkZWNpZGUgb24gc2FmZSBvcGVy
YXRpb24uCisJICovCisJaWYgKHByaXYtPm9yaWdpbmFsX2hzdGNmZyAmIFNNQkhTVENGR19TUERf
V0QpIHsKIAkJcGNpX2luZm8oZGV2LCAiU1BEIFdyaXRlIERpc2FibGUgaXMgc2V0XG4iKTsKKwkJ
cXVpcmtzLT5mbGFncyB8PSBJMkNfQVFfU1BEX1dSSVRFX0RJU0FCTEVEOworCX0KKwlwcml2LT5h
ZGFwdGVyLnF1aXJrcyA9IHF1aXJrczsKIAogCS8qIENsZWFyIHNwZWNpYWwgbW9kZSBiaXRzICov
CiAJaWYgKHByaXYtPmZlYXR1cmVzICYgKEZFQVRVUkVfU01CVVNfUEVDIHwgRkVBVFVSRV9CTE9D
S19CVUZGRVIpKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pMmMuaCBiL2luY2x1ZGUvbGlu
dXgvaTJjLmgKaW5kZXggMjBmZDQxYjUxZDVjLi40Yjg5ZjBiZjYyYTEgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvaTJjLmgKKysrIGIvaW5jbHVkZS9saW51eC9pMmMuaApAQCAtNzI2LDYgKzcy
Niw5IEBAIHN0cnVjdCBpMmNfYWRhcHRlcl9xdWlya3MgewogLyogYWRhcHRlciBjYW5ub3QgZG8g
cmVwZWF0ZWQgU1RBUlQgKi8KICNkZWZpbmUgSTJDX0FRX05PX1JFUF9TVEFSVAkJQklUKDcpCiAK
Ky8qIFNQRCB3cml0ZXMgYXJlIGJsb2NrZWQgYnkgaG9zdCBjb250cm9sbGVyICovCisjZGVmaW5l
IEkyQ19BUV9TUERfV1JJVEVfRElTQUJMRUQJQklUKDgpCisKIC8qCiAgKiBpMmNfYWRhcHRlciBp
cyB0aGUgc3RydWN0dXJlIHVzZWQgdG8gaWRlbnRpZnkgYSBwaHlzaWNhbCBpMmMgYnVzIGFsb25n
CiAgKiB3aXRoIHRoZSBhY2Nlc3MgYWxnb3JpdGhtcyBuZWNlc3NhcnkgdG8gYWNjZXNzIGl0Lgot
LSAKMi40Ny4zCgo=
--000000000000738c0d0649d1eb01--
