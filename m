Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302554;
	b=fZo2nhhHhqlI2BPiLA4aGyex3bA2p2FRZuD3hMX6/Z3GupIsjLxpH9ZdCLGOF2S5/e3w
	 aJkkQrlOOvfsZuZhOa6euxl3U79+J7sb+nxZpXnwW91BYFl7Yax0Jp879jl/c6KJqtQHX
	 g50MHiaZ+81T3vdpQESvRwael708JFlO2j9XD1IbyuloZxlLIQlKUeLo5bJ0oIzmJw301
	 S8XqyS2YxyI0zuayzlQxFSN3jud9QI/BkPlxC4P0oaMYFHJndYymLPHsi7HWgK3FKlNON
	 RAPXFnHjCumTXut1khp4tb0S9Xt2V6vrHzlplSl5CokJJWioxU00FZQ2BlUObUE5m0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302554;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type;
	bh=2CErbQZuzOV4ZJyyX1YT65TNric+LUU4CVPhMFH/I08=;
	b=EkuFx+r6GMDSrptZf/tCkq2MZnS+pifSAu+vuapv5yB0Npqm4/syZF3yTSH1O0vWgEE5
	 HwmOjbFVIm2FquMnp5zjWfLgFX8nX3IZp53KXGZYSK7mKzvNjRd50XbwF0KUI1VgJ/03I
	 NQgICDSqvWDNsstldzwL1BYzTxS+ZMI84ApNMfXOSTusaHCGV6Xxq1Hp+9gTl6gQLi2wx
	 63ZlIFdIDiKj84KCZUbpVH5HDlYthzTCpU5QnL6YFV9pO9wGRjdogqiYa80XE2CVIDpdj
	 PWIWwhMpaKyp7JFC6SvR/dKWDoxcpldQPdckhHsdkVocDyhTJHBDQgEHnsmvVTE9atA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ipvych.com;
	spf=pass smtp.mailfrom=ipvych.com;
	dkim=pass header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=iOaruSix;
	arc=none smtp.remote-ip=95.215.58.163
Received: from mta1.migadu.com (out-163.mta1.migadu.com [95.215.58.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C57C606A330
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 23:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C57C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ipvych.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipvych.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ipvych.com header.i=@ipvych.com header.a=rsa-sha256 header.s=key1 header.b=iOaruSix
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2CErbQZuzOV4ZJyyX1YT65TNric+LUU4CVPhMFH/I08=;
 c=simple/simple; d=ipvych.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795302550; v=1; x=1795907350;
 b=iOaruSix4dK4/HM3KN0wnG24PAg1Ibsg5/1zGFjEC67s8pVbuargfJjD/j3WQfLOONthisqv
 VfRyCZXukagQxZBZEgcxL6+lPY7QZqIhiJCqumSkLJV8jjP4BvDBfjJnbbsSB4ASHVhM1+wTMJ5
 SY9nfXkRkqOQUTNfGm+pO7GEk4Em8o4NXKSQtRsKVhtY7D0mxzSEmn81Gxf/+fioPoV9lTE164/
 TQ1MIijL2MyDJQwxhfumyTJKgUPKxA8qE9LkLV5hwB3N68+hsR+ALpSDqEUorT6qvdcFlnS8O+u
 yH19SBLyWsj5KVTCO5fjZ/i7RK0ff0nrcGoq4o7iVOb+w==
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2ce4d634fcc4153;
	Sat, 21 Nov 2026 23:09:10 +0000
X-Mizu-Trace-ID: c2ce4d634fcc4153
X-Migadu-Flow: FLOW_OUT
From: Ivan Popovych <ivan@ipvych.com>
To: Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org
Cc: pali@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
In-Reply-To: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
References: <20261121193227.9408-1-ivan@ipvych.com>
 <79f7bfaa-1cd0-4d44-818a-f080cf0168c5@gmx.de> <87v75paji6.fsf@ipvych.com>
 <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
Date: Sun, 22 Nov 2026 01:09:09 +0200
Message-ID: <87se0taiju.fsf@ipvych.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Armin Wolf <W_Armin@gmx.de> writes:

> Am 21.11.26 um 23:48 schrieb Ivan Popovych:
>
>> Armin Wolf <W_Armin@gmx.de> writes:
>>
>>> Hi,
>>>
>>> can you check if the 30a3/31a3 pair also works?
>>>
>> Hello. Tried 30a3/31a3 and it works too. I submitted 34a3/35a3 because
>> this was what is used by dell-bios-fan-control[1] tool that I use to
>> disable fan speed control right now.
>
> AFAIK 30a3/31a3 are the commands used by the official Dell software, so
> i would prefer using them.
>
> Thanks,
> Armin Wolf
>

Sent updated patch, hope that worked.

>> [1] https://github.com/TomFreudenberg/dell-bios-fan-control
>>
