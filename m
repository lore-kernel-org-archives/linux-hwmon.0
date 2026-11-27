Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756462;
	b=1PfoC5AeUz1QrvBLK36CcoA/xyPlyaK5oyMig4NZc46KAHsy22Jtwx9TftdSRJPSEeXg
	 oKlKAoJhn2WMiH34QiAYa1kHPNT2vfC9MnFuZtXRNz3BHIu7CNEmUVlgPcPiU7y/p3cnF
	 X/p/kTQK1r9BWJoahnOkd83v/gZxkhY+4vQ1OqSQ3YUsQ4THaUxn+r/UhFfkJL+eAQZly
	 NhPrM9/uKvwnpaEVgmkdPS2E7/Dpl6EsCaf6xkwL7B8HFk0MoWYndItqpnhL+XENQJ0rq
	 NPGDNeGlb4fIBRWgZtIqy4VYagth/MjGB5dL8bZy8WUV/LUGexeLOLE6DjSXD42Lo8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qzV5IimzsJbOvJ6sW4aUy5Eksg3lYZKwTkqSBUgFwOg=;
	b=nbGCBIOYJZaZwuDudjHVhINCLYXCSt84H+0ktqn6UuZ+mwOBbtW+yNjCUJGahuTZZWHE
	 EKt0fT9lznlzR6tjgf3MqbIkXzcu88KsyjWbnksj/a2Sw72aoWd16UxyywkcM3DH5VKyV
	 YImZF/unCcJS5HT2PWvxgOrJjw6j90ku6IYBTs3Es1qBNBV2YFijyxevM26trNcklnaBT
	 d4Z6zlWu4RklPGcl412ECN+k8h4XvVZNSfikx2afWpZFmif8QC1RcIgkj70HmozX/wXLQ
	 xmWQAU7DEnxoPhIbO3yJheQrW+Oytu5NQ6Lk0sMrvxojf9RmDfmBXxVy3+IlKrtwgwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRlvPmNd;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5A606A32F
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 05:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B5A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRlvPmNd
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb61185057so49259255e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 21:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756461; x=1796361261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzV5IimzsJbOvJ6sW4aUy5Eksg3lYZKwTkqSBUgFwOg=;
        b=QRlvPmNdghIl4U7Rz1BHAHhkt0zKYanW0QPXUPIwUseORSCsqW522IrEAKTIxHKDGU
         +C8phOjyC6nAl6NebLAZqP/e+VkriS/8B8T2rj7KHrstoNWAXsVwP5Hte8OXU3xdi8eK
         pXQawKrsTxKVCNs0lKePbgFksNvRThrrV/bFA0RvtgZSmpTX6Ibb31y9R1zuD/OaOQuF
         UQHkDnoEA0Xlo9AXibFS4vDkcmxPFWlSOSNPizU35NL5aj8EZVYgw7n+VvuFepgiDLBk
         vHIAjzCC+oJA7A18TROLqQPNVGSocy6lHHpbqV53lpffT+460/EGdYPcdiTFOfE5OZcM
         pTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756461; x=1796361261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzV5IimzsJbOvJ6sW4aUy5Eksg3lYZKwTkqSBUgFwOg=;
        b=dghOGGiAqqL2XADSWvYycZd9iAB2Lup0iIMjyA5uoKynl6cSfE47zlyld5kGS6spIk
         3TVlz6rq2m7YHRrJEuui1lgz6+tIg4vUJ23siFMDVCmGUochT9rVMaGmKJ/WCMvIVsfE
         YMiuAnL8j4LrUIq0OxwU6jeEDdcQm1or1jWYSX5TqioUZIsdSvmSoCCdD1fnTb47ZQop
         zjRJ5mKcfY+8ndyFeRkwc+JhlRo3XAGlls63ZAPn1p9BqTozV5ZBlOTz7oODoSfi+4px
         FDaetbaeSFn9eXD9YzuHT9qJlwDdbhB+i8LzkkVixekGfViVKj3zYLEM202gg8LVuJmN
         IAXw==
X-Gm-Message-State: APuU4Z86T6qXw2NM4Q1rMtDmJjGkKn0hbj0/FfMRI0CxA042oggJ62VJ
	fpP+YUOpL9LM7XCq+GeoYH38Ec1mx+DqLIATRTFS4Oggb9PfRQNNdsiO
X-Gm-Gg: AZFdTZfIZE5NNjLi4zAqbuSrvT51U9FLWzN0W2jqnK43O0IVt/RXfKd9mkJK0oGRMiA
	jwLQJdMfeE3gJttnPowLwxvg+f/T6p0R9KC8cCFii4DBMwNNLSEy5PYkb4jbZjM6GLp58QNNdeU
	CRzzmHuCNmj+xTRbD//74xr0CoEcVFgdLR0b/9U7dotrXqhhmZ3do77qQz+SJOeb2SmN/Ol1znN
	6vQ5wyipl2ZZ5+f738all4f+iX76X2ggnoZwiFriIgHn0vmPDZa2UJ38VZuiVOFx1DOjPha1QuS
	PYitV1hv/Y9HyU1O51v5U4NPVrP5xOiibME6KnF+r2as7YqmibTCLJaMfnhGjnsqoE3zLVkDYWD
	Ui7+W/nFFQNophJr22WvOpQK99VumwxY+ZUC707ecmUCHZjEKR2AfafjjIBYeGp7cAl4fZuPmLt
	ghtuyuqVy2l9O5xm3wi2MjtdCH9KxvPADVNr001n/1lunLvrvwRC5W7iuhP17bea2c61b4tcIQK
	a8zrrA2Bnm00WXX1eG8F3Ud4tg2XCuIbBK0spUcqqcFYMY3LzHyHxvgEcKeavTCGSSbHL8ff0+i
	DaRXGmLR+6xQnF7aA//8HdGbuyMO9zfl3zN6kK26twX+96ZK20AoC13ZMHm8+Gz3EoCBZBv2r46
	DHH0pcatx+TZJgpcdWwNO6T1ANQSKwNwUtFC2zPWOq3Bn5wKBhoyE54mWDd5VqgN5KL32vhFqtC
	14oDKzPXe4O9bCV/I4F0WXQmR/o3hoAT4+Po/DhF+wARUGdKIWS7n8hco06hdZ0+Tw
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb88828304mr481591525e9.34.1795756460683;
        Thu, 26 Nov 2026 21:14:20 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm636515015e9.15.2026.11.26.21.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:14:20 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Navon John Lukose <navonjohnlukose@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Date: Fri, 27 Nov 2026 06:14:19 +0100
Message-ID: <20261127051419.479659-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b672573a-f0ac-4ad8-9be8-6f3a554ddd98@roeck-us.net>
References: <b672573a-f0ac-4ad8-9be8-6f3a554ddd98@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter, Navon,

Apologies for the silence over the last few months -- I had to step away
due to a family illness, and I am truly sorry Navon had to track down and
submit this fix on his own in the meantime.

Thank you both for taking care of it.

Acked-by: Sergio Melas <sergiomelas@gmail.com>

Best regards,
Sergio
