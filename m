Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A5631352A
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Sep 2025 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034520; cv=none; b=tbD+/ykZrhjZQrEEa7yTT368VoQBjPIpE4mPdQneMt4yG2by5MoqUzD4mlmqqnfuSMFinsto9auMfK1LCH8FhpbT8i/lb6vlL8Euz8Kvz5jW/G7W7yVyOZZRJT99W7OPdCfvC4X69FKfC060UNcx4IX3fzZrSxg3gqowhBziLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034520; c=relaxed/simple;
	bh=tm0kA5/U/7lPdDiVcC4zEEqOIVnKxf9PeM+eT4gS4pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/3viGc3TSIv77H48Hk0JCPbLeerozqblccfPmwRWkB+C3v5NQ0GUI+QFg7XUYgbYFthh76rfjCJDTS2MPnpb6v0EcC1vTOlQKgXlE0nR1XCQ3weuIt5cx0lRhJZtNSiTNMkUWbJeyOr5aEdioNrH/NM8SXvffcK4jzN8X9Stxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=obZ4N0j+; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="obZ4N0j+"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-33158d9dfc6so2382629fac.3
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Sep 2025 07:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758034515; x=1758639315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5iIq7+KHCywK04RSDS9es8l3U4mIawqQHyrRZJkTg8=;
        b=obZ4N0j+eWHDyjwoNB8DM51ouON16EJd6CsPNyA1WIjfhnr1hkFuHxYKr7caIYqFzc
         w5MQvEudlutDfIHU0rk1jWT++LF7ynasoY4mJmEfy9k+zL0O2DkKCGgTHetyU92BzJK+
         zAqcPMC8pP8PQhzpEWq7koMrjpECa+KRpDtPrGXhInFDdBgDR8jQ1VdNEADeroeMRXb1
         0e2aL2sanjC4hHaTLGvXWUHJl8KHv77n30R9XXGVgNzGqciGBPPHpyfI0VZR0dhUu+aB
         uN77UjvJPFd+ZTWNN9P1ue23IB7ldgGpdciSlR3H1Eu06fsc/Ep1wahJKTC75yrhfO9r
         YdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034515; x=1758639315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D5iIq7+KHCywK04RSDS9es8l3U4mIawqQHyrRZJkTg8=;
        b=Xx9gBCBeKCJ93LwwOJ3Opz3DDOgKVYYGg3NpcMDjpj1+HTE49mZ3+p8TAqL7Hd2O1Y
         M8Somz+9L1oR7GOV5CEbSSBBkps8vwCHULUagMS2s8uuHSvcFQrolqxXam8SqynZiyTT
         TJ+Gz3hTMY70gkd6pX+nvVX3m7mMS870ZlpvC/GY+Pb8PxacDlGhjU7nIxd4VqB0f7M/
         mjyb89RKsd1DPkunX0VSW92kBjf+sik3YYLJWgmYJjAH9k/g0+1IM6lWPX2PKoUOSvEh
         pURSuTFg9RS8aze59etToch5fo+WEMLcsvK2ZI9X+/yRkcJZqx0UzzIWCNL0jZZEHw1c
         7AIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvQ1872Ez8ezKYBKEfpcX7xktEt1hmd8SYZpFoeZCv11J35uto8Xuta1p6rOizJeCjMuOleWBaKM+BQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLh4biNYu17B3SfSNlQSkloz2E4J9UknVdS9g+o8KyHMQjZSxF
	431fSoc6eYrj/MlZlOy0ZGfWBGopf1RzCUpfFSo11IzULM5Jo0E7qico9xfUaWlUm/0=
X-Gm-Gg: ASbGncuZGAM1yuTO7O8MEEtZH6zDRxEiSiCTaO4PSdQWAbEtu2wljNNdlKjPEeNoDh1
	63aXINeRwM8AfplMshqVhkk3+rdylEN3rn0CeHXzmUbFdZM8mCvsQNZpb+5GL98T0UNn1b9o2Oi
	FK+JBGur912upGjG7PrhT5l+G3BNzeahDhB1OV1y0HiE+Kd9iSRYvABl8uH+SsloNqB/Nk5XFK6
	Doa4w+DuD0Jg+vuRpPqekSlM9CMIEKFUleXg81wxUaLA3uhhkA5s+F1qf6goMl+077sUrb38nKb
	ZUD+IyHOFbkrGqPwkd3I9dUOMBNvJzbFMVdrSeIBlozxG/9HtXFJhVZ8dDLYjaB/rl6iB3Mpam1
	/MDD8BRrDyIEpDFt1+2D+D/IRyxQJWpPypgya4MzDzZH3Cwf97SAuPYU1R6JthSl7eDH75XxbXE
	A=
X-Google-Smtp-Source: AGHT+IG2j6o5ZiECUky0T/Yvf86ZO9qsIYrDXwjsYiIUbY9fkQXrpUngcoYlXLsDg0lSeAlhfx8Log==
X-Received: by 2002:a05:6870:de12:b0:31d:6e43:8d3a with SMTP id 586e51a60fabf-32e54e80af9mr7157585fac.18.1758034515240;
        Tue, 16 Sep 2025 07:55:15 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:70a1:e065:6248:ef8b? ([2600:8803:e7e4:1d00:70a1:e065:6248:ef8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-33204689b2fsm2368205fac.6.2025.09.16.07.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 07:55:14 -0700 (PDT)
Message-ID: <711b5e34-3534-440c-8914-ddb41987ee8d@baylibre.com>
Date: Tue, 16 Sep 2025 09:55:13 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] include: linux: move adi-axi-common.h out of fpga
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1_via_B4_Relay?=
 <devnull+nuno.sa.analog.com@kernel.org>, dmaengine@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, nuno.sa@analog.com,
 Michael Turquette <mturquette@baylibre.com>, Moritz Fischer
 <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>,
 Xu Yilun <yilun.xu@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250519-dev-axi-clkgen-limits-v6-0-bc4b3b61d1d4@analog.com>
 <20250519-dev-axi-clkgen-limits-v6-3-bc4b3b61d1d4@analog.com>
 <175133153648.4372.1727886846407026331@lazor>
 <202509161304166bf210e2@mail.local>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <202509161304166bf210e2@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/25 8:04 AM, Alexandre Belloni wrote:
> Hi Stephen,
> 
> On 30/06/2025 17:58:56-0700, Stephen Boyd wrote:
>> Quoting Nuno Sá via B4 Relay (2025-05-19 08:41:08)
>>> From: Nuno Sá <nuno.sa@analog.com>
>>>
>>> The adi-axi-common.h header has some common defines used in various ADI
>>> IPs. However they are not specific for any fpga manager so it's
>>> questionable for the header to live under include/linux/fpga. Hence
>>> let's just move one directory up and update all users.
>>>
>>> Suggested-by: Xu Yilun <yilun.xu@linux.intel.com>
>>> Acked-by: Xu Yilun <yilun.xu@intel.com>
>>> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # for IIO
>>> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
>>> ---
>>
>> Applied to clk-next
> 
> Do you mind providing an immutable branch for this as my i3c tree is
> introducing a new driver using this header and so it is going to depend
> on your branch.
> 
> Thanks!
> 

This was merged into mainline in v6.17-rc1, so I don't think we should
need an immutable branch at this point.

If you are modifying the include/linux/adi-axi-common.h file in the I3C
tree, FYI there are some changes in the SPI tree that just got applied [1].
But if you just need the header in the new location, it should already
be there since v6.17-rc1.


[1]: https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/commit/?id=67a529b7d3c50a56c162476509361f4fe11350dd

