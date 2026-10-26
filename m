Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025614;
	b=QhHbskitcTdoza1xSpYMTgreDaOkEqi/cXmyc0F+3Hvzj55n8AIp8+DnoAcy3MTO63uz
	 ggMIkaLJNeqSb9NbM2aVeNHgxU58gb/OTvgquTnbpvn9b+u6zp4T2+FOcQZAvNZMu0dQr
	 PAXFuHRrP/kTacUsS3V/aL26CcrbRdqmEzqyTd9Y+4J4PPfo/+rs23xahUStXuqWFrTpN
	 9R1xb2rW1i/S/WgZT6O80GvO0dJSP75+iAicZQ+BjtI1f61h7ZWEG9oMY93ZLUVs6IO1m
	 VqXGvVaGnGsV4Ft9kBl0M7Nqt8gdzqc9eEiwHvpw1er5etLlCzgEcxu/zzCfjplbxtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
	b=3cWLfutLBAAg90Fp68oRfw4EvFpUJT/zt3PKvJIFnuCX8aJ5cJrwsbPNoc3rwI7wmV1m
	 1jGrYeqBe6ceb34ard9+0XLO65iBT6Ya0SMnhfRl/wfWY0cXn/GT/vFiVL9LIKerqJddP
	 8K60Utrl65Q8Gd0QcShcJj8F9uhgJrkwVNUEF2ddw4bjJ605ABDWSaVp8Y+YADw4VaWr6
	 TbRZ1RXy8iciCAxfqEZ3mdPn1KzlvEn6RzHUZD4hptP07ybzGsX8gQcburlvHoakdGWvo
	 W8P31Rjxb4Lbz8cVqJkQZuLzQrVpIEKlQsIBvQfnO1os9Jo820A5DtiwG8RupW48IiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AnBU3FC/";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECAB606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 14:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EECAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AnBU3FC/
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae391a05so21508045ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025613; x=1793630413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
        b=AnBU3FC/k9/7NJPQaCbz+jpM4h9DbPEzea+pAhsWWMEqU7at8UDWkFlWrJGLeXEFIe
         jEJ3nTIQghMOvFuiH34NiTVKliL6GYYD6lB71lOYvesKdRjuTv/cd9RpIr4DXvxfCbcz
         e/IIdiBdO4cyN3u0Gohp/avUemciBsVq3s28wWFWjTJ7xtqO5OKf6sTdHYxIvFO2jdtg
         nqWdCRAX89Ll74HR+pGAgGrnepeIqx5rMuc/rf9PM2A5X0RScXPrHvJbe8quGTHaHxYH
         A51ep3anRYIWMswa81ank8FGaaE42stZW63XTaOCqCWBnQFvHNlQNx1RyvP/DyvFM/a1
         Qa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025613; x=1793630413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJx6Jk3q7Zj0vUF24ySNqADHQgrgfTJxl3ukIMikbSg=;
        b=RzVHkpprS2bdYUkhVYI9DBs6jt8kSsBayaSrWLAUL2dgn0JLUTp+ROFBFSetzZQ+b9
         AwJCVdNQGF32WhYPryYhyKE26t6ZGIXOMKT6L/U0tDwgVKCB719XBtZWB7MVt5YqWpUN
         OzxgkPNP1yc0T1Rw5JA2/g6Z6wKr1JIJxvcfzRwIPjY9j7xw9PFA1keuMaDgHpE1rM1A
         1YpbwVcejMcqQ4mAJSCMwdve+o7a6EZktNBtyxswaV6mpwaWrpOCPRLtxuBy1DVIC4Kj
         idVJ/FsWo8C59UDTBYd7S0bAuEZvKBUAINC1vPxuu35XU4UDCRUb1El7DQkuaTb4Kme7
         RFLw==
X-Forwarded-Encrypted: i=1; AKwUvBzq5lBqSuPKXjuENQcXqCf/CesU9uZCdTTTp3h6ZmBLl4+qlJqoVUktc8g/yXfiXz/zRk/EtLaiHPkzfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLaf8Jkf5weKWKOYbd8ybsKPFs4EgThnM15AjocTyHkD9ittHM3
	V6FYfWvgYlv7DIotS3lrNKFJiglDwR/N+FhEQ6AhZyvVfXMZQLkwjlyP
X-Gm-Gg: AYBFou3eoUFJE1vB2h9PFcdCUAMJpdrFxUZZHFtJ1Kmwhw9/2+/ATUBuXCHTQdDNhYi
	lIre40utWjxTbVrztm4AXtYW5QKg6tAKNfjQaSI7yaYjJhweAzKbbHmo2a6x422NypfTf1hfJzo
	cPUjEz0zH2awvFDI2Dx18bAWVoc3q8sZbH47dNYTEEQlm829LjSivNEIb8SAOD3e955zZ/qAiy2
	wt+LgLP2K7lZCLAnraG6WN7QKomNLMlQ9hiQQ7JdH1UE1w/zd+AtO3q1qC+SaNa+e/P3FAOQyG1
	WkF/91so8hQqTgFZyU0y9rrBKx56uwbjNNCxDlur/AH1P/hplDmEOAcFctLnnUBqRP0R68LRvK/
	cAlhsHQS94evdTdOX/Pv1L+JZh5Lqmd40fVdXZQQGvIn+CbowaIUPj7EY/Zk/y+LrLw8Fv/VUzZ
	uFnvh8TNSid1lBJdTseEhVJY6CNy2gT7RGqruHpLxLMQriZmhkClpUzQUgObwCSCDfpnWC1ft3N
	Byi9IQwZkDZOeaiAsoZppmLumzbvILrrWtcIhPxsPdGiZfJbp+86fiHcRqGD5ITotKmXw==
X-Received: by 2002:a17:903:3204:b0:2df:b004:df28 with SMTP id d9443c01a7336-2ea9cc685bcmr40841475ad.35.1793025613080;
        Mon, 26 Oct 2026 07:40:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b121651sm18814625ad.18.2026.10.26.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:40:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 07:40:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Message-ID: <3a279e6f-5c51-4786-a322-2c56667faff2@roeck-us.net>
References: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>

On Thu, Oct 01, 2026 at 11:58:14PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Since commit 032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER") the
> driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for its temperature channel and the
> device can be referenced as a thermal sensor.
> 
> The chip has a single temperature channel, registered as sensor 0, so
> no cell is needed.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied, and queued for v7.5.

Guenter
