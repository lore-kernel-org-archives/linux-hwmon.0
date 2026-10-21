Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618920;
	b=MZokmP4HQ96FmbbHL/Ru2vguRvS/kTv4cVlHSaltmVlE8oBKd/qFLNUXFCUaQanq58qT
	 swjiPeRIyY/Tl7JnZpxQ04y/KWqdkrH69bt1XQnMSeSvaz072mzEtEVHZO4nFK6hmqSuk
	 ieTTM6fF57cpPIfZ0nYgQ4dY0VFYHnMnj3lC9bKszlD/vNOElALpszcE8xaILYdqRgfq/
	 sMNm6mI8EkdGd9QNY+7VbQUqyrHtq2EpLlPY4gV7i72guBcglHhS+6B7z437HIUyH3GgO
	 YVpnm9RCJ6ome1hneK5ucK8wfPY2W5UWe2rxmZ5RI0XynxwzAlbrxOh8lw6QM9hQiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
	b=lfrOSOliPeJZDcSAZQnQaY5WcIovDCDH6MAz+Y0mcTeSP2YIlbSWTp1SULYc5abfHTab
	 DrDMLcv609rGB+92Wet3HKn0Y6D0GTWIl9FVFhiYlVbAa5XZtO3Qnk5wcDWrGnsayQlqI
	 MImbsUAvfAw1BYoOAynvu43T1IzSbT/9E8fxYhA3EnzmcH7TCIgWb4tdTCYqczJFYtig2
	 iMrTxDPypYVnKODBD6BYnqZ01HhwVvdy8F3Qlrvej7ozu/SEC9wkqOl9UzQA5drKjnwk6
	 D9HlmTHOgKyuDGLpCE8baGdVebUCCa6JXrN7nYxJEBvTuYM7vqA+Dk/ZioFSUkItcjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=APWtFxd6;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124B5606A323
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 21:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=APWtFxd6
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35943f55c06so370242eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 14:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618919; x=1793223719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
        b=APWtFxd6tsDHcsvtGIEJLxjzQrjUDtB/TGBRRdI9SCU1Vf9Cv0ho6bdDochbsJsFJa
         6YfvMf8A/nSP+14qATm48kQoFOG1ByuAB3rbVQdwZO2TfuHcvxFiBKR4b5ut9TN9/fbH
         yjAoYMraPnA+gHvtp+zuq1YzI3peJw7SFb8J9/0m6D8h9UOuySeend2KQW2JQPXnq2po
         Q6V457vdylOlsNUhaQlncRmq8Pn37Z2294HN8hlMSfZBPe7brhJnG0bZBgN4CUX+dZD/
         m+n1yU5ya1ug0OmKJO54G/kFInmAi90awd6tcB2dGOYXl0Hs7l7mlwZBKGT3SFE0lgE/
         Ue9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618919; x=1793223719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cdf3QpdJWB/0HDVyOxy8t0UFwHwVO9ns70PxKiQyY/U=;
        b=TDV0QV7ohpkiWDDD3A53Ui9UF5i93gqOARPAPq14vSdO9kvwDUv3NVLicdeFv6mr93
         fAPr5dduNku4fS9LzeNoWC46P+Y9zHuJdLuZXynRIFrdgukTfdbgNhpJIDoz6EJ3jxJ7
         3jYDwCZUvgHLW22CwC+7V5qZcBlXpjqSnBOVfVdqBQhfJpGYRZR/t4SkFNGp/+lUTZna
         ffNXr6tXjthd2hEJtRI8IC4WpNkoTPSXUnWqKfVxsW1zB0jyNPbPXf/Sb1HJzC9Nd3FS
         G7zMy4c5rEhqPlOpa1xjY5CG158+CkyRuRRQ4qhZz9fgwERPU+wzbZxn1ivGtRTDF/Y3
         OlVw==
X-Forwarded-Encrypted: i=1; AKwUvBx7V7GwmMbfIOWnlgPm4hnRrTAcFFbc8wD3S1NhhfPf3181p5oU3mwsrqjTfoeRLvRJ1WseBOTzQIdjUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLH7OfDcp/qDyoFnwS1Coyne+9da0AFqBa/DtNWnyY1/35aj5rM
	PPSuz3Hb2e9F79zTs5b0lQqoGDeDRu5Lc26t3GD2ErMrNA1kUsQHodvn
X-Gm-Gg: AYBFou2uVlSnET9ewKh6Yw9OhhSvzFxf+QLG9QbyZ2tRUJckeDA4Tt2ka/KXRslZDTF
	A7HhmGfEnoDDlhg5lUr0aEKWsLY9lDR3GkCbhBn0MffK7iOL3F4t55CVlbDgpKThYfZoAamBTJH
	tvinnAPWTESf3/bz9AtGSVp0sCTNxVeBGJNZ59GGAd304VYzn8F1S6hIhrzlt6sRmHF0+OvtEj9
	AL/w2pyTgXh7mVILGoKTsGoUAIzMXmGIqTrlPm/IURQmP6E3wfROUB0+g/8fpMp274G/gKrLrUV
	c0+zDkfCx7VSjejeI57+S0RHH3qftm6nEO5qqkRXPk7Iq5dBGB81Trn4a5/VPYBA7ThcBg9J8pv
	BhQkFxNFXGJKUmehVS598rHuhKl3YLnohnrzo5YXAsB1kDXOMMtHXTiHo9CrqtbLhChj+91l+By
	wXHLqqoGP4nHo6iBiy9HHY6dYEOzjy8Po6nZUb78VXDywvoT8MutgkYF6gxia3vBwYWvXq0Gflw
	Zw3L7i8ftVKa45dPlyuJXY+/m3vV3+TUU3GPFadefhAg2KTcykTXJBFwKPDr7W+Eibt+xEy5Ook
	rntXQb9+fXN+3NMpPBNpFDH3nC7rLY79
X-Received: by 2002:a05:7301:7e17:b0:366:6c79:212b with SMTP id 5a478bee46e88-368b122ff22mr622562eec.25.1792618918940;
        Wed, 21 Oct 2026 14:41:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm10773723eec.11.2026.10.21.14.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:41:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>
Date: Wed, 21 Oct 2026 14:41:55 -0700
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
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Guenter Roeck <linux@roeck-us.net>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
 <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <guenter@roeck-us.net>
In-Reply-To: <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 13:04, Abdurrahman Hussain wrote:
> On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
>> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_voltage()
>>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in regulator ops
>>>> --
>>> Good that I did not just apply this patch. Do you have time to look into
>>> those issues and fix them ?
>>>
>> Looking into it,
>>
>> Thanks,
>> Abdurrahman
> Addressed all sashiko comments in v4.
>
Yes, series looks good. I'll have to wait for the commit window to close before applying it.

Thanks,

Guenter


