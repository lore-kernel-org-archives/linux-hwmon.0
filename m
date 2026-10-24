Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.156.171.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833889;
	b=nQNv7kZIAHq2y6j0YekRc5aSHskRwYWU86YoZyh+SnBbm9e45Z//PCahO9ROnfTxt+ee
	 cM9Lk/Yz4M4bGM4+RvLCdI+/XaN9w1EEVTYsNeFKgk+SRT8Pe3vOGM+XtUd2P6vqRXFbt
	 GOO+Ru/oXgBJ6okoOWFP+54Pd/LppGu+Z5Mv4Kw+JNGxiNbGheMn9HJnyUpZWRpI8O8JB
	 uE+58maWIisrLEnAXD42xXWEZ1DYz7IqZrAorDqsUabAJoXCJaKaI0gPnyGs/pFyotB6G
	 USANwoW9AUlGrTEZgSelcgYUr8R7ILhNhO+7KHvOwrOrtXLtc+wnr77LWAfg7lYfasg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833889;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=UlFh2m38NvlbmdwBn9Ovqim+aU2KYkaeGxqpK8ckbcY=;
	b=Wzs5/jARKAcCBDqsEN3VWn32SzXGD3KhwAdiH7JixClDKu9jMO/4FEb3zsjn0HXWb/3H
	 sv6tWABvGac+GCrzLaVKx74P/5vnRw+ATevpRMoK/bqapBq2OLhTmrCWnCYnm7WSZLL2a
	 4BU0EC+wwlS04kl9a7zorgcOWuRgiGwz2KZDuy6nCgA2lowhYy/D4QhWbJsPq+HWmVJVA
	 6S+IRq4C/SKkvq+NcM+kkDY83estc94SDmpPsM+8jUPHsk4TFvFDcO7pDLxRWKS4qCOih
	 j5DKtB7Ebf6HycTYJHZE6pSc+ajFzs0wjGfYZGq3g2X2bt6wq3cHvps+2oIuamgPYyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	arc=none smtp.remote-ip=178.156.171.147
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99137606A31B
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 09:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99137606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 92A805E714
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 12:24:40 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 1B6BF5E516
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 12:24:39 +0300 (EEST)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B81A41FEA3A
	for <linux-hwmon@vger.kernel.org>; Sat, 24 Oct 2026 12:24:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1792833878;
	bh=UlFh2m38NvlbmdwBn9Ovqim+aU2KYkaeGxqpK8ckbcY=;
	h=Received:From:Subject:To;
	b=PCUeMa3TinM5NLbb8/42sI7Cb73NtX5QNKX0H2Jo+khS4Q7lM2p3PJv2LiLUkAa7O
	 a5jS149mNsJAM2DN1ShlUMw19UdMlbBCxfdc7ICB2CTlubqYU5AHjGZJYQX+fhlJqo
	 xgrNSLqVeDLXEtA3VvtFrCPkcStJEaZvGTdT1fAucjEX7G+iuK2wLb72GWul/UwLRR
	 gNZlIgexIpR7z+8vY9D84P4TsBRYpATjhNz2ux0Fg41QPvGwKR36EAgLtd6i91lvKD
	 hlbp20uQooTRPl8+e0o/+arwXwz8WL88qYnyBhq4KJ+X5N5XAwGJCUg2MspSbq/OhR
	 /X6yOBGRnDtLw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-cc4be0e5351so610014a12.0
        for <linux-hwmon@vger.kernel.org>;
 Sat, 24 Oct 2026 02:24:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBx2rg1AelMObMCnwY7nYjHBVq5DttrPGec/ZcCyxo04jgP0BBgG/I3FygACk4g1e+Nq+mJvhP82loJcCg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjLYnDbRH2Shk6UfNoGOeoD3tVjjdrjPII1oiFQKIfot8muKnW
	DXQzAIintqn3esEYi7hGlrXLmWmt5oKojAjLCOT4wp6SSGic6g+hTBrIDqMs69+XSsyLQDWs/jO
	VB2MN2HCIGl1YdLWXQlC0X8nOXznvXbo=
X-Received: by 2002:a05:6a21:e587:b0:3e2:117a:62ff with SMTP id
 adf61e73a8af0-3e7cd5242b8mr1238652637.61.1792833873675; Sat, 24 Oct 2026
 02:24:33 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
 <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
In-Reply-To: 
 <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 24 Oct 2026 11:24:21 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
X-Gm-Features: AclHuK_o5mK-ACNcsN3U3drXfMaNHe5y3JLkY05P_22D7Mibo_FAmTuZvNSEA6Q
Message-ID: 
 <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179283387775.2255795.2681702316204123197@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 21 Oct 2026 at 05:26, Derek John Clark
<derekjohn.clark@gmail.com> wrote:
>
> On Tue, Oct 20, 2026 at 2:53=E2=80=AFPM Antheas Kapenekakis <lkml@antheas=
.dev> wrote:
> >
> > On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wr=
ote:
> > >
> > > On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrot=
e:
> > > >
> > > > On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > > > > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> > > > >
> > > > >> The ML patch set uses a guard within a switch case that violates=
 cleanup
> > > > >> rules. Move the guard outside the switch so all return paths are=
 covered.
> > > > >>
> > > > >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > > >> ---
> > > > >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> > > > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/p=
latform/x86/msi-wmi-platform.c
> > > > >> index dfb65ac8fbf6..33acd448f674 100644
> > > > >> --- a/drivers/platform/x86/msi-wmi-platform.c
> > > > >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> > > > >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct d=
evice *dev, enum hwmon_sensor_types ty
> > > > >>      u8 buffer[32] =3D { };
> > > > >>      int ret;
> > > > >>
> > > > >> +    guard(mutex)(&data->wmi_lock);
> > > > >>      switch (type) {
> > > > >>      case hwmon_pwm:
> > > > >>              switch (attr) {
> > > > >>              case hwmon_pwm_enable:
> > > > >> -                    guard(mutex)(&data->wmi_lock);
> > > > >
> > > > > While I cannot see the code easily, one could also add braces to =
inside
> > > > > the case to avoid this problem.
> > > > >
> > > >
> > > > I don't see the code either, but wouldn't this be a use case for
> > > > scoped_guard() ?
> > >
> > > Hi, not explicitly stated in the cover letter, but this is essentiall=
y
> > > a series on top of the series I sent last year but I did not clean up
> > > due to a variety of issues with MSI firmware that would have made the
> > > driver unsuitable for upstreaming (to my standards at least). These
> > > issues span Intel driver problems, HID controller instability, and
> > > varying WMI implementations esp. in regards to PLx setting between AM=
D
> > > / Intel variants, shift mode behavior not acting correctly, and fan
> > > curve application / resetting being weird (the fan curve on off bit
> > > does not seem to change whether an automatic curve is used but how
> > > close the device alings to the set curve? requiring us to back up and
> > > restore the original curve? half of the devices keep the curve during
> > > sleep and half don't? but if the fan curve is so finicky do we really
> > > want a resume handler for it? Perhaps we can kick the timing quirks t=
o
> > > userspace)
> > >
> > > For this reason, I focused on other manufacturers such as Ayaneo and
> > > OneXPlayer. I will revisit this series per request from Derek as he
> > > seems to want this for steamos and hid-msi is already queued for 7.3?
> > > Although, to be honest, compared to the controller firmware issues,
> > > the WMI implementation is pristine.
> > >
> > > So I will need to go through these issues 1 by 1 and see which can be
> > > fixed and either drop certain features in the beginning.
> > >
> > > Particularly for the fan curves, if we say that resume handlers are
> > > required to be in the kernel moving forward, I do not know how
> > > realistic it is to make those reliable for this WMI device family.
> >
> > This driver still needs work. I am getting bug reports about
> > inconsistent TDP application on the EX. A8 is broken as well. Even
> > with your patches Derek. I need to grab a new version of center M and
> > see what they are doing.
> >
> > Does this driver work in your experience? What is that SMT toggle you a=
dded
>
> I've got a few reports of some issues, but nothing with much detail. I
> have the 8 AI+, 8 EX AI+, and A8 in hand and all three had effective
> TDP changes in SteamOS with these patches applied and SteamOS Manager.
> I haven't done extensive testing over multiple suspends or longer
> sessions myself. I'm also not aware if there have been BIOS updates
> since my testing.
>
> By SMT toggle i think you mean the STAPM toggle for the A8? It was
> referenced in API_UserScenario.dll (setPowerLimit_AMDSTAMP) which I
> reviewed using ILSpy. After toggling that TDP started reporting
> correctly and being settable.
>
> Hope this helps. LMK if you need anything tested or additional info.

Ok, I asked for more feedback. Yes, TDP changes do work, but they are
not correct. Users AB testing with a Decky plugin called
SimpleDeckyTDP report major divergence.

SimpleDeckyTDP uses a combination of RyzenAdj for AMD and RAPL for
Intel. When set to 7W, users report 25W power consumption when using
the kernel driver and 15W when using simpledeckytdp on A8. 15W is the
correct value for a 7W envelope on an X840u APU.

STAPM should not be required to use or deviate from STT. Both of them
should have equivalent behavior and match ryzenadj as the underlying
DPTC hooks are the same, ryzenadj just accesses the mailbox directly.
Using STAPM is a workaround for buggy vendor firmware that does not
control boost values correctly (SPPT/FPPT) and is what the first
generation Lenovo Legion Go did as well before they fixed it.

STAPM as a workaround works because it uses timers to control boost
values, so they decay after 2-3 minutes to the steady state TDP set by
the firmware. STT boosts for as long as the device thermal envelope
allows. STAPM is deprecated by AMD, only STT should be used going
forward. +CC Mario

This points to a BIOS firmware issue. You should consider getting in
touch with your MSI contact for feedback and to plan a fix. I do not
have an MSI contact. And yes, I am not happy my users have to rely on
third party unvetted plugins for basic power controls.

But we cannot revisit this driver while basic behavior. does not work.
If MSI does not fix this or there isn't a bug in this driver we can
fix, the only viable way forward from our side is to move power
controls to the DPTC RFC driver/RAPL for affected models and only
retain fan curves on this driver. I do not want to do this, I have
userspace integration for this driver already, but it is not
functional to the standard expected by users.

I checked the ACPI firmware and unlike other manufacturers, there is
no EC independent control of the power envelope. We would still need
to check a low battery hook in firmware but other than that it is a
straight translation.

Antheas

