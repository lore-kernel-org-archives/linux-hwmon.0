Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8CA47254E
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031068; cv=none; b=OnnrEpfASVd+NsFDy4lm44Aave0CqOE1mXG/J0L/oitoGS0xcypVwQbM/dqz/nHbPhQgv3kKlg0wXIPpxKf4SlPpJIAb6N2/ry2s1X7/m80now1I1UcwIiPRkSd6lvZ9RFY2WF1QXcU7PKzTmS1Ev742vYFsAu2kHRrsQiA0FpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031068; c=relaxed/simple;
	bh=O7rkwtXnbLwt2keDlpi9elKWxaB0PjsiSkkruUjKVaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyfQbJ3l8uOVWj+uGGyAsGTtpdf6PAjeQGM0rfH0tSA3RFTffR+0cOLKGsE54TA1jiWY2qYInh7BwujuQ1CvrA/pP7GWifqn6JlrRO1og68inwFJyedu7ctluLEGJw3ajYz8ed0ws6lc9zSrdxGcZ8fUSFJZWVwqg8XSpPOLhZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnEeLHRa; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnEeLHRa"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1485063a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786031066; x=1786635866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7rkwtXnbLwt2keDlpi9elKWxaB0PjsiSkkruUjKVaE=;
        b=rnEeLHRacsdHC6aHuinXasSiCo5B7niV8No7T5V4RBHPKB6AMUzoMTSoMkxGUlTSdI
         /OlCzFNsGw/AJa0D4yu7fkArw0cBeEMo2tdo2+38bALXwpe6I0gATISR1bHVlzu+TA6i
         XxcNRBydWTd8A5dE1W8syQ8mogM7zNpa4YgtNfcGukJ5Bf4TjZi1YSC34jfQI4lJwN9d
         H/1UwFQf0wAMvqQfoh0fJRedIIMbVtqpcBU9lT0zogAoWqtbGeappydHDJ7uC0BZAv5M
         5N0gpvaEyHeFsMVjfR5JoO7dm6riX/qvIx5Q/PBhD2oz1K2Gsb8EVB5b5C4Xdkh6vQvS
         /IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031066; x=1786635866;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O7rkwtXnbLwt2keDlpi9elKWxaB0PjsiSkkruUjKVaE=;
        b=p6YxWuwtkqVc1/Zqhaye/o1IubLbcuSJqVO7Q4tGp3UyOmtPCfmEwNxNZ8AAlUHJ6m
         3toLhe4bJoG0vygTUFpzWroObkU7g4pxoXwXxmhafp0doe3vtCMZaThBhW78J50ZNAyQ
         ar90usLib0PoL0xIJtKaILZ+zfnFlZspbkRpwvDJlflE7zX4IalhnESv6U2Y+o5xVhUf
         ufQZ3cn10pscbaDManQ9gz/Q/TuZ3VLrfe08Q/yDGqE0tvK929ZVTG0R//1MgWgBb28l
         kwsbojqt9khTLG4A3lIbsu6XBzFp8h+Zqsp2uFbQ2twlZf1jXxDB5L61AxwYzUM2eN3+
         IF3Q==
X-Gm-Message-State: AOJu0Yw4RZCC1vj0QtzioVTH9QEycy/rmtTQPXTL9UJ633XWegMIoqnc
	1W/fNPIIqVBn5p7U+pS6LCz5oEk/W7eauTYZEi/k6x11VO9JLOBd7OIK
X-Gm-Gg: AR+sD137VAjawysdy2twe8LvXWUVKO83qGuZbykKEMiaITSgZ31bmVzrAryeBUr3UH7
	xwU68+PdDI9Lxj9A/NA8pfki/AKWXLjBCdnSf0sDyfHbvI6+2R1tF9/GoBX0L3M6upBbt3GB1eH
	CdETdxLoAZuK+GYh/UQtKqjojXZOMEoP1E+0jWSDQfHxvLW7ZzvHVJ3QSEA0w/HdKAU6Ex4K82g
	k/huGIGzCM3laxEkBtg3Hou8ulSaNcqBib9xGuFxTNQYWg5id1MPe1/wZFORF1f/QFN1u0nkTVy
	mDjLdFaCSfh3uDDvDSyueVJkJFaxiEBaKGscXgc4tGK4H9WkvCGWKyTdxeIcr+cy7AEL4AOpAia
	BPshW3aNJpfiLiXScLINmIJye8y9nWo+SptY4I6Cs61cQ+NyIoWWhi57cBVL9Reo9hrAd2pgl83
	QKe/TzbGOwBrpmZW9h+exq73kBchFJnVe3+McpYV8E3o3Vw509YoMTvWz3OaASlzfWD64bq+Oi5
	Uem0R0L/z96Z7+je/ABK+dg+WsHBbVSVjS5Dg==
X-Received: by 2002:a05:6a21:109:b0:39f:a8fb:3354 with SMTP id adf61e73a8af0-3cbadc1497emr3658629637.17.1786031065993;
        Thu, 06 Aug 2026 08:44:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca92ada6sm25851294c88.15.2026.08.06.08.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:44:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f96884d5-7bb2-4646-9175-1b385789690b@roeck-us.net>
Date: Thu, 6 Aug 2026 08:44:24 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
To: sashiko-reviews@lists.linux.dev, Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260806131103.19104-1-sergiomelas@gmail.com>
 <20260806132452.80AD21F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806132452.80AD21F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sergio,

On 8/6/26 06:24, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Specific Lenovo model DMI quirks incorrectly use `DMI_PRODUCT_FAMILY` for exact model string matching, causing all specific quirks to fail and fall back to incorrect generic profiles.
> --

Please confirm that this is a non-issue.

Thanks,
Guenter

