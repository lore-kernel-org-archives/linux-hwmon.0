Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792613080;
	b=KELcgIg1VxLMxi7eN/IaFwWV+VNZhAvrCXAxjBV06KrZoSmpN2XC8vFkbC+JmVZx992v
	 ikXSVQ6KDjleaENb03hm3bWsMzPSn0Qws2z7oTX/ki6oAkckuk8sdpH603wvQbxayG2NN
	 MvcrY6UnF6Za+hLNABR1ZouXPDOYl3XOeNl4M4Hb+tvZYt4psDjq8R0kU4wQEqzTs+VPl
	 mshygtWJWM2n+mk4yJxZvOAhbBWgMtEWI0yXIIF6M+TgbP7wX1akm1Y0VUPzx6EX+pptj
	 YqHQ3rbV98El8i+fBbv5lfownUUiS5idOTlAQnfiGYTfqJtAXsFdR6GTo+tZSPqWrPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792613080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:Mime-Version:
	 Content-Transfer-Encoding:X-Mailer:References:In-Reply-To;
	bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
	b=vVZc/t3OJtTPjyZ5ccqykqofBq9uvj3BpYIezB3E2mOmPDckxhWz1nMqy8W+5l8F9Q1K
	 U6JYwxhItGoCYKzbvqzYzQtJwPfBndEcY6Aequxd7xbnued9Ll9LYoXrsjIiIhefEHbSM
	 n5Mh/tSdWUEMuegyMV4Jxg+rvuMrMF7i6OaYWW7sURHY63TxkgnRUOT/m9BJBvDgIwPWj
	 tKrbxfxK/sGUdxq8UzOyRVdZ5l2T7AL4pWL55nZeJ6aEVDmCkjrE5TAPVzSJsj/IRGREm
	 MRsuoeXiM82oj7mNlJDpwWwp9JP5HtGGUQk6ioS5VtRyRPMWM3R/jema+UvgZZyMYbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JAW4VnXH;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14991606A322
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 20:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14991606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JAW4VnXH
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so2138188eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 13:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792613079; x=1793217879; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
        b=JAW4VnXHkBtVnCvV8amF5BuEGUgtPcES+Q4STI3sixNMY6bHHx/ByD7IeV2pe/YaQU
         FbxPlYzVrqngyBqiK9m+Ix3aCCancLJSBNp2JDRUb0yiHk38u3dAhnh5kO4wMV2pzt/2
         31Mati6Y3BbkrFNMO33S7VA8h9BvPQ3dYOEKw5A0gj/JK4sDK+YlfQ9EAHI77SKZy/KA
         lUn44EyAJlITyqm2wvCfHEcSwYQ3d4Is/V0cNobM+UQHrdURpyi0eZcGauSP3yBctOU8
         Tmwd0Wr30n8cGvWc/N9ZMVI/JdNBOQxfCFGJVfl4qV6cVOcV5btTe5EX5rFnRdGj0Op7
         TF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792613079; x=1793217879;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxuzt3tx2zzrVlPN9LeqR2EJEXH3nO1HmXie8iUqGdY=;
        b=C+V9wDmcOU43GYt7tzqf4swmuQMZv97Np/oxLldZAvwVuH5vK9JeUQ2kBJ63v7RSJP
         vb2p6Cnx836AQrEQZvO9gcROfJSbK/rsB0wnBQRM8XjxxLS3WjKxXLJimCdsnjtfeUDa
         Sd+lKJekBHLOUlZMBqyPJYEh7w26XJTS3/nSyixKLbYO+qj6nOFlZwJhxzsgLSzdc69r
         TTMPDZ4u26gQgu0RgXwzT9zrAnO0T60nZLqjQk1+6Z5Rk8QTbbH+xq48yCGlWNJ6khwA
         TOAsMSr3PA+U7we8lyZ/AAs221mjluHA/1+tLQaGFl5OWfcp3ha3bGDMsT9K/w/oPDpo
         u7/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwti95Yqx5H1NKje9KZhRDrjfrJ1sRvdb1gIubYrLY+rxgoiubDuBBMPTMlSUtHS6bHW+EwT5ttVi9Nbg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIL+hgQbJ+t57LQ86aYPQUvSnT4FjkqcHY5vYHJjh38xBt20IPC
	cPlPJ2lwUbAxDP2x6GDPip2VjFikR5ZxaToZJC3EZi9cq3E4/9hISRV/ZwweMjvyig9dKQFZzAl
	lhZkDslE=
X-Gm-Gg: AYBFou2XNma2Pm8eZJi31v1vHpfJMTqIG44hVWHfkq95wTo/Jd3E6xD1xNd8qiML4xl
	qZ3ecT0qh8p8q1khJVxCrvJzlhP7vfySyIyNXcR+UePBLGzVMjH7OJJ3JvcyB7D0huQEzGyt9v+
	AfJ7eSZddGgE3gNvbY0qbKI4atpYbMSIBkM0H3FFJYvCDJSYFH3RO1MufT4rhROgsTKkpi/j93G
	fzgcyNg770zEje18fMaNNhP+oc47a32Mpv0N8bN0p4rz6KJQVb14lc172riCKyzJbyR+1NQnGIX
	WckRXY2zBk1D3HtK7DiaSSmAm1VkL0TO3IOxQXj7geU65ovqPHMvsnmhTyuTgzw1qGTmZSnD0NU
	OapI/VhDXu6XgrYvVAF5NfoNUMSsZnl9iyPT1thX9LpdDFKRqww/JjqmO4Ici2tfa3cSlt1THec
	L2ueuSDEzRJ3AkQUeyX61mXa3MblycFEzEz5FENoMnhmHyQ/BPX/XqkHjp+YlXf3XKNCAkhemc0
	doxEpqIseP6L0zifyad8TLR6a8WoFBMoTPz1DgXcz0p/qS4qcAi+uQ2
X-Received: by 2002:a05:701b:290b:b0:14a:8df8:56b1 with SMTP id a92af1059eb24-1933bb42675mr16108c88.22.1792613078967;
        Wed, 21 Oct 2026 13:04:38 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm8694937c88.15.2026.10.21.13.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 13:04:38 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 13:04:37 -0700
Message-Id: <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>, "Guenter Roeck"
 <linux@roeck-us.net>, <sashiko-reviews@lists.linux.dev>
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
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
In-Reply-To: <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>

On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_v=
oltage()
>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in =
regulator ops
>>> --
>>
>> Good that I did not just apply this patch. Do you have time to look into
>> those issues and fix them ?
>>
>
> Looking into it,
>
> Thanks,
> Abdurrahman

Addressed all sashiko comments in v4.

Thanks,
Abdurrahman
