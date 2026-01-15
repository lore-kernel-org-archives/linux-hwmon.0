Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F184C81;
	Thu, 15 Jan 2026 17:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497814; cv=none; b=B6+r8gvSM3GiMM1wAxOxKxZMsCe4VcETAf7GHWcLSkm8Zwa7VkUvwlnpc23+MEUdz7tZ60QsxgNbAzQOjxh2l51nqgt3Zn2J1lYz/OudZK+gJ1djr1UO9/i0soEFi6ZxELRwDfivF9UIg4dYCPOOe+BONmF65ZbY0DTb8mNf5B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497814; c=relaxed/simple;
	bh=3Tdu/6HF2mitSlEOpzxOI/azkGk9G/Ba60lWFSfoNGs=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=KTBk82VqA9f+r7gnmAdkK4swH0QBZhU2OUgkU3Iu94wY8HCKmb3Ij/nGMEJTYm77ps800iC6q2oZFdQwErCDeCAZ88t8OjG3a3YdwIvrkXWNdT6zzfBeQcghKR8/hsUMky800LUnRTifATGQp0rulEVszVnLQ5Uk1oTgLn6b6vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=CyHXEh3+; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="CyHXEh3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768497796; x=1769102596; i=markus.elfring@web.de;
	bh=stv4PQM9sBXGU4aM2wkHoore+ojhn1skj19vUvNSwqY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CyHXEh3+Pic3hcXijo3pahtVxm4sgXarUJ0xqElXGwYDzfn4opDyee5sUEa1hhrR
	 cOpClWdNWiqwvaGNepyla/6l1AL++MQmRhEDRgrZTg47K4xOwvvlcqI933ymBRKQl
	 ajmZ5YqD/G0d4ILGLn8eF6DTtHuNjT4klxgI1lVF7ED64fMfqQxxSpjPJjHQjwEe1
	 6JVJYv4ru6RWJrxINhdSrKf83aH8ZtaYRi0f2Jt3PvCkH9QEcVM9e88iBjggaHDJv
	 LF2TdkoHIRMcEIzke+HuhohJkYHbtCc6ah/T5ev3bJQ35MSwWpp1o7Cy6swVlN1OH
	 1LAxcsOggbdXYi84rw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.191]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0Igv-1w42GB3PZH-00xLuz; Thu, 15
 Jan 2026 18:23:16 +0100
Message-ID: <e80b0eef-4962-4135-a9ce-5f3dba6ff39d@web.de>
Date: Thu, 15 Jan 2026 18:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Felix Gu <gu_0233@qq.com>,
 Ban Feng <kcfeng0@nuvoton.com>
References: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
Subject: Re: [0/2] hwmon: Fix resource leaks for device_node
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dodcrwce3ZVxli/8Ljj0tvFyxAjuvWQ7ieJYa9m/z3Ahhi8qxzM
 GquGOeDl0gPgRBQgseckyToMtXdiwo02/aQ1mUpH4E2l2o6eoyAJL90MdLaYJ+2mwsVYp4R
 yEE2KtLI6flHr45LzsGRAUVL94+JhRpeFzBDzexYsN7TwSpFiviAFhgkoiX3ACgHHNhRYI4
 RNYOFwZDd2AXJGyAGFPGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jvV3mCINjrc=;1X3vK9a5ERJcQQpY0vKdLh8wAwc
 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

See also:
* hwmon: (emc2305) Fix a resource leak in emc2305_of_parse_pwm_child
  https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git=
/commit/?h=3Dhwmon-next&id=3D6b3a30846c23af1b36f1c1726e6ab5d6c9aa90cc

* hwmon: (nct7363) Fix a resource leak in nct7363_present_pwm_fanin
  https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git=
/commit/?h=3Dhwmon-next&id=3De59f0a584366b775e1dee39e183d8b37e6c0443d


I wonder why these commits did not get the tag =E2=80=9CFixes=E2=80=9D
together with the =E2=80=9Cstable=E2=80=9D annotation.

Regards,
Markus
