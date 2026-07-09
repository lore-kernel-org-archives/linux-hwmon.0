Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085253EC2DB
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587200; cv=none; b=EREAAk7ZeI+PIlTwmKHntJ4f5xw76XJB1zCFoRZDghpPDOzZb2ldUdCBsa6LO7z82T0vvOD/1SzYbrmNT/ChW/8gxHRVII29TyjYp2MKLOMql/s+L+4QP0FQNFmTNdcWm4S3Hx3Dy7/PQ+i0Cic5LZKP+sM3xphja6IrBeaNbF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587200; c=relaxed/simple;
	bh=gJH9guXcAfNJ6SsL+eO4i7xE/NDXFjDkDL6cAwmmE40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb4qR/gGhXoNsz/swklGj/iLKwiDWOdIlA4cCspmEitHNhjNWjpZD56SD9x1aLyk2vTARBwkY6x8s0qjMIKmoInfsbMtNMGhEe1LEVw86OPxSHVHNk054HID7mUz3+hTy4BWxBikUPgcIUoa1l5RRuOlUpwUX9KUEzlgUtGbaKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jksxRTYV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jksxRTYV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758bd3731bso425812f8f.0
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783587197; x=1784191997; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3WCN+xm9Ku357SP4qkc2nLAhmJTaNSJBwAXmI/hZS4=;
        b=jksxRTYVH0bOAxQiQT5u/DZMQ87Z5qlltniQc8dywmvycj0i62hJ82UpiEgeDT5lGF
         fjJdfEoRk6maqbwwKW+gitrKyTMdZcsMT4k1KouHq3RMglWYp7QmJti6wyqQTjboYLTN
         uz6Ol20xtiYyiA49JlWk220H5bL/spsLxhpkHG7+sSD6X0xTV+HdemhFyq3QRaKgwBWB
         Dr9b5PVzl+ZQCPzw1OR8pl1xfm25sqEUZVCzDHik84Q38dMYZe6naoR/k0v1erEHHW+z
         A6ZcQ819qVKNcva8PgADxK5dwwlwDMRXeVW3fhmZs9Nd2x/l/W7wGkTEwdBillnXvNGI
         7uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587197; x=1784191997;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W3WCN+xm9Ku357SP4qkc2nLAhmJTaNSJBwAXmI/hZS4=;
        b=KMSxpxG/d/7gprmWjF9Edkh/Edc1J2B+tORyI7Y3RBIkft+Swya/pV0qqKBAP79Bgd
         uM9EQxd71+IJkw1srbvbyY2ME+LjCYc8lLyM90N1iGeFSmaLZuOAmV+cnLVR6wdsvst7
         2Gw3UHhHj9OZOl1vpytTdrOv1jqujzI5S436JBo5ID1+dILsgfNAP/3XUoWaz6aN1jZ0
         mw/Kc1LqvW3NChRMEauLUn+eBeWadtbhVb1gcMRKHdKlWXKFU133qh37+xQ4xjtcrvbR
         QuqVMtlzucL6OHs6vX2OBDvU4UH6lGwNNkV5sbJzCCLdA7miG0deS0nFyMF5KpxsE8eb
         769A==
X-Forwarded-Encrypted: i=1; AHgh+RoLdIyl75pU5hwpatgs8TPMfeT8riTCKB71pvrTequpYqpTDWAv/Fe1PXEFj4F3pvq0ufCIQ0n9jqzqTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymoOzAIAA+Zjo3H41OH/TeIUR3cTzj66B1WZB0yh/59yMjCsP8
	PLFpAFopdPLQJi+AhHG3m2ddfROuTq8y+MxSHHuCutYAeoumu3CPpweg
X-Gm-Gg: AfdE7ckIERv3bKt9SX+rQGPlhcUP6vOV9cRxPD7fw2jeOporjD4RfPXDhfSARskv9wQ
	GKsc3O+FiFpv73PMX1fOlLwsvTkK7ppaQtPqFxoATH77lVOZvryQp7doyPLAqvDRhEmZj3uIkAg
	CPwd43kP+bWpzH+oHRRhcguUY4XRRIQC79oLXHEjvmwoEXwFjx5QC3ZCRAeDdWrNQmAo63rOqYP
	Ofm11gg82AHxJh0I68d+AAC8NXBwqq/kZ4/zvEp2zwsKj0GMCpabw5xBocWfTuQPEj3OA8Bf4Wy
	2PrLwHB99ZzT5RfHwe4tBSJYO8Mxb/mqLPIHxcX2ppT8MQGWnTnisdjOXsLa5Wwzr+eOUm67oqr
	ErHpDYMFIrfQcNFui4FyApHzoifyJsbEWHNoa0awJcOb4+utVlHcDIOI5KhNk/UiCTSE2LH7PZE
	637Xxk
X-Received: by 2002:a05:6000:2509:b0:475:da0e:744d with SMTP id ffacd0b85a97d-47df754dbc2mr2043290f8f.8.1783587197256;
        Thu, 09 Jul 2026 01:53:17 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm47621073f8f.23.2026.07.09.01.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:53:16 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:54:22 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Syed Arif <arif.syed@hpe.com>, 
	ChiShih Tsai <tomtsai764@gmail.com>, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>, Colin Huang <u8813345@gmail.com>, 
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak9gFKkfEgkU_q1G@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>

On Thu, Jul 09, 2026 at 03:23:55PM +0800, Fred Chen wrote:
> Torreno, Alexis Czezar <AlexisCzezar.Torreno@analog.com> 於 2026年7月9日週四 上午8:59寫道：
> >
> > > On 7/8/26 04:32, Nuno Sá wrote:
> > > > On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
> > > >> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno Sá wrote:
> > > >>> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > > >>>> On 7/7/26 05:26, Fred Chen wrote:
> > > >>>>> Add support for the Analog Devices MAX20912 and MAX20916
> > > >>>>> dual-output multiphase voltage regulators with PMBus interfaces.
> > > >>>>>
> > > >>>>> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> > > >>>>
> > > >>>> Please provide evidence that those chips actually exist.
> > > >>>> Internet search comes up blank. I'll need confirmation from someone
> > > >>>> at Analog.
> > > >>>
> > > >>> Hi Guenter,
> > > >>>
> > > >>> Well, in fact I'm in the middle of preparing a series that adds
> > > >>> support
> > > >>> for:
> > > >>>
> > > >>> "max20826"
> > > >>> "max20855b"
> > > >>> "max20908"
> > > >>> "max20912"
> > > >>> "max20916"
> > > >>>
> > > >>> All the above parts have the datasheet under NDA. But before we had
> > > >>> a one page "datasheet" in analog.com but I guess that is gone! For
> > > >>> context I mainly did the base (core) driver for max20826 and then
> > > >>> Alexis added the other ones.
> > > >>>
> > > >>> Not sure how to proceed... I can wait and then work on top of what
> > > >>> Fred has but this patch is very minimal when compared with what we have.
> > > >>> Like:
> > > >>>
> > > >>> * No regulator support;
> > > >>> * No direct mode. The chip has two ways to access registers (paging
> > > >>> and
> > > >>> * direct mode).
> > > >>> * No way to count how many phases we have or if RAIL_B (func[1]) is
> > > >>> being used at all.
> > > >>>
> > > >>>
> > > >>> Some other things more intriguing is that these chips, as far as I'm
> > > >>> aware (at least for max20826), always have bit 2 set in
> > > >>> ON_OFF_CONFIG so a gpio vout. Also we needed some special handling
> > > >>> to read phase current which I'm not seeing in the driver. So I would
> > > >>> like to understand how the chip was tested?
> > > >>>
> > > >>> Anyways, if Fred is ok with it I can just finish what I'm doing and
> > > >>> send the patches. It would make sense to have something more
> > > >>> complete on submission but I don't want to just "steal" the work already
> > > done.
> > > >>
> > > >> Binding should be in such case posted complete, so probably not a
> > > >> trivial device.
> > > >
> > > > Yes, in my series bindings are not in trivial as we support the enable
> > > > gpios.
> > > >
> > >
> > > Same question I asked before: What is your use case ?
> > >
> >
> > Hi Guenter,
> >
> > Unlike my MAX20830 patches, for some reason these chips (not only Nuno's max20826)
> > hardwired the bit 2 in ON_OFF_CONFIG to '1'. This makes the use of gpio to enable the
> > device a requirement.  (as of the latest info given to us)
> >
> > Regards,
> > Alexis
> 
> Hi Nuno,
> 
> Based on the MAX20912/16 specs on my hand, these chips do not support
> PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> and does not provide m/b/r. Therefore, some of the features you mentioned might
> be specific to the MAX20826 series.

I see, phases are not supported using standard PMBUS.

> 
> Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> part of the hardware power sequencing. Managing this pin through the driver is
> not a requirement for our system.

But we cannot assume all systems will behave like the above. But now i
do wonder about controlling the GPIOs in the driver. In your system you
clearly did not need to do it. In mine (testing with a rpi) I had to
use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
you do gain the ability to turn off the regulator. If you don't it's always on
(which might be indeed the bulk of the real usecases for these systems).

> 
> As for the testing, I have verified that the telemetry readings for both Rail A
> and Rail B behave as expected. The driver reports valid data after system
> power-on, and the readings drop to 0 properly after power-off.
> 
> It's possible my specs are outdated or that I'm missing some use cases. If
> you plan to submit your more complete driver covering the MAX20912/16
> soon, I'm more than willing to hold off on sending v2 patch.
>

Sure, soon enough :)

- Nuno Sá
