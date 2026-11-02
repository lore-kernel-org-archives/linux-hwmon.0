Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638635;
	b=nVeHtcLbjmV38gwHs2qIVd7vz3ny7Gx7xM3F+pRjxIOCzh2Km+rQZ5jHFkY4tMP/833h
	 9atFnxSQs37Gplxwg45dovs44CpWS+zOBZN0Fai6pm4JBLnATjS4p9Ab75mxR7Aa7t81E
	 kMNgpXl58ZNHO8ZQIkGg8YRgqiotejslYqvQmoOWKMp7HQwqDXJzX3L4IDphXv0nXlRx4
	 3jLmfWuxwi9thgp/BQXWoZ0laEm0kIAMwpxTEFNVuxy4pmyNDK+TZQQjaE1Qm1CHt1Qdo
	 4tC9FNHJSOoCHbI5u+RFzwLUKzDSJc2xxN3tyoz7+IJNNL4JIr8+VwCbhfFkybum/fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638635;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=MpO7RHOfLKJAP4WejvlEzMmeWorZw/u+tDQ+wr+YWhs=;
	b=HRJAW2BvC8wu9sLTJauDBHGCcv57jneghoj4KlT/obyqxLXVyJ5mqzru5wW9bNvsVRgf
	 06T5/b4yXSfARDRQkdnIudJlh0Q4RTjFv4WcpBXs8rwNeTvV6aH7oaG2tt6iDz27WOPt2
	 Fr/kKP6Q1TN1GZUtUuE2NAA1SqKO1uvSxhItLGM8U63birQq2WzwdXBCPc5ZiNaVMukvb
	 gexOpI7dgmn8vKWA67mASOC1EBvhae7njO5MOAOduLvrzOaKIWDt0tjbrP8FPDVT+WgOd
	 2EL/OepWwrRGNl362BmsxioW0lQ2fTjjuoPJsbVD4dv4NKzITgmJjXoFMdfqPaYR9lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IvZ4PM3y;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD0606A580;
	Mon,  2 Nov 2026 16:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CD0606A580
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IvZ4PM3y
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 542AE4E413C5;
	Mon,  2 Nov 2026 16:57:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22AB3603D7;
	Mon,  2 Nov 2026 16:57:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 164A410328E6F;
	Mon,  2 Nov 2026 17:57:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793638630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=MpO7RHOfLKJAP4WejvlEzMmeWorZw/u+tDQ+wr+YWhs=;
	b=IvZ4PM3yrswwu/IldZkckixMudRaegLNfu8wvtbbuUWxwRCB+C+4ai3apx6cq6+Q0wzGZ3
	nLNkjBKCbZxSSleMza5UR/mArwt6WAYdeyqIXAFj/JwQSRaBAwqi0G7yQqSDLIMuH9ptPK
	69Ur4rwakq7ZhEBBKNsdUffhcsSr/ZFw11aHyxWXupMZixyxVahgNwI4cEBn9BezBvfFzn
	g2Cr90I9cZ/wK2LYaMV9hHuz7kIDrMCXWXCXSh8gJQ+YXhemmDJ4kUY8dDrv8QY93RFXqs
	bp/o3SQJDzJh2eFWzIn4OBslQaLaFFXq0UH5QdQVaRoXNjhgUJanQCALGqvTuw==
Message-ID: <d7f5a3b3-a3e9-47bf-8f08-5c8feb0c88e7@bootlin.com>
Date: Mon, 2 Nov 2026 17:57:06 +0100
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
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, Roman Kuzmitskii <roman@damex.org>,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 robert.marko@sartura.hr, luka.perkov@sartura.hr, o.rempel@pengutronix.de
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
 <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
 <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
 <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>
 <d126b3d3-33b9-405c-9839-db492d874ece@lunn.ch>
 <9bac0a84-f03d-4fd1-8092-9922c65010bf@bootlin.com>
 <57516add-01bf-492b-9fd9-2bcb762e3041@roeck-us.net>
 <1219dc2f-0f96-40db-8268-1a8eb009b152@bootlin.com>
 <e422d6e8-3385-43f2-bcd3-1c5060a5b45e@lunn.ch>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <e422d6e8-3385-43f2-bcd3-1c5060a5b45e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/2/26 17:36, Andrew Lunn wrote:
>> I am not using at all the hwmon framework in that development.
>> But as the binding tps23861 is already reserved for hwmon I use a new
>> "tps23861-poe" compatible name binding.
>> To me, I agree to remove the hwmon driver but this will break backward
>> compatibility. I am not a hwmon maintainer so it's not my decision to take.
> 
> Is the hwmon code applicable to the tps238XX range of devices?
> 
> Can that hwmon code by merged into the PoE driver? Without API
> changes, apart from dropping the API abuse case? The compatible can
> then be transplanted into the PoE driver?

Should we really want to add the hwmon framework in the driver only to 
keep the binding name?
We are managing PSEs through ethtool why should we add another user 
interface (sysfs)?
Anyway old devicetree won't work, all the PSE PIs should be described 
for the PSE to function properly.

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

