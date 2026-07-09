Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289A9318EDF
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611726; cv=none; b=TN95QT7jrABvFi8TZo5Rozcd4i6OAYeB7rESfTR/m7CyZ00rROp86VoBLOh3F0f4/L6pv19dMrjqkNSaAooEZ9LwOcxgTYwegNrxH3dxhcCuMKhHEv3G8OjDjKOu6IKGageUmbI7oB8A8zTB+wEUe82IZbTqtyvPq4QK/4NGJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611726; c=relaxed/simple;
	bh=jBebvc9q65tpbTKgY3CaACwUbwDd+EIwTyXbtUWv9VU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmpxdnfYmgCAV7+lTjxETge2SN48GOY5xVnj6UP5SKU7cDq1QYRR32NUsvrqMza7e5TcxjEvq1A/PB/DhB5WgLni3UZgNHx8pwQHBzZAocyxa6fwTu4tzXPmXj90DxjQOKKA2efFwbH17wE/3zZ/0DVkC/0L6YOVr7Robrpvu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHeX7M47; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHeX7M47"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so20218275ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783611723; x=1784216523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m5WMgCSmDt8RWpA7neeShBFtGrEL8sTi9loDykIc/BY=;
        b=IHeX7M470HwInMtqFmjWjYFKB1DfkzuN8Lzu6OYbPe8fJEr+tr3TSsOvfdCeoHzJqN
         nJKIBQH7MUaanHEGKOwxZOm2mqyZRtJP5gaJzfNPoXegcnap3Fb/WXLJhCztRHBI/mIL
         MND/LotOCyG5NThW4keBM4/phNovAqcvl5jFA0NQaagF0hqrdKMyF06nLnaml/cSy79c
         Di8VbEiVWKSR0xt3SBw6qOPeYxvEZErATI1a48pdPne6YUowJlW9iw7oC5aiGdaxG5xY
         nRsr6hFORV2TKiOXSb3ggJI9YntbtZOXDk5AV1QTqV30OoaDzct2gnJETyesEERJNixb
         eXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611723; x=1784216523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5WMgCSmDt8RWpA7neeShBFtGrEL8sTi9loDykIc/BY=;
        b=VcVWqr3S5kS9KJCwHhFLD7dt3CoETY03l3C1iuL2OnstfAweBEned66pWs3NgwOgxo
         NCkuBCN0gceSVuo0bKNIoMStVal6VC5Tu9g2/KViRxI4cusOhnRm/C2L4RHer/WWA/g1
         8NKmDmONDyumdtxYoS4pz+AWG1jPW3CpyMGesfvqBXfypVrMb/abvbBw+XMUCEMF8RMS
         gAwFbh4bBQzDRR/RGXpK19kEf0VTsBMZMT7+6T4Y9l8cLHCA6XEJNIkZ5jlu2/Duf1h/
         cD9e2qo7YMJmIzDNvWC486Vp71oqtQr+7tbssaJcWXK1ElzPuB6kcMceDNVnYa/wJtqk
         i0eg==
X-Forwarded-Encrypted: i=1; AHgh+RpVb3bd33p/o7te55bYJE/NNgdSOEZmWgvfUv1OQWHhWCBYlFCVBkEmKo5XZPGS7obZ/ITt7765y/1rxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJBCqzklX+QA4sttQ5j79BT1GA0UDvSounlnNAgIo0W0hEBGJ+
	wFDJPRp08j6BYHozBIK3XcSOkFARosh/ceSGHZFhlgjpUSX+CsrM1Wqp
X-Gm-Gg: AfdE7cnHVJRKsZbBiqUed+IKm+5/4Sp0sxEueRheZzewp72zjTJ7Vf4vzhp7EMVrgMK
	JBPzMkoLjU6/UwmX22XaINQmov4SchNe3geN/lgieVS30vydzeYo2RBrEqhe9qV/o7l2dz0MOOk
	IvzIIjU2z2uIe76Szb2QMTJ0EZEbWENTQzhhFg8pAKiMhtP8xXnIsgxsgOQ414OmHZLYt0D/UiH
	45nCTbHzcRRlAM1bzzDG/o/DaJzzoGRsXf38jIrozim16yoxzmlVMzMiQZpR+pUq7vhA/IHTQby
	yoCwaTdqDDVMZd+lKifL+T1BXGORT36D9sy9uaSvKduZowfjtOh01X3odt6yhJOhiCHP2VJuljP
	kpplUR54UTeDG4trt/N1QwnW1lX31j3zhM+R5HTFFBNnxmKB1QbmOKKlXPdhCXzA8yFUUsv983L
	2dUt8mdfzfe53fXIgJe0sg8Zwe2Q==
X-Received: by 2002:a17:903:1a84:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2ccea3c7bdcmr84739185ad.14.1783611723236;
        Thu, 09 Jul 2026 08:42:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e284sm46431485ad.40.2026.07.09.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:42:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 08:42:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fred Chen <fredchen.openbmc@gmail.com>
Cc: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <1a7a6350-fc17-42b6-bcda-24d49725b92d@roeck-us.net>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>

On Thu, Jul 09, 2026 at 03:23:55PM +0800, Fred Chen wrote:
> 
> Based on the MAX20912/16 specs on my hand, these chips do not support
> PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> and does not provide m/b/r. Therefore, some of the features you mentioned might
> be specific to the MAX20826 series.

FWIW, phase support can be implemented in the chip driver. Other chips
such as MAX16601 don't support the standard phase command either.

> 
> Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> part of the hardware power sequencing. Managing this pin through the driver is
> not a requirement for our system.

That would normally be the case, but if the chip mandates the use of the EN pin
the driver should support (but not mandate) it. I would not expect you to implement
it, though, if you can not test it. This functionality is critical enough that
it should be implemented and tested by someone with access to hardware using it.

Thanks,
Guenter
