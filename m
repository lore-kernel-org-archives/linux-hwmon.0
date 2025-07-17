Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F328A408
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Jul 2025 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737456; cv=none; b=a3gG3c1zgtPTTYjg+nU99eoWiSe/APhJSEtrH6Yxw6SoHfYtKIB2JYXbAiWeAH2gSbLoFBwdQ8nN5fUNDa4XC59O9y4IjQTXL9tiW3w6YImQNbCXhDeJxLFmFAKmRyriq9HL+f+5NzlGlpvHfbI8iPDS+J2qqm/S5+s9kOhzHKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737456; c=relaxed/simple;
	bh=XKX4Kq6sieUxbDiNoTH5j+BP9mFbY60nvZsIbyQRnHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiCebMCw2+h5JHGJmDbyG54uk7ObiPVJ+/9OrUlEijryERYtDeNK7FUkMUDDIvSfx8Csqj6g8QD+mLnPm2nlvCvV5JAC4UBoS7HZj0WNLnpvYntqoO093aGWc7rjK7RpXWk2yNo3DyQg4cLBOXGptfC1Hm9M16FPDMWcKBSX3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1ucJ4d-0005Tm-34; Thu, 17 Jul 2025 09:30:35 +0200
Message-ID: <0915032e-617f-4d46-8dc7-6818af751a0e@pengutronix.de>
Date: Thu, 17 Jul 2025 09:30:33 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: ina238: Add label support for voltage inputs
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
 kernel@pengutronix.de
References: <20250715-ina228-v1-0-3302fae4434b@pengutronix.de>
 <20250715-ina228-v1-2-3302fae4434b@pengutronix.de>
 <eaa183cc-a56f-4a33-bf01-a5279799f395@roeck-us.net>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <eaa183cc-a56f-4a33-bf01-a5279799f395@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

Hi Guenter,

Thanks for the review!

On 16/07/2025 17.04, Guenter Roeck wrote:
> On 7/15/25 13:49, Jonas Rebmann wrote:
>> The INA family of power monitors estimate power consumption based on
>> two voltage measurements: across a shunt resistor and across the bus.
>>
>> Conveniently label them "Shunt Voltage" and "Bus Voltage".
>>
> 
> Labels are supposed to show the sensor's association with the system, not
> the chip labeling. So this is a no-go. And, yes, apparently I have been too
> complacent with people (mis-)using the label attributes. That doesn't make
> it better, so don't use it as argument to support this one.

As this chip measures power based on two voltage measurements, the
measured voltage inputs must always be associated with the system in
that way, that in1 measures the voltage on a bus and in0 over a shunt
resistor on that bus.

Otherwise the Power/Energy/Charge-Measurements will be incorrect.

Do you have a suggestion on how to use the labels correctly or should I
just drop the patch for v2?

Regards,
Jonas


-- 
Pengutronix e.K.                          | Jonas Rebmann               |
Steuerwalder Str. 21                      | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                 | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686          | Fax:   +49-5121-206917-9    |
