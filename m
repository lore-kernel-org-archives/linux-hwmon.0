Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612962;
	b=2m+5Jmf8jB7TCNYCeWqo7Ui9duT5lMydRj3YPgYfE6vna3/QD3E6cZ0YNlAP089Wk9/A
	 3xapHTVAS5g+8bcJUfZyfCx4wIQVh5tGWaewdUChVtORk0KJlJIj5COQbi8LdatEF98xE
	 EtoufHx31z6PBK2bSKpAelqsdItOpPXUrxqmlDhlFDxZpHLu8BUctCLxRJCEPe9hehd3e
	 d+3JXxZKX+UoeUhpUtKy78OUl3eTTcO5MQE+oNymdZZ+HdrTCXEp+2P47BzvA99axr+SY
	 BEI5w2TAPlmBsmv1R4DQ5+0PTxRziKD8vlUeqpfSKxpcoOr8RFYbcxpMrTWC/k6CsPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612962;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=IomBTekauLkxxPXv04mLoM8SJR5N1Q+EBQ6IW/a3VHQ=;
	b=EH02lS3LSKTWZrjJCh2WWOKQDo06xdOSZxv9V5La3SbpKys4Z2Nq8qKbGGmgP4JYLWeV
	 PObQmepVtU/Um7NxSnhd9+x9m/Ct0xschPZt7JPRaOT+BgFNZJOYJlOtutdFh8fO7qCMA
	 XQrgvpIigJhjWA1HE6B614T/Hj71B29zdMmgHqY/HD6xdhPiUWol+1mkXtAwhDTAzo0m8
	 G1IQ5gKuG3EAR+e8rqXvzHtCdOrU0sVuJSoekTiC+paI2t7pB7lcVYHl7pHxUREWblFwc
	 Z4dNhn7mWlDr+60mCzcVTpf58Q6J+eSjxv8WxdkdyWoIkFpwv+AuFFzF2C/L/pL8GMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jxYqJwwY;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD902606A332;
	Mon,  2 Nov 2026 09:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD902606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jxYqJwwY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 11DD14E413C5;
	Mon,  2 Nov 2026 09:49:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE19F60750;
	Mon,  2 Nov 2026 09:49:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D16DD103290E8;
	Mon,  2 Nov 2026 10:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793612958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=IomBTekauLkxxPXv04mLoM8SJR5N1Q+EBQ6IW/a3VHQ=;
	b=jxYqJwwYd0HYfHVt+JOcypgvx3XJNP1H5ktIESOIIvd2QOKvbNdGYxpygPY6fmwvp1LNjn
	O4GGEQB773WuzVtYZw1uG4UCpEYb/X72o2tVrrC5aqlN7TyuNWSExMazgpVQ86bGwZwykH
	cIizUz3vDyN+/uvP7+kDah9OBbIXfrRaUbPAKtbAz+UnQaScEURHP/tel5gt/HyKVVwyIu
	LgmDna8UMWRI60Dax3vw89ojY69oGkwtCX9KfFaqZJdzE89aJODUVG518OtsT2irxZAaK5
	deSKPXlTgDkhrgVbHDHtuQaodH0SIE6UKnTwPERmijzDNjFIjnJpw7it12JNtw==
Message-ID: <9bac0a84-f03d-4fd1-8092-9922c65010bf@bootlin.com>
Date: Mon, 2 Nov 2026 10:49:12 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or
 move to pse-pd?
To: Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>
Cc: Roman Kuzmitskii <roman@damex.org>, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, robert.marko@sartura.hr, luka.perkov@sartura.hr,
 o.rempel@pengutronix.de
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
 <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
 <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
 <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>
 <d126b3d3-33b9-405c-9839-db492d874ece@lunn.ch>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <d126b3d3-33b9-405c-9839-db492d874ece@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 11/1/26 20:57, Andrew Lunn wrote:
> On Sun, Nov 01, 2026 at 11:09:42AM -0800, Guenter Roeck wrote:
>> On 11/1/26 10:50, Roman Kuzmitskii wrote:
>>> On 11/2/26 1:38 AM, Guenter Roeck wrote:
>>>> On 11/1/26 10:02, Roman Kuzmitskii wrote:
>>>>> openwrt reviewers asked me to check with you first which way you prefer:
>>>>> 1. extend hwmon driver with PSE-PD (like it is done right now)
>>>>> 2. move driver to drivers/net/pse-pd and extend it with PSE-PD
>>>>> 3. something else

I am currently working on this topic by extending the tps23881 driver.
Please don't do it yourself to avoid working in parallel on the same 
topic. On the other hand, it would be nice if you can test it.
Roman I will add you in CC of my series.

>>>>>
>>>> The hardware monitoring "enable" attribute is supposed to enable monitoring,
>>>> not to enable some power delivery or network (or any other) port. That "port
>>>> enable" feature using the hwmon ABI was sneaked in, and I am inclined to just
>>>> remove the upstream driver for severe ABI violation.

Do you think it would be possible to remove the current tps23861 driver 
and binding? This would break the backward compatibility.
I am currently using "tps23861-poe" compatible name binding.

Regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

