Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00562F363F
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385306; cv=none; b=SHbT/FLiDeg6az7+L6DGNfhxzvvdsvoKCFGNsPna/VghId8QJuGqPUF/mG6VNTEMwYvRg8Zzykc2E+X+BA/ZIeDo5hLY/Pp6LT1jUflLFc4ECIn5SfQxtbZ3sJdFad0QToObsuvawL2uoUFWzk9OimmoJgUsZvpXoU/SiTgnUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385306; c=relaxed/simple;
	bh=POYaXGWfU39vm4D5fBYAmYDLChP1wCY+TCa+U2uqVZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpdY8IUljxaVo97ntoUd49TFaiNpI5ZQER8VfJYiFFlAT1oaJyFDIsIL5K38yHfQNO+Yf6mQ0W1pHBKdOtzAPjdNDrEF27on/eZnWrB5EfzwjQ2wJ+Nx0KmeTp9AzW8wBnEuF4xlH6WGqi/7hqBLpfXYY6kueFZBmJFfLZnM/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYuQEgJO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYuQEgJO"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce98cb8165so18061115ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787385304; x=1787990104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=addUntxabwjA+hDdpAXnZycZm8RYTIvP5o5VxHMOpF4=;
        b=cYuQEgJOdW71VYvjiIaeD5EEfnbdlPOFPFG8mMGBad23CTgTBWKuk66lbZtiW2/CiX
         3atzvN0UqytF0Uwdd33hXyE6xv0/glMopzrlzYR9iaOsElSZ7ww0qspkHwWY69mD0+j+
         KBpQ826cJEL0n+MDUE0Clvqwr27wb7pRP02hEmqWiFoTgFuvx+J7EBAyVL6BIEXkuGW3
         bCn5oBQ6bXO0rKwbey3CUNZEM8oTq6MMYd5m/MHSFg2omY26y2GKWIytMdLoHGqpL7oP
         t3I9Su2G8W5LtVFuzxXOUDIpKipMR2EAQ+xtbnE89aa+LZgqiIFiRlVioznxBRQ5z6La
         /pAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385304; x=1787990104;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=addUntxabwjA+hDdpAXnZycZm8RYTIvP5o5VxHMOpF4=;
        b=hegLX02nXWzaRtx7I5MaNuZzoaSNZaEGL3ebszzX9ZFnMc1vc5hAAOnI0FOe2DOz07
         JnK9nKL7ooDyQEuF2RAD4fwuE/qm+dpcRA7HXb/38e6ndyUt2P6fZSK2O7RQfY7rAEmH
         KPESCwVCxFHOpCIRJhZ7ZubLYUUrgtkPEiN+ynYTD5b/h1vt1RZ9eatYzwFVD8686dqv
         B7RNZ4mlIGOs1AykOE1xsZg4Ppo9gpCzDEv6kWyUPSmTuDCWpPPdr01+90sXL9QAwaXx
         pVUT85jb2HzeByqbmi4MKGY+QWWttYP0BTYbYD9g7UyYmiBFQ3Y5ED93SYTjkmNZssri
         Wb0A==
X-Gm-Message-State: AFuF++lYqYLCk7jT9rdjS9OLWCQ/fdiE4K6FMoncYDjzgb+sAwbTFdE1
	M9oQd1BA/tQSVTVNgjuH35dSxFI7a3QJWCeJ9uStPXAH1SpOClqYQL4H
X-Gm-Gg: AR+sD12eHTz7XheIUwtuJsRmfo3kwQ93j7FC9332hnq8YxtuC4fLLRlP95wMS6BNhru
	EAATaRhGqsSan3J6sxo2/nPrMwY71cvpTrTPZpMD7jEd9ZLM4Iapuzaky1IIWFLr0cP3c++9hCP
	qMR06pT01PN/7UEDfVrEhwpWNf9Dt2CqvIdsn3EyB0Cy7MimBJB491EFKM+pM5UQy80FPRUDD5M
	Wtli8OXQgJIdaLl3L7+o5Mx+kz5EWW7ENxk3mG06cytZpUO2xyTNa8S+uh0RN/TqxJBIzp3vzW3
	C/UHTCaTtCsmeFrxYh3qmhyy8ty74AgewI36jPHidlfijUOekNjxJYlxTgp7ZQXqVKcbtou4hdr
	fq8XunZNWnA8A3iw5iPTDMrw42bv+h4OJtvLDIgWLMI3S0zus7ya712P8DRAh/Xz09NTN4m/teJ
	nI4QC7IMd+FoQZlJPUtHOOjIreWmgKusU95eR4t/QhC9fA2/zOtQuf7rlYooloLcwXw82Bdu4p1
	yF12IPLNPvDvvZoIj5xJDUmPxQg+BLM62DQ8g==
X-Received: by 2002:a17:902:ef47:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2d61a032207mr248213275ad.1.1787385304004;
        Sat, 22 Aug 2026 00:55:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0de2sm4085772eec.8.2026.08.22.00.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2026 00:55:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6fbb0f5b-ea29-41c6-8b13-c15e83af71d1@roeck-us.net>
Date: Sat, 22 Aug 2026 00:54:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: valid the data size before reading the sensor
 data
To: Edward Adam Davis <eadavis@qq.com>, sashiko-bot@kernel.org
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, me@jackdoan.com, savicaleksa83@gmail.com,
 syzkaller-bugs@googlegroups.com
References: <20260822054428.D55F71F000E9@smtp.kernel.org>
 <tencent_D74E75F577C166FC3CBB36B6966836D44A09@qq.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <tencent_D74E75F577C166FC3CBB36B6966836D44A09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/26 00:45, Edward Adam Davis wrote:
> The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
> fails to handle cases where the sensor data length is too small when reading
> the data, resulting in [1] during the read process.
> 
> Add a data size check, if the size is less than that required for the
> specific data item to be read, abort the sensor data read operation.
> 
> [1]
> BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
> Read of size 2 at addr ffff888108aba257 by task swapper/1/0
> Call Trace:
>   get_unaligned_be16 include/linux/unaligned.h:48 [inline]
>   aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
>   aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
>   __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
>   hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
>   __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
>   usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741
> 
> Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
> Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
> Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
> v1 -> v2: change to check the data item and update comments

Please stop sending me AI generated patches. Whatever model you are using
has no clue what it is doing.

Guenter

