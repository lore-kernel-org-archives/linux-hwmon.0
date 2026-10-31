Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.220.183.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793420005;
	b=I5UZak5+R28s4rzfHfdLKmByDqashwJRyMiEpUE5ypIuVAPZePU9uratfPpz8JHcQrKD
	 o8oY/oIwdaDZLWwPOCaDSLC+hcxRKvXF2zK6FEYCc31FFMPHOfPTQm22dJ4+6gXtJQkKc
	 AiKBixQpClVm0+qWKrptA7Ymujmn9WUIQwCBBLvRyE7XYo7objGvVPR7edvWdvYQ6mUlT
	 G9dGARZwUywn0M9d1OFRXdpjKDQ1+tn3L3kbUkbKPJ31xRbTDuD3G7jBrjZnwtuy5FTDu
	 aKmRrx95PEiYrZWUl1hxhR0uUvx0RkcwZgBVKhT+ZvG76uFp11vO7csQyz3EAnogGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793420005;
	h=DMARC-Filter:DKIM-Signature:X-Mailgun-Sid:Received:
	 X-Mailgun-Sending-Ip:Sender:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6/UON3FZABElEDM2nkGkWU1zTaq2n8Hx9K56m1eT7GQ=;
	b=aSaM5Zz3QvoSGcgjfDyMvGYiHRnpozNUTuaA1G4GZaI8j9sk7PLPh8q8BhgXYHbp5gdK
	 +Hu/Ht4IeUuNTSPu0O1ia3F8nuZE1CKvCDWCo80+GAJHO6qsv9bQaqcm/aFoG7d9m8x/B
	 XtRBEGpxAj7Dujk4NXAnczKlCwPzdLR6GcDpHFBbJDgXuJ5R+WLrtXvEV++Du4GsC2mtM
	 qGa2odTcpa/kOyWITymcl1dKxSB14kNUkJausmRPoA0VPvGJxhYNWdc2sn9IAjPNr50cR
	 4bAWNMz0edSp2QDlsQQeNqiAzd56aaWNLpmW9fo07o+IfqFG81QrtgpdkmgFWEX0sGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=equiv.tech;
	spf=pass smtp.mailfrom=equiv.tech;
	dkim=pass header.d=equiv.tech header.i=@equiv.tech header.a=rsa-sha256 header.s=pdk2 header.b=Oao+fS2D;
	arc=none smtp.remote-ip=204.220.183.25
Received: from k25.k3ae2098.use4.send.mailgun.net (k25.k3ae2098.use4.send.mailgun.net [204.220.183.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id F0F21606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 04:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0F21606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=equiv.tech header.i=@equiv.tech header.a=rsa-sha256 header.s=pdk2 header.b=Oao+fS2D
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=pdk2; t=1793420003; x=1793427203;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=6/UON3FZABElEDM2nkGkWU1zTaq2n8Hx9K56m1eT7GQ=;
 b=Oao+fS2DtAktfEkT0AY7zBd7uKjSMrwlzr+FdFfdUwBz3NukEo5/sF+UgvQu+YTQAxyQZriOgyRfBvw6QGIjSoVVaGZfClRTsSRmLYyodF2gm4KmAIBdzqSHGsOKcMFgf6yWwDL1CX8khTQ9Q6Sm8XP31X4gUJmefYNin+HmucodiLumzcvXZktYv3lBuHgNqtAJdtYgBBWKHjJchVsFwfPHQk9oNvohBLOQsKD4IbsDMQgxpNjwNxYJKioOwRYBe1DETv3XmJKucu2Km/FFkh5Te3yiiT+0sQJ/rzV3AiPD7RvJue6Cw6DqKnwM41CKqNOCn7uwAfN7GrIc6zJ2QQ==
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by
 cb310769271d307aae5024361a622ea20ba464effb451eab3df74df2456907bd with SMTP id
 6ae56ae3849daf1f21de07c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 31 Oct 2026 04:13:23 GMT
X-Mailgun-Sending-Ip: 204.220.183.25
Sender: james@equiv.tech
Date: Fri, 30 Oct 2026 21:13:22 -0700
From: James Seo <james@equiv.tech>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 04/11] hwmon: (hp-wmi-sensors) Fix unbounded loops in
 scale_numeric_sensor()
Message-ID: <auVq4pPTpSaSrqku@equiv.tech>
References: <20261030185256.976255-1-linux@roeck-us.net>
 <20261030185256.976255-5-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030185256.976255-5-linux@roeck-us.net>

On Fri, Oct 30, 2026 at 11:52:49AM -0700, Guenter Roeck wrote:
> Fix the problem in the first loop by exiting it as soon as val is zero.
> Fix the problem with the second loop by only entering it if val is not
> zero. Also add a check for val < LONG_MIN / 10 and exit the loop if that
> is the case.
> 
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: James Seo <james@equiv.tech>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/hp-wmi-sensors.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
Acked-by: James Seo <james@equiv.tech> 
