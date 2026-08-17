Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B483EA959;
	Mon, 17 Aug 2026 23:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787007759; cv=none; b=caRwSxQ4Qb4vqChPQVPQnCQetHtUQTDpkH63EOxWLC4lwTcSvXTo+58618ih+BDpM/TXyotaU5cStRx6aBGJngMR01r20F6cqa1sDcYRksWzvaIqKowNhbYthPHmf8eZmk9UPMzE7KHG0/t8W1uD0KkyoARFW/4kO+D3DSvC/u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787007759; c=relaxed/simple;
	bh=RW2L0FJIr6SIJWt/a14TZQpM8aWcXdyVunDsy+gwTw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKtz0rs8cXgA4lVJzttXo6Ch/xx1cfadCReqSKrvzGx+1tjV7S7AX+eSiQxpHqa+/5pyu1+/uFfDnkaQercXvgW9QZtJvlc2rLoV6sj4+XdWH2qdiKmWihTvl/rkuDpDu1hsqNxrYtRPoeY5UqUNbtFllrAgLPohg3TrQcdFzf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QCqwhzFF; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QCqwhzFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787007755; x=1787612555; i=w_armin@gmx.de;
	bh=X90h0bbSbs1AVZwvVOF2OKV027eWSa7HhloTt8yBNtY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QCqwhzFFINk8rxIGkxBl8+0fAUOFtxmNgqo1hzCJOJ3PlgL3Lu2GCykp7n5pZXsk
	 3YVQ3+W8HCppX9oMM53NBNoaoqNMD0DmNhIGd4nJ/t5hUDooFBcRjIq9u999WhN47
	 wwDd32me6ZflXF92BuPCFLTsmR9c5nfUNnx4sFTdSeMAXzvSa7UtSeovyQ1neNutp
	 qahpyS0UpCFwcQglmpueVjwMjwWzR88PpgmgPeCrB7SLxQNn2nHur73zWTXjGkzOI
	 H8bGgXyhNRpm7wlRwQfI4C1D3UEnoRPcnvalh2AG7jCBDPmuQkgxDGX6RZZ1+ADvY
	 RHqYb5pyxY65b5hF1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpNo-1wMDMm3bbG-00gGg8; Tue, 18
 Aug 2026 01:02:34 +0200
Message-ID: <ebcb1afb-26db-46f6-8e9d-30218190870b@gmx.de>
Date: Tue, 18 Aug 2026 01:02:33 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected
 hubs
To: GG <ggirouard@bungeetaco.com>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
 <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
 <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
 <jjJPzuDEBRVJ3kZwlt43bdlePFCpQRMREjsEVngkNZLaCQDi9wBEEZb4U-2nvZ67qskaP8WSEbux8AmWenQGHT0WIvFQ6ZU2G4zQl3Lb4Vw=@bungeetaco.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <jjJPzuDEBRVJ3kZwlt43bdlePFCpQRMREjsEVngkNZLaCQDi9wBEEZb4U-2nvZ67qskaP8WSEbux8AmWenQGHT0WIvFQ6ZU2G4zQl3Lb4Vw=@bungeetaco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DIrW+QYm6FK8MrqbTG8nJR/7iA7JGV+HwtvQmWc90esLi+2X8nf
 pMuBWp0c3xCV+kOiIezeg7SeHBEGtsrZmHZDnhC3pRbudCpgXnmLaQGwaYVIzO/C6wriuMl
 0nxyFRF3XFkoIQlsDxZAwfI9LHmCnvb6VdrHehUtbRMkDSqKY+0pBXbrY88VHUGCzLJdH2O
 eULy06nU1MFbuZHMmkLQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NGv+5kCmR5I=;sx8JtmayUZmTwyFpGA3yiRKcDwG
 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
 M9QDnCw==

Am 17.08.26 um 19:03 schrieb GG:

> Understood - thanks for explaining the page selection part, that makes sense. I'll blacklist it for now.
>
> Appreciate you taking the time to get back to me on this!
>
> Gabriel G
>
> On Monday, August 17th, 2026 at 12:58 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>
>> On 8/17/26 09:42, GG wrote:
>>> Sorry - I should have searched the archives before sending my last email. I've since
>>> found this from February, which is the same problem:
>>>
>>>     https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaetadesse2015@gmail.com/
>>>
>>> And I missed the obvious clue sitting in my own boot log:
>>>
>>>     i801_smbus 0000:00:1f.4: SPD Write Disable is set
>>>
>>> So my kernel already knew. Apologies for the noise.
>>>
>> Unfortunately that knowledge is not passed on to the spd5118 driver.

Yes, sadly the patch series adding support for this was abandoned :/

>>> One thing I'll mention in case it's useful: that series above has spd5118 refuse to
>>> probe when writes are disabled. On my machine that would lose me two working
>>> temperature sensors. Reads are completely fine here, I get correct temps,
>>> and my temperature limits read back properly. It's only writing that fails.
>>>
>>> Happy to test anything on my hardware if it would help.
>>>
>> That can not be done, as I mentioned in my other e-mail.
>>
>> Problem is that accessing temperature sensor data on spd5118 compatible chips
>> requires a write to select the correct chip page. If writes are disabled, and
>> the BIOS selected a page other than page 0, temperature sensor data is not
>> accessible. Since the BIOS can do whatever it wants and may have selected a
>> different page after a suspend/resume sequence, one simply can not trust
>> the status when the driver is loaded initially.
>>
>> Guenter

Would it be enough if we always select page 0 inside spd5118_i2c_init(), thereby
preventing the driver from probing on hardware that does not allow us to write
the page select register?

Thanks,
Armin Wolf

