Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450145;
	b=sQIjCYdfuY00mxlPY6m93P14rPsO+AOZjU/+ZispUqkgrC8Bw3dGYgXRA2cowNekvgu1
	 feSDG5ffezXOmFQPe3chmPtVtNUD3+9NdXZeWWxrCoYeK0BZtXH2SZUaMFTz9H2OxIe4P
	 azncs6glswaIISUgM2uzrCCUbVpGLZpO12jI3YhRAM7DkOyuvbmH2Nd/gv7eRVHOw8L6L
	 3ohcAfHB3Wmo3LpG6XrS3J/0BxKY4/7WJFR18/pHycbGmt0udo3TiXGQ4RuEgLvQ4CtiT
	 agvwu/6AQCDEU/5CsARPF2JM8ovNyq9XOHyrAKZH5ptjTfm2cKZBe4TjNOrKj3gSWUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450145;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=vsZ4ZiEuFO3Q85v59nTceyK42q7BJhnrb+QW70Q5OgU=;
	b=M1aA0Vqj7j6P83tvVTwvkRWQSBaqd2XK9sQi6g7pxg7RSNygA7FDxrQwpsX88Fi2Diz+
	 Dbjc3Yu9D6l8VjJJTQcX6DiNUgncWXuKE4DGYbb5bMYNejyVr5aAgg/FpMpd9VfOIm6/N
	 VhOu6V+zZsxEU/Q9AQf8Y9XdCs5xiUa0blNodYafNVPwWMDwPDo8TkVbyqhutoXKtY114
	 OWcjJO+aOIgsSWdf4J1jOd8VS9RSh0dMd8hVjvhInqXqQmHOebzNImjuwTi0XenYzMUOK
	 L/4d1SSYflj9ddMiOpgsyOQD9WsN94tqRSTk1aWFmsZ5HPA+FMCDZ0XG9vxevxMLCdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ZVHCFi5V;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B5606A319;
	Mon, 19 Oct 2026 22:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1B5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ZVHCFi5V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792450142; x=1793054942; i=w_armin@gmx.de;
	bh=vsZ4ZiEuFO3Q85v59nTceyK42q7BJhnrb+QW70Q5OgU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZVHCFi5V3ttd1lj+OUuvj/IqIByl/s8BKOrGri54Nwf7aYiz/wtZruGIt3wUI9AM
	 R04mOljEVMUZpvItJfpP+bV7POY1uK4e1TP1iQfviZ+81sgp5Z95wYHpcHmec1TSE
	 MXKTfgsXo0ewk2pyWcEzFdYB8L34QWHjYvgKG0WWexjIHVmr5Yk6XTjFruw+yjlQo
	 dEv2I6d5UbmOBdKYHPnwhsWph9NfER7nw8H+oHk7OGsOZe7cGtuVtVvqhgiSYBJqI
	 erUSYVgAFKWL6R67FJfAlD2gWpHxQ7lqPoeyIfO0p0r6Y3FibEpyztNeHiavIkMG0
	 LvC6MBtCiNOra/Yg2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNKhs-1wyd3H3CkU-00XnmL; Tue, 20
 Oct 2026 00:49:01 +0200
Message-ID: <0dddd5bf-520d-4d20-b21c-a3891632c499@gmx.de>
Date: Tue, 20 Oct 2026 00:49:00 +0200
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
Subject: Re: [PATCH] hwmon: (acpi_power_meter) Fix 18.45 TW bug
To: Guenter Roeck <linux@roeck-us.net>
Cc: github@firefishy.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261006234618.10943-1-W_Armin@gmx.de>
 <86b3c644-544d-4c23-8e7a-4478f4094058@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <86b3c644-544d-4c23-8e7a-4478f4094058@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ehkXxIbwk3OQm7IrcUd7HnOZRm4//aXABxXM79l0BrPMcg3poc0
 6wjLZ//hC1qRZYhhsAsJQUmvGXSVXoHWrnd/MNnwU1/1gFmucYCeXJiaTtRFJKlz3U+u2AP
 qiXZsmBPnWPADn8wcngl5gTjhKF/+/ss+DU/hzUWtbwaomSuyO/niUkYD9Cq+ISRBWQOIs4
 MwMFfUJgmb6l9A0Uq9G5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XJAxwvt6cos=;MWIfXMyMe/ZrkYwt3iUVhNAsley
 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
 =

Am 19.10.26 um 22:53 schrieb Guenter Roeck:

> On Wed, Oct 07, 2026 at 01:45:34AM +0200, Armin Wolf wrote:
>> The ACPI specification says:
>>
>> "If an error occurs while obtaining the meter reading or if the value
>> is not available then an Integer with all bits set is returned"
>>
>> This integer can also be 64-bit wide on ACPI 2.0 and later systems,
>> so we have to check for that too.
>>
>> Compile-tested only.
>>
>> Reported-by: Grant Slater <github@firefishy.com>
>> Closes: https://github.com/lm-sensors/lm-sensors/issues/460
>> Fixes: 1fefca6c57fb ("hwmon: (acpi_power_meter) Fix 4.29 MW bug")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Applied.
>
> Thanks,
> Guenter

Thank you :)

