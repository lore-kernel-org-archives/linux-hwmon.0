Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.38.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793033077;
	b=XaEfFIjmtRu169+kqLdgdyPkY2ZdXIcmOa87XdVJCS2DjIdKVugB4NF+MBiGjK/HQTw6
	 HT6JGpDHhi8VUU6/7drpYsv9V12q+GptS27NNAmiV7hhdR7BLjs6ZXN1R/Abhu0xk/oUT
	 UrRQKX8aTyl/lqueeaWvBf/BuNOy8Y7vmTg3bt4IWAVy36lUZPzv+9YRgCTGHzWCNJzoL
	 Uptda3Z/ugh4lvXqwDorLyn7EvcRUIWLRX82NsfuEyg4RTv42cAdfeX65bf0YcpGqWHXi
	 zxAuq8sPm6m/fE/iOGKHVetMySZoKMET5JlJe9Xaf69Vllks3rRa9NoazQq8+RkZ9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793033077;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=AFQJdAiGgN3fW1Ct+HsLIsRUW5WmUGGeAmWhxML3ipc=;
	b=Xg6zWCuD/Oi1iew0hKaK4WDOa7ti8ET/ZflN/UEdCM7P0fPr9mSA6gMjPg1Ih6DrskuC
	 ZFLW47Dv4UChVDL5sePM8RJs49qpq/m+7w0HzyyvmUySxCYMIfFC82L5PVEmnTn6yDcET
	 mVWplSTbkRTAjvxm6WCFN3TRyidM3mEzZbtEd3uKN3VnDZjMBGskFEn+QYFQ6aKEVkMw2
	 YZSkxCY+XLy/xpX0BgzpVCOMixEO8SToeIpvzzUfuVnMNKnc3JfE3DmYEIFMFwOvpNUzM
	 zS7r2zAUTfVnCDfJrf0PwdA/gbOpOCXnpfsNIH0N3HKS9BV79ZyJ1hHPSrYseQQHeqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=m5hAYpex;
	arc=none smtp.remote-ip=88.99.38.195
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7340E606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 16:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7340E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=m5hAYpex
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id B6C10BC52F
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 18:44:28 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 4D790BC61B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 18:44:28 +0200 (EET)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 3A4EB1FEE34
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 18:44:27 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793033067;
	bh=AFQJdAiGgN3fW1Ct+HsLIsRUW5WmUGGeAmWhxML3ipc=;
	h=Received:From:Subject:To;
	b=m5hAYpexvqnx39l/JQ9/z6rKZqBJVFb/etCC5y34cNAd1Cr+pvONGaV2SM3nAGtOT
	 nJnYsYaJwx3zRVFKGIilCFA2iZWtSc/Uta8XQ1QIXXlyVBvIyHsAsg0PxdJBZJWyqx
	 iijFjttNSc+fF4sACmaPjVoHbTUjlI+DiaTOP+rlLaIP/UaNPIfJ0mYgRjIgE2l49v
	 kJXPntO1TpXiBwWG8GxZAZaAAYYw8jVmx1jTd34vFqGp/rRVAgBo2kjIWgv2f/XMjI
	 F6WvEBsqmaUknZK6JgOpobXflJlPDNq6N+Zqr870BMW99wOxNWJxJoKadtHTwTiFt8
	 Rm/Rj7kvSSEIw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2e96502e447so28263725ad.1
        for <linux-hwmon@vger.kernel.org>;
 Mon, 26 Oct 2026 09:44:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxJMCj3GGaiogqxtydPAD6q4faZNPoUdE/sz13pNRQXt7wtuP3KqRTGm3NUqe48fOyqWp471MqbV/t+fw==@vger.kernel.org
X-Gm-Message-State: AFq9FYILmWYljk5TrrSDID7ZqgfUA6pQNuPBXFve/W6jhyaL5svYJ4zo
	18xVARNIMJgM0kiLBXcmO4D7tpPFEJq8vdcFXpO9/NaZrw+6VPB+axS6KFN4zy4fpgnI1CyGWK2
	Y/W4gc4u3zNb9gG34tyZP1mHBsP3LAao=
X-Received: by 2002:a17:903:3250:b0:2dd:b795:9cb6 with SMTP id
 d9443c01a7336-2ea9c63d703mr60076695ad.21.1793033065583; Mon, 26 Oct 2026
 09:44:25 -0700 (PDT)
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
 <CAGwozwGUAEb4Q9pfd_+aXMw2P3qY376F+usPHdUFO5Q6mV_ATQ@mail.gmail.com>
 <baf91d42-13dd-41eb-88d7-d6311ee0d9f9@amd.com>
In-Reply-To: <baf91d42-13dd-41eb-88d7-d6311ee0d9f9@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 26 Oct 2026 17:44:13 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF00=zMvJKrjMG7mO18zRqSVF_Pz4DDf+og0giC5oSRcA@mail.gmail.com>
X-Gm-Features: AclHuK9dGUF3PYf3eMe7nI2U44d9425QaJilwQrMRy5o1E9SAE9mLWiMo4Hv_n8
Message-ID: 
 <CAGwozwF00=zMvJKrjMG7mO18zRqSVF_Pz4DDf+og0giC5oSRcA@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179303306779.3339780.14746648327294002433@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

<snip>
> > SimpleDeckyTDP uses a combination of RyzenAdj for AMD and RAPL for
> > Intel. When set to 7W, users report 25W power consumption when using
> > the kernel driver and 15W when using simpledeckytdp on A8. 15W is the
> > correct value for a 7W envelope on an X840u APU.
> >
> > STAPM should not be required to use or deviate from STT. Both of them
> > should have equivalent behavior and match ryzenadj as the underlying
> > DPTC hooks are the same, ryzenadj just accesses the mailbox directly.
> > Using STAPM is a workaround for buggy vendor firmware that does not
> > control boost values correctly (SPPT/FPPT) and is what the first
> > generation Lenovo Legion Go did as well before they fixed it.
> >
> > STAPM as a workaround works because it uses timers to control boost
> > values, so they decay after 2-3 minutes to the steady state TDP set by
> > the firmware. STT boosts for as long as the device thermal envelope
> > allows. STAPM is deprecated by AMD, only STT should be used going
> > forward. +CC Mario
>
> It's up to the OEM to decide whether they have programmed their firmware
> to to use STT or STAPM.  They should not be used at the same time.

On BIOS configuration, not on runtime! The patches here based on RE
configure STAPM on custom mode on demand. I did not even know this was
possible.

The purpose is to make the "custom slider" behave. Lenovo did the same
thing on the original Legion Go because they were not setting boost
values, and STAPM decays to the correct value eventually. Should we
bake this in the driver?

> If their BIOS/EC is using one and reverse engineered software is using
> the other, you will expect problems.

Correctly implemented ACPI should 1-1 match both modes, so we do not
care what the manufacturer did. Caring means their boost values are
not being properly set.

Antheas

> >
> > This points to a BIOS firmware issue. You should consider getting in
> > touch with your MSI contact for feedback and to plan a fix. I do not
> > have an MSI contact. And yes, I am not happy my users have to rely on
> > third party unvetted plugins for basic power controls.
> >

