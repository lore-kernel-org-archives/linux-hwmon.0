Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD8649C4D0
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354808; cv=none; b=JeXVyOFhiDx14IKXRkzXpLhKOzS5XKjLoIsmmv3WgXzWdLzaQsGxNXc1rc8gKMIoTOzeVMqtxJBFxakAoTxXtzAFBrePxN1fi0o3lDim1YzqACNHkfqcSRtZGBmft+OquH+SGSRht88lA1kYrBF6KyJgnCfcFdq11+bsS+NuyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354808; c=relaxed/simple;
	bh=U9vc3dyM+YUvCBr/4qgAYA5zLaGitUqlS1Dy/V99s3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hecpr9jabtCAmXORv4WlCeMzxv9wv3/axBxi0M/oicCTDaKKtODLnrS7X1kaMOTMEzgH4kPVOB1nsnpaRTkSxEycE7etCqbmydQmmH4RurJQMT0uG2Yv/ZgbYPMSOyIxW6A+J1qbflzgcmf8HzB+FrMUyWIMvbx7y7Daj1uZpYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3C6oQ+8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3C6oQ+8"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-85339ed040aso862335b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788354805; x=1788959605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/42RqmC9ERn7tQq+z58dQa1AiNxwavuyLFyUeoiv2QQ=;
        b=Q3C6oQ+8N2+FSQ0VDOy957LzND00Kaz8atEOgIJUQcpoocHf1NCG4LguYmo4pPex5m
         bUUqD8HkQigpCsN3KuoM/kJzSjT9hqbYIbsDGBIVZh4PCpBPX4GB7KM+uxo4ValEgJWV
         zv5MEsv7j6uG+PYu5ZPzJ9Mum0Rg0W2a7Bq0/ckQSqGdz9eKxvm8kOqTcnLLlPjDcz3v
         siddDzLrvhl7XAXwmuDkyMLqVO2iZXWCiR7tLDu3uucDjj+CkmGzhJrhRldJdztWIUET
         lhadpdZiNAO8AZ7BAY2TXqFJ/cgAteC+sbRTEeu4SOownuIS4Agm0A476uP48bMykd6K
         kXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354805; x=1788959605;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/42RqmC9ERn7tQq+z58dQa1AiNxwavuyLFyUeoiv2QQ=;
        b=cH1UeKrwexlI1MLpl7DpIl/pfsaQ71UgL5vY4FMRBu55y5CLnQI4nxshTQ20B5RiQS
         QvSKP5sQOoJLuXsFYxEvnvJszxD47frTEYa2BBjLfOl+rGSx06cgBtOPyzASQJPzXMSn
         qYf1ixm+2gjqJo6FkFg4mOSaA1Ous/K9LPzUKx5f41e0gJq82I5EgI9jeHTZx0owW/sb
         sBEIFVTbXbdV8jKJhcYVVYeMHwZ++qjwusuEJyjhLaaW5RAdA5kxyODpG3qjBw1jBMBe
         0rj+ryerniMeLSMDE3NYlT/zhC4kHEiuei8Kn3Yp/8AcdhUfXYzW1iBpknz/d5V+xeGs
         Ie/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxE+91SJcVDgbDkbQGOmoPYkF+J6LCO6BXjyslOm3NrXAHkB8VBcxWuIu1pix2rTuq7DWKiowkhGKX2dQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kWz6wYy1OAKePh1CAyFNJ3UEebXc39EVtJd9B0BJy3lzpvBOWC
	/Yq4UXu6m4AACb2NM0MOPqf4iQYYCfGmrlRcWX4YREdcoyAeNRtwfbeeKlb/Eg==
X-Gm-Gg: AYBFou24boLAmhF8qBWbm+ZJ2xFBHEvq4kYvuFsSuzENt0gdZKQb+fJe22CvfQFNOc2
	5LjfH/kLgoU/mFsWiEBspMcV5ma+wj8qSh8I3RN8D+HKnjk0VwgtxJ7EIsC4kMKK2hlEvEeucro
	1cvr1bjT06ThYIEQPmI4jfUjclakVZM84x5wbBf8dUWQG6Mb/udBMByj7dTiBhkB29cg/L4i4UP
	KfJYekRf0iA8ujAZqGFDeIJnpDmFHI++pAAIp0oB0u3/FeXApJ3i47aMO26VKejxN7Z/F+ZPVjq
	p9iQC325p2JiK4Msb2h5uoTyvsSf4JBs3nOwU7Xyi+cD75VdS7XfsHow7ZoyqJG2Ug+lnb4Gbm+
	bFktd/AlM+OFucSMQF5xeim0Lxs1WzcoRvNkNXxVd6yVoe2fER2aP+Qm5kV4CNcmxvLEISO8XeM
	FJHzXjl3i+nyQgGMHPBKbvzFDnWGNVIwhkOfolARAD88iRZOUnkVAXW3C8aXv0Ij4b8cxwHLv0k
	akHOuMutEcAZEPXvFS5dbix/M8iDSOBNVLHCA==
X-Received: by 2002:a05:6a00:4286:b0:857:4dea:e20e with SMTP id d2e1a72fcca58-85ecef11451mr7958614b3a.0.1788354805381;
        Wed, 02 Sep 2026 06:13:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc071665dsm1360625b3a.40.2026.09.02.06.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:13:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ff4f10a6-7818-49f1-8852-e712e19c7d57@roeck-us.net>
Date: Wed, 2 Sep 2026 06:13:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivetemp: Unable to read SATA drive temperatures from usb
 enclosure, but can read SMART temp
To: Rishub Nagpal <rishub.nagpal@gmail.com>, linux-hwmon@vger.kernel.org
References: <CALCyNyd=pmL2_RSJAOiwpX3x1ctuaXghpUxzfu77PNxHnUjPVQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CALCyNyd=pmL2_RSJAOiwpX3x1ctuaXghpUxzfu77PNxHnUjPVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 05:57, Rishub Nagpal wrote:
> Hi,
> 
> I have a Sabrent HDD enclosure connected through a USB-C bridge. I
> noticed that the drivetemp module cannot read temperature information
> from this enclosure, however I can read temperature information
> through SMART.
> 
> Admittedly, I used AI to try and investigate it, and it reports that
> "the bridge does not provide the SCSI ATA Information VPD page (0x89)
> and the drivetemp probe currently appears to require VPD page 0x89
> before attempting SMART/SCT access."
> 
> First, is this correct?
> 
Yes

> Second, since drivetemp supports reading temperatures through SMART,
> would it make sense to add a case for similar devices like this that
> if VPD 0x89 is not present, but is a sata drive, to query with SMART?
> 

The driver uses the information to determine if the drive is a SATA
drive and if it supports SCT or SMART. Maybe there is another / better
way to do that. If so, I don't know what it is, I can not test it, and
I don't have the time to explore. I'll be happy to review and apply
any patches shown to be safe.

Thanks,
Guenter

> I tested this on Kernel 7.1.10-200.fc44.x86_64
> 
> I would be happy to submit or test a patch on this hardware or any
> insights on why drivetemp is designed this way, I am not well-versed
> in the kernel.
> 
> Thanks,
> Rishub

