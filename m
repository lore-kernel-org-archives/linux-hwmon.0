Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442033263B;
	Wed, 20 May 2026 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256337; cv=none; b=T+iPiu1lU9cisc9NtZLRMF5CtHQLOMb7hltS5NLya5dSbm4opccRQm8hMaSl8keLf5t0YDbTZOoDyYV4iqA+ANEZe1/ttyQBk8UUr5+9BbGh1MHCwHqnG4EtxSIUWfSO7RON6kP8hk8HCgY1k6hOozscqPz8C5iSxFVfAWZy/y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256337; c=relaxed/simple;
	bh=vCpIsC+k4Hl1s9KxSQwlkpedlyDG0F2uMP/Kz82DKw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6lIbAYgZYWsrZ7u8EKANmhsInv9oQtXgw2dzlg48RCJ1UcpYfhmbP2BBP+9/0q/T2dy6RXc7ylkbINTmkIR8gVK9Qk2KH7ObKeawL08NkNgukU0OvRHTQTf4xzL19LWPaUndp2ncG1VKxVDemxq2rrwpMADkVXI4aZsyNkk/Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pWNmzLq0; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pWNmzLq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=5k
	oU8nAPtICHcibCYd3UGvmXs3AuaTkZpfga6ERiXyg=; b=pWNmzLq0eIrNcutIIq
	bPWQEjEm6360nSLaBu9IUFWMMP9cqw9+nUdsL/LsOl5vbX6ewcFrfjwNZlwFT0wG
	5IDXeGKUiU1ph6eYmvhP1fR1wXFJfZa+/BA/P1e14OypnboglsRVhBDa8CxhkINX
	9dthXAWBGyGWgAzUadONj1hx0=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD36ovvSw1qtRiaCQ--.5044S2;
	Wed, 20 May 2026 13:51:44 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer dereference when DMI match fails
Date: Wed, 20 May 2026 13:52:05 +0800
Message-ID: <20260520055205.87493-1-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <58352b37-a87a-49f0-ac89-da226f2266dc@roeck-us.net>
References: <58352b37-a87a-49f0-ac89-da226f2266dc@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD36ovvSw1qtRiaCQ--.5044S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr18tw47Aw17XF15CrW7Arb_yoW8GF18p3
	9xGan8Crs8JFyUZ3WxGw1qvFnYyw1rtr98Jryagw1Uu3ZxuryfWrZ29F4Yka9rJF4Sg3Wj
	vw1YyrWfZF4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUp6wXUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC-BDsm2oNS-Ao-AAA3T

Hi Guenter,

Thank you for the review!

>> Remove all five manual release_region() calls that are now handled
>> automatically, and drop the unnecessary braces on the single-statement
>> blocks that previously contained them.
>
> [Severity: Medium]
> Is this description accurate? The patch diff shows that only four
> release_region() calls were removed.
>
>>As far as I can see there are only four calls in the code. Description
>>problem ?
Yes, you are right, thanks for your point out, I will update it.

>> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
>>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>   		return -ENODEV;
>>   	}
>
> [Severity: Medium]
> This isn't a bug, but could these curly braces be removed? The commit
> message mentions dropping the unnecessary braces on the single-statement
> blocks, but they appear to have been left intact here.
>
>>Hmm, yes, the description does not match the code changes. Please drop
>>the now unnecessary {}.
Thanks, you are right, it is unnecessary {}, I have removed it in the V2 2/2,
Please review it. Anyway, I will update the next version V3 that will 
include all the modify which kindly pointed out from your review.

Thanks,
Kean

