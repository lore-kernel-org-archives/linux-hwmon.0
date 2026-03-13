Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ADE3D2FEC
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773443445; cv=none; b=A5tFrqoSkDK5JxFVTPbqjanbqQeVTL+l/M96ycE5sGxc+9UkEkmxxXrJBlZXQMc6i1QdXsxbi05/Qzjp+kLa0u48NCuo41lv0lrsowTW33P3AIN/9Kz+Czx838H6FPDvfKarpecoJMmnyki+wt1V7K517nX+bsVgC+AogDkWRVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773443445; c=relaxed/simple;
	bh=GlO7IiTGMQ1DZ+mz9HlWfCocpgMr3YojLil2O+dDmAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ueJu8tqR+3lUxEPqAvr2PmLdTgkGxez2lUOfDH2qnGWePNxTsxZ0Gi79HRZZZOimy17psSVvGdu9fFrMgY7e1ckMrC2GgXayRPR0iyZoDbngFTsQifAe6vfKiv+vQzWYeorjGwf0JvGj8Dmcf/XcANm/6Y7+XcR1Tifh+UpXxvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=guCttbzP; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="guCttbzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773443428; x=1774048228; i=w_armin@gmx.de;
	bh=7QSKOtfZP3PQep1TTTYpUjb5O25zOieMhlC0aG7N31o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=guCttbzPURszCf+awqqYd6LBuTPugq1QGG61kfPcykM8+zSdbAnmZ3no3AhxYhbE
	 cgVfeqCxfkxC8/jh2MBbKj0Aw0KMnVKdV7wNtQ95hSM0FsK0NZ/R/zD/wnW7/W2LD
	 RWJtbTHJqolg9cEDqDvPs38CycnMpnTHxZHm9lk4rT8UvsG99xUv3mqqgwj8QQpNp
	 U5unh/f7juFmpkD03p3iXXIHo6zeSLuFZ4HRvNSllFfzBCcjp7UM+b7aRgsvtKrHy
	 e6jqaxHmwwTkf1aWJPeqsTOUzUmkJeMa+O3hSkvLBd1/tFA/6EtaUp+Ekh7OdVVUa
	 9c3Pv5c/Cb58Faw1IA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMuR-1wEiA63DkH-00MZop; Sat, 14
 Mar 2026 00:10:27 +0100
Message-ID: <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
Date: Sat, 14 Mar 2026 00:10:26 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird Dell SMM bug since 6.18
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DDAd68aNB5i9g2VP5Bm1QJ+Xs1wff4JEF/meJgyHOB4S6qfHvg1
 zXHQCBnUh5DNGoXYPJgW27hZebOU0ZMoXy1qM6LaRhKTbn+layvB1/lvGXkVDk37+UuLwH7
 DU9zbJEOBrdmRzipBtj+OIgEu2eUOQkcwfXxrpFH99koOOHCl/QkzTE19p2azXf08tPDYQ9
 +0WoArwE48UoC7230jtLA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ebg6ruSEjmQ=;6sTAUnQDkCgtFZFjYq6VR7H6zP8
 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

Am 13.03.26 um 20:06 schrieb Jan Clau=C3=9Fen:

> I was actually in a fixed state for some reason and everything worked. I=
 then tried to get back to the broken state and seems that echoing 2 into =
the pwmX_enable endpoints followed by reboot did the trick.

The developers of CoolerControl said that:

	"As mentioned in my previous response above, CC reads the pwmX values fir=
st, and if that fails, then it doesn't bother
	 with checking the pwmX_enable attributes. So, according to the logs, it'=
s never getting to the point of reading the
	 pwmX_enable files at all, ..."

Reading pwmX when the associated PWM channel is still in automatic control=
 mode will return -ENODATA because
the driver cannot retrieve the current PWM value when the BIOS controls th=
e fan. This likely causes CoolerControl
to ignore the dell-smm hwmon device.

There a two solutions for this:
1. CoolerControl does not ignore PWM channels that cannot be read when in =
automatic control mode (or adds some special handling for this driver).
2. The dell-smm-hwmon driver stops returning -ENODATA and instead returns =
a dummy value (like 0).

Guenter, would you be OK with the second approach? I get the feeling that =
this issue might affect more
fan control daemons.

Thanks,
Armin Wolf

>
> I then reverted the commits you suggested and it indeed fixed the issue.=
 What to do now? Should coolercontrol adjust its code to this change or th=
e commit be get reverted upstream?
>
> My two cents regarding cranking the fans up to max until the control sof=
tware kicks in: I think medium fan speed should be sufficent. I actually w=
ould always default to BIOS control and make the control software in users=
pace responsible for setting pwmX_enable.

The problem is that on some devices, the "medium" setting is veeeeeery low=
, so the device might overheat should the fan control daemon somehow fail
to start. Normally this maximum speed is quickly overwritten by the fan co=
ntrol daemon after entering manual control mode, so this should not be a p=
roblem
in this case.

Thanks,
Armin Wolf

> Regards,
> Jan
>
