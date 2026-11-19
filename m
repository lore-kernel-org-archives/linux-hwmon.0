Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075571;
	b=Gs0nJHjZBtXncVkWzxSRHt02VZg+86sfaB3ESL0dVhxPE5QbD3h6zJX2hdmSZz3DPxVv
	 Tr1//XfOLLRckMUriqsNJ+sstLbPHZ1jq2Olw1Z6fT4SIqcAXtOZEDqhI0Ch9en/FDJnE
	 +DWfw+9CzhDBk7jgo8yozGQ32CRfzhVGlJj+xUDaP47vU9aIhOFZOF+PggM8jUgNLOff4
	 t54Ywi51Gz6+JewTmt+TGLwdQZ+5tEBs9yaj5l1VFYq93+/xFYUYthwDCuAdKQ5ZT2mcH
	 0qFbRCMGjJ3xvuf/8SmwvKv0ulvMIrhDNS9QZoulJG+GLbkkAqNq65ojOJTPDaGztHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075571;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=2zqQ4zpXpe07N252rkbekOGbKlRVsVWeGcGz5jxBkxM=;
	b=xAWAq1zGb8rM5WUmbZEG/crXrgA+tfibBTz39/8VgPNh8u/fwoW4fLL39Ua4CcZAwgPN
	 z9eOLoTJ6bIcy48+iVgxUjUAt4P0vC6ZBCb9osihHbnkWr9fd8TZt86zUUpCVyvPU8oK4
	 yDfwcT1f8ermKSImlmiAQL0hL9K5/PGu8CpZU3Ell8MhSmTOBjkRM1U3Df78my0kEEWdG
	 BqlLdlmGlxdrOSiqMoNJyyzQTRmCnYqcpGHYZtRd/i6rTDWrsKpFYQsz1uBFET7CZrvaY
	 axrfbWz3wtXSdLGnB28ztV1XqQj5SHTMNkASf/uzlzdr6eSVuNYLO7Gj2fnhS/jpR/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rKOwva0Q;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9868606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 08:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9868606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=rKOwva0Q
DKIM2-Signature:  i=1; m=1; t=1795075561;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:n0y0Hmcoege0DkEPeIjqDyweDGg1
   o6JJiWhiRtqXQzLIYMeD39t0ut5X8vm5yCksZFgkNcz8exudtSUpyHLilEp41gbi4LnGSTZW+qQ
   5rZPFTDT+gFUCVdo6gQYSd4ReZCVeeLn82X03BmCICt87lLdIsyYFLYZMPknQsXbsoMgHUsW2xb
   AJCZcJndl7mlqxS5i5vCXILd2Roe1X01jbuGdiwxECmgX5XqE8mfqVicdEkQBychjazHmiZRD1g
   ZJeD0LRvJoE48FTpyhLB1ytmmnemvpROQDlt3yUKdRvAt+G43DaA1J+Wfw6uik40vkrohIOzJr9
   VJnuVKDBQQhrNQ==;
Message-Instance:  m=1;
 h=sha256:
   hC1Wf+iup1N6Z6+ICHM9WSrl6ejgxG6gRqzzA35sFTk=:
   +2lLkr+KCdNLOPeQcJqjHLkOiu1be5nIRFpSzRq5ID8=,
  sha512:
   xSDz6bQVdcsX3KsA3/mKomiy285+5M3jtWMQ65RxRakMDrNtVycqHjKCl7d2COAcmmz+u3TrdbK4lwTlgdemzA==:
   DIQKIw903XGn2C7lkCONJx0MixDS3rYP+UU98vzI5fBTgHV322uriocGgKmGDFhzKdzDywA+ltef7OJuXQWH9A==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795075552; x=1795680352; i=markus.elfring@web.de;
	bh=2zqQ4zpXpe07N252rkbekOGbKlRVsVWeGcGz5jxBkxM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rKOwva0Q7gRaMm6oDyzx+y/Y1xLwkMW+0IqF68MWkQcZBGo+nQG1Rwis8BLdlVM9
	 WdSEVbGeeHuJpGV1SLEgNxOBHiHjr3JQ9Le1jct3A/NEd7eQlYQz3Y9zXCx975YOj
	 /CfEupWg0qepeQqCjgL/5hVPo3YxHx2xI+rA+pJmgwy++HWM/UFu/e+HslEG0edIu
	 hF7jGBMBpAXoHXWAJrAYyCb1NGfhVj6xyDHzdbvqepX39nLbu335ZMxu7q/ZCmcpC
	 4zH617A5Of8enmByAI+5J+OI1XnSh8ynTqHN6oppa7O2bz9v73vR21fcaQTpXVl+8
	 AURrpuKqH4uBISutPQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N14ta-1wRUrK0DNa-013ARp; Thu, 19
 Nov 2026 09:05:52 +0100
Message-ID: <303f05ef-8e21-4018-93af-769163be07f4@web.de>
Date: Thu, 19 Nov 2026 09:05:39 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sander Speetjens <sander.speetjens@gmail.com>,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com>
Subject: Re: [PATCH] hwmon: add Raspberry Pi DA9091 PMIC driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tU0b+oUfx/fyYI6NEplNnr2Hxs4+5c73BdGlf4sFns8YGdQvsBO
 MvvcejFHAlziarGdElHqCiOAxOHqSDE4MYK+7DWgLSdszic5X8kDI+XkiHdW6mMXFWeg0wE
 ocbD48Ubr+1cwiz5QoA8+rpOZNpaAJjC77SRpqqkBtTgjap+d6IwFvYpGROp+c9H1vInx5X
 KlYBQPrmH5IzJ6TINupfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4ID+I+j9geU=;rcE8Q+7BaHh+VUGzefrSi8i/y6U
 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
 o7CUSe69Q2LeQ=

=E2=80=A6
> +++ b/drivers/hwmon/raspberrypi-da9091.c
> @@ -0,0 +1,339 @@
=E2=80=A6
> +static int rpi_pmic_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> +			 u32 attr, int channel, long *val)
> +{
=E2=80=A6
> +	mutex_lock(&data->lock);
> +
> +	if (time_after(jiffies,
> +		       data->last_update + msecs_to_jiffies(RPI_PMIC_CACHE_MS))) {
=E2=80=A6
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&data->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.4-rc1/source/include/linux/mutex.h#L25=
3

Regards,
Markus
