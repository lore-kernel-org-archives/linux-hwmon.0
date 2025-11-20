Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC723D7FF
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 02:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763606368; cv=none; b=lsh2Z0JwZgS+0ZVH7d2taRDx0LObOLb1pKz5cICGKPiorbWsgh7qpF+64qmXDbXho0hzkJjgP5PaLp2vnlQ2iej+czdEq3siL2xeRMHgYdYcKOZSloZzkiLhvxjpjAaiVIpczfHk/JXh2OLLKaKReum9do3KEEA4WpW8abn2AC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763606368; c=relaxed/simple;
	bh=tSTI2J6PkvHyu30yi/JYan4cOyaRDoUxo8oGBT4+s5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wa5kEPxSrpnt5qOT5HBhTuyT6uEcwLC/ZRmpnbDxYW48/sJT1ewnx7s+lNPpwKKPkqWsOpIfiYV4QjReO5ZB/IEC4SlHXIWH4xCatGRcqOHts/FLGfNvlX7Qpvh4ngexFGihwh57g5jlc4RKhbPMROUPOMPCh7LnWT2kRV/VaH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QPN3O6jy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QPN3O6jy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763606364; x=1764211164; i=w_armin@gmx.de;
	bh=t9nQbBuefMx/8p52+Aa82M5kMm0TE6nFLB8vqnlT96w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QPN3O6jyKaUqmYbZ2KcsEI4kH2zJ/kFfpHKF74y2xDDclujNKfxSSuSSbwxREdKG
	 3evuFS215EPyKsguhvOF6A4helvJHpYsy5tlqhZXVGjCu83aYdFpzFfy+fzroPCqv
	 /NBAgE1SpBZVbIUf31Hp9OTBt0v54uyAVfojff9hOGy8PmloxRQZeatA4Zq0PlWuP
	 2oQ1kFdpia3Bd7PlOmdjPFsCd7REH1i693MFEUIV8xcvxugJ5i9jQf1Wyt3cWFnoR
	 N+30Qe7kLcO5DYgbySqlEFhI1jj1/FqA2Smcvyyt0g9dTR9UPIHcOPa6Ko0r8S3UQ
	 HzEg6HfhK3cHbwy6pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8ykg-1vFq2931fy-00EhUg; Thu, 20
 Nov 2025 03:39:23 +0100
Message-ID: <4ff54dba-db20-4d8e-b82a-c0eb2e227179@gmx.de>
Date: Thu, 20 Nov 2025 03:39:22 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patch: applesmc.c - update handling
To: Jared Mauch <jared@puck.nether.net>
Cc: rydberg@bitmath.org, linux-hwmon@vger.kernel.org
References: <aR5W2K2Ic06uPgBy@puck.nether.net>
 <c5151e1f-cdf9-4d58-b00b-433f877b2ab3@gmx.de>
 <aR528iQGceJtE0nN@puck.nether.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aR528iQGceJtE0nN@puck.nether.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dZweofx9LQCPsttkR1XY1DrP7wLI8BKq/mwNLzQ4lEdJ97yzQFX
 c5nPmYBysIUgT3XpRwnnWGCyNFrhnyoe5x7oFw+73tzP4PvO3eIA54zkkdGM06YNNvki9ur
 ccrA/6Mvbr+8xs//hc8QJAYB5KBJeKUDBlu4IAQRZ707duBIMrLdVVjtHmHFbrILksxvC5h
 5ElLCpnJYaRwLIrz4aGEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dtClmGSZjcE=;GUUI8H58f+IQTCTq6G0KihBUpzE
 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

Am 20.11.25 um 03:03 schrieb Jared Mauch:

> 	oops, wrong attachment.

- Please do not top post
- Please resend your patch if you make significant changes to it
- Please do not send patches as attachments (use git send-email for example)
- The attached patch still does not use struct hwmon_chip_info

Thanks,
Armin Wolf

> On Thu, Nov 20, 2025 at 12:54:24AM +0100, Armin Wolf wrote:
>> Am 20.11.25 um 00:46 schrieb Jared Mauch:
>>
>>> Updates code from hwmon_device_register to hwmon_device_register_with_info
>>>
>>> Signed-off-by: Jared Mauch <jared@puck.nether.net>
>>>
