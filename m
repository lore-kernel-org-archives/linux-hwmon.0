Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8742E8E6;
	Wed,  8 Jul 2026 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507843; cv=none; b=L2V11kW1W2EfSQ6db4AQdE+esA078DLW40VC2tCFbxQCbncCRegLq0SZQzefavC69XNO+vvDbjrdmic2ozSzN4h8qnnXwdgJDIQD3VJ1wQFU9kQdqa9QcA6iWSQiCmXZC3kHyME9u5mW22VjtsWM98VHuijMCajX8+WupQv8NBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507843; c=relaxed/simple;
	bh=d032drDqky5KzDhvKMflWjg9LG7OfLWmPzgJ+fvrOpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO6b0aXiLuxtOWm0kjqyWxQc5cGoph4hmHDDVOKFZVKrV6anD/80e8UIPLNah9Ac2u1x4S/xM2lCrwYfm+tBs+QjMx3hbJV9P0NlflsevFxm9amuOAb87Ap68S9+ivNNA95KJId1hdcANuDe8wwTiQc3juFzeB0MpAucalwZZMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ibwz4bf6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ibwz4bf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622321F00A3A;
	Wed,  8 Jul 2026 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783507828;
	bh=d032drDqky5KzDhvKMflWjg9LG7OfLWmPzgJ+fvrOpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ibwz4bf6ZWdc2y3Uii8snfheqYLAQLkbL1qe9WkXw20toarMn87Z3LCNseS5ZXqn1
	 HOqq7eD8NTuCvbyDupIX9ZNM7IiIWIQjrj8pte9uTVS9yRFSLjCysvBN5BGbKGDJ1W
	 Wqb/cUU57RUHCS8qxdhx36hkU1iCb/ZY+DWZW6FiGmdhsajoKbVKPwjN2tdXV9zloE
	 iEAhLXY3EehifNDFYFBsUM1iqdzmLL6pG88CDLqL3Nqqf4FbL0ipI5aFjq8IE3l5Oi
	 EBMZSBOX90SG3TE4PLUlzPUL/ocIZiF8xGSn6Rrg5ruo8r5isMN4G7RDoCAkC9qiHx
	 ONJ8qjwzsulKg==
Date: Wed, 8 Jul 2026 12:50:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <20260708-true-carp-of-champagne-a0dcca@quoll>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ak4QO9uhKOt68dl1@nsa>

On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno S=C3=A1 wrote:
> On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > On 7/7/26 05:26, Fred Chen wrote:
> > > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > > multiphase voltage regulators with PMBus interfaces.
> > >=20
> > > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> >=20
> > Please provide evidence that those chips actually exist.
> > Internet search comes up blank. I'll need confirmation
> > from someone at Analog.
>=20
> Hi Guenter,
>=20
> Well, in fact I'm in the middle of preparing a series that adds support
> for:
>=20
> "max20826"
> "max20855b"
> "max20908"
> "max20912"
> "max20916"
>=20
> All the above parts have the datasheet under NDA. But before we had a
> one page "datasheet" in analog.com but I guess that is gone! For context
> I mainly did the base (core) driver for max20826 and then Alexis added
> the other ones.
>=20
> Not sure how to proceed... I can wait and then work on top of what Fred
> has but this patch is very minimal when compared with what we have.
> Like:
>=20
> * No regulator support;
> * No direct mode. The chip has two ways to access registers (paging and
> * direct mode).
> * No way to count how many phases we have or if RAIL_B (func[1]) is being=
 used at
> all.
>=20
>=20
> Some other things more intriguing is that these chips, as far as I'm
> aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
> a gpio vout. Also we needed some special handling to read phase current
> which I'm not seeing in the driver. So I would like to understand how
> the chip was tested?
>=20
> Anyways, if Fred is ok with it I can just finish what I'm doing and send
> the patches. It would make sense to have something more complete on
> submission but I don't want to just "steal" the work already done.

Binding should be in such case posted complete, so probably not a
trivial device.

Best regards,
Krzysztof

