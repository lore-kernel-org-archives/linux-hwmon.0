Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231F2324B10;
	Mon, 12 Jan 2026 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768253238; cv=none; b=gl8zljlSUjDEL5LOJTOoPDDsRRslyyJkWfmToflRCAYMhsJTDtNKtiLYbHXv0Zsf8r1rUu4nep+Ofi693nRYu2Ivp1pNXAu5SrF7Cp1vyFstbsGrna/vD3z5S/FGs7stIjCJq6g4MVneNnjccZ0ok0H/M28cBhnz4dMTLYtm5Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768253238; c=relaxed/simple;
	bh=3Q/6st4yyg4YnRrbxeahfLMx4gT1Tj9cF21Orvgk1yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Va+8S9NX9z+8Dt7x0M9jzBP8YK83CPSp0KmDtfqiEtLeHbb2FtltlGAwNUCSX/3Ly05uhWVBSZlLjqu1EmwPhP3PlMnuI2yyHoECCuKdpOXSwI8siIVK4KMSa+pCiBhY4d3kRabJAG5lybhbjy/95+CEbZMJK1J8XAT7IuCxVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ODeuq/Hb; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ODeuq/Hb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768253221; x=1768858021; i=w_armin@gmx.de;
	bh=3Q/6st4yyg4YnRrbxeahfLMx4gT1Tj9cF21Orvgk1yY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ODeuq/HbxvsKra5Jj1wQOEBRCONpbZvkbdDRE0uQ3jbUM4+BWj7gwadLM2xltXEv
	 mBdcPYhUT2P92W8bRPccM3Uy/sr3uCd0gf61xITJ2ubzTriXLfDoxCYhuuAYBcpS5
	 5TwJSQd6bxQRQNv1wFrvNKesxxxralwXL0iPqOZ3NGRE5L+9qs9+/uiBUuKQiLVaG
	 WbW1u8aW4L8fV8n9oWTuAeB7E8s3T5YlaGeL7f19MrWXvokaAxTbgfy5k7Ls2PqBK
	 A2j2Xl49ZYRX7jk+FEq9Pm58i3LpAou6eneI9BWjW8H9uBaW6nqGerAzCsrkqDIoi
	 el8lkz+RwjpzvwRxZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2O6Y-1vh3rn1Vlu-006ymq; Mon, 12
 Jan 2026 22:27:01 +0100
Message-ID: <d617ae84-b93c-4ead-a48a-765c552ae49a@gmx.de>
Date: Mon, 12 Jan 2026 22:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Add support for Dell OptiPlex 7080
To: Guenter Roeck <linux@roeck-us.net>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260104000654.6406-1-W_Armin@gmx.de>
 <7bc197ec-9fb9-451b-b7b1-977d6d4c6152@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7bc197ec-9fb9-451b-b7b1-977d6d4c6152@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fqwvF/WfBb2FLjgsZEgBG5Ts97QFqrxwBPEbCT7HWbC3VtA4Hvx
 17bUem3OTtFXtZQ+wvoH5pdeMhHJiQjwemWiyeMC7pU2BwsBxklpGTzsfmALLh4AsGkoC/P
 IhguNKQTD8eQMobT+xgm7hwsnMrLp2i8SkS5UHPwTvpkKooTnG/36TR0N8UijZq/r5DACza
 gRAd0cd5jna9mBEdeH9HA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SwR+ValMVMs=;AoNqSvBRczEqE5NeNG4ohLwOAuu
 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
 RhZK8CEAB6O9XhCTk=

Am 12.01.26 um 22:21 schrieb Guenter Roeck:

> On Sun, Jan 04, 2026 at 01:06:10AM +0100, Armin Wolf wrote:
>> The Dell OptiPlex 7080 supports the legacy SMM interface for reading
>> sensors and performing fan control. Whitelist this machine so that
>> this driver loads automatically.
>>
>> Closes: https://github.com/Wer-Wolf/i8kutils/issues/16
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Applied.
>
> Thanks,
> Guenter
>
Thank you :)

