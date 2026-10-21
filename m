Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619897;
	b=Qb7FCfi+EH7foePfhxij8AQfX4o4ibgFVhCdEDJudCP5vnMs2OpmymRRPLkbsAV53gkk
	 ZojezSAhA5n+9ICbIIZu/rci/MLtUY1xRLHSy2amcU4OJmA9SgV4tZcZkMAhv6t4PgNQh
	 NAx+v0NBze6c7NhUq/MDgNg3A1cA09+gyrE+fMnAfoucfhTcUJxCXnNg2PT2i3DKKK9vp
	 PlZTlByi5mOypEA8gj6ybjwoz5a8BOIOCgIgwyCHZK3auGKDL4afRRAgicrU7W5Xwimuc
	 rSdIY7mT6sew2ndWNx9k+1qdsUT1Dx6Y/42XYcqaUycAKpaDGvCh+EGRKQRO+k9pbeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
	b=F5c728TTkd7MIW/v3D8sstq4+AvvGinj1CIBM9XtURFWODQeit7tDRUcngq6xQBMSbRh
	 cjWjel/9M1qVt1r03CWis4JquGfrMzHHQqgPAgT0MhUn3zYkMssrBVa4hZljNOXkaISLq
	 x9bcPh2PWpbetI/uW0eOjzedhfCr27XF8ppOOpSs7CIutzaa2r7GRrnmA1ptRLOSss3XP
	 LyWdKtvvxPgpPDZ6ASJJafCGwIh07QqU/EQOU5r1d7eOXU5h2QwilCUU3Sh+8sgHwSrkA
	 MC4RlU0fcAR4Nu0EOV6TIoP8gZ95oQlSK3zGNbqCd0Wq2tZ4ttRzRqb8RRNZibyTbmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Bv6yuU59;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7020606A328
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 21:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7020606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=Bv6yuU59
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so1674822eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792619896; x=1793224696; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
        b=Bv6yuU59nd+Ut2wBNrms7x2KVr3ltVHDHJ9wPLhZWuAdYIXDzPPijQUJt41to4og+R
         jhPbJQy8Bt3WMPnwCH71termvOtenXWFlVGmgYa3HgDXbvpBHQVbvetndgcqIP2boZdV
         PsMkKFLYyn+sw2JrxhPKt6lLodquLrVRsXaQZV8G/YhIlJ8YD40I7vtJ2Hz9LZTz0X5T
         vQkDNz4X9LkJUGHY3wKYLOqAxfBAbS0WP+USYsoVK//cGczx5os1MliU4u0uz+XQjk+O
         U+aYNNgj0TJvz4y/VLuEjefu+wGRUxZrZz0aaWGlQeiU3kcqXXEB5h2ZcCO/JKVLOBxr
         ss3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619896; x=1793224696;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
        b=mntgwCiEH1fLhfxx1xUd6bAC+9dHboFjh3awZCYT6ryWi5wx3Tvd44mHAsFCsSjS4c
         n4b8a7ULGMVwnYpnbttGkwSv0mqJmxbJAsvV+vlTY1aOCi3Oi0clbE9aPecM4dz0DckJ
         4zaYQ6M39zBT++desQ4r4frP/kQ9vZ/cyY8t4JXKldUnUWSp4vY7KrVjfaf+HObSGjJL
         FEUa+cAOchlWC5XOp2da3HLaagwcN4ySMKQpJg7B0F0xYXizQsiO48u4FjCNZ3S/4vEo
         3smy/1YfyxoidIhK2Ww45QXcRvYE5tol4J/oaspAGKkRIVeHsRAeXQ447DOoUDG8dpEl
         ZDfw==
X-Forwarded-Encrypted: i=1; AKwUvBwa6RrcT/NrHZOU6siQuF4v7fda3nysqRBB3fgnzr33l+vZUchn+JZkBIvb0c9KMc54kFiPWzHoTIDopA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK2vublleU0vAtmYx3H0ndWlENyMuZXCSwlmBUxGQWHloK5K8s0
	C6kEom5aGHROTjFGDZmMj8l4MkSVGKRecnILo1WJ9OWtF3iJgEp+03el9D8kD/cWgk4=
X-Gm-Gg: AYBFou3jslKOE9W/e5cZUQ7hpNwjFsMD3oERBFmr1JT0aKlnvSlSuEUXzGtLKa0FDPf
	Vx/4/GDEjDb+Rw8Jh3kkEZG7g4JE6jcdLSXtLHUISun2WbJfQ1wfzk8aTxPqRcA8dMBw6B+W2/2
	ZJrFf4M/QAvk1LD8fUuFXMcbc1OlN0YGAA67KrSNfNmcTl7A92cjQmcsF137JTI7/v0tmFa7vRh
	v3fSGbuCf8e5kB0N6QH4NgQy7AICn7l6qiGT61OyMDdVCmjKesn+od1YSdWbJ2ntYMXlR8bf+Nj
	bgJ4orMFDJ7wtVH5SgWLqmS5Xm7dMPI+R7Hy5Jh5w4A+rB5aZbuBEx+c31N7x2YqQ1KHaSQymCm
	SC0smJI0RHFv/mydkfdJ27nyTeono5ODHwwhs+5Jp+Qx1WOCZLyeoo18x/QnS5TAF+zFT27BISh
	8NNIiwn8F65LkCYOcEbpLuGUhwqqco8m9rmEjs3n7ubDWDdemWZs8jJvPVSuLjNGpycj3bjno8H
	WdtBuPN9FgRdDpZm8aeG7Ed1ZdLycR7wK8cEJ6rdJp6tlakghbMQqeN
X-Received: by 2002:a05:701b:4283:10b0:15f:28e1:7c7d with SMTP id a92af1059eb24-190a86ade90mr4009050c88.42.1792619895746;
        Wed, 21 Oct 2026 14:58:15 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm8941979c88.14.2026.10.21.14.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:58:15 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 14:58:14 -0700
Message-Id: <DMAUPUPEBZ7W.DB96YQGOYZAI@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <guenter@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Guenter Roeck" <linux@roeck-us.net>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
 <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
 <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>
In-Reply-To: <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>

On Wed Oct 21, 2026 at 2:41 PM PDT, Guenter Roeck wrote:
> On 10/21/26 13:04, Abdurrahman Hussain wrote:
>> On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
>>> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>>>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>>>> Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
>>>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set=
_voltage()
>>>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling i=
n regulator ops
>>>>> --
>>>> Good that I did not just apply this patch. Do you have time to look in=
to
>>>> those issues and fix them ?
>>>>
>>> Looking into it,
>>>
>>> Thanks,
>>> Abdurrahman
>> Addressed all sashiko comments in v4.
>>
> Yes, series looks good. I'll have to wait for the commit window to close =
before applying it.
>
> Thanks,
>
> Guenter

Thank You!
Abdurrahman


