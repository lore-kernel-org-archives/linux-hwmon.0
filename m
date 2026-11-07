Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075325;
	b=ZrDc21FeNeRWc/NiwV6Pr1loyMCHNneu1Bq7tmyVSFgMJo7RM1Rs5++DYTW8/aXuBo7c
	 elH4oqfJm9fh2ih4hWEHN3kh3bplg6TOdpsnh4bnrIBf+lm1deV/5UrpPnhf5OKTuuDX7
	 bgq6koLJQqh3exbizwMxqtcCaRXC8CDPXQwwNKcqg+xz1ewtjcZfPuaUzC3XFsCv+/uZs
	 bpWOyptheFdlKxcxqvRjnRcDCLZxRi5iJbriNfppLVp8Vkt6hVFMoJJD43rvdWZQlHXd9
	 FHkamcSaGMpPzxaEOdDzEhhxsKwPPXs5MlvqWtPQs/fnoR1Drshfe1+D/74rXk+KoHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075325;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=LmORuIzJmRaD9mdXvNsI+jt2xp0BvSO0FVdp3HLY9ZM=;
	b=qoC0JCNzw5UU0GAts0IIapzLuqnlf7l8ohKih+93A9poiDMjgsZsrum/RDpdcIK6k/Gp
	 JZiqyMiysaaBfuuBGKNOAq6YB7FBGbqg0URZbolUsWjxbI3R+ihh+9wdeNHEsaTGoiVlf
	 ysuv/tHeraVDS4KFDMpcTDnmfuTRrS2nGWW4yAEF853j8QYbdqfZVB1vQYcH4ZINj0Oz7
	 AgyzV0Ipm0LpaVEq+4GZ45BXVg7iCuxa4N4GZqA3TVUhI70H/s758vxdk+Q0ExGfAVQO4
	 +DI1bw9Nx1NNL0LrGHnfGsdf6lDNVceFVGqBdQclP/wuO+o9AhL3EaB4neFh2WCUBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=GYCmHOcn;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3B606A326;
	Sat,  7 Nov 2026 18:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AA3B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=GYCmHOcn
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jMPNS3J0mzKmct;
	Sat, 07 Nov 2026 19:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794075320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmORuIzJmRaD9mdXvNsI+jt2xp0BvSO0FVdp3HLY9ZM=;
	b=GYCmHOcnZQQMMX4E2NEoxW2+t1k7WPj/mY6SlONeKQ8b1oAOquBU3Q+/JYrFspplYoE3PQ
	IBarf/0wbydmaKXMqfd3m5nZuQwTjG898waefzdGrRIL1c3ta/bhi2IChxvyIWt6B5l4h4
	rAcLz9OWIUIgxhMkCU9f7/L2ORcBlmg17BzL4yO3v4cEmxQ50IxjiCSkTLCCCro89ecimw
	sgrOvv4Pjae6GdoG8OYNK7Qkn+UKm2CpAXzc8RtfTB+/OCombldjgI6/5NNXvz69LJPuke
	kP5CtGJ5gT4o61Tn/UdPu7CBk/+V6gRDNh+U7pNfPmEkqZ4nRHmQLmGjl04cOw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 19:15:18 +0100
Message-ID: <20261107181518.385136-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net>
References: <20261107082821.8257-1-tomasz@bojanowski.me> <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net> <20261107161249.336512-1-tomasz@bojanowski.me> <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jMPNS3J0mzKmct

Hi Guenter,

On 11/7/26 10:02, Guenter Roeck wrote:
> What am I missing ?

Sorry, my earlier description was not clear about how the request is
sent. From the vendor software, it looks like this:

- The request goes out as an output report with report ID 0xfa, not
  as a feature report. If I read usbhid_set_raw_report() correctly,
  it puts reportnum into buf[0], so with MSI_ML_SENSOR_REPORT_ID the
  controller would have received a feature report 0xf0 instead.
- The reply seems to come back as an input report on the interrupt
  endpoint, not through GET_REPORT. As long as the driver calls
  hid_hw_open(), it should show up in .raw_event().

Roughly like this (untested, I have none of these boards):

        buf[0] = 0xfa;
        buf[1] = 0xa0;
        buf[9] = 0x01;
        buf[10] = 0xfc;
        reinit_completion(&priv->done);
        ret = hid_hw_output_report(hdev, buf, 64);
        if (ret == -ENOSYS)
                ret = hid_hw_raw_request(hdev, 0xfa, buf, 64,
                                         HID_OUTPUT_REPORT,
                                         HID_REQ_SET_REPORT);
        ...
        wait_for_completion_timeout(&priv->done, msecs_to_jiffies(500));

In .raw_event(), the reply could be accepted when data[0] == 0xfa,
data[2] == 0x01 and size == 64, followed by complete().

The report ID should stay a constant 0xfa: with 0x01, the same buffer
would be the bootloader command.

A quicker check might be to write the 64 bytes to the hidraw node and
read() the input reports.

Thanks,
Tomasz
