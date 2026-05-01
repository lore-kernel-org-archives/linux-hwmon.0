Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF0737D10A
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626381; cv=none; b=FKm8TtruO5u9Zpt02bAOPvq6/9sFF3AnZQlXYx9/U3UOVv59rep99IxBKQ5cBM7g9gG2W2BVr0R8yAefTSSdq3FQARg3YYtmPJHzFg1wtP9NJvT0vkzGQyUygFEs6qIBv4Y9/jfNsAFOz5onSR/YUsLRoGi6eCVKn7iNsieYylQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626381; c=relaxed/simple;
	bh=f7hQPoUNOPFHNms1VtGeIdzhO2Fg4F8IUnwgd9ABmKI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZcUv6Z/8oykN6CwSuJlL572+DHGxAnc/vNObYUinO2JO4fBst0guYbLb6bu/FakGubk/mLwPCDZ7KXg5d7hfiBxgcaftZWXqa8/LWSYy/B6KRwVkQveKlaG08en9dbVYdtsBJZv8AiI9ZaQKWpok2Nd6/azENfJCsLURvYr6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNzYs/vT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNzYs/vT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0046078so14510835e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 02:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777626379; x=1778231179; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FAli/ojvvv60g9jGIIaKkrzw2RR4VbZckKfc9cgNVPM=;
        b=FNzYs/vT7B/Uz4aG9wkOdBbDnyaKSkrJnKYyILEyuZZ3c0AZAAmD8vKByQHFUobUs3
         ODm6D0WW8TfpsqlVuVcasQG+3p23ZgOyOd8H5kkeaC2vsr8bdCwtrEp4uix9ffTMqmXS
         WqQPxddpB0oy4UHGlA0xqz5tFT94+FA17xvEoimF3Q4odq3O9M4EH3Q2evwmIiroXtV5
         FzMur3UvWyEWiHCb+ub7L5ExokNU0Z5w7A5ulGhpe91AV8tpVuVJZ4EAHXYq9lu5yNT6
         kIEBj1OxHFcTq2p/+UPrnBwZKfhM1TKUF1yzpNVHp0cb+ndVcf3afHgDtZ2ay7120xrF
         7zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777626379; x=1778231179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAli/ojvvv60g9jGIIaKkrzw2RR4VbZckKfc9cgNVPM=;
        b=GgSlhifU9Mcb64luUX+qUKUNS9n+fJpCQDZHsifKpFcOj4VqWtV5RRBikL1Z5Gmew1
         mO5sP2THj0Ct6ytfN2feVKNAxt3oVaV8gulv5GUn4OVhhlGIxDa0hbC8cZFFVFvMeQU7
         T8oROZLhlPhpGPTVPPVogexitlmz1taw7GlhSmYabeRVadWnt5cjkp+9e2E93uXVdPLW
         hiJOK15TtcEXyS2ngRaUW4G3oFC15tl5AVQTIhdrztIUzpcBmYxwJTEKTY3NwqE3O0lP
         GnR/bXFiyjh+GCm3TJv2UnhfA3XzS1Bw1X1iXxj2JG1r8v1l9P+OF9sdUkuDL7EvGqIQ
         ax5g==
X-Forwarded-Encrypted: i=1; AFNElJ/ikDL2EWt48NXJDwxS/JFN84BnXTVMLJKayPN4wCPvNr9dQt/wTAJJp22SDLu+nrEGzAN1/z2AEJHslA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEcnvuYqu8JiO7fHt0XOhKNmAu5EMPDZAyfWkiKw8cOK61+w+
	FWn5hAJDEklzsv3pzDqVKCVGVCvvk9iFbvDlpsgaMyeFpl82kSHE5XPTUFD0ng==
X-Gm-Gg: AeBDievE9A6pB36CE/qJ+AdqtVXEZZMcRb3UI2VCt+N3+Hu3TVj6bq7a7YlL7czNH9w
	L71Vk+DA1EEDKQuVigOvRgNXV3iAT3DwDfC6JBRuB6I7wjEWy476TkbNZIf7OPvk16E2mrg8Sec
	r3rAgLmR5ke8/rwJnbtt8WsXevHDfEPeFCjpAfYyVfzICrlLztThblmaGJ07tgTS0dgFX7+WxP5
	3AnjshVgS/B2dB0wLMqVwdIr1wtfb6YdQTxFJHggKBeSMOKL8dSceNZNlwWw92vC7ZVfksVOJMV
	5XqB2SV7nwwItZgkGpwCzGqurysRLBgMrGlCFCY2/74t6+Wewd8Sz8nQJL8vVDYD3GyI/6sswWJ
	Pg44u4ELkOWoIDy+2xwlnRgTtGL63PrexVgWDDRu/rcaSeP82fLGAMhMfMmEwihgKn4hHyhhv3s
	7WRubULg81YTfrbT6uFkxmKyQ7sMD7VmRsmZzyq+7qmgLdb0rvimbDqDmPb9gRYAl6J4R2weuXQ
	q2pYje+O8Ep
X-Received: by 2002:a05:600c:3b2a:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-48a8eba4225mr30082085e9.25.1777626378454;
        Fri, 01 May 2026 02:06:18 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm69224565e9.0.2026.05.01.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:06:18 -0700 (PDT)
Message-ID: <40d4b3f058d70c8e6650dfd2e453315b42fe371d.camel@gmail.com>
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283
 Swap Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko@lists.linux.dev, Nuno =?ISO-8859-1?Q?S=E1?= via B4 Relay
	 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org
Date: Fri, 01 May 2026 10:07:17 +0100
In-Reply-To: <190bf39b-172d-4852-be86-1d7379d7d4aa@roeck-us.net>
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
	 <20260430100343.45D31C2BCB3@smtp.kernel.org>
	 <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net> <afOH5xx29LGJ9yKH@nsa>
	 <190bf39b-172d-4852-be86-1d7379d7d4aa@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-04-30 at 23:10 -0700, Guenter Roeck wrote:
> On 4/30/26 09:50, Nuno S=C3=A1 wrote:
> > On Thu, Apr 30, 2026 at 07:52:55AM -0700, Guenter Roeck wrote:
> > > On 4/30/26 03:03, sashiko-bot@kernel.org=C2=A0wrote:
> > > ...
> > > > > +	id =3D (client->adapter->nr << 10) | client->addr;
> > > > > +	adev =3D __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "g=
pio",
> > > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->gpio_mask, id);
> > > > > +	if (!adev)
> > > > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO
> > > > > device\n");
> > > >=20
> > > > Can this error path lead to a use-after-free?
> > > >=20
> > > > According to the I2C subsystem rules, debugfs entries attached to t=
he
> > > > client debugfs directory are only cleaned up during the client devi=
ce
> > > > removal function on driver unbind.
> > > >=20
> > > > If __devm_auxiliary_device_create() fails, the probe function abort=
s and
> > > > the devres subsystem frees the st pointer. However, the debugfs fil=
es
> > > > persist and retain operations that operate on the freed st pointer.
> > > >=20
> > >=20
> > > AI taking everything literally :-(. I'll have to reword that guidance=
 again
> > > to include the probe error path.
> > >=20
> >=20
> > Yeah and it is annoying it always comes up with something that could
> > have been said before. Even more annoying some of are legit issues :)
> >=20
>=20
> Agreed, but I think it it is better that it finds the issues in multiple
> rounds than not finding them at all. And I have to say it is very human -
> the same happens to me as well when I do code reviews of complex patches.
> A major difference is that, unlike me, AI doesn't get tired.
>=20

Yes, nothing I can disagree with. Until it continues to come up with legit =
reports, I
just need to continue to re-spin :)

- Nuno S=C3=A1
