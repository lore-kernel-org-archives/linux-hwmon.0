Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792522721;
	b=pDWoctF5rjVZGW5E3RMKTaPWlhtzwFuJVAFkWEwOlw+B5huYgzebb4ZwZASis4eVp/bJ
	 kHrPU6J3evQqx+1KGdUAAvfXjNeVXq93CtGZHkdvr3oY3YDZw3xQv+LMnYflbQZkzY1hn
	 YuXAUPkPmEV/qlxCIHAw659CazJY06E2D5f1RyU6PovtUHX9S+qD2i61Ds5Sn8zN4uDD8
	 hzrcTDIgDLiSZ1j/TRDIIFFGV4tB523y2nRqwcxSTRwyVb7m5XTU4DzPMoXUT9+HESM38
	 +kzUpmzjgkEuiu4Mw8avNIMBWWdNv43CIOUCOUF9Zi+Lr1wgzIjVa011/ut9MjySr0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792522721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
	b=WyxKBx8COPgEpZRkvbE+EIGe0d2OHuk+SYVHxkcIdAlaS31asBkMU8hH1gBjbsIpIvD7
	 COqWtm85wl2eqDZVYrFDk17FNVghrs3m5XzusxqaWJrYePq3qh76tM12cd1hyZUJ1SmvH
	 8yXR1Bjgk02SWkkGG779eSLCALjMHg5dD3ELtKUe0RmB2O3g9kK8EP++TWjGq0QvRwMob
	 yYFEYXGzbOnvOjXzpLeCGiJ6XgXAjImYrR6BATHXveMXmJgGvV++imdubJqfp4pMjSc9m
	 iBTraHcRSV0Eg68gXOTb1Pv2n1tzhxwkrIc+4MiiUBRGR8D9NaXaoH6SefgTHbOqJDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=c25yAxJX;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D4606A319
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 18:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 457D4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=c25yAxJX
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so1568557eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 11:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792522720; x=1793127520; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
        b=c25yAxJXnLGbZbe0H/IIYhi4952TrJ5/lFAnKapG+ZYVl2WYsfqGDERXe6GOYk+OKd
         LMpTqEtOJiZ26u4BS8SMfrqcpCZg51KHNo5gxleGWgg/p/ZfO8qTMDlAPnAuV6CZJrlG
         iTX65EIpY+srQNZp+/5rvEjJxVj63mCPTus3AryQS3FbqHpyp0qImaYyFyjLQRQGHEY2
         6BwnC5t8vNPtJfN6wbhOP3mpfciYF+esIex/lejtyMtMPqyx9SwdaY4IN94QNZGY8NUz
         NIQDrJJ5P9CssQTgfAqVXqerPmtiudz54SPXzhMf8WqIYi1RDUVKOoLNvTHjvEeUZuVM
         5dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522720; x=1793127520;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mawDnWzs4fnqEe3LjDzISKgGdBwKvLiWqFhvrvd71LE=;
        b=JnOT/MpJylpfeXdtAVsit8vdPS6ui3ak2RGkqkHa83doAsOS9YYj4JW5iL2mH/68+0
         XgngtaBGBj7MY6zbteD5mjFQ7XJTZppU1HiYHuyx7d0qvxqMFkg/0EaPmfAZg1VjzgKX
         n6ZAb1vNt6NHMXGuTwNkf7nKNXaI1t6+GZliUu7R/yaB/vjb7Gt5IcPloACDNvObPazB
         Hb06PRqrnk2StuLKcrHH8sSI83HDw+H29WNytCtbuiF4xteFvbnUNiUkpapCayKConbU
         78+yLELbtVwkJMeYqkx9NYMge08zAqo6aFv3yEv2/Lllb3OxH8zkvjGVGPjjJiOkuO5J
         MK3g==
X-Forwarded-Encrypted: i=1; AKwUvBwaQdNjeWifXGIPOS9tiE1Spvaq5vbZ3qRNp+RQO7+zfWnBcuTK8Ln51bdOUPqA0uuVl192dOLPBDTr3w==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4u2qOa6FECM5MLRGTbEfU+NyxYl9poNrGNfY63Go1G5Men5hj
	p3s/GlgaQhQDLtiVamPChrzn3XYI8EB1D7UEveSKIkIH0ABKaAf8PnlVxhhH6ad2hOg=
X-Gm-Gg: AYBFou3D3Z0uoxLaFnfyfveFVyO5HiZhmvXUa2Eraz3JBzmrcM/UJxoWE8oCTnoeLmN
	Al94VWYpMpBcKFf2Q1D1/T0AmccetU7GacP2K3o6KsCKtaOG71Pie9tonpBgko3qb54wU7KLyh7
	hA7ekLIY2w5VgA+Bgjq6A4q/G3p6Ba1BGfu01TGwT/v4O4xUjrpc+CDTBMNmO0PW/DYm0DCJ49f
	MyMmCwJgDoUeOKwDx4plxebvtxgz1lp3Pqh/uB+TG5yKvZzA5rmvgtenJdDQ4fmqtWdtcpQIOne
	S6LPmeJZgIs4y6vsvfLYLndwuh9HwMeiJ5q12DI1Tm7EV4haukfzgKJNJoxoufNDFdvBCYuIoSC
	iuQxB/gr1TtrqRxJkMkJKcNQCfkaoTvhVkscM4LLdtlG8geT62w+h2fx2DTxzuRPCLLl/zqgTrh
	PmQYQ46SZX9W9v3om6nCyvf5vUhik3Dxcr6s8cOcNN/fK9vGC5RCRTf+noDnaFsk4KEYUneKQ=
X-Received: by 2002:a05:7300:4627:b0:35e:da0a:75b0 with SMTP id 5a478bee46e88-3674e164a78mr171066eec.25.1792522720294;
        Tue, 20 Oct 2026 11:58:40 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm454400eec.21.2026.10.20.11.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 11:58:39 -0700 (PDT)
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
Date: Tue, 20 Oct 2026 11:58:39 -0700
Message-Id: <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>,
 "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
In-Reply-To: <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>

On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_vo=
ltage()
>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in r=
egulator ops
>> --
>
> Good that I did not just apply this patch. Do you have time to look into
> those issues and fix them ?
>

Looking into it,

Thanks,
Abdurrahman
