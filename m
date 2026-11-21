Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795301682;
	b=N1YP9r3LlYLNAzTZZEUlXfY0Nve8NynUKQigcq3gMLPpv6vgCJyeZd40f/T+LIoCrESt
	 rTB+Q1po/du2JEn5tnrz1VWl5zpz/pQFrM83hjrjO3pVZ1AP1p/kGayyBxMPxyNYoOUV0
	 IgFdHVpar8FJw4eMDkDj/ZRAzKErP9q0d2D/CjpqLAnYws+AGrzq59ovVFfoqmmn0ba2+
	 PKz66vQqbXhrUcKwr1x75kAgY7Zp6HU3WsiJLZbpJ75PFEWw42me8oGyn0pkMppafK4oO
	 WUzhbo2gC0BiPJSkIR8KdQjCqzTPPKIV10yxNqCQMBCB8TmyRr70bX38j15z6HVav2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795301682;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=UGaZrJKlIADv2McyuKUcw6E3BmRLnvEUOZf/8ztrctU=;
	b=d2YsBClNjWfA9GX6kQYacM09pXr1OZOXpvk5/D3SR/JZzLXKlA1UgCLcFDktgzTGvxIM
	 2CGJsq2HVT27+vCXUI27NK2Mm3u7gAsnoKSYjhvYP24EQPwFoEvjFE92gfU+8HliYxwTy
	 7X/6vWzwU5+FjdxjhBNaZDBo05OEF+1appltx5LnMHVgpJ+5ztBd/ZRv4EFg6Q0E69ZwP
	 xI0Fzz8JF8eDavovOW8Q50xWpV5QqJR2kM3tm/xkT095F38XziXNeyazDwjRupI5+8n9B
	 F/e+kBEWO2e0gzCeDPn0NUABg/RSUs0Ue8Kbvhg20KfUjzCHDyLys4+yfemyfzX501g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=beBTYP4C;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FD4606A334
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Nov 2026 22:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FD4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=beBTYP4C
DKIM2-Signature:  i=1; m=1; t=1795301679;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:d25Uypx07MD/G7LvbOJe7HGIuKIe
   8XQRfrZCPXfv4FjvCwTmdnmBKS6ss4FAh3lHkciglqWbJDaHMUARNd4H3mVTrN0TRXyVKnLauRx
   vAp0yZa4ABZfwmpPrNZuLRIaHtrXzuCbJbv4uWqepkOwrNpgoMgJn58i2GOM4IrItpBp+cEuDp2
   iJcHUr6TsKalQm8dfc141kyRoUebJz6U7/QbXR/ufMPeIkmfpBaq1cA4OWNl+Rsc4S4/1cP5AKn
   9NlOFYn84r37QOLewsQMwUWJDGJCzeqqhCjF+xw+UjBy7nSaA7jQNfsN1VFb+oe6XM0PK/6myM6
   sOLM2ybwpqbAOA==;
Message-Instance:  m=1;
 h=sha256:
   OOlcNUq8xOhvr/8f6+GD0rrSPcgcNpZQ7tctovEcbrU=:
   UGaZrJKlIADv2McyuKUcw6E3BmRLnvEUOZf/8ztrctU=,
  sha512:
   83Tk6l7TqnHjCcsnpFaSjMCP/4A4RqtOZoLE5Bixmkl3nycBfqnyLiMIHn6769ZZhj4YoQz0B+G6x9l0iOTcow==:
   SPgz0pdmIUJk1gfRXQfDjN2lKrmQw4H6vNQKx7LXTot1KaBWbcopXTgIDVezhd819JKBWSQNQZxnSykNwEHzHw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795301661; x=1795906461; i=w_armin@gmx.de;
	bh=UGaZrJKlIADv2McyuKUcw6E3BmRLnvEUOZf/8ztrctU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=beBTYP4CYrXbOnb9KJ5QcpFhTEFft1H+UnwkEZh58IuPFXey9MetwFzApX9PnNcZ
	 Op889nUEXPn9OVjMnZw6iuyyUAf78sGA2b2F1jfX1wGwlS+e5GRw9QZ7x/j3/pgFl
	 qsTjB2uvhpsRM7zpgyQ2W0KxtwGv6fXyLwXwsHREFrnDvBZKuoVWnJd6HZ9vu95Hs
	 /B+FWnF4ij1ANJ9TAjOEnpU5OymNBzTUMcPJPz7/BnVTvilQYbL2iRJM2SnvH/mRX
	 KsxXfsSGPcUB2y75c5g5PLXAOIZOqGT2eXBOfk7eNSS64gijtkd7MJG9zCB7B8QbF
	 AcNUyNrpqnihu7bGAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCKFk-1xd7S32rUQ-00H4bh; Sat, 21
 Nov 2026 23:54:21 +0100
Message-ID: <e4e133c6-db41-4776-a73e-e8e051eadec4@gmx.de>
Date: Sat, 21 Nov 2026 23:54:20 +0100
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
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell XPS 15 9550 to fan control
 whitelist
To: Ivan Popovych <ivan@ipvych.com>, linux-kernel@vger.kernel.org
Cc: pali@kernel.org, linux@roeck-us.net, linux-hwmon@vger.kernel.org
References: <20261121193227.9408-1-ivan@ipvych.com>
 <79f7bfaa-1cd0-4d44-818a-f080cf0168c5@gmx.de> <87v75paji6.fsf@ipvych.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <87v75paji6.fsf@ipvych.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:82fGQCuFpC2HOBa0LMAnsb9GlDeN01nezIXqhZ2GIrky6vpKtkZ
 Vdoq4UZOij91cv2U2RmLctzcIpy58dRPTV/6yq2wsfVSEp4hheRt0OmL5dAFw/odWs/l1no
 b+n5/D9h/F2/20/5kgtHXrKwSENHt58qBl3N1MjyPgAdON+8e8HNU1vuptvU46ozXoAGFyH
 8J8k3/5ac5vf5DLymaY5Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/XdbmOpUt1A=;HLKcBYt6anNfp1BdrgzNsypYCMi
 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
 Jv4Qit

Am 21.11.26 um 23:48 schrieb Ivan Popovych:

> Armin Wolf <W_Armin@gmx.de> writes:
>
>> Hi,
>>
>> can you check if the 30a3/31a3 pair also works?
>>
> Hello. Tried 30a3/31a3 and it works too. I submitted 34a3/35a3 because
> this was what is used by dell-bios-fan-control[1] tool that I use to
> disable fan speed control right now.

AFAIK 30a3/31a3 are the commands used by the official Dell software, so
i would prefer using them.

Thanks,
Armin Wolf

> [1] https://github.com/TomFreudenberg/dell-bios-fan-control
>
